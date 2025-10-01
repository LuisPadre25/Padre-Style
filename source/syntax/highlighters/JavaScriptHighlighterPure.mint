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
    line
    |> SyntaxHelpers.escapeHtml
    |> highlightComments
    |> highlightStrings
    |> highlightKeywords
    |> highlightTypes
    |> highlightBooleans
    |> highlightNumbers
  }

  /* Highlight comments */
  fun highlightComments (text : String) : String {
    case String.indexOf(text, "//") {
      Maybe.Just(index) =>
        {
          let before =
            String.slice(text, 0, index)

          let comment =
            String.dropStart(text, index)

          before + SyntaxHelpers.wrapToken(comment, "comment")
        }

      Maybe.Nothing => text
    }
  }

  /* Highlight strings */
  fun highlightStrings (text : String) : String {
    text
    |> highlightStringDelimiter("&quot;", "&quot;")
    |> highlightStringDelimiter("&#39;", "&#39;")
  }

  /* Highlight string with specific delimiter */
  fun highlightStringDelimiter (
    text : String,
    open : String,
    close : String
  ) : String {
    highlightStringHelper(text, open, close, "")
  }

  /* Helper to highlight strings */
  fun highlightStringHelper (
    remaining : String,
    open : String,
    close : String,
    result : String
  ) : String {
    case String.indexOf(remaining, open) {
      Maybe.Just(startIndex) =>
        {
          let before =
            String.slice(remaining, 0, startIndex)

          let afterOpen =
            String.dropStart(remaining, startIndex + String.size(open))

          case String.indexOf(afterOpen, close) {
            Maybe.Just(endIndex) =>
              {
                let stringContent =
                  String.slice(
                    remaining,
                    startIndex,
                    startIndex + String.size(open) + endIndex + String.size(close))

                let rest =
                  String.dropStart(
                    remaining,
                    startIndex + String.size(open) + endIndex + String.size(close))

                highlightStringHelper(
                  rest,
                  open,
                  close,
                  result + before + SyntaxHelpers.wrapToken(stringContent, "string"))
              }

            Maybe.Nothing => result + remaining
          }
        }

      Maybe.Nothing => result + remaining
    }
  }

  /* Highlight keywords */
  fun highlightKeywords (text : String) : String {
    RegexHelpers.replaceWords(
      text,
      KEYWORDS,
      (word : String) : String { SyntaxHelpers.wrapToken(word, "keyword") })
  }

  /* Highlight types */
  fun highlightTypes (text : String) : String {
    RegexHelpers.replaceWords(
      text,
      TYPES,
      (word : String) : String { SyntaxHelpers.wrapToken(word, "type") })
  }

  /* Highlight booleans */
  fun highlightBooleans (text : String) : String {
    RegexHelpers.replaceWords(
      text,
      BOOLEANS,
      (word : String) : String { SyntaxHelpers.wrapToken(word, "boolean") })
  }

  /* Highlight numbers - using simple word boundary approach */
  fun highlightNumbers (text : String) : String {
    highlightNumbersHelper(text, "")
  }

  /* Helper to highlight numbers */
  fun highlightNumbersHelper (remaining : String, result : String) : String {
    if String.isEmpty(remaining) {
      result
    } else if SyntaxHelpers.isDigit(String.slice(remaining, 0, 1)) && !isInsideTag(result) {
      highlightNumbersWithNumber(remaining, result)
    } else {
      highlightNumbersHelper(
        String.dropStart(remaining, 1),
        result + String.slice(remaining, 0, 1))
    }
  }

  /* Helper to process a number that we know exists */
  fun highlightNumbersWithNumber (remaining : String, result : String) : String {
    highlightNumbersHelper(
      String.dropStart(remaining, String.size(extractNumber(remaining, ""))),
      result + SyntaxHelpers.wrapToken(extractNumber(remaining, ""), "number"))
  }

  /* Check if we're inside an HTML tag (to avoid highlighting already highlighted content) */
  fun isInsideTag (text : String) : Bool {
    let lastOpenTag =
      String.lastIndexOf(text, "<")

    let lastCloseTag =
      String.lastIndexOf(text, ">")

    case {lastOpenTag, lastCloseTag} {
      {Maybe.Just(openIndex), Maybe.Just(closeIndex)} => openIndex > closeIndex
      {Maybe.Just(openIndex), Maybe.Nothing} => true
      _ => false
    }
  }

  /* Extract a complete number */
  fun extractNumber (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char =
        String.slice(text, 0, 1)

      if SyntaxHelpers.isDigit(char) || char == "." {
        extractNumber(String.dropStart(text, 1), acc + char)
      } else {
        acc
      }
    }
  }
}
