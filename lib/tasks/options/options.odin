/// docs.ignore
package lib_tasks_options

// Defines the available command line options
Options :: struct {

	ver: bool `args:"pos=1,name=v" usage:"Prints the current version."`,
	file: bool `args:"pos=1,name=file" usage:"Tells Gungnir this is a file input."`,
	package: bool `args:"pos=1,name=package" usage:"Tells Gungnir this is a package input."`,
	project: bool `args:"pos=1,name=project" usage:"Tells Gungnir this is a project input. (Default)"`,
}
