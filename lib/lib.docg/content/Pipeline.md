# Pipeline

_Gungnir_ takes some stages to generate documentation.

##  Stage 0: Document detection and parsing

_Gungnir_ will scan the codebase inside the `lib` directory (or another path or file if given the param) looking for all `*.odin` files. It will remember the path and store the package reference for its corresponding `*.docg` directory.

### Markdown comments

The convention in _Gungnir_ is separating the comments in two categories:

- Regular comments: `//` and `/*`, are used to mark what your code is trying to do, adding explainers for people who want to understand or modify that piece of code. These comments will not be parsed by _Gungnir_. Normally used for private methods that must not generate _Markdown_ files.

- Documentation comments: `///` and `/**`, are used to mark how your code should be used, explaining what its parameters are, what it returns, and more. These are _Markdown_ comments and will be parsed by _Gungnir_.


### Gungnir tags

Special tags can be added to files to indicate a certain behviour.
These tags must be the first comment at the file:

- `/// docs.ignore`: _Gungnir_ will ignore this file and docs would not be generated.
- `/// docs.replace: <my-file>.md`: _Gungnir_ will ignore this file, but will use the file located inside the `<package>.docg/content/api/` directory as a replacement.
- `/// docs.name: <my-file>`: _Gungnir_ will generate the output files and directories based on this name and not the filename.

### Include files

Using `mdbook` syntax _Gungnir_ can include _Markdown_ files. This is useful when is preferred
to leave heavy documentation in special files. This can be included in any part of the file.

- `/// {{#include file.md}}`: The files must be inside the `content/api` directory. It will be the base path. It is recommended to create a custom `content/api/file.odin.d/` directory for storing such files.

**Important**

