/// disable.docs
package Gungnir_Boundary_File

import "core:os"

// Reads a file handle and returns a string with the contents
read :: proc(path: os.Handle, allocator := context.allocator) -> ([]byte, bool) #optional_ok {
    data, ok := os.read_entire_file(path, allocator)
    //defer delete(data, allocator)
    return data, ok
}