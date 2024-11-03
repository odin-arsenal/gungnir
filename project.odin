// Identifies the directory as an Odin project
// May have have a quick example on the use of the code inside lib/ directory
// In the future may execute scaffolding commands or other tasks
package gungnir_main

import "core:fmt"
import gungnir "lib"
import tasks "lib/tasks/version"


main :: proc() {
	tasks.run_version_command(gungnir.COPYRIGHT, gungnir.AUTHORS, gungnir.WEBSITE)
}
