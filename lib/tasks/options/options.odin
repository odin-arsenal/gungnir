package lib_tasks_options

/// Defines the available command line options
Options :: struct {
	ver: bool `args:"pos=1,name=v" usage:"Prints the current version."`,
}
