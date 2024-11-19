/// docs.ignore
// This file will walk the AST and group the tokens
package Gungnir_Core_Parser

import "core:odin/ast"
import "core:odin/tokenizer"
import "core:strings"
import "core:fmt"

GungnirASTWalkerResult :: struct {
    tree : struct {
        ast: GungnirASTResult,
        lines: []string,
    },
    token: tokenizer.Token,
}

GungnirASTToken :: struct {
    line: int,
    offset: int,
    column: int,
    kind : string,
    text : string,
}

// Construct the base nodes
new_walker_from_ast_result :: proc (ast: GungnirASTResult) -> GungnirASTWalkerResult {
    return GungnirASTWalkerResult{tree = {ast = ast, lines = strings.split_lines(ast.content)}}
}

// add_token_to_walker :: proc(walker : GungnirASTWalkerResult, token: tokenizer.Token) -> GungnirASTWalkerResult {
//     return GungnirASTWalkerResult{tree = walker.tree, token = token}
// }

// walk_to_ast_root_node :: proc(walker : GungnirASTWalkerResult) -> GungnirASTWalkerResult {
//     token : tokenizer.Token

//     return add_token_to_walker(walker, token)
// }


get_tokens_by_line :: proc(nodes : ^map[int]GungnirASTToken, tree: GungnirASTResult) {
    for token in tree.ast.tags {
        
        nodes[token.pos.line] = GungnirASTToken{
            line = token.pos.line, 
            offset = token.pos.offset, 
            column = token.pos.column,
            kind = fmt.tprint(token.kind),
            text = fmt.tprint(token.text),
        }
    }

    for token in tree.ast.decls {

        fmt.println(token.stmt_base)

        // nodes[token.pos.line] = GungnirASTToken{
        //     line = token.pos.line, 
        //     offset = token.pos.offset, 
        //     column = token.pos.column,
        //     kind = token,
        // }
    }
}


