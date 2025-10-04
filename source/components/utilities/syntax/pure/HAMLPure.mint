/* HAML Syntax Highlighter - Pure Mint Lang */
module HAMLPure {
  fun highlightHAML (code : String) : String {
    HighlightEngine.highlightMultiLine(code,
      ["if", "unless", "while", "until", "for", "each", "case", "when", "else"],
        [], ["true", "false", "nil"], "/", ["\"", "'"])
  }
}
