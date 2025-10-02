/* Markdown Parser - Pure Mint Lang */
module MarkdownParser {

  /* Parse markdown text to HTML elements */
  fun parse (markdown : String) : Html {
    let lines =
      String.split(markdown, "\n")

    let elements =
      processLinesToHtml(lines, 0, [], false)

    <div>
      {
        for element of elements {
          element
        }
      }
    </div>
  }

  /* Process lines and convert to Html array */
  fun processLinesToHtml (
    lines : Array(String),
    index : Number,
    result : Array(Html),
    inCodeBlock : Bool
  ) : Array(Html) {
    let size =
      Array.size(lines)

    if index >= size {
      result
    } else {
      case Array.at(lines, index) {
        Maybe.Just(line) =>
          {
            let trimmed =
              String.trim(line)

            if String.startsWith(trimmed, "```") {
              if inCodeBlock {
                /* End code block */
                processLinesToHtml(lines, index + 1, result, false)
              } else {
                /* Start code block - collect all lines until end */
                let language =
                  String.dropStart(trimmed, 3)
                  |> String.trim

                let codeBlockResult =
                  collectCodeBlock(lines, index + 1, [])

                let {codeLines, nextIndex} =
                  codeBlockResult

                let codeText =
                  String.join(codeLines, "\n")

                let codeElement =
                  renderCodeBlock(codeText, language)

                let newResult =
                  Array.push(result, codeElement)

                processLinesToHtml(lines, nextIndex, newResult, false)
              }
            } else if inCodeBlock {
              /* Should not happen as we collect code blocks above */
              processLinesToHtml(lines, index + 1, result, true)
            } else if String.startsWith(trimmed, "|") {
              /* Start table - collect all table lines */
              let tableResult =
                collectTableLines(lines, index, [])

              let {tableLines, nextIndex} =
                tableResult

              let tableElement =
                renderAdvancedTable(tableLines)

              let newResult =
                Array.push(result, tableElement)

              processLinesToHtml(lines, nextIndex, newResult, false)
            } else if String.startsWith(trimmed, "- ") || String.startsWith(trimmed, "* ") {
              /* List item - render as simple list */
              let text =
                if String.startsWith(trimmed, "- ") {
                  String.dropStart(trimmed, 2)
                } else {
                  String.dropStart(trimmed, 2)
                }

              let htmlElement =
                <ul>
                  <li>
                    {
                      for part of processInlineToHtml(text) {
                        part
                      }
                    }
                  </li>
                </ul>

              let newResult =
                Array.push(result, htmlElement)

              processLinesToHtml(lines, index + 1, newResult, false)
            } else {
              let htmlElement =
                processLineToHtml(trimmed)

              let newResult =
                Array.push(result, htmlElement)

              processLinesToHtml(lines, index + 1, newResult, false)
            }
          }

        Maybe.Nothing =>
          processLinesToHtml(lines, index + 1, result, inCodeBlock)
      }
    }
  }

  /* Render code block with syntax highlighting */
  fun renderCodeBlock (code : String, language : String) : Html {
    let lang =
      if String.isEmpty(language) {
        "mint"
      } else {
        language
      }

    <CodeHighlight
      code={code}
      language={lang}
      showLineNumbers={true}
      showCopyButton={false}
    />
  }

  /* Collect code block lines - returns Tuple(codeLines, endIndex) */
  fun collectCodeBlock (
    lines : Array(String),
    index : Number,
    codeLines : Array(String)
  ) : Tuple(Array(String), Number) {
    let size =
      Array.size(lines)

    if index >= size {
      {codeLines, index}
    } else {
      case Array.at(lines, index) {
        Maybe.Just(line) =>
          {
            let trimmed =
              String.trim(line)

            if String.startsWith(trimmed, "```") {
              /* End of code block */
              {codeLines, index + 1}
            } else {
              /* Add line to code block */
              let newCodeLines =
                Array.push(codeLines, line)

              collectCodeBlock(lines, index + 1, newCodeLines)
            }
          }

        Maybe.Nothing => collectCodeBlock(lines, index + 1, codeLines)
      }
    }
  }

  /* Collect table lines - returns Tuple(tableLines, endIndex) */
  fun collectTableLines (
    lines : Array(String),
    index : Number,
    tableLines : Array(String)
  ) : Tuple(Array(String), Number) {
    let size =
      Array.size(lines)

    if index >= size {
      {tableLines, index}
    } else {
      case Array.at(lines, index) {
        Maybe.Just(line) =>
          {
            let trimmed =
              String.trim(line)

            if String.startsWith(trimmed, "|") {
              /* Add line to table */
              let newTableLines =
                Array.push(tableLines, trimmed)

              collectTableLines(lines, index + 1, newTableLines)
            } else {
              /* End of table */
              {tableLines, index}
            }
          }

        Maybe.Nothing => {tableLines, index}
      }
    }
  }


