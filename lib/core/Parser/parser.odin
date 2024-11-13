/// docs.ignore
package Gungnir_Core_Parser

import "core:fmt"
import "core:os"
import "core:log"
import "core:odin/ast"
import "core:odin/parser"
import "core:path/filepath"
import "core:odin/tokenizer"

import "project:lib/boundary/File"

ParserASTResult :: struct {
    ast: ast.File,
    path: string,
    content: string,
}

ParserResult :: struct {
    ast: ParserASTResult,
    doc_comments: [dynamic]tokenizer.Token,
    ignore_file: bool,
}

// Will parse a string and return the tokens found
generate_ast :: proc(path: string, content: string, allocator := context.allocator) -> (ParserASTResult, bool) #optional_ok {
    pkg := ast.Package {
		kind = .Normal,
	}

	file := ast.File {
		pkg      = &pkg,
		src      = content,
		fullpath = path,
	}

    parser_flags := parser.Flags{.Optional_Semicolons}

    parser_handler := parser.default_parser(parser_flags)

	ok := parser.parse_file(&parser_handler, &file)

    result : ParserASTResult = {
        path = path,
        content = content,
        ast = file,
    }

    if !ok || file.syntax_error_count > 0 {
        log.debugf("Could not parse file at path: %s", path)
        log.debug(content)
		return result, false
	}

    return result, ok
}

// Filter comments and find the documentation comments
get_doc_comments :: proc(tree : ParserASTResult) -> ParserResult {
    // See: https://github.com/odin-lang/Odin/blob/master/core/odin/ast/ast.odin
    // See Also: https://github.com/DanielGavin/ols/blob/master/src/odin/printer/printer.odin
    
    comments : [dynamic]tokenizer.Token
    ignore_file := false

    // Fetch only the doc comments
    walk:
    for group in tree.ast.comments {
        for comment in group.list {
            
            if !is_doc_comment(comment.text) do continue

            comment_text := trim_leading_keyword(comment.text)

            // Check the docs actions
            if is_doc_action(comment_text) {
                action := get_doc_action(comment_text)
                if is_doc_action_ignore(action) {
                    log.debugf("Found `docs.ignore` action, Ignoring file: %s", tree.path)
                    ignore_file = true
                    break walk
                }
            } else {
                append(&comments, comment)
            }
        }
    }

    result : ParserResult = {
        ast = tree,
        doc_comments = comments,
        ignore_file = ignore_file,
    }

    return result
}

parse_file :: proc(file: os.Handle, path: string = "memory") -> (ParserResult, bool) #optional_ok {
    
    log.debugf("Reading file: %s", path)

    content := File.read_from_handle(file)
    tree, ok := generate_ast(path, content)
    result := get_doc_comments(tree)
    
    return result, ok
}

parse_content :: proc(content: string, path: string = "memory") -> (ParserResult, bool) #optional_ok {
    log.debugf("Reading content: %s", path)

    tree, ok := generate_ast(path, content)

    // TODO: We have to differentiate markdown comments from doc comments
    // Markdown comments are used to add content to the final document
    // doc comments are associated with a symbol (proc, struct, enum, constant)
    // The main difference is that they have a new line after, instead of a symbol after.
    // Normally markdown comments are used for sections within the document.
    // Also consider implementing parsing MARK comments (MARK, FIXME, TODO)
    // Maybe translate them to: Info, Warning and Note.
    // docs comments will generate its own file for menu creation
    // markdown comments will only be available at the main document for the file.
    result := get_doc_comments(tree)
    
    return result, ok
}