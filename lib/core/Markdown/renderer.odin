/// disable.docs
package Gungnir_Core_Markdown

import "core:fmt"
import "core:strings"
import "core:slice"

//import Path "core:path/filepath"

import "project:lib/core/Parser"

// Contains the structure for all the settings
// for rendering the markdown document
GungnirMarkdownDocument :: struct {
    directory : string, // *.docg directory, normally the filename myfile.odin -> myfile.docg
    disabled  : bool, // is this document disabled from rendering?
    parser  : Parser.GungnirWalkerDocument, // The tokens document returned by the parser
}

@(private)
render_file_info :: proc(document: GungnirMarkdownDocument) -> string {
    // TODO: Add repository and line numbers to Header link
    return strings.concatenate({
        "# [", document.parser.walker.file.filename, "](", 
        document.parser.walker.file.path, /* repository */ 
        ")", /* line number*/ 
    }, context.temp_allocator)
}

// Handle compiler tags such as #+build
@(private)
render_tags :: proc(document: GungnirMarkdownDocument) -> string {
    return ""
}

// Public API

new_markdown_document :: proc(parser : Parser.GungnirWalkerDocument) -> GungnirMarkdownDocument {
    return GungnirMarkdownDocument {
        directory = parser.walker.file.path,
        disabled = parser.disabled,
        parser = parser,
    }
}

// Render Markdown for diverse tags found
render_document :: proc(document : GungnirMarkdownDocument) -> string {

    // Do not render a disabled document
    if document.disabled {
        return ""
    }

    // TODO: consider a string builder instead
    lines : [dynamic]string
    defer delete(lines)

    // render the file and package info
    append(&lines, render_file_info(document))

    // render the document tags
    append(&lines, render_tags(document))

    return strings.join(lines[:], "\n", context.temp_allocator)
}