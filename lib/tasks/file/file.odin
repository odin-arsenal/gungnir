/// docs.ignore
package  Gungnir_Tasks_File

import "core:log"
import "core:os"
import "core:fmt"

import "project:lib/tasks/options"
import "project:lib/core/Parser"
import "core:odin/tokenizer"


run :: proc(args: options.Options) {

    using fmt
    
    log.debugf("-file action triggered with options %v", args)

    path := os.args[1]
    data, _ok := os.read_entire_file(args.path)

    content := string(data)

    ast := Parser.new_ast_from_content(content)
    //walker := Parser.new_walker_from_ast_result(ast)

    nodes := make(map[int]Parser.GungnirASTToken)
    defer delete(nodes)

    Parser.get_tokens_by_line(&nodes, ast)

    fmt.println(nodes)

    // for _line, index in walker.tree.lines {
    //     Parser.get_token_by_line(nodes, index, ast)
    // }

    //Parser.walk_to_ast_root_node(walker)

    //Parser.parse_file(args.path, path)
}
