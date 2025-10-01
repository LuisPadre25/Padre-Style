/* JSON Syntax Highlighter - Pure Mint Lang */
module JSONPure {
  fun highlightJSON (line : String) : String {
    HighlightEngine.highlight(line, [], [], ["true", "false", "null"], "", "",
      "", ["&quot;"])
  }
}
