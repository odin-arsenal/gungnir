/// docs.ignore
package Gungnir_Boundary_File

import "core:os"

// // Reads a file handle and returns a string with the contents
// read_from_handle :: proc(handle: os.Handle, allocator := context.allocator) -> (string, bool) #optional_ok {
//     data, ok := os.read_entire_file(handle, allocator)
//     return string(data), ok
// }

// // Reads a path
// read_from_path:: proc(path: string, allocator := context.allocator) -> (string, bool) #optional_ok {
//     data, ok := os.read_entire_file(path, allocator)
//     return string(data), ok
// }

// read :: proc {
//     os.read_entire_file
// }