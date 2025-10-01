/* Syntax Highlighting Helpers - Pure Mint Lang */
module SyntaxHelpers {
  /* Wrap text with a token class */
  fun wrapToken (text : String, tokenType : String) : String {
    "<span class=\"token-#{tokenType}\">#{text}</span>"
  }

  /* Check if character is alphanumeric or underscore */
  fun isWordChar (char : String) : Bool {
    String.match(char, "[a-zA-Z0-9_]")
  }

  /* Check if string contains a substring */
  fun contains (haystack : String, needle : String) : Bool {
    String.includes(haystack, needle)
  }

  /* Check if string starts with prefix */
  fun startsWith (text : String, prefix : String) : Bool {
    String.startsWith(text, prefix)
  }

  /* Check if string ends with suffix */
  fun endsWith (text : String, suffix : String) : Bool {
    String.endsWith(text, suffix)
  }

  /* Check if a word is in an array of keywords */
  fun isKeyword (word : String, keywords : Array(String)) : Bool {
    Array.contains(word, keywords)
  }

  /* Escape HTML special characters */
  fun escapeHtml (text : String) : String {
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&#039;")
  }

  /* Extract words from a line */
  fun extractWords (line : String) : Array(String) {
    String.split(line, " ")
  }

  /* Check if character is a digit */
  fun isDigit (char : String) : Bool {
    String.match(char, "[0-9]")
  }

  /* Check if character is whitespace */
  fun isWhitespace (char : String) : Bool {
    char == " " || char == "\t" || char == "\n" || char == "\r"
  }
}
