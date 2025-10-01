/* Professional Syntax Highlighter - Main module */
module Highlighter {
  /* Highlight a line of code based on language */
  fun highlight (line : String, language : String) : String {
    case language {
      "mint" => MintHighlighter.highlightMint(line)
      "javascript" => JavaScriptHighlighter.highlightJavaScript(line)
      "typescript" => TypeScriptHighlighter.highlightTypeScript(line)
      "python" => PythonHighlighter.highlightPython(line)
      "go" => GoHighlighter.highlightGo(line)
      "crystal" => CrystalHighlighter.highlightCrystal(line)
      "json" => JSONHighlighter.highlightJSON(line)
      "html" => HTMLHighlighter.highlightHTML(line)
      "css" => CSSHighlighter.highlightCSS(line)
      "bash" => BashHighlighter.highlightBash(line)
      "http" => HTTPHighlighter.highlightHTTP(line)
      "haml" => HAMLHighlighter.highlightHAML(line)
      "stimulus" => StimulusHighlighter.highlightStimulus(line)
      _ => escape(line)
    }
  }

  /* Escape HTML */
  fun escape (text : String) : String {
    `
    #{text}
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;')
    `
  }
}
