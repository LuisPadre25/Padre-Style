/* Stimulus Syntax Highlighter - Pure Mint Lang */
module StimulusPure {
  fun highlightStimulus (code : String) : String {
    HighlightEngine.highlightMultiLine(code,
      [
        "controller",
        "action",
        "target",
        "targets",
        "connect",
        "disconnect",
        "initialize",
        "data",
        "static",
        "values",
        "classes",
        "outlets"
      ], ["Controller", "Application", "Context", "Element"],
        ["true", "false", "null", "undefined"], "//", ["\"", "'"])
  }
}
