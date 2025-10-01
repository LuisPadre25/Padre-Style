/* HAML Syntax Highlighter - Pure Mint Lang */
module HAMLPure {
  fun highlightHAML (line : String) : String {
    HighlightEngine.highlight(
      line,
      [
          "if",
          "unless",
          "while",
          "until",
          "for",
          "each",
          "case",
          "when",
          "else"
        ],
      [],
      [
          "true",
          "false",
          "nil"
        ],
      "/",
      "",
      "",
      [
          "&quot;",
          "&#39;"
        ])
  }
}
