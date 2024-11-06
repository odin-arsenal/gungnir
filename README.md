# 🪡  [Gungnir Documentation Generator](https://github.com/odin-arsenal/gungnir)

_Gungnir_, the spear of Odin, is a symbol of power and authority in Norse mythology. According to legend, Odin himself created the spear and imbued it with magical properties that made it unstoppable in battle. It is said that Gungnir never missed its **mark** and always returned to Odin’s hand, no matter how far he threw it.

In the same spirit, this project never misses a **Mark**down style comment and generates _Markdown_ files to document _Odin_ projects.

## Odin's Arsenal

This tool is part of [Odin's Arsenal](https://github.com/odin-arsenal) a set of tools
for _Odin_ developers.

---

## Why Use _Gungnir_?

_Gugnir_ treats documentation as a first-class citizen. Documentation must be easy to write and easy to read. _Gungnir_ empowers you to write excellent reference documentation, leveraging the power of _Markdown_ and _Odin_ to give users a bird's-eye view of the public APIs in your framework, library or package, complete with the ability to describe how APIs work together, not just in isolation. _Gungnir_ enables you to write much more than great reference documentation, though. With _Markdown_ you can write articles to allow you walk users through the big picture behind your project, giving you an opportunity to tie individual items in your project together with a cohesive story. And tutorials are a powerful step-by-step walk-through of writing a project that uses your project. They allow you to go much deeper than reference documentation or articles by giving your users a guided introduction to your project from the ground up.

### Markdown

_Gungnir_ documentation is written using _Markdown_. There are plenty of guides on _Markdown_ online, we recommend the one from GitHub as a getting started point:

- [Basic writing and formatting syntax](https://help.github.com/articles/basic-writing-and-formatting-syntax/)

### Documentation != Code Comments

_Gungnir_ treats documentation and code comments as different concepts. Documentation is an explicit contract between you and users of your _Application Programming Interface_ (API), be they third-party developers, co-workers, or your future self. Packages and procedures must always be documented if they are part of your API.

Code comments are aimed at developers reading the code. They are useful for marking improvements, leaving notes (for example, why you had to resort to a workaround due to a bug in a library), and so forth. They are tied to the source code: you can completely rewrite a procedure and remove all existing code comments, and it will continue to behave the same, with no change to either its behavior or its documentation.

Private procedures cannot be accessed externally. However, you can add code comments to private procedures, as with any other piece of code, and we recommend developers to do so whenever they believe it will add relevant information to the readers and maintainers of such code.

In summary, documentation is a contract with users of your API, who may not necessarily have access to the source code, whereas code comments are for those who interact directly with the source. You can learn and express different guarantees about your software by separating those two concepts.

## Getting Started

_Gungnir_ is designed around the benefits of in-source documentation. You write your documentation right alongside your code, making it convenient and easy to integrate with your existing development workflow.

To add documentation to a declaration, you just write a special kind of comment directly above it. This makes it easy to keep your documentation in sync with any code changes you might make in the future. And, of course, it will fit right in with your existing text-based tooling, like Git diffs.

By writing a comment that begins with three forward slashes, you're telling _Gungnir_ documentation compiler to associate the comment with the declaration immediately below it. The comment will be included in the symbol's compiled documentation page and accessible to anyone who imports your package. And if you prefer to use block-style comments, you can create a documentation comment in that style by just including an extra asterisk in the opening delimiter.

The convention in _Gungnir_ is separating the comments in two categories:

- Regular comments: `//` and `/*`, are used to mark what your code is trying to do, adding explainers for people who want to understand or modify that piece of code. _Gugnir_ will ignore these comments when compiling documentation.

- Documentation comments: `///` and `/**`, are used to mark how your code should be used, explaining what its parameters are, what it returns, and more. These supports basic markdown syntax. For example, you can add headers, links, horizontal rules, bolding, and italics to your core description. You can also add code insets. Use the triple-backticks code fence or add four spaces or more to indicate code sections. _Gungnir_ use these comments for compiling documentation.

### Example

```odin
/// A simple sum procedure of two numbers
///
/// This is just a simple example of a procedure,
/// normally you won't need such procedure to wrap around
/// the sum operator.
///
/// - Parameter x: First number to sum
/// - Parameter y: Second number to sum
/// - Returns: The sum of both x and y
sum :: proc(x: int, y: int) -> int {
    return x + y
}
```

This can also be written with block style comments

```odin
/**
A simple sum procedure of two numbers

This is just a simple example of a procedure,
normally you won't need such procedure to wrap around
the sum operator.

- Parameter x: First number to sum
- Parameter y: Second number to sum
- Returns: The sum of both x and y
*/
sum :: proc(x: int, y: int) -> int {
    return x + y
}
```

**What Gungnir Parses?**

_Gungnir_ will read the previous code and parse it as the following structure:

```json
{
  "declaration": "sum :: proc(x: int, y: int) -> int",
  "file": "math.odin",
  "package": "math",
  "path": "lib/science",
  "line": 300,
  "symbol": "procedure",
  "identifier": "sum",
  "parameters": [{
    "sort": 0,
    "name": "x",
    "type": "int"
  },
  {
    "sort": 1,
    "name": "y",
    "type": "int"
  }
  ],
  "returns": [
    {
      "type": "int"
    }
  ],
  "docs": {
    "summary": "A simple sum procedure of two numbers",
    "description": "This is just a simple example of a procedure,\nnormally you won't need such procedure to wrap around\nthe sum operator.",
    "parameters": [{
      "name": "x",
      "sort": 0,
      "description": "First number to sum"
    },
    {
      "name": "y",
      "sort": 1,
      "description": "Second number to sum"
    }],
    "returns": ["The sum of both x and y"]
  }
}
```

Then _Gungnir_ will generate a _Markdown_ output.

```markdown

**procedure**

# [sum](lib/science/math/math.odin#300)

A simple sum procedure of two numbers.

## Declaration

\```odin
sum :: proc(x: int, y: int) -> int
\```

## Parameters

### x: int
First number to sum

### y: int
Second number to sum

## Returns

### int
The sum of both x and y

## Discussions

This is just a simple example of a procedure,
normally you won't need such procedure to wrap around
the sum operator.
```

### Keywords

_Gungnir_ recognizes several other keywords. These are: _Attention_, _Author_, _Authors_, _Bug_, _Complexity_, _Copyright_, _Date_, _Experiment_, _Important_, _Invariant_, _Note_, _Postcondition_, _Precondition_, _Remark_, _Requires_, _See_, _SeeAlso_, _Since_, _TODO_, _Version_, _Warning_, _Throws_.


- **Attributions** (author, authors, copyright, date) create a documentation trail for authorship.

- **Availability** (since, version) specifies when material was added to the code or updated, enabling you to lock down both release conformance and real-world time.

- **Admonitions** (attention, important, note, remark, warning) caution about use. These establish design rationales and point out limitations and hazards.

- **Development State** (bug, TODO, experiment) express progress of ongoing development, marking out areas needing future inspection and refinement.

- **Implementation qualities** (complexity) express a code’s time and space complexity.

- **Functional Semantics** (precondition, postcondition, requires, invariant) detail predicates about argument values before and after calls. Preconditions and requirements limit the values and conditions under which the code should be accessed. Postconditions specify observable results that are true after execution.

- **Cross Reference** (see) enables you to point out related material to add background to the documented implementation.

- **Throws** are used to document what errors can be thrown and why. These appear alongside parameters and return descriptions.

Reference: [Erica Sadun's Swift Documentation](https://ericasadun.com/2015/06/14/swift-header-documentation-in-xcode-7/)

### Render Backend

This _Markdown_ file can be fed to tools like [mdBook](https://rust-lang.github.io/mdBook/) for rendering _Markdown_. `mdBook` is a command line tool to create books with _Markdown_. It is ideal for creating product or API documentation, tutorials, course materials or anything that requires a clean, easily navigable and customizable presentation.

## State of the Art

Currently _Odin_ developers have a documentation tool called [`odin-doc`](https://github.com/odin-lang/pkg.odin-lang.org). This tool is used for the core packages documentation, but can also be available for other projects outside _Odin_ core. It works in a similar way of _Gungnir_ that parses comments and generates an output.

**Example Odin Doc**

```odin
/*
Whether the given string is "example"

**Does not allocate**

Inputs:
- bar: The string to check

Returns:
- ok: A boolean indicating whether bar is "example"

Example:
	foo("example")
	foo("bar")

Output:
	true
	false
*/
foo :: proc(bar: string) -> (ok: bool) {}
```

- [More examples can be found at Odin repository](https://github.com/odin-lang/Odin/tree/master/examples/all).

Additionally there is the convention of [doc.odin](https://github.com/odin-lang/Odin/blob/master/core/flags/doc.odin). A file with a comment similar to [Go Doc Comments](https://tip.golang.org/doc/comment). "Doc comments" are comments that appear immediately before top-level declarations with no intervening newlines. Every exported (capitalized) name should have a doc comment.

### Itches

_Odin Doc_ seems like a good and solid documentation tool for _Odin_ projects. However it has the following itches:

- Do not discriminate normal comments from documentation comments: This lack of separation of concerns can be cumbersome in the long run to differentiate documentation from developer comments.

- Requires all the core apis: The documentation is tied up with the core apis (even if they are hidden), which means the links generated can be outdated if the core api changes. Its best to link official core apis in the web instead of a local copy. This can be a good idea for a total offline distribution, but this is rarely a need for most people. A way to generate links both local or remote could be a good idea.

- Only generates HTML: The documentation tool generates HTML files only. It does not generate _Markdown_ files that can be used with any other renderer backend like `mdBook`. It also limits the themes and personalization options.

- Does not provides an executable: The tool needs to be built. It does not provide pre built binaries or `asdf-vm` recipes to quickly install and use it.

- Needs heavy configuration: The tool needs heavy configuration for rendering the output.

- Lack of standard for complementary docs: Autogenerated API docs are reference material and are not a replacement for good introductory docs, like overviews, articles and tutorials. _Odin Docs_ enables inclusion of complementary documents, but does not provides an standard for organization and presentation.

- Lack of Doctests: _Odin Docs_ lacks the ability to test documentation code examples.

## Roadmap

_Gungnir_ aims to be a complete suite of documentation tools to help _Odin_ developers.
For this endevour it will take an incremental and evolutional approach of features.

The main inspiration and goal is to provide a similar to [Swift Docc](https://www.swift.org/documentation/docc/) experience for _Odin_ developers. This means implementing a _Documentation Catalog_ and pipelines that will create HTML documentation files and archives that could be shared to the users and developers of the package, library or framework.

The presented _Roadmap_ can be modified depending on different priorities and findings from the evolution of the project. Is just a list of possible (but important) ideas.

|Item|Description|Status
|---|---|---|
| Implement prototype (v0.1) | Implement a Prototype in Python to test the viability of the approach. | Completed. [Download Available](https://github.com/odin-arsenal/gungnir/releases/tag/v0.1-prototype)
| Implement v1.0.0 | Implement a command line version in Odin that takes a single file and creates a _Markdown_ document, reading the documentation comments. | In Progress.
| _Gungnir_ Documentation Catalogues | _Gungnir_ documentation catalogues will enable richer documentation by appending articles, tutorials and extended reference docs by storing files inside a `*.docg` directory at the package level. | To be defined.
| Doctests| [Doctests](https://stackoverflow.com/a/13722080) solves the far more subtle danger of having outdated comments misleading the maintenance of the code.| To be defined.
|_Odin Doc_ bi-directional transpiler | Take _Gungnir_ documentation comments and transpile them to _Odin Doc_ format (and reverse operation). This will enable integration with existing codebases. | To be defined.
|Tarball Archives| Provide archiving the HTML docs in a `*.tar` file. This can be loaded in _Gungnir_ to initialize a localhost server to show the documentation inside the tarball. | To be defined.

## License

- BSD-3


## Credits

<p>
  Made with <i class="fa fa-heart">&#9829;</i> by
  <a href="https://ninjas.cl">
    Ninjas.cl
  </a>.
</p>