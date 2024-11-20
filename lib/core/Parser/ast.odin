/// docs.ignore
// This file will read a string content
//  and return an Abstract Syntax Tree of Odin code
package Gungnir_Core_Parser

import "core:log"
import "core:odin/ast"
import "core:odin/parser"

// Will parse a string and return tokens
new_ast_from_content :: proc(content: string, path := "memory", allocator := context.allocator) -> (result: ast.File, ok: bool) #optional_ok {

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

	ok = parser.parse_file(&parser_handler, &file)

    if !ok || file.syntax_error_count > 0 {
        log.debugf("Could not parse file at path: %s", path)
        log.debug(content)
		return {}, false
	}

    return file, true
}