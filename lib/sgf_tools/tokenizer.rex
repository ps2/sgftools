#
# sgf.rex
# lexical definition for sgf
#
# usage
#  rex  sgf.rex 
#

class SgfTokenizer

macro           
  BLANK         \s+

rule

# [:state]  pattern  [actions]

# PropIdent
                [A-Z]+          { [:prop_ident, text] }

# PropValue
                \[[^\]]*\]      { [:prop_value, text[1..-2]] }

# skip
                {BLANK}         # no action

# identifier
                .               { [text, text] }

end

