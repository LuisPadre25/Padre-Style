/* Regex-like helpers using Mint String functions */
module RegexHelpers {
  /* Replace all occurrences of a pattern with a replacement */
  fun replaceAll (text : String, pattern : String, replacement : String) : String {
    if String.isEmpty(text) || String.isEmpty(pattern) {
      text
    } else {
      case String.indexOf(text, pattern) {
        Maybe.Just(index) =>
          {
            let before =
              String.slice(text, 0, index)

            let after =
              String.dropStart(text, index + String.size(pattern))

            before + replacement + replaceAll(after, pattern, replacement)
          }

        Maybe.Nothing => text
      }
    }
  }

  /* Replace word with word boundaries */
  fun replaceWord (
    text : String,
    word : String,
    replacement : String
  ) : String {
    replaceWordHelper(text, word, replacement, "")
  }

  /* Helper for word replacement */
  fun replaceWordHelper (
    remaining : String,
    word : String,
    replacement : String,
    result : String
  ) : String {
    if String.isEmpty(remaining) {
      result
    } else {
      case String.indexOf(remaining, word) {
        Maybe.Just(index) =>
          {
            let before =
              String.slice(remaining, 0, index)

            let charBefore =
              if index > 0 {
                String.slice(remaining, index - 1, index)
              } else {
                " "
              }

            let charAfter =
              String.slice(remaining, index + String.size(word), index + String.size(word) + 1)

            let isWordBoundary =
              (isNonWordChar(charBefore) || index == 0) && (isNonWordChar(charAfter) || String.isEmpty(charAfter))

            if isWordBoundary {
              let newResult =
                result + before + replacement

              let rest =
                String.dropStart(remaining, index + String.size(word))

              replaceWordHelper(rest, word, replacement, newResult)
            } else {
              let newResult =
                result + before + word

              let rest =
                String.dropStart(remaining, index + String.size(word))

              replaceWordHelper(rest, word, replacement, newResult)
            }
          }

        Maybe.Nothing => result + remaining
      }
    }
  }

  /* Check if character is a non-word character */
  fun isNonWordChar (char : String) : Bool {
    if String.isEmpty(char) {
      true
    } else {
      !SyntaxHelpers.isWordChar(char) && char != "$"
    }
  }

  /* Replace multiple words at once */
  fun replaceWords (
    text : String,
    words : Array(String),
    wrapper : Function(String, String)
  ) : String {
    Array.reduce(
      words,
      text,
      (acc : String, word : String) : String {
        replaceWord(acc, word, wrapper(word))
      })
  }
}
