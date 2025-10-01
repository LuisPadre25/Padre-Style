/* Code Syntax Highlighting Component - Pure Mint Lang */
component CodeHighlight {
  property code : String = ""
  property language : String = "mint"
  property showLineNumbers : Bool = true
  property showCopyButton : Bool = true
  property title : String = ""
  property maxHeight : String = ""

  connect ThemeStore exposing { currentTheme }

  state copied : Bool = false

  style container {
    border-radius: 12px;
    overflow: hidden;
    border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    background: #{ThemeHelpers.getElevated(currentTheme)};
    font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
    font-size: 14px;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.75rem 1rem;
    background: rgba(0, 0, 0, 0.2);
    border-bottom: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
  }

  style titleText {
    font-size: 0.875rem;
    font-weight: 600;
    color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  style copyButton {
    background: #{ThemeHelpers.getAccent(currentTheme)};
    color: white;
    border: none;
    padding: 0.375rem 0.75rem;
    border-radius: 6px;
    font-size: 0.75rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      opacity: 0.9;
      transform: translateY(-1px);
    }

    &:active {
      transform: translateY(0px);
    }
  }

  style codeWrapper {
    display: flex;
    overflow-x: auto;
    background: #1e1e1e;
    color: #d4d4d4;

    max-height: #{if String.isEmpty(maxHeight) {
      "none"
    } else {
      maxHeight
    }};

    overflow-y: auto;

    &::-webkit-scrollbar {
      width: 8px;
      height: 8px;
    }

    &::-webkit-scrollbar-track {
      background: #2d2d30;
    }

    &::-webkit-scrollbar-thumb {
      background: #424242;
      border-radius: 4px;
    }

    &::-webkit-scrollbar-thumb:hover {
      background: #555555;
    }
  }

  style lineNumbers {
    padding: 1rem 0;
    text-align: right;
    user-select: none;
    background: #252526;
    border-right: 1px solid #3e3e42;
    min-width: 3rem;
  }

  style lineNumber {
    display: block;
    padding: 0 0.75rem;
    color: #858585;
    font-size: 0.875rem;
    line-height: 1.5;
  }

  style codeContent {
    flex: 1;
    padding: 1rem;
    overflow-x: auto;
    tab-size: 2;
  }

  style codeLine {
    display: block;
    font-size: 0.875rem;
    line-height: 1.5;
    white-space: pre;
    tab-size: 2;
    font-variant-ligatures: none;
    letter-spacing: normal;
  }

  fun handleCopy (event : Html.Event) : Promise(Void) {
    `navigator.clipboard.writeText(#{code})`
    next { copied: true }

    await Timer.timeout(2000)

    next { copied: false }
  }

  fun getLines : Array(String) {
    String.split(code, "\n")
  }

  fun trimCommonIndent (lines : Array(String)) : Array(String) {
    /* Remove common leading whitespace from all lines */
    lines
  }

  fun highlightLine (line : String) : Html {
    <span>{line}</span>
  }

  fun renderLineAtIndex (index : Number, lines : Array(String)) : Html {
    case Array.at(lines, index) {
      Maybe.Just(line) => <div::codeLine>highlightLine(line)</div>

      Maybe.Nothing => <div/>
    }
  }

  fun render : Html {
    let lines =
      getLines()

    let displayTitle =
      if String.isEmpty(title) {
        language
      } else {
        title
      }

    <div::container>
      <div::header>
        <div::titleText>displayTitle</div>

        if showCopyButton {
          <button::copyButton onClick={handleCopy}>
            if copied {
              "✓ Copied!"
            } else {
              "📋 Copy"
            }
          </button>
        } else {
          <div/>
        }
      </div>

      <div::codeWrapper>
        if showLineNumbers {
          <div::lineNumbers>
            {
              for index of Array.range(0, Array.size(lines) - 1) {
                <div::lineNumber>Number.toString(index + 1)</div>
              }
            }
          </div>
        } else {
          <div/>
        }

        <div::codeContent>
          {
            for index of Array.range(0, Array.size(lines) - 1) {
              renderLineAtIndex(index, lines)
            }
          }
        </div>
      </div>
    </div>
  }
}
