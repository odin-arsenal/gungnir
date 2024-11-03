# 🪡  [Gungnir Documentation Generator](https://github.com/odin-arsenal/gungnir)

Code structure and organization is a matter of pride for developers.
Clear and consistent code signifies clear and consistent thought.

Even though the compiler lacks a discerning palate when it comes to
naming, whitespace, or documentation,
it makes all the difference for human collaborators.

_Gungnir_ takes inspiration from [_Swift-flavored Markdown_](https://www.swift.org/documentation/docc/), [_Jazzy_](https://github.com/realm/jazzy) and [_Hexdocs_](https://hexdocs.pm/elixir/main/writing-documentation.html) to extract documentation markup from special comments inside [_Odin_](https://odin-lang.org/) source-code. Creating [Markdown](https://daringfireball.net/projects/markdown/) files.

The script just generates _Markdown_ files.  _HTML_ output can be created by using [mdBook](https://rust-lang.github.io/mdBook/) or other _Markdown_ to website generators.

## Odin's Arsenal

This tool is part of [Odin's Arsenal](https://github.com/odin-arsenal) a set of tools
for _Odin_ developers.

## Usage

_Gungnir_ is a simple _Python_ script that reads `.odin` files and
parse them looking for `/**` (Markdown) comments. Then it extract the comment
contents and store them inside a _Markdown_ file.

You just need [_Python 3.7_](https://www.python.org/download/releases/3.0/) installed (_MacOS_ and _Linux_ provides a _Python_ installation by default in most cases).

```sh
$ python3 . ../
✨ Jobs Done!: found 9 files. parsed 6 comments. docs saved in `./docs`
```

[Take a peek](https://ninjascl.github.io/wren-odin/0.4/)
at a _Gungnir_-generated documentation for the `wren.odin` file.

- Note: The `docs` directory must exist. You can create it before hand `mkdir -p docs`.

### Known Issues

- Needs double newline in after each comment.
- Procedure declaration must be in a single line.

### Config

A small [configuration file](config.py) is provided.

- `repo`: The base for generating header links to the source code. e.g. _"github.com/ninjascl/domepunk"_
- `branch`: The url related to the branch in the source code. e.g. _"blob/main"_
- `docs`: Tells the directory name for generating the files e.g. _"docs"_

### Special Comments

There are some special comments that could be used at the beginning of the file.
Only one command per line is supported.

- `/** doc-disable */`: This command will disable parsing the file.

- `/** name: MyFilename */`: This command will overwrite the filename of the generated markdown file. By default _Gungnir_ uses the following format:

```python
# e.g wren.md
f"{pathToFile}".lower().strip().replace("/", "-").replace("\\", "-") + ".md"`
```

- `/** header */`: This is a special comment that will append its contents on the header of the document.

Example:

```js
/** header
This markdown will append before any other comment.
Useful for giving context.
*/
```

---

## Roadmap

- [x] Implement prototype (v0.1).
- [ ] Migrate code to `Odin` (v1.0).
- [ ] Implement Multiline _Markdown_ comments in `Odin` (`/**`).
- [ ] Implement Single line _Markdown_ comments in `Odin` (`////`).

# How to create comments

It is recommended to follow some standards. Either [Swift conventions](https://github.com/swiftlang/swift/blob/main/docs/DocumentationComments.md) or [Elixir conventions](https://hexdocs.pm/elixir/main/writing-documentation.html)
are mature and good.

It would require some time to determine which way is best suited for _Odin_.

## Links

- [Wren.odin file](https://github.com/NinjasCL/wren-odin/blob/main/0.4/wren.odin)
- [Hexdocs](https://hexdocs.pm/elixir/main/writing-documentation.html)
- [Jazzy](https://github.com/realm/jazzy)
- [NSHipster Swift Documentation](https://nshipster.com/swift-documentation/)
- [Swift header documentation in Xcode 7](https://ericasadun.com/2015/06/14/swift-header-documentation-in-xcode-7/)
- [Markup Formatting Reference](https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/)
- [Swift Docc](https://www.swift.org/documentation/docc/formatting-your-documentation-content)
- [Swift Documentation Comments](https://github.com/swiftlang/swift/blob/main/docs/DocumentationComments.md)
- [Mdbook](https://rust-lang.github.io/mdBook/)

## License

- BSD-3


## Credits

<p>
  Made with <i class="fa fa-heart">&#9829;</i> by
  <a href="https://ninjas.cl">
    Ninjas.cl
  </a>.
</p>