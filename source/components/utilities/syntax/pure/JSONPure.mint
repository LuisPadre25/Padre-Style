/* JSON Syntax Highlighter - Pure Mint Lang */
module JSONPure {
  fun highlightJSON (code : String) : String {
    HighlightEngine.highlightMultiLine(code, [], [], ["true", "false", "null"], "", ["\""])
  }
}
