
# Writing documentation

_Gugnir_ treats documentation as a first-class citizen. Documentation must be easy to write and easy to read. In this guide you will learn how to write documentation for _Odin_ projects, covering constructs like attributes, style and practices.

## Markdown

_Gungnir_ documentation is written using Markdown. There are plenty of guides on Markdown online, we recommend the one from GitHub as a getting started point:

- [Basic writing and formatting syntax](https://help.github.com/articles/basic-writing-and-formatting-syntax/)

Additionally _Gungnir_ uses [mdBook](https://rust-lang.github.io/mdBook/) for rendering _Markdown_. _mdBook_ is a command line tool to create books with _Markdown_. It is ideal for creating product or API documentation, tutorials, course materials or anything that requires a clean, easily navigable and customizable presentation.

## Documentation != Code Comments

_Gungnir_ treats documentation and code comments as different concepts. Documentation is an explicit contract between you and users of your Application Programming Interface (API), be they third-party developers, co-workers, or your future self. Packages and procedures must always be documented if they are part of your API.

Code comments are aimed at developers reading the code. They are useful for marking improvements, leaving notes (for example, why you had to resort to a workaround due to a bug in a library), and so forth. They are tied to the source code: you can completely rewrite a procedure and remove all existing code comments, and it will continue to behave the same, with no change to either its behavior or its documentation.

Private procedures cannot be accessed externally. However, you can add code comments to private procedures, as with any other piece of code, and we recommend developers to do so whenever they believe it will add relevant information to the readers and maintainers of such code.

In summary, documentation is a contract with users of your API, who may not necessarily have access to the source code, whereas code comments are for those who interact directly with the source. You can learn and express different guarantees about your software by separating those two concepts.

The convention in _Gungnir_ is separating the comments in two categories:

- Regular comments: `//` and `/*`, are used to mark what your code is trying to do, adding explainers for people who want to understand or modify that piece of code.

- Documentation comments: `///` and `/**`, are used to mark how your code should be used, explaining what its parameters are, what it returns, and more.
