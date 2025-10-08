/* CodeBlock - Reusable syntax-highlighted code display component */
component CodeBlock {
  /* Props */
  property code : String = ""

  property language : String = "mint"
  property showCopyButton : Bool = false

  /* Copy code to clipboard */
  fun copyToClipboard : Promise(Void) {
    `navigator.clipboard.writeText(#{code})`
  }

  /* Get highlighted code based on language */
  fun getHighlightedCode : String {
    if language == "mint" {
      MintPure.highlightMint(code)
    } else if language == "css" {
      CSSPure.highlightCSS(code)
    } else {
      /* Default: no highlighting, just escape HTML */
      HighlightEngine.escapeHtml(code)
    }
  }

  /* Styles */
  style container {
    background: #1e1e1e;
    border-radius: 12px;
    padding: 20px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #d4d4d4;
    line-height: 1.6;
    overflow-x: auto;
    white-space: pre;
    position: relative;
  }

  style copyButton {
    position: absolute;
    top: 12px;
    right: 12px;
    padding: 6px 12px;
    background: #2d2d30;
    border: 1px solid #3e3e42;
    border-radius: 6px;
    font-size: 12px;
    color: #cccccc;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      background: #3e3e42;
      color: #ffffff;
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      if showCopyButton {
        <button::copyButton
          onClick={(event : Html.Event) : Promise(Void) { copyToClipboard() }}
        >"📋 Copy"</button>
      } else {
        <></>
      }

      <div dangerouslySetInnerHTML={`{__html: #{getHighlightedCode()}}`}/>
    </div>
  }
}
