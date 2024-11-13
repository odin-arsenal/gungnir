package Gungnir_Test
/// Sets variables
/// And other global settings
/// Available for all the tests

import "core:strings"
import "core:fmt"
import "project:lib/boundary/File"

get_fixture_path :: proc(path: string) -> string {
    fullpath := []string {"test/fixtures/", path}
    return strings.concatenate(fullpath)
}

get_fixture_content :: proc(path: string) -> string {
    return File.read_from_path(get_fixture_path(path))
}