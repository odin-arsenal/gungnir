package test

import "core:log"
import "core:testing"
import "core:os"

import lib "project:lib"

@(test)
test_that_lib_ :: proc(t: ^testing.T) {

		result := 42

    if testing.expect_value(t, result, 42) {
        return
    }

    testing.cleanup(t, proc (raw_handle: rawptr) {
        handle := cast(^os.Handle) raw_handle
        os.close(handle^)
    }, &result)
}
