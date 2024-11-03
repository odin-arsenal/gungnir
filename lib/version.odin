package gungnir_lib

/**
### Gungnir Constants
These constants contains information about the version.
*/

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

VERSION             :: "Gungnir " + VERSION_STRING
RELEASE             :: VERSION + "." + VERSION_RELEASE_STRING
COPYRIGHT           :: RELEASE + "  Copyright (C) Odin's Arsenal, Ninjas.cl"
AUTHORS             :: "Made with ❤ by Ninjas.cl and friends."
WEBSITE							:: "https://github.com/odin-arsenal/gungnir"
