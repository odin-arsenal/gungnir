package lib_tasks_version

import "core:fmt"
import "project:config"
import "../options"

run:: proc(args: options.Options) {
	fmt.printfln("%s\n%s\n%s", config.COPYRIGHT, config.AUTHORS, config.WEBSITE)
}
