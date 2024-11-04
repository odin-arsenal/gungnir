package lib_tasks_options

/// Defines the available command line options
Options :: struct {
	version: bool `args:"pos=1,name=version" usage:"Prints the current version."`,
}
