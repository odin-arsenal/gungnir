# Markdown Comments

_Markdown_ comments will output _Raw_ _Markdown_ markup to the generated document.

These are identified by writing triple slashes (`///`) or one slash and two asterisk (`/**`) and having a blank line after the comment.

**Example**

```odin
package Universal_Answer

/// This is a Markdown comment
/// This will be rendered to the output
/// Because it has a newline after the comment
/// No symbols are attached to this comment.

/**
This will also be available
as a Markdown comment
*/

// MARK: Answers

// The following is a Documentation Comment.
// Documentation comments are parsed for special Keywords
// That formats how to document symbols
// They are associated with a symbol (procedure, struct, enum, constant, field) below them

/// The universal answer
///
/// - Returns: The universal answer of life, the universe and everything.
get_universal_answer :: proc() -> int {
    return 42
}
```

Would render

```markdown
# Universal Answer

This is a Markdown comment
This will be rendered to the output
Because it has a newline after the comment
No symbols are attached to this comment.


This will also be available
as a Markdown comment

## Answers

### get_universal_answer

The universal answer

#### Declaration

`get_universal_answer :: proc() -> int`

#### Returns

- The universal answer of life, the universe and everything.

```