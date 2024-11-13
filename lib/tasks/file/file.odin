/// docs.ignore
package Tasks_File

import "core:log"
import "core:os"

import "project:lib/tasks/options"
import "project:lib/core/Parser"

run :: proc(args: options.Options) {
    
    path := os.args[1]
    Parser.parse_file(args.path, path)
}
