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
                  String.dropStart(trimmed, 3) |> String.trim

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

        Maybe.Nothing =>
          collectCodeBlock(lines, index + 1, codeLines)
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

        Maybe.Nothing =>
          {tableLines, index}
      }
    }
  }

  /* Parse table line into cells */
  fun parseTableRow (line : String) : Array(String) {
    String.split(line, "|")
    |> Array.select((cell : String) : Bool { !String.isEmpty(String.trim(cell)) })
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
        hoverable={true}/>
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

                processLines(lines, index + 1, newResult, false, inTable, inList)
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

              processLines(lines, index + 1, newResult, inCodeBlock, inTable, inList)
            } else {
              /* Regular markdown processing */
              let processed =
                processLine(trimmed)

              let newResult =
                result + processed + "\n"

              processLines(lines, index + 1, newResult, inCodeBlock, inTable, inList)
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
        String.dropStart(line, 6) |> String.trim

      <h6>
        processInlineToHtml(text)
      </h6>
    } else if String.startsWith(line, "#####") {
      let text =
        String.dropStart(line, 5) |> String.trim

      <h5>
        processInlineToHtml(text)
      </h5>
    } else if String.startsWith(line, "####") {
      let text =
        String.dropStart(line, 4) |> String.trim

      <h4>
        processInlineToHtml(text)
      </h4>
    } else if String.startsWith(line, "###") {
      let text =
        String.dropStart(line, 3) |> String.trim

      <h3>
        processInlineToHtml(text)
      </h3>
    } else if String.startsWith(line, "##") {
      let text =
        String.dropStart(line, 2) |> String.trim

      <h2>
        processInlineToHtml(text)
      </h2>
    } else if String.startsWith(line, "#") {
      let text =
        String.dropStart(line, 1) |> String.trim

      <h1>
        processInlineToHtml(text)
      </h1>
    } else if String.startsWith(line, ">") {
      let text =
        String.dropStart(line, 1) |> String.trim

      <blockquote>
        processInlineToHtml(text)
      </blockquote>
    } else if String.startsWith(line, "- ") || String.startsWith(line, "* ") {
      let text =
        String.dropStart(line, 2)

      <li>
        processInlineToHtml(text)
      </li>
    } else if String.startsWith(line, "---") || String.startsWith(line, "***") {
      <hr/>
    } else if String.startsWith(line, "|") {
      processTableRowToHtml(line)
    } else {
      <p>
        processInlineToHtml(line)
      </p>
    }
  }

  /* Process a single markdown line */
  fun processLine (line : String) : String {
    if String.isEmpty(line) {
      "<br>"
    } else if String.startsWith(line, "######") {
      "<h6>" + processInline(String.dropStart(line, 6) |> String.trim) + "</h6>"
    } else if String.startsWith(line, "#####") {
      "<h5>" + processInline(String.dropStart(line, 5) |> String.trim) + "</h5>"
    } else if String.startsWith(line, "####") {
      "<h4>" + processInline(String.dropStart(line, 4) |> String.trim) + "</h4>"
    } else if String.startsWith(line, "###") {
      "<h3>" + processInline(String.dropStart(line, 3) |> String.trim) + "</h3>"
    } else if String.startsWith(line, "##") {
      "<h2>" + processInline(String.dropStart(line, 2) |> String.trim) + "</h2>"
    } else if String.startsWith(line, "#") {
      "<h1>" + processInline(String.dropStart(line, 1) |> String.trim) + "</h1>"
    } else if String.startsWith(line, ">") {
      "<blockquote>" + processInline(String.dropStart(line, 1) |> String.trim) + "</blockquote>"
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
  fun processInlineToHtml (text : String) : Html {
    <span>{ text }</span>
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
      Maybe.Just({content, pos}) =>
        Maybe.Just({content, pos})

      Maybe.Nothing =>
        Maybe.Nothing
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
          String.slice(text, pos, pos + 1)

        findMarkerPos(text, pos + 1, marker, markerSize, content + char)
      }
    }
  }

  /* Process table row to Html */
  fun processTableRowToHtml (line : String) : Html {
    let cells =
      String.split(line, "|")
      |> Array.select((cell : String) : Bool { !String.isEmpty(String.trim(cell)) })

    let cellsHtml =
      Array.map(
        cells,
        (cell : String) : Html {
          let text =
            String.trim(cell)

          <td>
            processInlineToHtml(text)
          </td>
        }
      )

    <table>
      <tr>
        {
          for cell of cellsHtml {
            cell
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
      |> Array.select((cell : String) : Bool { !String.isEmpty(String.trim(cell)) })

    let processedCells =
      Array.map(
        cells,
        (cell : String) : String {
          "<td>" + processInline(String.trim(cell)) + "</td>"
        }
      )

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
