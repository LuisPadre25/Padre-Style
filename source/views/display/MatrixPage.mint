/* MatrixPage - Demonstration page for Matrix component */

component MatrixPage {
  /* Sample matrix data - basic grid */
  fun basicMatrixData : MatrixData {
    {
      data:
        [
          { x: 0, y: 0, col: 1, row: 1, text: "A1", className: "" },
          { x: 1, y: 0, col: 1, row: 1, text: "B1", className: "" },
          { x: 2, y: 0, col: 1, row: 1, text: "C1", className: "" },
          { x: 0, y: 1, col: 1, row: 1, text: "A2", className: "" },
          { x: 1, y: 1, col: 1, row: 1, text: "B2", className: "" },
          { x: 2, y: 1, col: 1, row: 1, text: "C2", className: "" },
          { x: 0, y: 2, col: 1, row: 1, text: "A3", className: "" },
          { x: 1, y: 2, col: 1, row: 1, text: "B3", className: "" },
          { x: 2, y: 2, col: 1, row: 1, text: "C3", className: "" }
        ]
    }
  }

  /* Merged cells matrix */
  fun mergedMatrixData : MatrixData {
    {
      data:
        [
          { x: 0, y: 0, col: 2, row: 1, text: "Merged Header", className: "" },
          { x: 2, y: 0, col: 1, row: 2, text: "Tall Cell", className: "" },
          { x: 0, y: 1, col: 1, row: 1, text: "A2", className: "" },
          { x: 1, y: 1, col: 1, row: 1, text: "B2", className: "" },
          { x: 0, y: 2, col: 3, row: 1, text: "Wide Footer", className: "" }
        ]
    }
  }

  /* Table-like matrix with headers */
  fun tableMatrixData : MatrixData {
    {
      data:
        [
          { x: 0, y: 0, col: 1, row: 1, text: "Name", className: "header-cell" },
          { x: 1, y: 0, col: 1, row: 1, text: "Age", className: "header-cell" },
          { x: 2, y: 0, col: 1, row: 1, text: "City", className: "header-cell" },
          { x: 0, y: 1, col: 1, row: 1, text: "Alice", className: "" },
          { x: 1, y: 1, col: 1, row: 1, text: "25", className: "" },
          { x: 2, y: 1, col: 1, row: 1, text: "NYC", className: "" },
          { x: 0, y: 2, col: 1, row: 1, text: "Bob", className: "" },
          { x: 1, y: 2, col: 1, row: 1, text: "30", className: "" },
          { x: 2, y: 2, col: 1, row: 1, text: "LA", className: "" },
          { x: 0, y: 3, col: 1, row: 1, text: "Carol", className: "" },
          { x: 1, y: 3, col: 1, row: 1, text: "28", className: "" },
          { x: 2, y: 3, col: 1, row: 1, text: "SF", className: "" }
        ]
    }
  }

  /* Styles */
  style container {
    width: 100%;
    max-width: 1200px;
  }

  style pageSubtitle {
    color: rgba(52, 73, 94, 0.7);
    margin-bottom: 30px;
    font-size: 16px;
    line-height: 26px;
  }

  style section {
    margin-bottom: 48px;
  }

  style sectionDescription {
    color: #646566;
    margin-bottom: 20px;
    font-size: 14px;
    line-height: 22px;
  }

  style demoBox {
    background: #fff;
    border-radius: 12px;
    padding: 32px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
    margin-bottom: 24px;
  }

  style codeBlock {
    background: #f7f8fa;
    border-radius: 8px;
    padding: 16px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #58727e;
    overflow-x: auto;
    margin-top: 16px;
  }

  style badge {
    display: inline-block;
    padding: 4px 10px;
    background: #1989fa;
    color: #fff;
    font-size: 12px;
    border-radius: 4px;
    margin-left: 8px;
    font-weight: 500;
  }

  style featureList {
    list-style: none;
    padding: 0;
    margin: 20px 0;
  }

  style featureItem {
    padding: 8px 0;
    color: #646566;
    font-size: 14px;

    &:before {
      content: "✓ ";
      color: #07c160;
      font-weight: bold;
      margin-right: 8px;
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <Heading level="1" margin="0 0 24px">
        "Matrix"
        <span::badge>"Grid Layout"</span>
      </Heading>

      <Text size="lg" margin="0 0 32px">
        "Flexible grid layout component with support for merged cells and fixed headers. "
        "Perfect for complex table layouts and dashboard grids."
      </Text>

      <ul::featureList>
        <li::featureItem>"Support for merged cells (colspan/rowspan)"</li>
        <li::featureItem>"Fixed first column or row"</li>
        <li::featureItem>"Flexible cell sizing"</li>
        <li::featureItem>"Conflict detection for overlapping cells"</li>
        <li::featureItem>"Responsive scrolling"</li>
      </ul>

      <div::section>
        <Heading level="2" margin="32px 0 16px">"Basic Grid"</Heading>
        <Text size="base" margin="0 0 20px">
          "A simple 3x3 matrix with equal cell sizes."
        </Text>

        <div::demoBox>
          <Matrix
            data={basicMatrixData()}
            cellWidth={[120, 120, 120]}
            cellHeight={[60, 60, 60]}/>
        </div>

        <div::codeBlock>
          "data: [\n" +
          "  { x: 0, y: 0, col: 1, row: 1, text: \"A1\" },\n" +
          "  { x: 1, y: 0, col: 1, row: 1, text: \"B1\" },\n" +
          "  // ...\n" +
          "]"
        </div>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 16px">"Merged Cells"</Heading>
        <Text size="base" margin="0 0 20px">
          "Cells can span multiple columns (col) or rows (row)."
        </Text>

        <div::demoBox>
          <Matrix
            data={mergedMatrixData()}
            cellWidth={[120, 120, 120]}
            cellHeight={[60, 60, 60]}/>
        </div>

        <div::codeBlock>
          "{ x: 0, y: 0, col: 2, row: 1, text: \"Merged\" }\n" +
          "{ x: 2, y: 0, col: 1, row: 2, text: \"Tall Cell\" }\n" +
          "{ x: 0, y: 2, col: 3, row: 1, text: \"Wide Footer\" }"
        </div>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 16px">"Table Layout"</Heading>
        <Text size="base" margin="0 0 20px">
          "Use Matrix for table-like data with fixed headers."
        </Text>

        <div::demoBox>
          <Matrix
            data={tableMatrixData()}
            cellWidth={[150, 100, 150]}
            cellHeight={[50, 45, 45, 45]}
            fixFirstRow={true}
            maxHeight={200}/>
        </div>

        <div::codeBlock>
          "<Matrix\n" +
          "  data={tableData}\n" +
          "  fixFirstRow={true}\n" +
          "  maxHeight={200}\n" +
          "/>"
        </div>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 16px">"Properties"</Heading>
        <div::codeBlock>
          "data: MatrixData           - Grid data with cell definitions\n" +
          "cellWidth: Array(Number)   - Width for each column\n" +
          "cellHeight: Array(Number)  - Height for each row\n" +
          "fixFirstColumn: Bool       - Fix first column on scroll\n" +
          "fixFirstRow: Bool          - Fix first row on scroll\n" +
          "maxWidth: Number           - Max width with horizontal scroll\n" +
          "maxHeight: Number          - Max height with vertical scroll\n" +
          "width: Number              - Fixed matrix width\n" +
          "height: Number             - Fixed matrix height"
        </div>
      </div>
    </div>
  }
}
