# Mark Line Comments

_Mark Lines_ allows us to create a better overview of sections within our structs and procedures. A so-called mark line comment adds both a chapter title and linebreak in the generated _Markdown_ ouput. This chapter split makes it easier to quickly navigate through a relative big file. 

Having the need to add a mark line comment often indicates that your file is too large to easily navigate through. This could be an indication that you’ve written a file that’s doing too many things.

In this case, it might be worth to rethink your code and see whether you can split it up in multiple files with single responsibility. In the end, less code is often more readable.

Is up to you to decide whether you should split the code up or whether marks lines will help you out. 

Mark Lines are added through commented code. _Gungnir_ parses those comments into chapter lines within the document generation phase. There are several ways of using them each with their own added value. 

They are not using _Markdown_ style comments (`///`) so they can be compatible with syntax highlighting tools in IDEs such as [TODO Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree).

## Available Marks

When attempting to maintain our codebase it’s a good idea to have a clear and consistent way of structuring our code so it remains readable and easy to navigate. This becomes increasingly important as our codebase grows larger in size. _Mark lines_ are comments with special powers that are interpreted by _Gungnir_ a little differently compared to regular comments. They serve as a kind of labels within our code to help us organize it and keep it easy to navigate and readable in our code. There are three different types we can use to annotate our code; `MARK`, `TODO` and `FIXME`.

### `MARK:`

This adds a chapter title in your file’s symbol list.

```c
// MARK: Data Constructors
```

It will be translated as `# Data Constructors` in the generated _Summary's Markdown_.

### `MARK: -`

A separator line can be added to a marked chapter by using a dash after the colon. 

```c
// MARK: - User data constructors
```

It will be translated as `## User data constructors` in the generated _Summary's Markdown_.

#### Empty `MARK: -`

The great thing about the mark comment is that the title is not required. 
This means that we can create a clean separator line in our code without having to name a certain section. This can already improve navigation through our instances, even for the smaller ones. 

```c
// MARK: -
```

It will be translated as `---` in the generated _Summary's Markdown_.


### `FIXME:` and `TODO:`

The great thing about these marks is that it helps to identify the code that needs to be fixed or to be done later.
Ideally, this is combined with a [deprecated string](https://odin-lang.org/docs/overview/#deprecatedstring) so that you make sure to fix or implement this as soon as possible.

```odin
// TODO: Investigate why Mondays is needed.
// FIXME: Fix value when Mondays
@(deprecated="This method returns the wrong value on Mondays. Use `foo_v2` instead.")
foo :: proc() {
    // ...
}
```

They will not be used in the _Markdown_ output, but they can be used in IDEs to help navigate the code (with proper plugins or grep). Try to avoid merging code containing `FIXME` or `TODO` comments, because they tend to be easily forgotten. If you find yourself in a situation where you really need to merge your unfinished code (we all know it happens sometimes) with these types of comments, It is highly recommended using a [`log.warn()`](https://pkg.odin-lang.org/core/log/#warn) statement instead. 

A third option is the `NOTE:` markline, but is not quite as popular. Useful for comments that complements the understanding for maintainers of the code.

### Deprecation Policy

Before marking your code as `deprecated` it is recommended to follow a deprecation policy.

The deprecations could happen in 3 steps:

- The feature is soft-deprecated. It means both CHANGELOG and documentation must list the feature as deprecated but no warning is effectively emitted by running the code. There is no requirement to soft-deprecate a feature.

- The feature is effectively deprecated by emitting warnings on usage. In order to deprecate a feature, the proposed alternative MUST exist for AT LEAST two versions. For example, `foo_v1` was soft-deprecated in favor of `foo_v2` in `v1.1`. This means a deprecation warning may only be emitted by `v1.3` or later.

- The feature is removed. This can only happen on major releases. This means deprecated features in `v1.x` shall only be removed by `v2.x`.

## Example

This is an example code containing both _Markline_ and _Markdown_ documentation comments.

```odin
package My_Package

// MARK: Structs

// MARK: - Person Data

/// Person Contact Information
///
/// - Fields:
///     - email: A properly formatted email.
PersonContact :: struct {
    email : string,
}

/// Person Details
///
/// - Fields:
///     - name: Firstname of the person.
///     - lastname: Lastname of the person.
///     - contact: The main contact information for this person
Person :: struct {
    name : string,
    lastname : string,
    contact : PersonContact,
}
```

It will be rendered in the `SUMMARY.md` file as:

```markdown
# Structs

## Person Data

- [PersonContact](symbols/person-contact.md)
- [Person](symbols/person.md)

```


## References

- https://www.avanderlee.com/xcode/xcode-mark-line-comment/
- https://forsberg.dev/posts/MARK-comments/
- https://medium.com/@mumtaz.hussain/xcode-11-now-makes-mark-comments-a-lot-more-useful-with-minimap-feature-f8c658b293f
- https://hexdocs.pm/elixir/1.5.0-rc.2/deprecations.html