package Gungnir_Core_Parser

import "core:fmt"
import "core:os"
import "core:log"
import "core:odin/ast"
import "core:odin/parser"
import "core:path/filepath"

// get_executable_path :: proc(allocator := context.temp_allocator) -> string {
// 	exe_path, ok := filepath.abs(os.args[1], context.temp_allocator)

// 	if !ok {
// 		log.error("Failed to resolve executable path")
// 		return ""
// 	}

// 	return filepath.dir(exe_path, allocator)
// }

// Will parse a string and return the comments found
parse :: proc(path: string, content: string, allocator := context.allocator) -> (ast.File, bool) #optional_ok {
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

    if !ok || file.syntax_error_count > 0 {
		return {}, false
	}

    return file, ok
}

// Filter comments and find the documentation comments
get_doc_comments :: proc(content : string) {

}