  /* Parse table line into cells */
  fun parseTableRow (line : String) : Array(String) {
    String.split(line, "|")
    |> Array.select(
      (cell : String) : Bool { !String.isEmpty(String.trim(cell)) })
    |> Array.map((cell : String) : String { String.trim(cell) })
  }

  /* Render advanced table from markdown table lines */
  fun renderAdvancedTable (tableLines : Array(String)) : Html {
    if Array.isEmpty(tableLines) {
      <div/>
    } else {
      /* First line is headers */
      let headerLine =
        case Array.at(tableLines, 0) {
          Maybe.Just(line) => line
          Maybe.Nothing => ""
        }

      let headers =
        parseTableRow(headerLine)

      /* Skip separator line (index 1) and get data rows (from index 2) */
      let dataRows =
        Array.slice(tableLines, 2, Array.size(tableLines))
        |> Array.map((line : String) : Array(String) { parseTableRow(line) })

      <AdvancedTable
        headers={headers}
        rows={dataRows}
        pageSize={5}
        searchable={true}
        striped={true}
        hoverable={true}
      />
    }
  }

  /* Process lines recursively */
  fun processLines (
    lines : Array(String),
    index : Number,
    result : String,
    inCodeBlock : Bool,
    inTable : Bool,
    inList : Bool
  ) : String {
    let size =
      Array.size(lines)

    if index >= size {
      result
    } else {
      case Array.at(lines, index) {
        Maybe.Just(line) =>
          {
            let trimmed =
              String.trim(line)

            /* Check for code blocks */
            if String.startsWith(trimmed, "```") {
              if inCodeBlock {
                /* End code block */
                let newResult =
                  result + "</code></pre>\n"

                processLines(lines, index + 1, newResult, false, inTable,
                  inList)
              } else {
                /* Start code block */
                let language =
                  String.dropStart(trimmed, 3)
                  |> String.trim

                let langClass =
                  if String.isEmpty(language) {
                    ""
                  } else {
                    " class=\"language-" + language + "\""
                  }

                let newResult =
                  result + "<pre><code" + langClass + ">"

                processLines(lines, index + 1, newResult, true, inTable, inList)
              }
            } else if inCodeBlock {
              /* Inside code block - escape HTML */
              let escaped =
                escapeHtml(line)

              let newResult =
                result + escaped + "\n"

              processLines(lines, index + 1, newResult, inCodeBlock, inTable,
                inList)
            } else {
              /* Regular markdown processing */
              let processed =
                processLine(trimmed)

              let newResult =
                result + processed + "\n"

              processLines(lines, index + 1, newResult, inCodeBlock, inTable,
                inList)
            }
          }

        Maybe.Nothing =>
          processLines(lines, index + 1, result, inCodeBlock, inTable, inList)
      }
    }
  }

  /* Process a single markdown line to Html */
  fun processLineToHtml (line : String) : Html {
    if String.isEmpty(line) {
      <br/>
    } else if String.startsWith(line, "######") {
      let text =
        String.dropStart(line, 6)
        |> String.trim

      <h6>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h6>
    } else if String.startsWith(line, "#####") {
      let text =
        String.dropStart(line, 5)
        |> String.trim

      <h5>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h5>
    } else if String.startsWith(line, "####") {
      let text =
        String.dropStart(line, 4)
        |> String.trim

      <h4>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h4>
    } else if String.startsWith(line, "###") {
      let text =
        String.dropStart(line, 3)
        |> String.trim

      <h3>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h3>
    } else if String.startsWith(line, "##") {
      let text =
        String.dropStart(line, 2)
        |> String.trim

      <h2>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h2>
    } else if String.startsWith(line, "#") {
      let text =
        String.dropStart(line, 1)
        |> String.trim

      <h1>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </h1>
    } else if String.startsWith(line, ">") {
      let text =
        String.dropStart(line, 1)
        |> String.trim

      <blockquote>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </blockquote>
    } else if String.startsWith(line, "- ") || String.startsWith(line, "* ") {
      let text =
        String.dropStart(line, 2)

      <li>
        {
          for part of processInlineToHtml(text) {
            part
          }
        }
      </li>
    } else if String.startsWith(line, "---") || String.startsWith(line, "***") {
      <hr/>
    } else if String.startsWith(line, "|") {
      processTableRowToHtml(line)
    } else {
      <p>
        {
          for part of processInlineToHtml(line) {
            part
          }
        }
      </p>
    }
  }

