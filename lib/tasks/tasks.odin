/// docs.ignore
package Tasks

import "core:flags"

// Tasks
import "options"
import "version"
import "file"

parse_system_args :: proc(args: []string) -> options.Options {
	opt: options.Options
	flags.parse_or_exit(&opt, args, .Odin)
	return opt
}

run_task_by_options :: proc (args: options.Options) {

	if args.ver {
		version.run(args)
		return
	}

	if args.file {
		file.run(args)
		return
	}
}

// Entry point
run :: proc(args: []string) {
	run_task_by_options(parse_system_args(args))
}
