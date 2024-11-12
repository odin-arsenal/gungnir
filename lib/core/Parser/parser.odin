package Gungnir_Core_Parser

import "core:fmt"
import "core:os"
import doc "core:odin/doc-format"

// Will parse a string and return the comments found
parse :: proc(data : []byte, allocator := context.allocator) -> (h: ^doc.Header, err: doc.Reader_Error) {
    header, error := doc.read_from_bytes(data)
    return header, error
}

// Filter comments and find the documentation comments
get_doc_comments :: proc(content : string) {

}