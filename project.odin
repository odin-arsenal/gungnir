/// docs.ignore
// Identifies the directory as an Odin project
// Setup settings for project wide context
package Gungnir_Project

import "core:fmt"
import "core:log"
import "core:os"
import "core:mem"
import "core:path/filepath"
import "core:encoding/ini"

import app "lib"
import "config"

// 1. Read project.ini
// 2. Setup logger
// 3. Pass Arguments from main to lib/application

read_project_settings :: proc() -> ini.Map {
	// Setup project.ini for entire project
	config_file_path := filepath.clean("project.ini")
	values, err, ok := ini.load_map_from_path(config_file_path, context.allocator)

	if !ok {
		fmt.panicf("Error opening project config file (%s): %s", config_file_path, err)
	}

	return values
}

setup_logger :: proc() -> os.Handle {
	// Setup logger for entire project
	log_file_path := filepath.clean("priv/logs/console.log")

	// Create log with empty values
	empty : []u8
	os.write_entire_file(log_file_path, empty)

	// Open the logger
	log_file_handle, log_file_open_error := os.open(log_file_path, os.O_WRONLY)

	if log_file_open_error != os.ERROR_NONE {
		fmt.panicf("Error opening log file (%s): %v\n", log_file_path, log_file_open_error)
	}

	return log_file_handle
}

main :: proc() {
	// Read project settings
	// Example usage
	// fmt.printfln("%v", (^ini.Map)(context.user_ptr)^)
	settings := read_project_settings()
	context.user_ptr = &settings
	defer free(&settings)

	// Start Logger
	log_handle := setup_logger()
	context.logger = log.create_multi_logger(
		log.create_console_logger(.Debug when ODIN_DEBUG else .Info),
		log.create_file_logger(log_handle),
	)
	defer os.close(log_handle)

	// Start Tracking Allocator
	when ODIN_DEBUG {
		track: mem.Tracking_Allocator
		mem.tracking_allocator_init(&track, context.allocator)
		context.allocator = mem.tracking_allocator(&track)

		defer {
			if len(track.allocation_map) > 0 {
				log.warnf("=== %v allocations not freed: ===\n", len(track.allocation_map))
				for _, entry in track.allocation_map {
					log.warnf("- %v bytes @ %v\n", entry.size, entry.location)
				}
			}
			if len(track.bad_free_array) > 0 {
				log.warnf("=== %v incorrect frees: ===\n", len(track.bad_free_array))
				for entry in track.bad_free_array {
					log.warnf("- %p @ %v\n", entry.memory, entry.location)
				}
			}
			mem.tracking_allocator_destroy(&track)
		}
	}

	// Now we can start our application
	log.debugf("Starting Application %s", config.VERSION)
	defer os.exit(app.start(os.args))
}
