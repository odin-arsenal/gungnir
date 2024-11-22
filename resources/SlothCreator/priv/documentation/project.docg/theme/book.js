// from: https://github.com/odin-lang/odin-lang.org/blob/9e62d94a6392f68ad01ac0059ced020a4eaacf86/themes/odin/layouts/partials/head.html#L71
hljs.registerLanguage("odin", function(e) {
    return {
        aliases: ["odin", "odinlang", "odin-lang", "language-odin"],
        keywords: {
            keyword: "auto_cast bit_field bit_set break case cast context continue defer distinct do dynamic else enum fallthrough for foreign if import in map matrix not_in or_else or_return package proc return struct switch transmute type_of typeid union using when where",
            literal: "true false nil",
            built_in: "abs align_of cap clamp complex conj expand_to_tuple imag jmag kmag len max min offset_of quaternion real size_of soa_unzip soa_zip swizzle type_info_of type_of typeid_of"
        },
        illegal: "</",
        contains: [e.C_LINE_COMMENT_MODE, e.C_BLOCK_COMMENT_MODE, {
            className: "string",
            variants: [e.QUOTE_STRING_MODE, {
                begin: "'",
                end: "[^\\\\]'"
            }, {
                begin: "`",
                end: "`"
            }]
        }, {
            className: "number",
            variants: [{
                begin: e.C_NUMBER_RE + "[ijk]",
                relevance: 1
            }, e.C_NUMBER_MODE]
        }]
    }
});

hljs.highlightAll()