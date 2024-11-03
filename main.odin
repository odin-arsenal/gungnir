package gungnir_main

import "core:fmt"
import tasks "lib/tasks/version"

// A main file is needed for running Odin in subdirectories
main :: proc() {
	tasks.version()
}
