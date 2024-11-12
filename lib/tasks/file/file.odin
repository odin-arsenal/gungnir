package Tasks_File

import "core:log"
import "core:fmt"
import "core:os"
import "core:odin/ast"
import "core:strings"

import "project:lib/tasks/options"
import "project:lib/boundary/File"
import "project:lib/core/Parser"

run :: proc(args: options.Options) {
    
    log.debugf("tasks.file with args: %#v", args)

    path := os.args[1]

    content := File.read(args.path)

    ast_tree := Parser.parse(path, content)

    // See: https://github.com/odin-lang/Odin/blob/master/core/odin/ast/ast.odin
    // See Also: https://github.com/DanielGavin/ols/blob/master/src/odin/printer/printer.odin
    walk: 
        for group in ast_tree.comments {
            for comment in group.list {

                // Check the docs actions
                if !strings.starts_with(comment.text, "///") do continue

                comment_text := strings.trim_left_space(comment.text[len("///"):])

                if strings.starts_with(comment_text, "docs.") {
                    action := strings.trim_space(comment_text[len("docs."):])
                    if action == "ignore" {
                        log.debugf("Found `docs.ignore` action, Ignoring file: %s", path)
                        break walk
                    }
                }
            }
        }

    // for line in strings.split_lines_iterator(&iterator) {
    //     fmt.println(line)
    // }
}
