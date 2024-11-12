package Tasks_File

import "core:log"
import "core:fmt"
import "core:os"
import "core:strings"

import "../options"

run :: proc(args: options.Options) {
    
    log.debugf("tasks.file with args: %#v", args)

    data, ok := os.read_entire_file(args.path, context.allocator)
    defer delete(data, context.allocator)

    content := string(data)
    
    // for line in strings.split_lines_iterator(&iterator) {
    //     fmt.println(line)
    // }
}
