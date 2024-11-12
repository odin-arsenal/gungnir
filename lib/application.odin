package Application

import "tasks"

start :: proc(args: []string) {
	tasks.run(args)
}
