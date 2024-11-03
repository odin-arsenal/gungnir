package gungnir_tasks_version

import "core:fmt"

run_default_version_command :: proc() {
	fmt.printfln("%s\n%s\n%s", COPYRIGHT, AUTHORS, WEBSITE)
}
