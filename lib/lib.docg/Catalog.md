# Documentation Catalog

_Gungnir_ lets us go a lot further by adding custom articles that really bring our documentation to life.
Documentation comments makes for a good reference, which is perfect for the times you want to read about a specific type, constant, enum, struct or procedure. But it’s less good at actually introducing what our project is trying to do – providing an introductory reference, explaining how the parts fit together, or pointing out particularly important concepts.

## Naming Convention

A documentation catalog is a directory named `<package>.docg` where `<package>` is the name of the _Odin_ package
in the same directory. The extension `docg` means "Documentation Gungnir".

## Build

_Gungnir_ will scan for all the directories `*.docg` inside the project and combine them in a `mdbook` project structure that can be build using `mdbook build`. The generated `mdbook` will be stored inside the `priv/documentation` directory.

## Directory: resources

Contains all images or resources used in the documentation. _Gungnir_ will copy this directory and place it inside the `mdBook` directory.

## File: SUMMARY.md

The summary file is used by `mdBook` to know what chapters to include, in what order they should appear, what their hierarchy is and where the source files are. Without this file, there is no book.

This markdown file must be named `SUMMARY.md`. Its formatting is very strict and must follow the structure outlined below to allow for easy parsing. Any element not specified below, be it formatting or textual, is likely to be ignored at best, or may cause an error when attempting to build the book.

_Gungnir_ will take the `SUMMARY.md` inside the `docg` directories and compile them in a single `SUMMARY.md` file for use inside `mdBook`.

This file must be created manually by the developers. For more information check [Summary documentation in Mdbook](https://rust-lang.github.io/mdBook/format/summary.html).

### Naming Convention

By default _Gungnir_ will sort the summaries alphabetically by `<package>.docg` name. If you want specific sort you can name your file like `<nnn>-SUMMARY.md` were `<nnn>` corresponds to a number between 000 and 999. Example: `001-SUMMARY.md`.

## Directory structure

A `*.docg` directory can have any amount of _Markdown_ files and resources. The only requirement is following the naming conventions and the `SUMMARY.md` file.

```text
lib.docg/
├── ABOUT.md
├── SUMMARY.md
└── resources/
```
