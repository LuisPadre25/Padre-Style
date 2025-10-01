/* Simple Syntax Highlighting - Pure Mint using String operations */
module SimpleSyntax {
  /* Highlight with simple word-based coloring */
  fun highlight (line : String, language : String) : String {
    /* Get language-specific patterns */
    let keywords = getKeywords(language)
    let types = getTypes(language)

    /* Process the line word by word */
    processLine(line, keywords, types)
  }

  /* Get keywords for a language */
  fun getKeywords (language : String) : Array(String) {
    case language {
      "mint" => [
        "component", "module", "store", "property", "state", "fun",
        "if", "else", "case", "for", "of", "return", "next", "let",
        "connect", "exposing", "style", "const", "try", "catch"
      ]

      "javascript" => [
        "const", "let", "var", "function", "class", "if", "else",
        "for", "while", "return", "import", "export", "async", "await",
        "try", "catch", "new", "this"
      ]

      "python" => [
        "def", "class", "if", "else", "elif", "for", "while",
        "return", "import", "from", "try", "except", "with", "as"
      ]

      _ => []
    }
  }

  /* Get types for a language */
  fun getTypes (language : String) : Array(String) {
    case language {
      "mint" => ["String", "Number", "Bool", "Array", "Maybe", "Promise", "Html", "Void"]
      "javascript" => []
      "python" => []
      _ => []
    }
  }

  /* Process line with simple replacements */
  fun processLine (line : String, keywords : Array(String), types : Array(String)) : String {
    line
    |> highlightStrings
    |> highlightComments
    |> highlightKeywordsInLine(keywords)
    |> highlightTypesInLine(types)
    |> highlightNumbers
    |> SyntaxHelpers.escapeHtml
  }

  /* Highlight strings - simple approach */
  fun highlightStrings (line : String) : String {
    line
    |> String.replace("\"", "◆STR◆")
  }

  /* Highlight comments */
  fun highlightComments (line : String) : String {
    if String.contains(line, "//") {
      case String.indexOf(line, "//") {
        Maybe.Just(idx) =>
          String.slice(line, 0, idx) + "◆CMT◆" + String.slice(line, idx, String.size(line))

        Maybe.Nothing => line
      }
    } else {
      line
    }
  }

  /* Highlight keywords in line */
  fun highlightKeywordsInLine (line : String, keywords : Array(String)) : String {
    Array.reduce(
      keywords,
      line,
      (acc : String, keyword : String) : String {
        String.replace(acc, keyword, "◆KW◆" + keyword + "◆/KW◆")
      }
    )
  }

  /* Highlight types in line */
  fun highlightTypesInLine (line : String, types : Array(String)) : String {
    Array.reduce(
      types,
      line,
      (acc : String, t : String) : String {
        String.replace(acc, t, "◆TYPE◆" + t + "◆/TYPE◆")
      }
    )
  }

  /* Highlight numbers */
  fun highlightNumbers (line : String) : String {
    line
  }
}
