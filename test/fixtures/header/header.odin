// normal comment is ignored
#+private file
package Gungnir_Fixture_Docs_Header

/// My File
///
/// This is a Header File
/// This will be rendered as a Markdown
/// Because it has a newline after 

// Below this normal comment is a documentation comment
// Is associated with the symbol right below it.
// Type /// or /** */ to begin a documentation comment and then use Gungnir's special dialect of Markdown to 
// write the content. This dialect supports many keywords like - Parameters: for describing procedure arguments 
// or - Returns: for describing return values.
// Note how the > Warning: keyword was recognized as an aside and automatically emphasized. 
// Gungnir supports multiple other aside types like Note, Tip and Important.

/// A simple salutation procedure
///
/// With this procedure you can have a "Hello" string 
/// and the name of the person to give salutation.
///
/// > Warning: The returned greeting is not localized. To
/// > produce a localized string, use ``localized_say_hello_to/1``
/// > instead.
///
/// - Parameters:
///    - name: The name of the person to say hello.
/// - Returns:
///    - hello: The phrase "Hello".
///    - result: The same name passed in the parameters.
/// - Example:
/// ```odin
/// say_hello_to("Camilo")
/// ```
/// ```return
/// "Hello", "Camilo"
/// ```
say_hello_to :: proc(name : string) -> (hello: string, result: string) {
    return "Hello", name
}