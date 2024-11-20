/// docs.ignore
package  Gungnir_Tasks_File

import "core:log"
import "core:os"
import "core:fmt"

import "project:lib/boundary/File"
import "project:lib/tasks/options"
import "project:lib/core/Parser"
import "core:odin/tokenizer"

import "core:strings"


run :: proc(args: options.Options) {
    
    log.debugf("-file action triggered with options %v", args)

    filename := os.args[2]
    data := File.read(args.path, filename)

    //fmt.println(data.lines)

    ast := Parser.new_ast_from_content(data.content)
    walker := Parser.new_walker_from_file_and_ast(data, ast)

    fmt.println(Parser.walk(walker))

    // ast := Parser.new_ast_from_content(content)
    //walker := Parser.new_walker_from_ast_result(ast)

    // nodes := make(map[int]Parser.GungnirASTToken)
    // defer delete(nodes)

    // Parser.get_tokens_by_line(&nodes, ast)

    // fmt.println(nodes)

    // for _line, index in walker.tree.lines {
    //     Parser.get_token_by_line(nodes, index, ast)
    // }

    //Parser.walk_to_ast_root_node(walker)

    //Parser.parse_file(args.path, path)
}
