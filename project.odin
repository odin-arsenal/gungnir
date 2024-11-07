// Identifies the directory as an Odin project
// May have have a quick example on the use of the code inside lib/ directory
// My execute scaffolding commands or other tasks
// Setup settings for project wide context
package project_main

import "core:fmt"
import "core:log"
import "core:os"
import "core:path/filepath"

import "lib"

main :: proc() {
	// Setup logger for entire project
	log_file_path := filepath.clean("priv/logs/console.log")
	log_file_handle, log_file_open_error := os.open(log_file_path, os.O_WRONLY)

	if log_file_open_error != os.ERROR_NONE {
		
		// File was not found, then we create it with empty values
		empty : []u8
		os.write_entire_file(log_file_path, empty)
		
		// Try again
		log_file_handle, log_file_open_error := os.open(log_file_path, os.O_WRONLY)

		if log_file_open_error != os.ERROR_NONE {
			fmt.panicf("Error opening log file (%s): %v\n", log_file_path, log_file_open_error)
		}
	}

	defer os.close(log_file_handle)
	
	context.logger = log.create_multi_logger(
		log.create_console_logger(),
		log.create_file_logger(log_file_handle),
	)

	log.info("Init")
	lib.main()
}