  /* Process a single markdown line */
  fun processLine (line : String) : String {
    if String.isEmpty(line) {
      "<br>"
    } else if String.startsWith(line, "######") {
      "<h6>" + processInline(
        String.dropStart(line, 6)
        |> String.trim) + "</h6>"
    } else if String.startsWith(line, "#####") {
      "<h5>" + processInline(
        String.dropStart(line, 5)
        |> String.trim) + "</h5>"
    } else if String.startsWith(line, "####") {
      "<h4>" + processInline(
        String.dropStart(line, 4)
        |> String.trim) + "</h4>"
    } else if String.startsWith(line, "###") {
      "<h3>" + processInline(
        String.dropStart(line, 3)
        |> String.trim) + "</h3>"
    } else if String.startsWith(line, "##") {
      "<h2>" + processInline(
        String.dropStart(line, 2)
        |> String.trim) + "</h2>"
    } else if String.startsWith(line, "#") {
      "<h1>" + processInline(
        String.dropStart(line, 1)
        |> String.trim) + "</h1>"
    } else if String.startsWith(line, ">") {
      "<blockquote>" + processInline(
        String.dropStart(line, 1)
        |> String.trim) + "</blockquote>"
    } else if String.startsWith(line, "- ") || String.startsWith(line, "* ") {
      "<li>" + processInline(String.dropStart(line, 2)) + "</li>"
    } else if String.startsWith(line, "---") || String.startsWith(line, "***") {
      "<hr>"
    } else if String.startsWith(line, "|") {
      /* Table row */
      processTableRow(line)
    } else {
      "<p>" + processInline(line) + "</p>"
    }
  }

  /* Process inline markdown to Html */
  fun processInlineToHtml (text : String) : Array(Html) {
    parseInlineMarkdown(text, 0, [], "")
  }

