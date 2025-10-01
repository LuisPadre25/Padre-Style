/* CSS Syntax Highlighter - Pure Mint Lang */
module CSSPure {
  fun highlightCSS (line : String) : String {
    HighlightEngine.highlight(line,
      ["important", "media", "keyframes", "from", "to", "and", "not", "only"],
        [
          "color",
          "background",
          "border",
          "margin",
          "padding",
          "width",
          "height",
          "display",
          "position",
          "flex",
          "grid",
          "font",
          "text",
          "transform",
          "transition",
          "animation"
        ], [], "", "/*", "*/", ["&quot;", "&#39;"])
  }
}
