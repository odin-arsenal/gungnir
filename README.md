# 💍  [Draupnir Full Project Template](https://github.com/odin-arsenal/draupnir)


[Draupnir](https://github.com/odin-arsenal/draupnir) a magical ring that symbolizes prosperity and abundance. Every ninth night, Draupnir would produce eight new rings of the same size and weight, adding to Odin’s wealth and power. This magical ring adds to the allure of Odin’s arsenal and the mythology that surrounds it.

In the same spirit, this project adds to Odin's wealth and power by scaffolding `Odin` projects.

## Odin's Arsenal

This project is part of the [Odin's Arsenal](https://github.com/odin-arsenal/draupnir).

## Usage

Use this template as a base to create your own [Odin Projects](https://odin-lang.org/).
This project contains a more feature full version of an _Odin Project_.

## Structure and Files

- `lib`: Directory where all the main packages will be stored.
- `test`: Directory where all the tests will be stored.
- `priv`: Directory where all the private files would exist.
- `deps`: Directory for all external libraries and vendored code.
- `docs`: Documentation generated to be available in Github Pages or similar.
- `lib.docg`: `Gungnir` documentation catalogue.
- `SUMMARY.md`: A file used in `Gungnir` to generate a menu.
- `.tool-versions`: `asdf-vm` version declaration of tools for this project.
- `.version`: A number indicating the current version (for CI purposes).
- `run`: A bash script to run the commands.
- `_build`: hidden directory for storing project build files
- `dist`: hidden directory for storing release builds.
- `.hooks`: store git hooks for linting and formatting odin projects.
- `config/config.odin`: Stores configuration settings for different environments: dev, prod, runtime, test.
- `config/runtime.odin`: Used for setting or getting Environment variables and other runtime only settings.
- `resources`: Stores different static assets like images needed for the application.
- `priv/documentation`: A `Gungnir` directory to store the amalgamated documentation before `mdbook` compilation.
- `priv/scripts`: Project helpful shell scripts for diverse tasks.
- `test/test_helper.odin`: A file to set variables and other global settings for the tests.
- `test/lib_test.odin`: An example test file.

## Run Script

The project provides a [_./run_](run) script to ease commands:

- `./run build.project`: Builds the `project.odin` file
- `./run build.debug`: Builds the `lib` package.
- `./run build.release`: Builds the `lib` package and store it in `dist`.
- `./run project`: Runs the `project` binary. You can pass arguments.
- `./run lib`: Runs the `lib` binary. You can pass arguments.
- `./run version`: Builds the `lib` package and runs the `--version` command.
- `./run hooks`: Install hooks to `.git` directory.
- `./run format`: Runs format and lint in the codebase.
- `./run docs`: Generates documentation using `Gungnir`.
- `./run deps.get`: Downloads git submodules inside `deps`.
- `./run test`: Run tests.

## Project Collection

In order to simplify the structure a collection is passed down to odin called `project`
that points to the root directory.

**Before**

```odin
import "../../../config"
```

**After**

```odin
import "project:config"
```

## Env Define

A define named `env` is pass down in build scripts
that can be used for special setting in different build configurations
inside `config/config.odin`.

```odin
when ENVIRONMENT == "dev" {

}

when ENVIRONMENT == "prod" {

}

when ENVIRONMENT == "test" {

}
```

## Tasks

A task can be defined by creating a new package inside `lib/tasks`, and which defines the `run` procedure.
The `run` procedure will receive a list of all command line arguments passed, according to the user's terminal.
You can use these tasks in `project.odin` as a way to access internal lib data or procedures.

**Example Task**

```odin
package lib_tasks_version

import "core:fmt"
import "project:config"
import "../options"

run :: proc(args: options.Options) {
	fmt.printfln("%s\n%s\n%s", config.COPYRIGHT, config.AUTHORS, config.WEBSITE)
}
```

## Main Files: project.odin and lib/lib.odin

- `project.odin`: This file is used for commands or other project related procedures. By default is an alias of `lib/lib.odin` main procedure. But can be modified as a special build, different from `lib.odin`. Is used mainly to identify the directory as an `odin` project.

- `lib/lib.odin`: This file is were the main application code is stored, contains its own main procedure.

## Docs

Documentation can be generated with [Gungnir](https://github.com/odin-arsenal/gungnir).

## License

- BSD-3

## Credits

<p>
  Made with <i class="fa fa-heart">&#9829;</i> by
  <a href="https://ninjas.cl">
    Ninjas.cl
  </a>.
</p>
