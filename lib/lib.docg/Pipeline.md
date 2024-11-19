# Pipeline

This is the _Pipeline_ followed by _Gungnir_ to create the final _Markdown_ output.

## Step 0: Read Document AST

By using the built in [_Odin_ parser](https://github.com/odin-lang/Odin/blob/master/core/odin/ast/ast.odin), create an _AST Tree_ that can be walked and generate the final structure that holds all the information needed to write the _Markdown_ file.

```odin

import "core:odin/ast"
import "core:odin/parser"

generate_ast :: proc(path: string, content: string, allocator := context.allocator) -> (ast.File, bool) #optional_ok {
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
		return file, false
	}

    return file, ok
}
```


## Step 1: Walk the AST

From top to bottom will walk every node from the AST and store the output.

