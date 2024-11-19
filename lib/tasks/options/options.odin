/// docs.ignore
package  Gungnir_Tasks_Options

import "core:os"

// Defines the available command line options
Options :: struct {
	path: os.Handle `args:"pos=0, required, file=r" usage:"File path to analize. $ gungnir <path> -file"`,
	file: bool `args:"name=file" usage:"Enables file mode. $ gungnir <path> -file"`,
	ver: bool `args:"name=v" usage:"Print the current version."`,
	debug: bool `args:"hidden" usage:"Print debug info"`,
}
