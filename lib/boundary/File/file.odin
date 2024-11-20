/// docs.ignore
package Gungnir_Boundary_File

import "core:os"
import "core:strings"
import Path "core:path/filepath"

// alias to https://github.com/odin-lang/Odin/blob/master/core/os/os.odin#L125

GungnirFileReadingResult :: struct {
    filename: string,
    path: string,
    data: []byte,
    content: string,
    lines: []string,
    error: os.Error,
}

@(require_results)
read_entire_file_from_handle_or_err :: proc(fd: os.Handle, path: string, allocator := context.allocator, loc := #caller_location) -> (result: GungnirFileReadingResult, ok : bool) #optional_ok {
    data, err := os.read_entire_file_from_handle_or_err(fd, allocator, loc)
    ok = err == nil
    if ok {
        result = GungnirFileReadingResult{
            path = path,
            filename = Path.base(path),
            data = data, 
            content = string(data),
            lines = strings.split_lines(string(data)),
        }

        return result, ok
    }
    return GungnirFileReadingResult{error = err}, ok
}

@(require_results)
read_entire_file_from_filename_or_err :: proc(name: string, path: string, allocator := context.allocator, loc := #caller_location) -> (result: GungnirFileReadingResult, ok : bool) #optional_ok {
    data, err := os.read_entire_file_from_filename_or_err(name, allocator, loc)
    ok = err == nil
    if ok {
        result = GungnirFileReadingResult{
            path = path,
            filename = Path.base(path),
            data = data, 
            content = string(data),
            lines = strings.split_lines(string(data)),
        }

        return result, ok
    }
    return GungnirFileReadingResult{error = err}, ok
}


read :: proc {
    read_entire_file_from_filename_or_err,
    read_entire_file_from_handle_or_err,
}