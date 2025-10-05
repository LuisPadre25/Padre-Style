/* Syntax Highlighting Engine - Pure Mint Lang */
module HighlightEngine {
  /* Escape HTML entities */
  fun escapeHtml (text : String) : String {
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  }

  /* Wrap text with span and color */
  fun colorize (text : String, color : String) : String {
    "<span style='color: " + color + ";'>" + escapeHtml(text) + "</span>"
  }

  /* Check if a word is in an array */
  fun contains (array : Array(String), word : String) : Bool {
    Array.any(array, (item : String) : Bool { item == word })
  }

  /* Basic word detection - simplified version */
  fun isWordChar (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { const c = #{char}.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()`
    }
  }

  /* Simple highlighting function */
  fun highlight (
    line : String,
    keywords : Array(String),
    types : Array(String)
  ) : String {
    processSimpleLine(line, keywords, types, 0, "")
  }

  /* Process line character by character */
  fun processSimpleLine (
    line : String,
    keywords : Array(String),
    types : Array(String),
    index : Number,
    result : String
  ) : String {
    if index >= String.size(line) {
      result
    } else {
      let remaining =
        String.dropStart(line, index)

      /* Check for strings */
      case detectString(remaining) {
        Maybe.Just(stringMatch) =>
          {
            let stringLength =
              String.size(stringMatch)

            let colored =
              colorize(stringMatch, "#CE9178")

            processSimpleLine(line, keywords, types, index + stringLength, result + colored)
          }

        Maybe.Nothing =>
          {
            /* Check for words */
            case detectWord(remaining) {
              Maybe.Just(wordMatch) =>
                {
                  let wordLength =
                    String.size(wordMatch)

                  let colored =
                    if contains(keywords, wordMatch) {
                      colorize(wordMatch, "#C586C0")
                    } else if contains(types, wordMatch) {
                      colorize(wordMatch, "#4EC9B0")
                    } else {
                      colorize(wordMatch, "#9CDCFE")
                    }

                  processSimpleLine(line, keywords, types, index + wordLength, result + colored)
                }

              Maybe.Nothing =>
                {
                  let char =
                    `#{remaining}.substring(0, 1)`

                  let colored =
                    colorize(char, "#D4D4D4")

                  processSimpleLine(line, keywords, types, index + 1, result + colored)
                }
            }
          }
      }
    }
  }

  /* Detect string at beginning */
  fun detectString (text : String) : Maybe(String) {
    if String.startsWith(text, "\"") {
      findStringEnd(text, "\"", 1)
    } else if String.startsWith(text, "'") {
      findStringEnd(text, "'", 1)
    } else {
      Maybe.Nothing
    }
  }

  /* Find end of string */
  fun findStringEnd (text : String, delimiter : String, position : Number) : Maybe(String) {
    if position >= String.size(text) {
      Maybe.Just(text)
    } else {
      let char =
        `#{text}.substring(#{position}, #{position + 1})`

      if char == delimiter {
        Maybe.Just(`#{text}.substring(0, #{position + 1})`)
      } else {
        findStringEnd(text, delimiter, position + 1)
      }
    }
  }

  /* Detect word at beginning */
  fun detectWord (text : String) : Maybe(String) {
    let firstChar =
      `#{text}.substring(0, 1)`

    if isWordChar(firstChar) {
      extractWord(text, 1)
    } else {
      Maybe.Nothing
    }
  }

  /* Extract word */
  fun extractWord (text : String, position : Number) : Maybe(String) {
    if position >= String.size(text) {
      Maybe.Just(`#{text}.substring(0, #{position})`)
    } else {
      let char =
        `#{text}.substring(#{position}, #{position + 1})`

      if isWordChar(char) {
        extractWord(text, position + 1)
      } else {
        Maybe.Just(`#{text}.substring(0, #{position})`)
      }
    }
  }

  /* Highlight multiple lines */
  fun highlightMultiLine (code : String, keywords : Array(String), types : Array(String)) : String {
    let lines =
      String.split(code, "\n")

    highlightLines(lines, keywords, types, 0, "")
  }

  /* Process multiple lines */
  fun highlightLines (
    lines : Array(String),
    keywords : Array(String),
    types : Array(String),
    index : Number,
    result : String
  ) : String {
    if index >= Array.size(lines) {
      result
    } else {
      case Array.at(lines, index) {
        Maybe.Just(line) =>
          {
            let highlighted =
              highlight(line, keywords, types)

            let lineResult =
              if index < Array.size(lines) - 1 {
                highlighted + "\n"
              } else {
                highlighted
              }

            highlightLines(lines, keywords, types, index + 1, result + lineResult)
          }

        Maybe.Nothing => highlightLines(lines, keywords, types, index + 1, result)
      }
    }
  }
}
