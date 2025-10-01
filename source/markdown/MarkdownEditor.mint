/* Markdown Editor with Live Preview - Simplified */
component MarkdownEditor {
  state markdown : String = <<-MARKDOWN
  # Welcome to Markdown Editor

  Full-featured **Markdown** editor with *live preview* and `syntax highlighting`.

  ---

  ## Headers

  # H1 Header
  ## H2 Header
  ### H3 Header
  #### H4 Header
  ##### H5 Header
  ###### H6 Header

  ---

  ## Text Formatting

  **Bold text** - use double asterisks
  *Italic text* - use single asterisk
  `Inline code` - use backticks

  You can combine **bold and _italic_** text.

  ---

  ## Lists

  ### Unordered Lists (with -)

  - First item
  - Second item
  - Third item
    - Nested item
    - Another nested item

  ### Unordered Lists (with *)

  * Apple
  * Banana
  * Orange

  ---

  ## Blockquotes

  > This is a blockquote.
  > It can span multiple lines.

  > Another quote here.

  ---

  ## Code Blocks

  ### Mint Lang Example

  ```mint
  component Hello {
    state count : Number = 0

    fun increment : Promise(Void) {
      next { count: count + 1 }
    }

    fun render : Html {
      <div>
        <h1>"Counter: " + Number.toString(count)</h1>
        <button onClick={increment}>"Increment"</button>
      </div>
    }
  }
  ```

  ### JavaScript Example

  ```javascript
  function greet(name) {
    return "Hello " + name + "!";
  }

  console.log(greet("World"));
  ```

  ### Python Example

  ```python
  def greet(name):
      return "Hello " + name + "!"

  print(greet("World"))
  ```

  ---

  ## Tables

  | Language   | Type       | Year |
  | Mint       | Functional | 2018 |
  | JavaScript | Multi      | 1995 |
  | Python     | OOP        | 1991 |
  | Rust       | Systems    | 2015 |

  | Feature    | Supported |
  | Headers    | Yes       |
  | Lists      | Yes       |
  | Tables     | Yes       |
  | Code       | Yes       |

  ---

  ## Horizontal Rules

  Use three dashes:

  ---

  Or three asterisks:

  ***

  ---

  ## Mixed Content Example

  Here's a **complete example** combining multiple features:

  ### Project Setup

  1. Install dependencies
  2. Configure settings
  3. Run the project

  > **Note:** Make sure you have Node.js installed.

  ```bash
  npm install
  npm start
  ```

  ### Configuration

  | Option     | Value      | Description    |
  | port       | 3000       | Server port    |
  | host       | localhost  | Server host    |
  | debug      | true       | Debug mode     |

  ---

  ## End

  **Happy coding!** 🚀

  Try editing the markdown on the left to see live preview on the right!
  MARKDOWN

  state viewMode : String = "split"

  style container {
    display: flex;
    flex-direction: column;
    height: 80vh;
    background: #1e1e1e;
    border-radius: 12px;
    overflow: hidden;
  }

  style toolbar {
    display: flex;
    gap: 0.5rem;
    padding: 1rem;
    background: #2d2d30;
    border-bottom: 1px solid #3e3e42;
  }

  style toolButton {
    padding: 0.5rem 1rem;
    background: #667eea;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 0.875rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      opacity: 0.9;
      transform: translateY(-1px);
    }
  }

  style editorContainer {
    display: #{if viewMode == "split" || viewMode == "editor" {
      "flex"
    } else {
      "none"
    }};
    flex: 1;
    overflow: hidden;
  }

  style editorPanel {
    flex: #{if viewMode == "split" {
      "1"
    } else {
      "0 0 100%"
    }};
    display: flex;
    flex-direction: column;
    border-right: #{if viewMode == "split" {
      "1px solid #3e3e42"
    } else {
      "none"
    }};
  }

  style editorTitle {
    padding: 0.75rem 1rem;
    background: #2d2d30;
    border-bottom: 1px solid #3e3e42;
    font-weight: 600;
    color: #d4d4d4;
  }

  style textarea {
    flex: 1;
    padding: 1rem;
    background: #1e1e1e;
    color: #d4d4d4;
    border: none;
    font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
    font-size: 14px;
    line-height: 1.6;
    resize: none;
    outline: none;
  }

  style previewPanel {
    flex: #{if viewMode == "split" {
      "1"
    } else if viewMode == "preview" {
      "0 0 100%"
    } else {
      "0"
    }};
    display: #{if viewMode == "editor" {
      "none"
    } else {
      "flex"
    }};
    flex-direction: column;
    overflow: auto;
  }

  style previewTitle {
    padding: 0.75rem 1rem;
    background: #2d2d30;
    border-bottom: 1px solid #3e3e42;
    font-weight: 600;
    color: #d4d4d4;
  }

  style previewContent {
    flex: 1;
    padding: 2rem;
    background: #1e1e1e;
    color: #d4d4d4;
    overflow-y: auto;

    h1, h2, h3, h4, h5, h6 {
      color: #d4d4d4;
      margin: 1rem 0 0.5rem 0;
    }

    h1 {
      font-size: 2rem;
      font-weight: 700;
      border-bottom: 2px solid #3e3e42;
      padding-bottom: 0.5rem;
    }

    h2 {
      font-size: 1.75rem;
    }

    p {
      margin: 0.75rem 0;
      line-height: 1.7;
    }

    code {
      background: #2d2d30;
      padding: 0.2rem 0.4rem;
      border-radius: 3px;
      font-family: 'Consolas', 'Monaco', 'Courier New', monospace;
      font-size: 0.875rem;
      color: #667eea;
    }

    pre {
      background: #252526;
      padding: 1rem;
      border-radius: 6px;
      overflow-x: auto;
      margin: 1rem 0;

      code {
        background: transparent;
        padding: 0;
        color: #d4d4d4;
      }
    }

    blockquote {
      border-left: 4px solid #667eea;
      padding-left: 1rem;
      margin: 1rem 0;
      color: #a0a0a0;
      font-style: italic;
    }

    ul, ol {
      margin: 0.75rem 0;
      padding-left: 2rem;
    }

    li {
      margin: 0.5rem 0;
      line-height: 1.6;
    }

    hr {
      border: none;
      border-top: 2px solid #3e3e42;
      margin: 2rem 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin: 1rem 0;
    }

    td {
      padding: 0.75rem;
      border: 1px solid #3e3e42;
    }

    a {
      color: #667eea;
      text-decoration: none;
      font-weight: 500;

      &:hover {
        text-decoration: underline;
      }
    }

    strong {
      font-weight: 700;
    }
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)

    next { markdown: value }
  }

  fun getPreviewHtml : Html {
    MarkdownParser.parse(markdown)
  }

  fun setViewMode (mode : String) : Promise(Void) {
    next { viewMode: mode }
  }

  fun render : Html {
    <div::container>
      <div::toolbar>
        <button::toolButton onClick={() { setViewMode("split") }}>
          "Split View"
        </button>

        <button::toolButton onClick={() { setViewMode("editor") }}>
          "Editor Only"
        </button>

        <button::toolButton onClick={() { setViewMode("preview") }}>
          "Preview Only"
        </button>
      </div>

      <div::editorContainer>
        <div::editorPanel>
          <div::editorTitle>
            "Markdown Editor"
          </div>

          <textarea::textarea
            value={markdown}
            onInput={handleInput}
            placeholder="Write your markdown here..."/>
        </div>

        <div::previewPanel>
          <div::previewTitle>
            "Live Preview"
          </div>

          <div::previewContent>
            getPreviewHtml()
          </div>
        </div>
      </div>
    </div>
  }
}