_Gungnir_ uses [`mdbook`](https://rust-lang.github.io/mdBook/format/mdbook.html) as a backend so it can access all it's features.

##  Stage 1: Gungnir Documentation Catalogs

Similar to `Odin`, _Gungnir_ is `package` sensible.
Each directory is a package that will have it's own `*.docg` (_Gungnir_ Documentation Catalog) directory.

These catalogs will store both the generated _API_ documentation and other custom made _Markdown_ files
or `resources` (images, diagrams, jsons) that would be used inside the _Markdown_ files.

Additionally for each properly documented procedure, constant, enum or struct found. It will create it's own files
inside `<package>.docg/api/<file>.odin.d/`.

- `TOPICS.md`: Optional. This file contains the links to custom made _Markdown_ files. It's optional and manually generated.

- `API.md`: This file is auto generated with the API _Markdown_ files. It's the concatenation of all the `<file>.odin.md`. The items will be sorted alphabetically.

- `SUMMARY.md`: This file is auto generated. First takes `TOPICS.md` and concatenates with `API.md`. It can be optionally be manually created as `<nnn>-SUMMARY.md` (000 to 999). _Gungnir_ will take this name and use it to generate the final file with the given number. This is important if you want the final amalgamated `SUMMARY.md` to control the final sorting inside `mdbook` stage.

<!-- TODO: Add link to Gugnir Style Guide. Is similar to Swift Markdown Docs format. -->
<!-- TODO: Maybe generate an odin file with constants too, for better inference? -->

- `<file>.odin.d/<procedure>.md`: Individual page for the procedure. Used for amalgamated `<file>.odin.md` and `SUMMARY.md` creation.

- `<file>.odin.d/<procedure>.json`: This is a parsed _Markdown_ with information about the procedure. It's meant to be used alongside an _IDE_ or other plugins and tools. Contains rich information that complements static inference. This is useful for creating other tools and integrations that can improve developer experience. For example if you want to convert _Markdown_ to _Asciidoc_ for usage in other backends like [Antora Docs](https://docs.antora.org/antora/latest/). For creating these, the file **must** be properly created using a strict _Markdown_ format. Check [Gungnir Markdown Style Guide](./) for more information.

- `content/`: Optional. Contains custom pages that will be manually linked in `TOPICS.md` by the developer.

**Example tree**
```text
lib
├── lib.docg
│   ├── API.md
│   ├── TOPICS.md
│   ├── 000-SUMMARY.md
│   ├── content
│   │   ├── MyCustomPage.md
│   │   ├── api
│   │   │		└── custom.md
│   ├── api
│   │   ├── lib.odin.d
│   │   │		├── lib.odin.md
│   │   │		├── main.json
│   │   │		└── main.md
│   └── resources
│       └── image.jpg
└── lib.odin
```


<!-- TODO: Figure out how to only show a mermaid both in Github and mdbook output -->
![Mermaid](https://github.com/user-attachments/assets/7d1e5405-7c01-4091-b29f-e820392dc874)

<!-- delete the space before > to be valid
```mermaid
flowchart TD
		A[File *.odin with Markdown comments] -- > |Get Markdown| B(Process Markdown Comments)
		B -- > C{Store them in package *.docg directory}
		C -- >|Generate| D[SUMMARY.md]
		C -- >|Generate| E[Top level *.odin file Markdown]
		C -- >|Generate| F[Directory for each *.odin file and store each procedure Markdown and json definition]
```
-->

##  Stage 2: Amalgamation

All detected package `*.docg` directories will be copied to `priv/documentation/src`. If a `.version` file is found at the root docs directory (or passed down as an argument). Then it will be used as the name of the output directory. For avoiding conflicts the `*.docg` directory names will be prefixed with the path names of the original route.

- `book.toml`: Main configuration file for `mdBook`.
- `highlight.js`: Custom `highlight.js` version for syntax highlighting.
- `src`: Storage of the amalgamated documentation.

**Example tree**

```text
documentation
├── book.toml
├── resources
│   └── highlight.js
├── .gitignore
├── src
│   ├── SUMMARY.md
│   ├── lib-lib.docg
│   │   ├── API.md
│   │   ├── TOPICS.md
│   │   ├── 000-SUMMARY.md
│   │   ├── content
│   │   │		├── MyCustomPage.md
│   │   │		├── api
│   │   │		│		└── custom.md
│   │   ├── api
│   │   │		├── lib.odin.d
│   │   │		│		└── lib.odin.md
│   │   │		│		└── main.json
│   │   │		│		└── main.md
│   │   ├── resources
│   │   │		└── image.jpg
└────────
```

##  Stage 3: mdBook compilation

This is the last stage where all the _Markdown_ files found at `src` will be compiled and copied
to `docs` directory under the `.version` number (or argument) or at the root of docs if no version is given.

**Example Output**

```text
docs
├── 0.4
│   ├── 404.html
│   ├── FontAwesome
│   │   ├── css
│   │   │   └── font-awesome.css
│   │   └── fonts
│   │       ├── FontAwesome.ttf
│   │       ├── fontawesome-webfont.eot
│   │       ├── fontawesome-webfont.svg
│   │       ├── fontawesome-webfont.ttf
│   │       ├── fontawesome-webfont.woff
│   │       └── fontawesome-webfont.woff2
│   ├── ayu-highlight.css
│   ├── book.js
│   ├── clipboard.min.js
│   ├── css
│   │   ├── chrome.css
│   │   ├── general.css
│   │   ├── print.css
│   │   └── variables.css
│   ├── elasticlunr.min.js
│   ├── favicon.png
│   ├── favicon.svg
│   ├── fonts
│   │   ├── OPEN-SANS-LICENSE.txt
│   │   ├── SOURCE-CODE-PRO-LICENSE.txt
│   │   ├── fonts.css
│   │   ├── open-sans-v17-all-charsets-300.woff2
│   │   ├── open-sans-v17-all-charsets-300italic.woff2
│   │   ├── open-sans-v17-all-charsets-600.woff2
│   │   ├── open-sans-v17-all-charsets-600italic.woff2
│   │   ├── open-sans-v17-all-charsets-700.woff2
│   │   ├── open-sans-v17-all-charsets-700italic.woff2
│   │   ├── open-sans-v17-all-charsets-800.woff2
│   │   ├── open-sans-v17-all-charsets-800italic.woff2
│   │   ├── open-sans-v17-all-charsets-italic.woff2
│   │   ├── open-sans-v17-all-charsets-regular.woff2
│   │   └── source-code-pro-v11-all-charsets-500.woff2
│   ├── highlight.css
│   ├── highlight.js
│   ├── index.html
│   ├── mark.min.js
│   ├── print.html
│   ├── searcher.js
│   ├── searchindex.js
│   ├── searchindex.json
│   ├── tomorrow-night.css
│   └── wren.html
└── README.md
```
