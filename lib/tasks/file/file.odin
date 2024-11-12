package Tasks_File

import "core:log"
import "core:fmt"

import "project:lib/tasks/options"
import "project:lib/boundary/File"
import "project:lib/core/Parser"

import doc "core:odin/doc-format"
// testing
// ideas from: https://github.com/odin-lang/pkg.odin-lang.org/blob/master/main.odin
// and : https://github.com/odin-lang/Odin/blob/master/core/odin/doc-format/doc_format.odin
// A file named project.odin-doc must be generated for odin-doc to analize
// $ odin doc project.odin -file -all-packages -doc-format -collection:project=.
// $ ./run project project.odin-doc -file
// The main problem with this approach are 1: must be compiled before doc extraction
// 2: don't know how to extract comments from entities.

array :: proc(header: ^doc.Header, a: $A/doc.Array($T)) -> []T {
	return doc.from_array(header, a)
}

str :: proc(header: ^doc.Header, s: $A/doc.String) -> string {
	return doc.from_string(header, s)
}

run :: proc(args: options.Options) {
    
    log.debugf("tasks.file with args: %#v", args)

    data := File.read(args.path)

    header, err := Parser.parse(data)

    //fmt.println(header.entities.comment, err)

    // Where I can find the comments?
    for entity in array(header, header.entities) {
        fmt.println(str(header, entity.name))
    }

    // for line in strings.split_lines_iterator(&iterator) {
    //     fmt.println(line)
    // }
}
