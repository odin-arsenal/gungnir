# Gungnir Command Line

The _Gungnir_ command line accepts many different options. Uses `Odin` style arguments.

## Version Command

It will show version information, as well as the team and github repository. Useful for testing if the command was installed properly

**Command**

```shell
$ gungnir -v
```

**Output**

```text
Gungnir 1.0.0  Copyright (C) Odin's Arsenal, Ninjas.cl
Made with ❤ by Ninjas.cl and friends.
https://github.com/odin-arsenal/gungnir
```

## Single File Amalgamation

Since _Gungnir_ requires projects and packages a single file must be treated uniquely.
By default the output will be on the current directory. A param named `-out <path>`
can be used to control where the `file.odin.d` directory is stored.

### Params

- `filename`: Required. The path to the file.
- `-file`: Required. Indicates that this is a single file.
- `-out`: Optional. Specifies the output directory. By default _Gungnir_ will use the current directory.

### Usage

**Command**
```shell
$ gungnir file.odin -file -out /my/path
```

**Example Output**

```text
file.odin.d
├── api
│   ├── procedure1.json
│   └── procedure1.md
└── file.odin.md
└── file.odin.json
```

## Package Amalgamation

This will take all the files inside a package directory and create `*.docg` catalogues directly inside.
The `package` flag is needed since the default behaviour is the `project`.

### Usage

**Command**
```shell
$ gungnir lib -package
````

**Example Output**

```text
lib
├── API.md
├── SUMMARY.md
├── TOPICS.md
├── api
│   └── lib.odin.d
│       ├── api
│       │   ├── procedure_1.json
│       │   └── procedure_1.md
│       ├── lib.odin.json
│       └── lib.odin.md
├── content
│   └── Example.md
└── resources
    └── image.jpg
```

## Project Amalgamation

This is the default behaviour. The param is optional but can be made explicit by using `-project`. It will require a project structure using [Draupnir](https://github.com/odin-arsenal/draupnir) templates.

_Gungnir_ will assume the following structure:

- `docs`: Directory were the final HTML output would be copied to.
- `lib`: Directory were all the main application code is stored.
- `.version`: Text file that contains the current version number of the application. Used for the final HTML output in `docs`.
- `priv/documentation/mdbook`: Directory were amalgamated files will be stored.
- `project.odin`: Main project files that will be required to identify this as a _Draupnir_ based project.
- `Project *.md files`: These files are common in many projects, if they are found they will be used in the pipeline. They are: README.md, CHANGELOG.md, LICENSE.md, AUTHORS.md, CONTRIBUTING.md and SUMMARY.md.

### Params

- `-project`: Optional. This is the default behaviour in _Gungnir_. If no `project.odin` file is found inside the given path. Then it will emit a **warning** so users will be aware of the _Draupnir_ project structure requirement, and they must adhere to it or replace the default values with the provided options.

- `-version:<string>`: Optional. This will overwrite the number inside `.version` for the final output directory in `docs`. The if no `.version` is present, the default value is "".

- `-out:<path>`: Optional. This will overwrite where the amalgamated sources will be stored. By default is `priv/documentation/mdbook`.

- `-src:<path>`: Optional String. This will overwrite the `lib` directory and will look into the directory path given. Searching for `*.odin` files. If no path is given, `src` will be "src".

- `-odin`: Optional Bool. This will activate _Odin's pkg_ (aka `odin-doc`) documentation engine for rendering the HTML. The default path value for `-out` will change to `priv/documentation/odin-doc`. (Check https://github.com/odin-lang/pkg.odin-lang.org). And will transform _Markdown_ comments to _Odin Doc_ compatible comments.

- `-mdbook`: Optional Bool. This is the default rendering engine. Can be paired with `-odin-doc` for generating the documentation in both formats.

### Usage

**Command**

```shell
$ gungnir .
````

**Example Output**

```text
priv
│   ├── documentation
│   │   └── mdbook
│   │       ├── book
│   │       │   ├── 404.html
│   │       │   ├── FontAwesome
│   │       │   │   ├── css
│   │       │   │   │   └── font-awesome.css
│   │       │   │   └── fonts
│   │       │   │       ├── FontAwesome.ttf
│   │       │   │       ├── fontawesome-webfont.eot
..........................
│   │       ├── book.toml
│   │       └── src
│   │           ├── SUMMARY.md
│   │           ├── lib.docg
│   │           │   ├── Catalog.md
│   │           │   ├── SUMMARY.md
│   │           │   ├── WritingDocumentation.md
│   │           │   └── resources
│   │           └── root
│   │               ├── AUTHORS.md
│   │               ├── CHANGELOG.md
│   │               ├── CONTRIBUTING.md
│   │               ├── LICENSE.md
│   │               ├── README.md
│   │               ├── SUMMARY.md
│   │               └── resources
```

## Build

The build command will use `mdbook` or `odin-doc` commands to compile documentation to _HTML_. The amalgamation stage must be completed before. This option is only available for `-project` type amalgamations. `-file` and `-package` must be compiled manually.

### Params

- `-build.mdbook`: Boolean. Default parameter. Will call `mdbook` terminal app in `/priv/documentation/mdbook` directory.
- `-build.odin`: Boolean. Will call `odin-doc` terminal app in `priv/documentation/odin-doc` directory

### Usage

## Deploy

The deployment can be a full website from the build option or can be an archived tarball of the output directory.

### Params

- `-docs:<path>`: Optional. This will overwrite where the final HTML output will be stored. By default is `docs/<version>`.
- `-archive` Optional. This will generate the archived `<project-name>-<version>.gungnir.tar` file inside docs/ directory.

## Read

_Gungnir_ can also enable loading a `*.gungnir.tar` documentation archive. This will uncompress the html in a temp directory
and star a localhost in a random port.

### Params

- `load:<*.gungnir.tar>`: Loads a documentation archive in a temp directory and starts a localhost webserver (requires webserver command configuration).
