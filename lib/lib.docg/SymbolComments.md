# Symbol Comments

Symbol comments are _Markdown_ comments (`///`, `/**`) associated with a symbol. _Markdown_ comments are not linked to a symbol, in the other hand, symbol comments are linked to a symbol such as struct, procedures, enums, constants and struct or enum fields.

**Example**

```odin
// MARK: My Mark
// This is a comment
/// This is a normal Markdown Doc comment

/// This is a symbol doc comment
/// This is linked to the constant below
ANSWER :: 42
```
