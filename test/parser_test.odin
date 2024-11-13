package Gungnir_Test

import "core:log"
import "core:testing"
import "core:os"
import "core:fmt"

import "project:lib/core/Parser"

@(test)
test_that_docs_ignore_action_is_parsed :: proc(t: ^testing.T) {

    fixture := get_fixture_content("docs_ignore/docs_ignore.odin")

	result := Parser.parse_content(fixture)

    if testing.expect_value(t, result.ignore_file, true) {
        return
    }

    testing.cleanup(t, proc (raw_handle: rawptr) {
        handle := cast(^os.Handle) raw_handle
        os.close(handle^)
    }, &result)
}
