/* Mint Language Syntax Highlighter - Pure Mint Lang */
module MintHighlighter {
  /* Mint keywords */
  const KEYWORDS =
    [
      "component",
      "module",
      "store",
      "provider",
      "enum",
      "property",
      "state",
      "fun",
      "get",
      "set",
      "const",
      "if",
      "else",
      "case",
      "when",
      "try",
      "catch",
      "for",
      "of",
      "return",
      "next",
      "connect",
      "exposing",
      "style",
      "let",
      "where",
      "use",
      "sequence",
      "parallel",
      "encode",
      "decode",
      "as"
    ]

  /* Mint types */
  const TYPES =
    [
      "String",
      "Number",
      "Bool",
      "Array",
      "Maybe",
      "Result",
      "Promise",
      "Html",
      "Void",
      "Time",
      "Map",
      "Set",
      "Tuple",
      "Record"
    ]

  /* Highlight a single line of Mint code */
  fun highlight (line : String) : String {
    highlightLine(line, "", 0)
  }

  /* Recursive function to highlight line character by character */
  fun highlightLine (
    remaining : String,
    result : String,
    index : Number
  ) : String {
    if String.isEmpty(remaining) {
      result
    } else if String.startsWith(remaining, "//") {
      /* Single line comment - rest of line */
      result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(remaining),
        "comment")
    } else if String.startsWith(remaining, "/*") {
      /* Multi-line comment start */
      case String.indexOf(remaining, "*/") {
        Maybe.Just(endIndex) =>
          highlightLine(
            String.slice(remaining, endIndex + 2, String.size(remaining)),
              result + SyntaxHelpers.wrapToken(
                SyntaxHelpers.escapeHtml(
                  String.slice(remaining, 0, endIndex + 2)), "comment"),
                index + endIndex + 2)

        Maybe.Nothing =>
          result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(remaining),
            "comment")
      }
    } else {
      let char =
        String.slice(remaining, 0, 1)

      if char == "\"" {
        /* String literal */
        highlightString(remaining, result, index, 1)
      } else if String.match(char, "[a-zA-Z_]") {
        /* Potential keyword, type, or identifier */
        highlightWord(remaining, result, index)
      } else if String.match(char, "[0-9]") {
        /* Number */
        highlightNumber(remaining, result, index)
      } else if contains(char, "=>|+-*/%<>=!&|?:.,;(){}[]") {
        /* Operator or punctuation */
        highlightLine(String.dropStart(remaining, 1),
          result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(char),
            "operator"), index + 1)
      } else {
        /* Regular character */
        highlightLine(String.dropStart(remaining, 1),
          result + SyntaxHelpers.escapeHtml(char), index + 1)
      }
    }
  }

  /* Highlight a string literal */
  fun highlightString (
    remaining : String,
    result : String,
    index : Number,
    startIndex : Number
  ) : String {
    case String.indexOf(String.dropStart(remaining, startIndex), "\"") {
      Maybe.Just(endIndex) =>
        highlightLine(
          String.slice(remaining, endIndex + startIndex + 1,
            String.size(remaining)),
            result + SyntaxHelpers.wrapToken(
              SyntaxHelpers.escapeHtml(
                String.slice(remaining, 0, endIndex + startIndex + 1)),
                "string"), index + endIndex + startIndex + 1)

      Maybe.Nothing =>
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(remaining),
          "string")
    }
  }

  /* Highlight a word (keyword, type, function, or identifier) */
  fun highlightWord (
    remaining : String,
    result : String,
    index : Number
  ) : String {
    let word =
      extractWord(remaining, "")

    let rest =
      String.dropStart(remaining, String.size(word))

    let nextChar =
      String.slice(rest, 0, 1)

    if Array.contains(word, KEYWORDS) {
      highlightLine(rest,
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word),
          "keyword"), index + String.size(word))
    } else if Array.contains(word, TYPES) {
      highlightLine(rest,
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word), "type"),
          index + String.size(word))
    } else if word == "true" || word == "false" {
      highlightLine(rest,
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word),
          "boolean"), index + String.size(word))
    } else if nextChar == "(" {
      /* Function call */
      highlightLine(rest,
        result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(word),
          "function"), index + String.size(word))
    } else {
      highlightLine(rest, result + SyntaxHelpers.escapeHtml(word),
        index + String.size(word))
    }
  }

  /* Extract a word (alphanumeric + underscore) */
  fun extractWord (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char =
        String.slice(text, 0, 1)

      if String.match(char, "[a-zA-Z0-9_]") {
        extractWord(String.dropStart(text, 1), acc + char)
      } else {
        acc
      }
    }
  }

  /* Highlight a number */
  fun highlightNumber (
    remaining : String,
    result : String,
    index : Number
  ) : String {
    let num =
      extractNumber(remaining, "")

    let rest =
      String.dropStart(remaining, String.size(num))

    highlightLine(rest,
      result + SyntaxHelpers.wrapToken(SyntaxHelpers.escapeHtml(num), "number"),
        index + String.size(num))
  }

  /* Extract a number (digits and optional decimal point) */
  fun extractNumber (text : String, acc : String) : String {
    if String.isEmpty(text) {
      acc
    } else {
      let char =
        String.slice(text, 0, 1)

      if String.match(char, "[0-9.]") {
        extractNumber(String.dropStart(text, 1), acc + char)
      } else {
        acc
      }
    }
  }

  /* Helper to check if char is in string */
  fun contains (char : String, chars : String) : Bool {
    String.includes(chars, char)
  }
}
