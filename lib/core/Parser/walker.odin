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

GungnirWalkerTokenKind :: enum {
    Unknown = -1,
    Tag,
    MarkH1,
    MarkH2,
    MarkRule, // Special case of MarkH2 without text that generates an Horizontal Rule
}

GungnirWalkerTokenKindStrings :: [GungnirWalkerTokenKind]string {
    .Unknown = "Unknown",
    .Tag = "Tag",
    .MarkH1 = "// MARK:",
    .MarkH2 = "// MARK: -",
    .MarkRule = "// MARK: -",
}

GungnirWalkerToken :: struct {
    line : int,
    declaration : string,
    kind : GungnirWalkerTokenKind,
    text: string,
    docs : [dynamic]string,
    sort : int,
}

GungnirWalkerDocument :: struct {
    disabled : bool, // documentation was disabled either by having a #+private tag or // docs.disable comment
    tokens: [dynamic]GungnirWalkerToken,
    walker : GungnirWalker,
}

@(private)
text_starts_with_token_kind :: proc(text: string, kind : GungnirWalkerTokenKind) -> bool {
    token_kinds := GungnirWalkerTokenKindStrings
    return strings.has_prefix(strings.trim_space(text), token_kinds[kind])
}

@(private)
trim_token :: proc(text: string, kind : GungnirWalkerTokenKind) -> string {
    token_kinds := GungnirWalkerTokenKindStrings
    return text[len(token_kinds[kind]):]
}

@(private)
trim_token_and_space :: proc(text: string, kind: GungnirWalkerTokenKind) -> string {
    return strings.trim_space(trim_token(text, kind))
}

// Public API

new_walker_from_file_and_ast :: proc(file: File.GungnirFileReadingResult, ast: ast.File) -> GungnirWalker {
    return GungnirWalker{file = file, ast = ast}
}


walk :: proc(walker : GungnirWalker)  -> GungnirWalkerDocument {

    // First we look for the private tag
    // a private package tag will skip documentation generation.

    document : GungnirWalkerDocument
    document.walker = walker

    tokens : [dynamic] GungnirWalkerToken
    defer delete(tokens)

    for tag in walker.ast.tags {
        if strings.has_prefix(tag.text, "#+private") {
            document.disabled = true
            log.debug("#+private tag found. skipping document", walker.file.path)
            return document
        }

        // Append the found tokens 
        append(&tokens, GungnirWalkerToken{
            line = tag.pos.line,
            declaration = tag.text,
            kind = .Tag,
        })
    }

    // If we continue at this point then
    // Render the markdown for the tags.
    
    // Then we look for `// docs.disable` or `/// docs.disable` action
    // that will skip documentation generation. 
    // This must be the first comment in the file.

    disable_check: for group in walker.ast.comments {
        for comment in group.list {
            text := strings.to_lower(strings.trim_space(comment.text))
            if text == "// docs.disable" || text == "/// docs.disable" {
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
    count_check: for group in walker.ast.comments {
        for comment in group.list {
            if strings.has_prefix(comment.text, "///") || strings.has_prefix(comment.text, "/**") {
                count += 1
            }
            // At least one doc comment is enough to parse the file
            if (count >= 1) {
                break count_check
            }
        }
    }

    if count == 0 {
        document.disabled = true
        log.debug("No documentation comments found. skipping document", walker.file.path)
        return document
    }

    // Now we are done checking for disabled = true
    // We are ready to begin parsing tokens

    // Look for Markline comments
    //
    // MARK: <empty>  ; is omited.
    // MARK: <text>   ; Are H1 (#) - A parent node, could have children.
    // MARK: - <text> ; Are H2 (##) - A child node, can't have children.
    // MARK: -        ; Are Horizontal Rule (---) - A child node, can't have children.
    // These are used for generating SUMMARY.md
    // And provide headers inside the final Markdown file.

    sort := 0
    
    for group in walker.ast.comments {
        for comment in group.list {

            // We only care for Markline comments
            if !text_starts_with_token_kind(comment.text, .MarkH1) {
                continue
            } 

            // If the Markline is empty, skip it
            if trim_token_and_space(comment.text, .MarkH1) == "" {
                continue
            }

            token := GungnirWalkerToken{kind = .MarkH1}
            token.text = trim_token_and_space(comment.text, .MarkH1)
            token.line = comment.pos.line

            if text_starts_with_token_kind(comment.text, .MarkH2) {
                token.text = trim_token_and_space(comment.text, .MarkH2)
                token.kind = .MarkH2

                if token.text == "" {
                    token.kind = .MarkRule
                }
            }

            token.sort = sort
            sort += 1
            append(&tokens, token)
        }
    }

    // Traverse every comment
    // Markdown comments will be stored in the documentation section.
    // They are identified by having a newline after the last comment.

    // Documentation comments will be stored in the symbols section.
    // They are identifier by having a symbol after the last comment.

    // Each symbol found will have its own Markdown file
    // so is easier to create a SUMMARY.md

    // for line, index in walker.file.lines {
    // }

    document.tokens = tokens

    return document
}