  /* Parse inline markdown recursively - supports nested formatting */
  fun parseInlineMarkdown (
    text : String,
    pos : Number,
    result : Array(Html),
    buffer : String
  ) : Array(Html) {
    let size =
      String.size(text)

    if pos >= size {
      if String.isEmpty(buffer) {
        result
      } else {
        Array.push(result,
          <span>
            {
              buffer
            }
          </span>)
      }
    } else {
      let remaining =
        String.dropStart(text, pos)

      /* Check for bold (**text**) */
      if String.startsWith(remaining, "**") {
        case findClosingMarker(text, pos + 2, "**") {
          Maybe.Just({content, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              /* Recursively parse content inside bold for nested formatting */
              let innerParts =
                parseInlineMarkdown(content, 0, [], "")

              let boldResult =
                Array.push(newResult,
                  <strong>
                    {
                      for part of innerParts {
                        part
                      }
                    }
                  </strong>)

              parseInlineMarkdown(text, endPos + 2, boldResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "*")
        }

        /* Check for italic (*text* or _text_) */
      } else if String.startsWith(remaining, "*") && !String.startsWith(
        remaining, "**") {
        case findClosingMarker(text, pos + 1, "*") {
          Maybe.Just({content, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              /* Recursively parse content inside italic for nested formatting */
              let innerParts =
                parseInlineMarkdown(content, 0, [], "")

              let italicResult =
                Array.push(newResult,
                  <em>
                    {
                      for part of innerParts {
                        part
                      }
                    }
                  </em>)

              parseInlineMarkdown(text, endPos + 1, italicResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "*")
        }
      } else if String.startsWith(remaining, "_") {
        case findClosingMarker(text, pos + 1, "_") {
          Maybe.Just({content, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              /* Recursively parse content inside italic for nested formatting */
              let innerParts =
                parseInlineMarkdown(content, 0, [], "")

              let italicResult =
                Array.push(newResult,
                  <em>
                    {
                      for part of innerParts {
                        part
                      }
                    }
                  </em>)

              parseInlineMarkdown(text, endPos + 1, italicResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "_")
        }

        /* Check for images (![alt](url)) */
      } else if String.startsWith(remaining, "![") {
        case parseImageOrLink(text, pos, true) {
          Maybe.Just({label, url, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              let imageResult =
                Array.push(newResult,
                  <img
                    src={url}
                    alt={label}
                    style="max-width: 100%; height: auto;"/>)

              parseInlineMarkdown(text, endPos, imageResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "!")
        }

        /* Check for links ([text](url)) */
      } else if String.startsWith(remaining, "[") {
        case parseImageOrLink(text, pos, false) {
          Maybe.Just({label, url, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              let linkResult =
                Array.push(newResult,
                  <a
                    href={url}
                    target="_blank"
                    rel="noopener noreferrer">
                    {
                      label
                    }
                  </a>)

              parseInlineMarkdown(text, endPos, linkResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "[")
        }

        /* Check for inline code (`code`) - code does NOT support nested formatting */
      } else if String.startsWith(remaining, "`") {
        case findClosingMarker(text, pos + 1, "`") {
          Maybe.Just({content, endPos}) =>
            {
              let newResult =
                if String.isEmpty(buffer) {
                  result
                } else {
                  Array.push(result,
                    <span>
                      {
                        buffer
                      }
                    </span>)
                }

              let codeResult =
                Array.push(newResult,
                  <code>
                    {
                      content
                    }
                  </code>)

              parseInlineMarkdown(text, endPos + 1, codeResult, "")
            }

          Maybe.Nothing =>
            parseInlineMarkdown(text, pos + 1, result, buffer + "`")
        }
      } else {
        let char =
          `#{text}.charAt(#{pos})`

        parseInlineMarkdown(text, pos + 1, result, buffer + char)
      }
    }
  }

  /* Parse image or link syntax: ![alt](url) or [text](url) */
  fun parseImageOrLink (
    text : String,
    startPos : Number,
    isImage : Bool
  ) : Maybe(Tuple(String, String, Number)) {
    /* For images, skip the ! and start at [ */
    let bracketStart =
      if isImage {
        startPos + 1
      } else {
        startPos
      }

    /* Find closing ] for label/alt text */
    case findClosingMarker(text, bracketStart + 1, "]") {
      Maybe.Just(labelResult) =>
        {
          let label =
            labelResult[0]

          let closeBracketPos =
            labelResult[1]

          /* Check if next char is ( */
          let afterBracket =
            String.dropStart(text, closeBracketPos + 1)

          if String.startsWith(afterBracket, "(") {
            /* Find closing ) for URL */
            case findClosingMarker(text, closeBracketPos + 2, ")") {
              Maybe.Just(urlResult) =>
                {
                  let url =
                    urlResult[0]

                  let endPos =
                    urlResult[1]

                  Maybe.Just({label, url, endPos + 1})
                }

              Maybe.Nothing => Maybe.Nothing
            }
          } else {
            Maybe.Nothing
          }
        }

      Maybe.Nothing => Maybe.Nothing
    }
  }

  /* Find closing marker and return content */
  fun findClosingMarker (
    text : String,
    startPos : Number,
    marker : String
  ) : Maybe(Tuple(String, Number)) {
    let markerSize =
      String.size(marker)

    let result =
      findMarkerPos(text, startPos, marker, markerSize, "")

    case result {
      Maybe.Just({content, pos}) => Maybe.Just({content, pos})

      Maybe.Nothing => Maybe.Nothing
    }
  }

  /* Recursively find marker position */
  fun findMarkerPos (
    text : String,
    pos : Number,
    marker : String,
    markerSize : Number,
    content : String
  ) : Maybe(Tuple(String, Number)) {
    let size =
      String.size(text)

    if pos >= size {
      Maybe.Nothing
    } else {
      let remaining =
        String.dropStart(text, pos)

      if String.startsWith(remaining, marker) {
        Maybe.Just({content, pos})
      } else {
        let char =
          `#{text}.charAt(#{pos})`

        findMarkerPos(text, pos + 1, marker, markerSize, content + char)
      }
    }
  }

  /* Process table row to Html */
  fun processTableRowToHtml (line : String) : Html {
    let cells =
      String.split(line, "|")
      |> Array.select(
        (cell : String) : Bool { !String.isEmpty(String.trim(cell)) })

    <table>
      <tr>
        {
          for cell of cells {
            <td>
              {
                for part of processInlineToHtml(String.trim(cell)) {
                  part
                }
              }
            </td>
          }
        }
      </tr>
    </table>
  }

  /* Process inline markdown (bold, italic, code, links, etc) - DEPRECATED */
  fun processInline (text : String) : String {
    text
  }

  /* Process table row */
  fun processTableRow (line : String) : String {
    let cells =
      String.split(line, "|")
      |> Array.select(
        (cell : String) : Bool { !String.isEmpty(String.trim(cell)) })

    let processedCells =
      Array.map(cells,
        (cell : String) : String {
          "<td>" + processInline(String.trim(cell)) + "</td>"
        })

    let cellsHtml =
      String.join(processedCells, "")

    "<tr>" + cellsHtml + "</tr>"
  }

  /* Escape HTML entities */
  fun escapeHtml (text : String) : String {
    text
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&#039;")
  }
}
