/// docs.ignore
package  Gungnir_Tasks_File

import "core:log"
import "core:os"
import "core:fmt"
import "core:strings"
import "core:odin/tokenizer"

import "project:lib/boundary/File"
import "project:lib/tasks/options"

import "project:lib/core/Parser"
import "project:lib/core/Markdown"

run :: proc(args: options.Options) {
    
    log.debug("-file action triggered with options: ", args)

    filename := os.args[2]
    data := File.read(args.path, filename)
    ast := Parser.new_ast_from_content(data.content)
    walker := Parser.new_walker_from_file_and_ast(data, ast)
    tokens := Parser.walk(walker)
    
    markdown := Markdown.new_markdown_document(tokens)
    out := Markdown.render_document(markdown)

    log.debug("Rendered Markdown Document")
    log.debug("\n", out)
}
