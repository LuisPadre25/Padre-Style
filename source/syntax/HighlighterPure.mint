/* Professional Syntax Highlighter - Pure Mint Lang (No JavaScript) */
module HighlighterPure {
  /* Highlight a line of code based on language */
  fun highlight (line : String, language : String) : String {
    case language {
      "mint" => MintPure.highlightMint(line)
      "javascript" => JavaScriptPure.highlightJavaScript(line)
      "typescript" => TypeScriptPure.highlightTypeScript(line)
      "python" => PythonPure.highlightPython(line)
      "go" => GoPure.highlightGo(line)
      "crystal" => CrystalPure.highlightCrystal(line)
      "json" => JSONPure.highlightJSON(line)
      "html" => HTMLPure.highlightHTML(line)
      "css" => CSSPure.highlightCSS(line)
      "bash" => BashPure.highlightBash(line)
      "http" => HTTPPure.highlightHTTP(line)
      "haml" => HAMLPure.highlightHAML(line)
      "stimulus" => StimulusPure.highlightStimulus(line)
      _ => escape(line)
    }
  }

  /* Escape HTML - Pure Mint (No JavaScript) */
  fun escape (text : String) : String {
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&#39;")
  }
}
