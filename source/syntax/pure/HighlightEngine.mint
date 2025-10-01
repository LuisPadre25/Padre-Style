/* Syntax Highlighting Engine - Pure Mint Lang (Simplified) */
module HighlightEngine {
  /* Main highlighting function - simplified version */
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
    line
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&#39;")
  }
}
