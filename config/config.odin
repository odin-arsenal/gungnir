package config

// This file is responsible for configuring your application
// and its dependencies.

// Can be subdivided in other files
//
// config.odin ->
// 	general application configuration
//
// dev.odin ->
// 	development environment configuration
//
// prod.odin ->
//	production environment configuration
//
// runtime.odin ->
//	is executed for all environments, including during releases.
//  It is executed after compilation and before the
//  system starts, so it is typically used to load production configuration
//  and secrets from environment variables or elsewhere.
//
//  test.odin ->
// 		test environment configuration

/// Project Constants
/// These constants contains information about the version.

/// Major version number
VERSION_MAJOR       :: 1


/// Minor version number
VERSION_MINOR       :: 0

/// Release version number
VERSION_RELEASE     :: 0

VERSION_RELEASE_STRING :: "0"

VERSION_NUMBER      :: VERSION_MAJOR * 1000000 + VERSION_MINOR * 1000 + VERSION_RELEASE
VERSION_STRING      :: "1.0"

/// A version with release number in string format
VERSION_FULL_STRING :: "1.0.0"

VERSION             :: "Project " + VERSION_STRING
RELEASE             :: VERSION + "." + VERSION_RELEASE_STRING
COPYRIGHT           :: RELEASE + "  Copyright (C) Odin's Arsenal, Ninjas.cl"
AUTHORS             :: "Made with ❤ by Ninjas.cl and friends."
WEBSITE							:: "https://github.com/odin-arsenal/draupnir"

/// The current environment set with -define:env=dev at build time
ENVIRONMENT 				:: #config(env, "dev")

// Can be separated in different files if needed

/// Dev environment settings
when ENVIRONMENT == "dev" {}

/// Prod environment settings
when ENVIRONMENT == "prod" {}

/// Test environment settings
when ENVIRONMENT == "test" {}
