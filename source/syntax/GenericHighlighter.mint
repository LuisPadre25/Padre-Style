/* Generic Syntax Highlighter - Simplified for common languages */
module GenericHighlighter {
  /* Get keywords for a language */
  fun getKeywords (language : String) : Array(String) {
    case language {
      "javascript" =>
        ["const", "let", "var", "function", "class", "if", "else", "for", "while", "return", "import", "export", "async", "await", "try", "catch", "new", "this", "super", "extends"]

      "typescript" =>
        ["const", "let", "var", "function", "class", "interface", "type", "if", "else", "for", "while", "return", "import", "export", "async", "await", "public", "private", "protected"]

      "python" =>
        ["def", "class", "if", "else", "elif", "for", "while", "return", "import", "from", "try", "except", "with", "as", "in", "is", "and", "or", "not", "lambda", "pass", "break", "continue"]

      "go" =>
        ["package", "import", "func", "var", "const", "type", "struct", "interface", "if", "else", "for", "range", "return", "go", "defer", "chan", "map", "make", "new"]

      "crystal" =>
        ["def", "class", "module", "if", "else", "elsif", "for", "while", "return", "require", "include", "end", "do", "begin", "rescue"]

      _ => []
    }
  }

  /* Simple highlight that colors keywords, strings, numbers, and comments */
  fun highlight (line : String, language : String) : String {
    let keywords = getKeywords(language)
    highlightSimple(line, keywords, "")
  }

  /* Simplified recursive highlighter */
  fun highlightSimple (remaining : String, keywords : Array(String), result : String) : String {
    if String.isEmpty(remaining) {
      result
    } else if String.startsWith(remaining, "//") || String.startsWith(remaining, "#") {
      /* Comment */
      result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(remaining), "comment")
    } else if String.startsWith(remaining, "\"") {
      /* String */
      highlightStringSimple(remaining, keywords, result, 1)
    } else if String.startsWith(remaining, "'") {
      /* Single quote string */
      highlightStringSimple(remaining, keywords, result, 1)
    } else if String.match(String.slice(remaining, 0, 1), "[a-zA-Z_]") {
      /* Word */
      highlightWordSimple(remaining, keywords, result)
    } else if String.match(String.slice(remaining, 0, 1), "[0-9]") {
      /* Number */
      highlightNumberSimple(remaining, keywords, result)
    } else {
      /* Other character */
      highlightSimple(String.dropStart(remaining, 1), keywords, result + SyntaxHelpers.escapeHtml(String.slice(remaining, 0, 1)))
    }
  }

  /* Highlight string */
  fun highlightStringSimple (remaining : String, keywords : Array(String), result : String, start : Number) : String {
    let quote = String.slice(remaining, 0, 1)

    case String.indexOf(String.dropStart(remaining, start), quote) {
      Maybe.Just(endIndex) =>
        {
          let strLen = endIndex + start + 1
          let str = String.slice(remaining, 0, strLen)
          let rest = String.dropStart(remaining, strLen)
          highlightSimple(rest, keywords, result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(str), "string"))
        }

      Maybe.Nothing =>
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(remaining), "string")
    }
  }

  /* Highlight word */
  fun highlightWordSimple (remaining : String, keywords : Array(String), result : String) : String {
    let word = extractWord(remaining, "")
    let rest = String.dropStart(remaining, String.size(word))

    if Array.contains(word, keywords) {
      highlightSimple(rest, keywords, result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word), "keyword"))
    } else if word == "true" || word == "false" || word == "null" || word == "undefined" || word == "nil" || word == "True" || word == "False" || word == "None" {
      highlightSimple(rest, keywords, result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word), "boolean"))
    } else if String.slice(rest, 0, 1) == "(" {
      highlightSimple(rest, keywords, result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word), "function"))
    } else {
      highlightSimple(rest, keywords, result + SyntaxHelpers.escapeHtml(word))
    }
  }

  /* Extract word */
  fun extractWord (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char = String.slice(text, 0, 1)

      if String.match(char, "[a-zA-Z0-9_]") {
        extractWord(String.dropStart(text, 1), acc + char)
      } else {
        acc
      }
    }
  }

  /* Highlight number */
  fun highlightNumberSimple (remaining : String, keywords : Array(String), result : String) : String {
    let num = extractNumber(remaining, "")
    let rest = String.dropStart(remaining, String.size(num))
    highlightSimple(rest, keywords, result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(num), "number"))
  }

  /* Extract number */
  fun extractNumber (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char = String.slice(text, 0, 1)

      if String.match(char, "[0-9.]") {
        extractNumber(String.dropStart(text, 1), acc + char)
      } else {
        acc
      }
    }
  }
}
