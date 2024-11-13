/// docs.ignore
package Gungnir_Core_Parser

import "core:strings"

SINGLE_LINE_COMMENT :: "///"
MULTI_LINE_COMMENT :: "/**"

DOC_ACTION :: "docs."
DOC_ACTION_IGNORE :: "ignore"

is_single_line_doc_comment :: proc(content: string) -> bool {
    return strings.starts_with(content, SINGLE_LINE_COMMENT)
}

is_multi_line_doc_comment :: proc(content: string) -> bool {
    return strings.starts_with(content, MULTI_LINE_COMMENT)
}

is_doc_comment :: proc(content : string) -> bool {
    return is_single_line_doc_comment(content) ||  is_multi_line_doc_comment(content)
}

is_doc_action :: proc(content : string, keyword := DOC_ACTION) -> bool {
    return strings.starts_with(content, keyword)
}

is_doc_action_ignore :: proc (action : string) -> bool {
    return action == DOC_ACTION_IGNORE
}

get_doc_action :: proc(content: string) -> string {
    return trim_keyword(content, DOC_ACTION)
}

trim_keyword :: proc(content : string, keyword := SINGLE_LINE_COMMENT) -> string {
    return strings.trim_space(content[len(keyword):])
}

trim_leading_keyword :: proc(content : string, keyword := SINGLE_LINE_COMMENT) -> string {
    return strings.trim_left_space(content[len(keyword):])
}

trim_trailing_keyword :: proc(content : string, keyword := SINGLE_LINE_COMMENT) -> string {
    return strings.trim_right_space(content[len(keyword):])
}