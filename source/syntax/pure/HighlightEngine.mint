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
    `"<span style='color: " + #{color} + ";'>" + #{escapeHtml(text)} + "</span>"`
  }

  /* Check if a word is in an array */
  fun contains (array : Array(String), word : String) : Bool {
    Array.any(array, (item : String) : Bool { item == word })
  }

  /* Check if word is UPPERCASE (constant) */
  fun isConstant (word : String) : Bool {
    if String.isEmpty(word) {
      false
    } else {
      `(() => { return #{word} === #{word}.toUpperCase() && /[A-Z]/.test(#{word}); })()`
    }
  }

  /* Check if word is PascalCase (class/type) */
  fun isPascalCase (word : String) : Bool {
    if String.isEmpty(word) {
      false
    } else {
      `(() => { const first = #{word}.charAt(0); return first === first.toUpperCase() && /[A-Z]/.test(first); })()`
    }
  }

  /* Check if next non-whitespace char is opening parenthesis (function call) */
  fun isFollowedByParen (line : String, position : Number) : Bool {
    `(() => { const rest = #{line}.substring(#{position}).trim(); return rest.startsWith('('); })()`
  }

  /* Check if character is operator */
  fun isOperatorChar (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { return /[+\-*/%=<>!&|^~?:]/.test(#{char}); })()`
    }
  }

  /* Check if character is a bracket */
  fun isBracket (char : String) : Bool {
    char == "(" || char == ")" || char == "[" || char == "]" || char == "{" || char == "}"
  }

  /* Check if bracket is opening */
  fun isOpenBracket (char : String) : Bool {
    char == "(" || char == "[" || char == "{"
  }

  /* Check if bracket is closing */
  fun isCloseBracket (char : String) : Bool {
    char == ")" || char == "]" || char == "}"
  }

  /* Extended bracket color palette - 12 distinct colors */
  fun getBracketColorExtended (depth : Number) : String {
    let level =
      `#{depth} % 12`

    if level == 0 {
      "#FFD700"
    } else if level == 1 {
      "#DA70D6"
    } else if level == 2 {
      "#179FFF"
    } else if level == 3 {
      "#FF6B6B"
    } else if level == 4 {
      "#4ECDC4"
    } else if level == 5 {
      "#95E1D3"
    } else if level == 6 {
      "#FFA07A"
    } else if level == 7 {
      "#98D8C8"
    } else if level == 8 {
      "#F7DC6F"
    } else if level == 9 {
      "#BB8FCE"
    } else if level == 10 {
      "#85C1E2"
    } else {
      "#F8B195"
    }
  }

  /* Generate color using HSL for very deep nesting (deterministic) */
  fun generateHslColor (depth : Number) : String {
    `
    (() => {
      // Use depth to generate a deterministic but varied hue
      const hue = (#{depth} * 137.5) % 360; // Golden angle for good distribution
      const saturation = 65 + (#{depth} % 20); // 65-85%
      const lightness = 55 + (#{depth} % 15); // 55-70%
      return "hsl(" + hue + ", " + saturation + "%, " + lightness + "%)";
    })()
    `
  }

  /* Get bracket pair color based on depth level */
  fun getBracketColor (depth : Number) : String {
    if depth < 12 {
      /* Use predefined palette for first 12 levels */
      getBracketColorExtended(depth)
    } else {
      /* Use HSL generator for deeper levels */
      generateHslColor(depth)
    }
  }

  /* Check if character is alphabetic or underscore */
  fun isAlpha (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { const c = #{char}.charCodeAt(0); return (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()`
    }
  }

  /* Check if character is digit */
  fun isDigit (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { const c = #{char}.charCodeAt(0); return c >= 48 && c <= 57; })()`
    }
  }

  /* Check if character is alphanumeric or underscore */
  fun isWordChar (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { const c = #{char}.charCodeAt(0); return (c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || c === 95; })()`
    }
  }

  /* Check if character is digit or dot */
  fun isNumberChar (char : String) : Bool {
    if String.isEmpty(char) {
      false
    } else {
      `(() => { const c = #{char}.charCodeAt(0); return (c >= 48 && c <= 57) || c === 46; })()`
    }
  }

  /* Main highlighting function - single line with optional initial bracket depth */
  fun highlight (
    line : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    singleLineComment : String,
    multiLineCommentStart : String,
    multiLineCommentEnd : String,
    stringDelimiters : Array(String)
  ) : String {
    /* Check for single line comments */
    if !String.isEmpty(singleLineComment) {
      case String.indexOf(line, singleLineComment) {
        Maybe.Just(index) =>
          {
            let before =
              highlightCode(`#{line}.substring(0, #{index})`, keywords, types, booleans, stringDelimiters, 0)

            let comment =
              colorize(String.dropStart(line, index), "#6A9955")

            before + comment
          }

        Maybe.Nothing => highlightCode(line, keywords, types, booleans, stringDelimiters, 0)
      }
    } else {
      highlightCode(line, keywords, types, booleans, stringDelimiters, 0)
    }
  }

  /* Highlight code without comments - now accepts initial bracket depth */
  fun highlightCode (
    line : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    stringDelimiters : Array(String),
    initialBracketDepth : Number
  ) : String {
    processLine(line, keywords, types, booleans, stringDelimiters, 0, "", initialBracketDepth)
  }

  /* Highlight multiple lines while maintaining bracket depth state */
  fun highlightMultiLine (
    code : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    singleLineComment : String,
    stringDelimiters : Array(String)
  ) : String {
    let lines =
      String.split(code, "\n")

    processLines(lines, keywords, types, booleans, singleLineComment, stringDelimiters, 0, 0, "")
  }

  /* Process multiple lines recursively, maintaining bracket depth */
  fun processLines (
    lines : Array(String),
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    singleLineComment : String,
    stringDelimiters : Array(String),
    lineIndex : Number,
    currentBracketDepth : Number,
    result : String
  ) : String {
    if lineIndex >= Array.size(lines) {
      result
    } else {
      case Array.at(lines, lineIndex) {
        Maybe.Just(line) =>
          {
            /* Highlight this line starting with current bracket depth */
            let highlightedTuple =
              highlightLineWithDepth(line, keywords, types, booleans, singleLineComment, stringDelimiters, currentBracketDepth)

            /* Destructure tuple */
            case highlightedTuple {
              {highlightedLine, newDepth} =>
                {
                  /* Add newline if not the last line */
                  let lineResult =
                    if lineIndex < Array.size(lines) - 1 {
                      highlightedLine + "\n"
                    } else {
                      highlightedLine
                    }

                  processLines(lines, keywords, types, booleans, singleLineComment, stringDelimiters, lineIndex + 1, newDepth, result + lineResult)
                }
            }
          }

        Maybe.Nothing => processLines(lines, keywords, types, booleans, singleLineComment, stringDelimiters, lineIndex + 1, currentBracketDepth, result)
      }
    }
  }

  /* Highlight a single line and return both the highlighted string and ending bracket depth */
  /* Returns Tuple(html : String, endDepth : Number) */
  fun highlightLineWithDepth (
    line : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    singleLineComment : String,
    stringDelimiters : Array(String),
    initialDepth : Number
  ) : Tuple(String, Number) {
    /* Check for single line comments */
    if !String.isEmpty(singleLineComment) {
      case String.indexOf(line, singleLineComment) {
        Maybe.Just(index) =>
          {
            let beforeResult =
              processLineWithDepthReturn(
                `#{line}.substring(0, #{index})`,
                keywords,
                types,
                booleans,
                stringDelimiters,
                0,
                "",
                initialDepth
              )

            let comment =
              colorize(String.dropStart(line, index), "#6A9955")

            case beforeResult {
              {html, depth} => {html + comment, depth}
            }
          }

        Maybe.Nothing =>
          processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, 0, "", initialDepth)
      }
    } else {
      processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, 0, "", initialDepth)
    }
  }

  /* Process line and return both HTML and final bracket depth */
  /* Returns Tuple(html : String, depth : Number) */
  fun processLineWithDepthReturn (
    line : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    stringDelimiters : Array(String),
    index : Number,
    result : String,
    bracketDepth : Number
  ) : Tuple(String, Number) {
    if index >= String.size(line) {
      {result, bracketDepth}
    } else {
      let remaining =
        String.dropStart(line, index)

      /* Check for strings */
      case detectString(remaining, stringDelimiters) {
        Maybe.Just(stringMatch) =>
          {
            let stringLength =
              String.size(stringMatch)

            /* Build colored string based on string length */
            let colored =
              if stringLength >= 2 {
                /* Extract delimiter and content */
                let delimiter =
                  `#{stringMatch}.substring(0, 1)`

                /* Process content for format specifiers */
                let processedContent =
                  processStringContent(stringMatch, 1, stringLength - 1)

                /* Build colored string */
                colorize(delimiter, "#CE9178") + processedContent + colorize(delimiter, "#CE9178")
              } else {
                /* String too short, just colorize as-is */
                colorize(stringMatch, "#CE9178")
              }

            processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + stringLength, result + colored, bracketDepth)
          }

        Maybe.Nothing =>
          {
            /* Check for numbers */
            case detectNumber(remaining) {
              Maybe.Just(numberMatch) =>
                {
                  let numberLength =
                    String.size(numberMatch)

                  let colored =
                    colorize(numberMatch, "#B5CEA8")

                  processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + numberLength, result + colored, bracketDepth)
                }

              Maybe.Nothing =>
                {
                  /* Check for words (keywords, types, identifiers) */
                  case detectWord(remaining) {
                    Maybe.Just(wordMatch) =>
                      {
                        let wordLength =
                          String.size(wordMatch)

                        let colored =
                          if contains(keywords, wordMatch) {
                            /* Keywords - purple */
                            colorize(wordMatch, "#C586C0")
                          } else if contains(types, wordMatch) {
                            /* Built-in types - cyan */
                            colorize(wordMatch, "#4EC9B0")
                          } else if contains(booleans, wordMatch) {
                            /* Boolean values - blue */
                            colorize(wordMatch, "#569CD6")
                          } else if isConstant(wordMatch) {
                            /* UPPERCASE constants - light blue */
                            colorize(wordMatch, "#4FC1FF")
                          } else if isFollowedByParen(line, index + wordLength) {
                            /* Function calls - yellow */
                            colorize(wordMatch, "#DCDCAA")
                          } else if isPascalCase(wordMatch) {
                            /* PascalCase types/classes - cyan */
                            colorize(wordMatch, "#4EC9B0")
                          } else {
                            /* Variables and other identifiers - light blue */
                            colorize(wordMatch, "#9CDCFE")
                          }

                        processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + wordLength, result + colored, bracketDepth)
                      }

                    Maybe.Nothing =>
                      {
                        /* Check for brackets first (for colorization) */
                        let char =
                          `#{remaining}.substring(0, 1)`

                        if isBracket(char) {
                          /* Handle bracket with depth-based coloring */
                          if isOpenBracket(char) {
                            /* Opening bracket: color with current depth, then increment */
                            let bracketColor =
                              getBracketColor(bracketDepth)

                            let colored =
                              colorize(char, bracketColor)

                            processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth + 1)
                          } else if isCloseBracket(char) {
                            /* Closing bracket: decrement depth first, then color */
                            let newDepth =
                              if bracketDepth > 0 {
                                bracketDepth - 1
                              } else {
                                0
                              }

                            let bracketColor =
                              getBracketColor(newDepth)

                            let colored =
                              colorize(char, bracketColor)

                            processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, newDepth)
                          } else {
                            /* Not a recognized bracket */
                            let colored =
                              colorize(char, "#D4D4D4")

                            processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth)
                          }
                        } else {
                          /* Check for operators */
                          case detectOperator(remaining) {
                            Maybe.Just(operatorMatch) =>
                              {
                                let operatorLength =
                                  String.size(operatorMatch)

                                let colored =
                                  colorize(operatorMatch, "#D4D4D4")

                                processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + operatorLength, result + colored, bracketDepth)
                              }

                            Maybe.Nothing =>
                              {
                                /* Regular character (punctuation, whitespace, etc) */
                                let colored =
                                  colorize(char, "#D4D4D4")

                                processLineWithDepthReturn(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth)
                              }
                          }
                        }
                      }
                  }
                }
            }
          }
      }
    }
  }

  /* Process line character by character */
  fun processLine (
    line : String,
    keywords : Array(String),
    types : Array(String),
    booleans : Array(String),
    stringDelimiters : Array(String),
    index : Number,
    result : String,
    bracketDepth : Number
  ) : String {
    if index >= String.size(line) {
      result
    } else {
      let remaining =
        String.dropStart(line, index)

      /* Check for strings */
      case detectString(remaining, stringDelimiters) {
        Maybe.Just(stringMatch) =>
          {
            let stringLength =
              String.size(stringMatch)

            let colored =
              colorize(stringMatch, "#CE9178")

            processLine(line, keywords, types, booleans, stringDelimiters, index + stringLength, result + colored, bracketDepth)
          }

        Maybe.Nothing =>
          {
            /* Check for numbers */
            case detectNumber(remaining) {
              Maybe.Just(numberMatch) =>
                {
                  let numberLength =
                    String.size(numberMatch)

                  let colored =
                    colorize(numberMatch, "#B5CEA8")

                  processLine(line, keywords, types, booleans, stringDelimiters, index + numberLength, result + colored, bracketDepth)
                }

              Maybe.Nothing =>
                {
                  /* Check for words (keywords, types, identifiers) */
                  case detectWord(remaining) {
                    Maybe.Just(wordMatch) =>
                      {
                        let wordLength =
                          String.size(wordMatch)

                        let colored =
                          if contains(keywords, wordMatch) {
                            /* Keywords - purple */
                            colorize(wordMatch, "#C586C0")
                          } else if contains(types, wordMatch) {
                            /* Built-in types - cyan */
                            colorize(wordMatch, "#4EC9B0")
                          } else if contains(booleans, wordMatch) {
                            /* Boolean values - blue */
                            colorize(wordMatch, "#569CD6")
                          } else if isConstant(wordMatch) {
                            /* UPPERCASE constants - light blue */
                            colorize(wordMatch, "#4FC1FF")
                          } else if isFollowedByParen(line, index + wordLength) {
                            /* Function calls - yellow */
                            colorize(wordMatch, "#DCDCAA")
                          } else if isPascalCase(wordMatch) {
                            /* PascalCase types/classes - cyan */
                            colorize(wordMatch, "#4EC9B0")
                          } else {
                            /* Variables and other identifiers - light blue */
                            colorize(wordMatch, "#9CDCFE")
                          }

                        processLine(line, keywords, types, booleans, stringDelimiters, index + wordLength, result + colored, bracketDepth)
                      }

                    Maybe.Nothing =>
                      {
                        /* Check for brackets first (for colorization) */
                        let char =
                          `#{remaining}.substring(0, 1)`

                        if isBracket(char) {
                          /* Handle bracket with depth-based coloring */
                          if isOpenBracket(char) {
                            /* Opening bracket: color with current depth, then increment */
                            let bracketColor =
                              getBracketColor(bracketDepth)

                            let colored =
                              colorize(char, bracketColor)

                            processLine(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth + 1)
                          } else if isCloseBracket(char) {
                            /* Closing bracket: decrement depth first, then color */
                            let newDepth =
                              if bracketDepth > 0 {
                                bracketDepth - 1
                              } else {
                                0
                              }

                            let bracketColor =
                              getBracketColor(newDepth)

                            let colored =
                              colorize(char, bracketColor)

                            processLine(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, newDepth)
                          } else {
                            /* Not a recognized bracket */
                            let colored =
                              colorize(char, "#D4D4D4")

                            processLine(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth)
                          }
                        } else {
                          /* Check for operators */
                          case detectOperator(remaining) {
                            Maybe.Just(operatorMatch) =>
                              {
                                let operatorLength =
                                  String.size(operatorMatch)

                                let colored =
                                  colorize(operatorMatch, "#D4D4D4")

                                processLine(line, keywords, types, booleans, stringDelimiters, index + operatorLength, result + colored, bracketDepth)
                              }

                            Maybe.Nothing =>
                              {
                                /* Regular character (punctuation, whitespace, etc) */
                                let colored =
                                  colorize(char, "#D4D4D4")

                                processLine(line, keywords, types, booleans, stringDelimiters, index + 1, result + colored, bracketDepth)
                              }
                          }
                        }
                      }
                  }
                }
            }
          }
      }
    }
  }

  /* Detect string at the beginning of text */
  fun detectString (text : String, delimiters : Array(String)) : Maybe(String) {
    detectStringHelper(text, delimiters, 0)
  }

  fun detectStringHelper (text : String, delimiters : Array(String), index : Number) : Maybe(String) {
    if index >= Array.size(delimiters) {
      Maybe.Nothing
    } else {
      case Array.at(delimiters, index) {
        Maybe.Just(delimiter) =>
          if String.startsWith(text, delimiter) {
            findStringEnd(text, delimiter, String.size(delimiter))
          } else {
            detectStringHelper(text, delimiters, index + 1)
          }

        Maybe.Nothing => Maybe.Nothing
      }
    }
  }

  /* Find the end of a string */
  fun findStringEnd (text : String, delimiter : String, position : Number) : Maybe(String) {
    if position >= String.size(text) {
      Maybe.Just(text)
    } else {
      let remaining =
        `#{text}.substring(#{position})`

      if String.startsWith(remaining, delimiter) {
        let endPos =
          position + String.size(delimiter)

        Maybe.Just(`#{text}.substring(0, #{endPos})`)
      } else {
        /* Check for escaped delimiter */
        if String.startsWith(remaining, `"\\\\"`) && position + 1 < String.size(text) {
          findStringEnd(text, delimiter, position + 2)
        } else {
          findStringEnd(text, delimiter, position + 1)
        }
      }
    }
  }

  /* Detect number at the beginning of text */
  fun detectNumber (text : String) : Maybe(String) {
    let firstChar =
      `#{text}.substring(0, 1)`

    if isDigit(firstChar) {
      extractNumber(text, 1)
    } else {
      Maybe.Nothing
    }
  }

  fun extractNumber (text : String, position : Number) : Maybe(String) {
    if position >= String.size(text) {
      Maybe.Just(`#{text}.substring(0, #{position})`)
    } else {
      let char =
        `#{text}.substring(#{position}, #{position + 1})`

      if isNumberChar(char) {
        extractNumber(text, position + 1)
      } else {
        Maybe.Just(`#{text}.substring(0, #{position})`)
      }
    }
  }

  /* Detect word (identifier) at the beginning of text */
  fun detectWord (text : String) : Maybe(String) {
    let firstChar =
      `#{text}.substring(0, 1)`

    if isAlpha(firstChar) {
      extractWord(text, 1)
    } else {
      Maybe.Nothing
    }
  }

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

  /* Detect format specifier inside string (printf-style: %s, %d, %f, etc.) */
  fun detectFormatSpecifier (text : String, position : Number) : Maybe(Number) {
    let size = String.size(text)

    if position >= size {
      Maybe.Nothing
    } else {
      let char = `#{text}.substring(#{position}, #{position + 1})`

      if char == "%" {
        if position + 1 < size {
          let nextChar = `#{text}.substring(#{position + 1}, #{position + 2})`

          if nextChar == "s" || nextChar == "d" || nextChar == "f" || nextChar == "v" || nextChar == "t" || nextChar == "b" || nextChar == "o" || nextChar == "x" || nextChar == "X" || nextChar == "e" || nextChar == "E" || nextChar == "g" || nextChar == "G" || nextChar == "c" || nextChar == "p" || nextChar == "%" || nextChar == "i" || nextChar == "u" {
            Maybe.Just(position + 2)
          } else {
            detectFormatSpecifier(text, position + 1)
          }
        } else {
          Maybe.Nothing
        }
      } else {
        detectFormatSpecifier(text, position + 1)
      }
    }
  }

  /* Process string content to highlight format specifiers */
  fun processStringContent (content : String, startPos : Number, endPos : Number) : String {
    case detectFormatSpecifier(content, startPos) {
      Maybe.Just(formatEnd) =>
        if formatEnd <= endPos {
          let before = `#{content}.substring(#{startPos}, #{formatEnd - 2})`
          let format = `#{content}.substring(#{formatEnd - 2}, #{formatEnd})`
          let afterProcessed = processStringContent(content, formatEnd, endPos)

          colorize(before, "#CE9178") + colorize(format, "#D7BA7D") + afterProcessed
        } else {
          colorize(`#{content}.substring(#{startPos}, #{endPos})`, "#CE9178")
        }

      Maybe.Nothing =>
        colorize(`#{content}.substring(#{startPos}, #{endPos})`, "#CE9178")
    }
  }

  /* Detect operator at the beginning of text */
  fun detectOperator (text : String) : Maybe(String) {
    let firstChar =
      `#{text}.substring(0, 1)`

    if isOperatorChar(firstChar) {
      /* Check for multi-character operators */
      let twoChars =
        `#{text}.substring(0, 2)`

      let threeChars =
        `#{text}.substring(0, 3)`

      /* Three-character operators */
      if String.startsWith(text, "===") || String.startsWith(text, "!==") || String.startsWith(text, ">>>") || String.startsWith(text, "<<=") || String.startsWith(text, ">>=") {
        Maybe.Just(threeChars)
      } else if String.startsWith(text, "==") || String.startsWith(text, "!=") || String.startsWith(text, "<=") || String.startsWith(text, ">=") || String.startsWith(text, "&&") || String.startsWith(text, "||") || String.startsWith(text, "++") || String.startsWith(text, "--") || String.startsWith(text, "<<") || String.startsWith(text, ">>") || String.startsWith(text, "=>") || String.startsWith(text, "::") || String.startsWith(text, "+=") || String.startsWith(text, "-=") || String.startsWith(text, "*=") || String.startsWith(text, "/=") || String.startsWith(text, "%=") || String.startsWith(text, "|>") {
        Maybe.Just(twoChars)
      } else {
        Maybe.Just(firstChar)
      }
    } else {
      Maybe.Nothing
    }
  }
}
