/* ColumnsPage - Columns & Column Components Showcase */
component ColumnsPage {
  connect ThemeStore exposing { theme }
  connect ViewModeStore exposing { viewMode }

  /* State for examples */
  state activeExample : String = "basic"

  state gap : String = "1rem"
  state multiline : Bool = true
  state vAlign : String = "stretch"
  state direction : String = "horizontal"

  /* Dynamic columns state */
  state dynamicColumns : Array(DynamicColumn) =
    [{ id: "1", size: "5", offset: "0" }, { id: "2", size: "5", offset: "0" }]

  state columnCounter : Number = 2

  /* Event handlers */
  fun handleGapChange (event : Html.Event) : Promise(Void) {
    next { gap: Dom.getValue(event.target) }
  }

  fun handleMultilineToggle (event : Html.Event) : Promise(Void) {
    {
      let isChecked =
        `#{event}.target.checked`

      next { multiline: isChecked }
    }
  }

  fun handleVAlignChange (event : Html.Event) : Promise(Void) {
    next { vAlign: Dom.getValue(event.target) }
  }

  fun handleDirectionChange (event : Html.Event) : Promise(Void) {
    next { direction: Dom.getValue(event.target) }
  }

  /* Dynamic column handlers */
  fun addColumn : Promise(Void) {
    {
      let newCounter =
        columnCounter + 1

      let newId =
        Number.toString(newCounter)

      let newColumns =
        `[
          ...#{dynamicColumns},
          { id: #{newId}, size: "auto", offset: "0" }
        ]`

      next { columnCounter: newCounter, dynamicColumns: newColumns }
    }
  }

  fun removeColumn (id : String) : Promise(Void) {
    next {
      dynamicColumns:
        Array.reject(dynamicColumns, (col : DynamicColumn) { col.id == id })
    }
  }

  fun updateColumnSize (id : String, newSize : String) : Promise(Void) {
    next {
      dynamicColumns:
        Array.map(dynamicColumns,
          (col : DynamicColumn) {
            if col.id == id {
              { id: col.id, size: newSize, offset: col.offset }
            } else {
              col
            }
          })
    }
  }

  fun updateColumnOffset (id : String, newOffset : String) : Promise(Void) {
    next {
      dynamicColumns:
        Array.map(dynamicColumns,
          (col : DynamicColumn) {
            if col.id == id {
              { id: col.id, size: col.size, offset: newOffset }
            } else {
              col
            }
          })
    }
  }

  /* Get color for column ID */
  fun getColumnColor (colId : String) : String {
    case colId {
      "1" => "linear-gradient(135deg, #f093fb 0%, #f5576c 100%)"
      "2" => "linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)"
      "3" => "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
      "4" => "linear-gradient(135deg, #f093fb 0%, #f5576c 100%)"
      "5" => "linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)"
      "6" => "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
      "7" => "linear-gradient(135deg, #f093fb 0%, #f5576c 100%)"
      "8" => "linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)"
      "9" => "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
      => "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
    }
  }

  /* Styles */
  style controlGroup {
    margin-bottom: 20px;
  }

  style label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: var(--heading-color);
    margin-bottom: 8px;
  }

  style select {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 14px;
    background: var(--card-bg);
    color: var(--text-color);
    transition: all 0.2s ease;

    &:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 2px rgba(25, 137, 250, 0.1);
    }
  }

  style checkboxGroup {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  style checkbox {
    width: 18px;
    height: 18px;
    cursor: pointer;
  }

  style checkboxLabel {
    font-size: 14px;
    color: var(--text-color);
    cursor: pointer;
  }

  style columnControl {
    background: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 8px;
    padding: 12px;
    margin-bottom: 12px;
  }

  style columnHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
  }

  style columnTitle {
    font-weight: 600;
    color: var(--heading-color);
  }

  style removeButton {
    background: #ef4444;
    color: white;
    border: none;
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 12px;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      background: #dc2626;
    }
  }

  style addButton {
    background: var(--primary-color);
    color: white;
    border: none;
    border-radius: 8px;
    padding: 10px 16px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
    width: 100%;
    margin-top: 12px;

    &:hover {
      background: #0c7cd5;
    }
  }

  style columnRow {
    display: flex;
    gap: 12px;
  }

  style columnField {
    flex: 1;
  }

  style demoBox {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 1.5rem;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    font-size: 14px;
    word-break: break-word;
  }

  style demoBox2 {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: white;
    padding: 1.5rem;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    font-size: 14px;
    word-break: break-word;
  }

  style demoBox3 {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    color: white;
    padding: 1.5rem;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    font-size: 14px;
    word-break: break-word;
  }

  fun render : Html {
    <ComponentShowcase
      title="Columns & Column"
      description="Grid system with fraction-based sizing (1-10 = 10%-100%), offset support, and responsive breakpoints (sizeTablet, sizeDesktop). Use this for Bootstrap-style grids. For flexible layouts, cards, or navbars, use Flex component instead."
      badge="Grid"
      previewContent={
        <div style="width: 100%;">
          <Columns
            gap={gap}
            multiline={multiline}
            vAlign={vAlign}
            direction={direction}
          >
            for col of dynamicColumns {
              <Column size={col.size} offset={col.offset}>
                <div
                  style={
                    "background: " + getColumnColor(col.id) + "; color: white; padding: 2rem; border-radius: 8px; text-align: center; font-weight: 500; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);"
                  }
                >
                  <div>
                    "Column "

                    {
                      col.id
                    }
                  </div>

                  <div style="font-size: 12px; margin-top: 8px; opacity: 0.9;">
                    "size: "

                    {
                      col.size
                    }

                    if col.offset != "0" {
                      " | offset: "

                      {
                        col.offset
                      }
                    }
                  </div>
                </div>
              </Column>
            }
          </Columns>
        </div>
      }
      controlsContent={
        <div>
          <div::controlGroup>
            <label::label>"Direction"</label>

            <select::select value={direction} onChange={handleDirectionChange}>
              <option value="horizontal">"Horizontal (Row)"</option>
              <option value="vertical">"Vertical (Column)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Vertical Alignment"</label>

            <select::select value={vAlign} onChange={handleVAlignChange}>
              <option value="stretch">"Stretch"</option>
              <option value="top">"Top"</option>
              <option value="center">"Center"</option>
              <option value="bottom">"Bottom"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Columns"</label>

            for col of dynamicColumns {
              <div::columnControl>
                <div::columnHeader>
                  <div::columnTitle>
                    "Column "

                    {
                      col.id
                    }
                  </div>

                  if Array.size(dynamicColumns) > 1 {
                    <button::removeButton onClick={() { removeColumn(col.id) }}>
                      "Remove"
                    </button>
                  }
                </div>

                <div::columnRow>
                  <div::columnField>
                    <label::label>"Size"</label>

                    <select::select
                      value={col.size}
                      onChange={
                        (e : Html.Event) {
                          updateColumnSize(col.id, Dom.getValue(e.target))
                        }
                      }
                    >
                      <option value="auto">"Auto (flexible)"</option>
                      <option value="1">"1 (10%)"</option>
                      <option value="2">"2 (20%)"</option>
                      <option value="3">"3 (30%)"</option>
                      <option value="4">"4 (40%)"</option>
                      <option value="5">"5 (50%)"</option>
                      <option value="6">"6 (60%)"</option>
                      <option value="7">"7 (70%)"</option>
                      <option value="8">"8 (80%)"</option>
                      <option value="9">"9 (90%)"</option>
                      <option value="10">"10 (100%)"</option>
                    </select>
                  </div>

                  <div::columnField>
                    <label::label>"Offset"</label>

                    <select::select
                      value={col.offset}
                      onChange={
                        (e : Html.Event) {
                          updateColumnOffset(col.id, Dom.getValue(e.target))
                        }
                      }
                    >
                      <option value="0">"0 (None)"</option>
                      <option value="1">"1 (10%)"</option>
                      <option value="2">"2 (20%)"</option>
                      <option value="3">"3 (30%)"</option>
                      <option value="4">"4 (40%)"</option>
                      <option value="5">"5 (50%)"</option>
                      <option value="6">"6 (60%)"</option>
                      <option value="7">"7 (70%)"</option>
                      <option value="8">"8 (80%)"</option>
                      <option value="9">"9 (90%)"</option>
                    </select>
                  </div>
                </div>
              </div>
            }

            <button::addButton onClick={addColumn}>"+ Add Column"</button>
          </div>
        </div>
      }
      usageText="Columns is a grid system for fraction-based layouts. Use <Columns> container with <Column> children. Set size='1'-'10' for fixed percentages (1=10%, 5=50%, 10=100%), size='auto' for flexible columns, or offset='1'-'9' to push columns. Use sizeTablet/sizeDesktop for responsive layouts. ⚠️ For navbars, cards with backgrounds, or flex-based layouts, use the Flex component instead."
      codeExamples={
        [
          {
            title: "Basic Columns - Equal Width",
            description: "Auto columns distribute space equally",
            snippet:
              {
                code:
                  "<Columns gap=\"1rem\">\n" + "  <Column size=\"auto\">\n" + "    <div>Column 1</div>\n" + "  </Column>\n" + "  <Column size=\"auto\">\n" + "    <div>Column 2</div>\n" + "  </Column>\n" + "  <Column size=\"auto\">\n" + "    <div>Column 3</div>\n" + "  </Column>\n" + "</Columns>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Columns gap="1rem">
                  <Column size="auto"><div::demoBox>"Column 1"</div></Column>
                  <Column size="auto"><div::demoBox2>"Column 2"</div></Column>
                  <Column size="auto"><div::demoBox3>"Column 3"</div></Column>
                </Columns>
              </div>,
            showReplay: false
          },
          {
            title: "Fixed Sizes - Fractions",
            description: "Size 1-10 represents 10%-100%",
            snippet:
              {
                code:
                  "<Columns gap=\"1rem\">\n" + "  <Column size=\"2\">\n" + "    <div>20% (size=2)</div>\n" + "  </Column>\n" + "  <Column size=\"5\">\n" + "    <div>50% (size=5)</div>\n" + "  </Column>\n" + "  <Column size=\"3\">\n" + "    <div>30% (size=3)</div>\n" + "  </Column>\n" + "</Columns>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Columns gap="1rem">
                  <Column size="2"><div::demoBox>"20%"</div></Column>
                  <Column size="5"><div::demoBox2>"50%"</div></Column>
                  <Column size="3"><div::demoBox3>"30%"</div></Column>
                </Columns>
              </div>,
            showReplay: false
          },
          {
            title: "Mixed Sizes",
            description: "Combine fixed and auto columns",
            snippet:
              {
                code:
                  "<Columns gap=\"1rem\">\n" + "  <Column size=\"3\">\n" + "    <div>30% fixed</div>\n" + "  </Column>\n" + "  <Column size=\"auto\">\n" + "    <div>Auto fills remaining</div>\n" + "  </Column>\n" + "  <Column size=\"2\">\n" + "    <div>20% fixed</div>\n" + "  </Column>\n" + "</Columns>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Columns gap="1rem">
                  <Column size="3"><div::demoBox>"30% fixed"</div></Column>
                  <Column size="auto"><div::demoBox2>"Auto"</div></Column>
                  <Column size="2"><div::demoBox3>"20% fixed"</div></Column>
                </Columns>
              </div>,
            showReplay: false
          },
          {
            title: "Offset",
            description: "Push columns with offset",
            snippet:
              {
                code:
                  "<Columns gap=\"1rem\">\n" + "  <Column size=\"3\" offset=\"2\">\n" + "    <div>30% with 20% offset</div>\n" + "  </Column>\n" + "  <Column size=\"4\">\n" + "    <div>40%</div>\n" + "  </Column>\n" + "</Columns>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Columns gap="1rem">
                  <Column size="3" offset="2"><div::demoBox>"30% + offset"</div></Column>
                  <Column size="4"><div::demoBox2>"40%"</div></Column>
                </Columns>
              </div>,
            showReplay: false
          },
          {
            title: "Responsive Columns",
            description: "Different sizes per breakpoint",
            snippet:
              {
                code:
                  "<Columns gap=\"1rem\" multiline={true}>\n" + "  <Column size=\"10\" sizeTablet=\"5\" sizeDesktop=\"3\">\n" + "    <div>100% mobile, 50% tablet, 30% desktop</div>\n" + "  </Column>\n" + "  <Column size=\"10\" sizeTablet=\"5\" sizeDesktop=\"3\">\n" + "    <div>100% mobile, 50% tablet, 30% desktop</div>\n" + "  </Column>\n" + "  <Column size=\"10\" sizeTablet=\"10\" sizeDesktop=\"4\">\n" + "    <div>100% mobile, 100% tablet, 40% desktop</div>\n" + "  </Column>\n" + "</Columns>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Columns gap="1rem" multiline={true}>
                  <Column size="10" sizeTablet="5" sizeDesktop="3">
                    <div::demoBox>"Responsive 1"</div>
                  </Column>

                  <Column size="10" sizeTablet="5" sizeDesktop="3">
                    <div::demoBox2>"Responsive 2"</div>
                  </Column>

                  <Column size="10" sizeTablet="10" sizeDesktop="4">
                    <div::demoBox3>"Responsive 3"</div>
                  </Column>
                </Columns>
              </div>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "Columns Properties",
            description: "Grid container (uses <Columns> + <Column> children). ⚠️ No background/borderRadius props - use Flex for cards.",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "gap",
            description: "Space between columns (CSS value)",
            type: "String",
            defaultValue: "\"0.75rem\""
          },
          {
            name: "multiline",
            description: "Allow columns to wrap to next line",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "vAlign",
            description:
              "Vertical alignment: 'top', 'center', 'bottom', 'stretch'",
            type: "String",
            defaultValue: "\"stretch\""
          },
          {
            name: "hAlign",
            description:
              "Horizontal alignment: 'left', 'center', 'right', 'space-between', 'space-around'",
            type: "String",
            defaultValue: "\"flex-start\""
          },
          {
            name: "centered",
            description: "Center all columns",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "Column Properties",
            description: "Individual column properties. ✅ Has: size fractions, offset, responsive breakpoints. ❌ No: flex property - use Flex component for flex='1' growth.",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "size",
            description: "Column size: '1'-'10' (10%-100%), 'auto', or 'custom'. Note: This is NOT the same as flex property.",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "customSize",
            description:
              "Custom CSS size when size='custom' (e.g., '300px', '25%')",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "offset",
            description: "Left margin offset: '0'-'9' (0%-90%)",
            type: "String",
            defaultValue: "\"0\""
          },
          {
            name: "sizeTablet",
            description: "Size for tablet+ (768px)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "sizeDesktop",
            description: "Size for desktop+ (1024px)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "offsetTablet",
            description: "Offset for tablet+ (768px)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "offsetDesktop",
            description: "Offset for desktop+ (1024px)",
            type: "String",
            defaultValue: "\"\""
          }
        ]
      }
    />
  }
}
