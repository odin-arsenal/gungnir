package lib_tasks

import "core:fmt"
import "core:flags"
import "core:os"

// Tasks
import "options"
import "version"

parse_system_args :: proc() -> options.Options {
	args: options.Options
	flags.parse_or_exit(&args, os.args, .Unix)
	return args
}

run_task_by_options :: proc (args: options.Options) {
	if args.version {
		version.run(args)
		return
	}
}

process_tasks :: proc() {
	args := parse_system_args()
	run_task_by_options(args)
}
