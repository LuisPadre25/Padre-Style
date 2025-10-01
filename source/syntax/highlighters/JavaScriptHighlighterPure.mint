/* JavaScript Syntax Highlighter - Pure Mint Lang (100% Mint, no JS) */
module JavaScriptHighlighterPure {
  const KEYWORDS =
    [
      "const",
      "let",
      "var",
      "function",
      "class",
      "extends",
      "implements",
      "if",
      "else",
      "switch",
      "case",
      "default",
      "break",
      "continue",
      "for",
      "while",
      "do",
      "of",
      "in",
      "with",
      "try",
      "catch",
      "finally",
      "throw",
      "return",
      "async",
      "await",
      "yield",
      "import",
      "export",
      "from",
      "as",
      "new",
      "this",
      "super",
      "static",
      "get",
      "set",
      "delete",
      "typeof",
      "instanceof",
      "void",
      "debugger"
    ]

  const TYPES =
    [
      "Promise",
      "Array",
      "Object",
      "String",
      "Number",
      "Boolean",
      "Math",
      "JSON",
      "Date",
      "RegExp",
      "Error",
      "Map",
      "Set",
      "FormData",
      "Response",
      "Request",
      "console",
      "window",
      "document",
      "fetch"
    ]

  const BOOLEANS =
    [
      "true",
      "false",
      "null",
      "undefined",
      "NaN",
      "Infinity"
    ]

  /* Main highlighting function */
  fun highlightJavaScript (line : String) : String {
    processLine(SyntaxHelpers.escapeHtml(line), "", 0)
  }

  /* Process line character by character */
  fun processLine (remaining : String, result : String, index : Number) : String {
    if String.isEmpty(remaining) {
      result
    } else if String.startsWith(remaining, "//") {
      /* Comment - rest of line */
      result + SyntaxHelpers.wrapToken(remaining, "comment")
    } else if String.startsWith(remaining, "&quot;") {
      /* Double quoted string */
      processString(remaining, result, "&quot;")
    } else if String.startsWith(remaining, "&#39;") {
      /* Single quoted string */
      processString(remaining, result, "&#39;")
    } else {
      let char =
        String.slice(remaining, 0, 1)

      if SyntaxHelpers.isWordChar(char) {
        /* Start of a word - could be keyword, type, or identifier */
        processWord(remaining, result)
      } else if SyntaxHelpers.isDigit(char) {
        /* Number */
        processNumber(remaining, result)
      } else {
        /* Regular character */
        processLine(
          String.dropLeft(remaining, 1),
          result + char,
          index + 1)
      }
    }
  }

  /* Process a string literal */
  fun processString (
    remaining : String,
    result : String,
    delimiter : String
  ) : String {
    let delimiterSize =
      String.size(delimiter)

    let afterDelimiter =
      String.dropLeft(remaining, delimiterSize)

    case String.indexOf(afterDelimiter, delimiter) {
      Maybe.Just(endIndex) =>
        {
          let stringContent =
            String.slice(remaining, 0, delimiterSize + endIndex + delimiterSize)

          let rest =
            String.dropLeft(remaining, delimiterSize + endIndex + delimiterSize)

          processLine(
            rest,
            result + SyntaxHelpers.wrapToken(stringContent, "string"),
            0)
        }

      Maybe.Nothing =>
        {
          /* Unclosed string - highlight rest of line */
          result + SyntaxHelpers.wrapToken(remaining, "string")
        }
    }
  }

  /* Extract and process a word */
  fun processWord (remaining : String, result : String) : String {
    let word =
      extractWord(remaining, "")

    let rest =
      String.dropLeft(remaining, String.size(word))

    let tokenType =
      getWordType(word)

    case tokenType {
      Maybe.Just(type) =>
        processLine(rest, result + SyntaxHelpers.wrapToken(word, type), 0)

      Maybe.Nothing =>
        processLine(rest, result + word, 0)
    }
  }

  /* Extract a complete word */
  fun extractWord (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char =
        String.slice(text, 0, 1)

      if SyntaxHelpers.isWordChar(char) || char == "$" {
        extractWord(String.dropLeft(text, 1), acc + char)
      } else {
        acc
      }
    }
  }

  /* Get the token type for a word */
  fun getWordType (word : String) : Maybe(String) {
    if Array.contains(word, KEYWORDS) {
      Maybe.Just("keyword")
    } else if Array.contains(word, TYPES) {
      Maybe.Just("type")
    } else if Array.contains(word, BOOLEANS) {
      Maybe.Just("boolean")
    } else {
      Maybe.Nothing
    }
  }

  /* Extract and process a number */
  fun processNumber (remaining : String, result : String) : String {
    let number =
      extractNumber(remaining, "")

    let rest =
      String.dropLeft(remaining, String.size(number))

    processLine(rest, result + SyntaxHelpers.wrapToken(number, "number"), 0)
  }

  /* Extract a complete number */
  fun extractNumber (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char =
        String.slice(text, 0, 1)

      if SyntaxHelpers.isDigit(char) || char == "." {
        extractNumber(String.dropLeft(text, 1), acc + char)
      } else {
        acc
      }
    }
  }
}
