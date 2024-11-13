// normal comment is ignored
package Gungnir_Fixture_Docs_Header

/// My File
///
/// This is a Header File
/// This will be rendered as a Markdown

/**
Example comment

This is an example discussion comment
- Parameters:
    - name: String with the name
- Returns:
    - hello: String with "Hello"
    - n: String with name
*/
my_procedure :: proc(name : string) -> (string, string) {
    return "Hello", name
}