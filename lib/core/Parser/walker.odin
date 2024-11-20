/// docs.disable
package Gungnir_Core_Parser

import "project:lib/boundary/File"
import "core:strings"
import "core:fmt"
import "core:odin/ast"
import "core:log"

GungnirWalker :: struct {
    file: File.GungnirFileReadingResult,
    ast: ast.File,
}

GungnirWalkerDocument :: struct {
    disabled : bool, // documentation was disabled either by having a #+private tag or // docs.disable comment
}

new_walker_from_file_and_ast :: proc(file: File.GungnirFileReadingResult, ast: ast.File) -> GungnirWalker {
    return GungnirWalker{file = file, ast = ast}
}


walk :: proc(walker : GungnirWalker)  -> GungnirWalkerDocument {

    // First we look for the private tag
    // a private package tag will skip documentation generation.

    document : GungnirWalkerDocument

    for tag in walker.ast.tags {
        if strings.has_prefix(tag.text, "#+private") {
            document.disabled = true
            log.debug("#+private tag found. skipping document", walker.file.path)
            return document
        }
    }

    // If we continue at this point then
    // Render the markdown for the tags.
    
    // Then we look for `// docs.disable` or `/// docs.disable` action
    // that will skip documentation generation. 
    // This must be the first comment in the file.

    disable_check: for group in walker.ast.comments {
        for comment in group.list {
            // TODO: trim spaces and lowercase text
            if comment.text == "// docs.disable" || comment.text == "/// docs.disable" {
                document.disabled = true
                log.debug("docs.disable action found. skipping document", walker.file.path)
                return document
            }
            break disable_check
        }
    }


    // Check for Markdown comments inside the file
    // If they are not found, then disable docs.

    count := 0
    for group in walker.ast.comments {
        for comment in group.list {
            if strings.has_prefix(comment.text, "///") || strings.has_prefix(comment.text, "/**") {
                count += 1
            }
        }
    }

    if count == 0 {
        document.disabled = true
        log.debug("No documentation comments found. skipping document", walker.file.path)
        return document
    }

    // Look for Markline comments
    // MARK: are H1 (#)
    // MARK: - are H2 (##)
    // These are used for generating SUMMARY.md
    // And provide headers inside the final Markdown file.

    // Traverse every comment
    // Markdown comments will be stored in the documentation section.
    // They are identified by having a newline after the last comment.

    // Documentation comments will be stored in the symbols section.
    // They are identifier by having a symbol after the last comment.

    // Each symbol found will have its own Markdown file
    // so is easier to create a SUMMARY.md


    for line, index in walker.file.lines {
    }

    return document
}
