/// docs.ignore
package  Gungnir_Application

import "tasks"

start :: proc(args: []string) -> int {
	tasks.run(args)
	return 0
}
