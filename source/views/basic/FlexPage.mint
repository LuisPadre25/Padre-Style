/* FlexPage - Flex Layout Component Showcase */
component FlexPage {
  /* State for interactive preview */
  state direction : String = "row"

  state justify : String = "flex-start"
  state align : String = "stretch"
  state gap : String = "12px"
  state wrap : Bool = false

  /* Handlers */
  fun handleDirectionChange (event : Html.Event) : Promise(Void) {
    next { direction: Dom.getValue(event.target) }
  }

  fun handleJustifyChange (event : Html.Event) : Promise(Void) {
    next { justify: Dom.getValue(event.target) }
  }

  fun handleAlignChange (event : Html.Event) : Promise(Void) {
    next { align: Dom.getValue(event.target) }
  }

  fun handleGapChange (event : Html.Event) : Promise(Void) {
    next { gap: Dom.getValue(event.target) }
  }

  fun handleWrapToggle (event : Html.Event) : Promise(Void) {
    {
      let isChecked =
        `#{event}.target.checked`

      next { wrap: isChecked }
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

  style demoBox {
    padding: 1.5rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  style demoBox2 {
    padding: 1.5rem;
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: white;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  style demoBox3 {
    padding: 1.5rem;
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    color: white;
    border-radius: 8px;
    text-align: center;
    font-weight: 500;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  style demoCard {
    padding: 1.5rem;
    background: #f7f8fa;
    border-radius: 8px;
    color: #323233;
  }

  fun render : Html {
    <ComponentShowcase
      title="Flex"
      description="Pure flexbox component with flex property for proportional growth, visual properties (background, borderRadius, padding), and overflow control. Use this for navbars, cards, app layouts, and any flexbox pattern. For Bootstrap-style grids with fractions and responsive breakpoints, use Columns component instead."
      badge="Flexbox"
      previewContent={
        <div style="width: 100%;">
          <Flex
            direction={direction}
            justify={justify}
            align={align}
            gap={gap}
            wrap={wrap}
          >
            <div::demoBox>"Box 1"</div>
            <div::demoBox2>"Box 2"</div>
            <div::demoBox3>"Box 3"</div>
          </Flex>
        </div>
      }
      controlsContent={
        <div>
          <div::controlGroup>
            <label::label>"Direction"</label>

            <select::select value={direction} onChange={handleDirectionChange}>
              <option value="row">"Row (Horizontal)"</option>
              <option value="column">"Column (Vertical)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Justify Content"</label>

            <select::select value={justify} onChange={handleJustifyChange}>
              <option value="flex-start">"Flex Start"</option>
              <option value="center">"Center"</option>
              <option value="flex-end">"Flex End"</option>
              <option value="space-between">"Space Between"</option>
              <option value="space-around">"Space Around"</option>
              <option value="space-evenly">"Space Evenly"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Align Items"</label>

            <select::select value={align} onChange={handleAlignChange}>
              <option value="stretch">"Stretch"</option>
              <option value="flex-start">"Flex Start"</option>
              <option value="center">"Center"</option>
              <option value="flex-end">"Flex End"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Gap"</label>

            <select::select value={gap} onChange={handleGapChange}>
              <option value="0">"0"</option>
              <option value="4px">"4px"</option>
              <option value="8px">"8px"</option>
              <option value="12px">"12px"</option>
              <option value="16px">"16px"</option>
              <option value="24px">"24px"</option>
              <option value="32px">"32px"</option>
            </select>
          </div>

          <div::controlGroup>
            <div::checkboxGroup>
              <input::checkbox
                type="checkbox"
                checked={wrap}
                onChange={handleWrapToggle}
              />

              <label::checkboxLabel>"Wrap"</label>
            </div>
          </div>
        </div>
      }
      usageText="Flex is a pure flexbox component. Use flex='1' for equal growth, flex='2' for 2x width, etc. Automatic features: box-sizing: border-box (always), width: 100% (default), width: auto (when flex is set). Includes visual props (background, borderRadius, padding, margin) and overflow control. Perfect for navbars (justify='space-between'), cards (background + borderRadius), app layouts (flex='1' for growing sections), and any flexbox pattern. ⚠️ For Bootstrap-style grids with size fractions (1-10) and responsive breakpoints, use Columns component instead."
      codeExamples={
        [
          {
            title: "Basic Row Layout",
            description: "Simple horizontal layout with gap",
            snippet:
              {
                code:
                  "<Flex gap=\"12px\">\n" + "  <div>Item 1</div>\n" + "  <div>Item 2</div>\n" + "  <div>Item 3</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex gap="12px">
                  <div::demoBox>"Item 1"</div>
                  <div::demoBox2>"Item 2"</div>
                  <div::demoBox3>"Item 3"</div>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Column Layout",
            description: "Vertical stacking of items",
            snippet:
              {
                code:
                  "<Flex direction=\"column\" gap=\"12px\">\n" + "  <div>Item 1</div>\n" + "  <div>Item 2</div>\n" + "  <div>Item 3</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex direction="column" gap="12px">
                  <div::demoBox>"Item 1"</div>
                  <div::demoBox2>"Item 2"</div>
                  <div::demoBox3>"Item 3"</div>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Flex Property - Equal Growth",
            description: "Items grow equally to fill space",
            snippet:
              {
                code:
                  "<Flex gap=\"12px\">\n" + "  <Flex flex=\"1\"><div>Flex 1</div></Flex>\n" + "  <Flex flex=\"1\"><div>Flex 1</div></Flex>\n" + "  <Flex flex=\"1\"><div>Flex 1</div></Flex>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex gap="12px">
                  <Flex flex="1"><div::demoBox>"Flex 1"</div></Flex>
                  <Flex flex="1"><div::demoBox2>"Flex 1"</div></Flex>
                  <Flex flex="1"><div::demoBox3>"Flex 1"</div></Flex>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Flex Property - Different Proportions",
            description: "Control growth ratio with flex values",
            snippet:
              {
                code:
                  "<Flex gap=\"12px\">\n" + "  <Flex flex=\"1\"><div>1x</div></Flex>\n" + "  <Flex flex=\"2\"><div>2x wider</div></Flex>\n" + "  <Flex flex=\"1\"><div>1x</div></Flex>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex gap="12px">
                  <Flex flex="1"><div::demoBox>"1x"</div></Flex>
                  <Flex flex="2"><div::demoBox2>"2x wider"</div></Flex>
                  <Flex flex="1"><div::demoBox3>"1x"</div></Flex>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Centering Content",
            description: "Horizontal and vertical centering",
            snippet:
              {
                code:
                  "<Flex justify=\"center\" align=\"center\" height=\"150px\">\n" + "  <div>Centered</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex
                  justify="center"
                  align="center"
                  height="150px"
                  background="#f7f8fa"
                  borderRadius="8px"
                ><div::demoBox>"Centered"</div></Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Space Between",
            description: "Distribute items with space between",
            snippet:
              {
                code:
                  "<Flex justify=\"space-between\">\n" + "  <div>Left</div>\n" + "  <div>Right</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex justify="space-between">
                  <div::demoBox>"Left"</div>
                  <div::demoBox3>"Right"</div>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Visual Properties - Cards",
            description: "Create cards with background and border radius",
            snippet:
              {
                code:
                  "<Flex\n" + "  direction=\"column\"\n" + "  gap=\"12px\"\n" + "  background=\"#f7f8fa\"\n" + "  borderRadius=\"12px\"\n" + "  padding=\"24px\"\n" + ">\n" + "  <div>Card Content</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex
                  direction="column"
                  gap="12px"
                  background="#f7f8fa"
                  borderRadius="12px"
                  padding="24px"
                >
                  <Text weight="600">"Card Title"</Text>
                  <Text>"This Flex has background, border radius, and padding."</Text>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Multiple Cards",
            description: "Row of equal-width cards",
            snippet:
              {
                code:
                  "<Flex gap=\"16px\">\n" + "  <Flex flex=\"1\" background=\"#07c160\" borderRadius=\"12px\" padding=\"20px\">\n" + "    <div>Card 1</div>\n" + "  </Flex>\n" + "  <Flex flex=\"1\" background=\"#1989fa\" borderRadius=\"12px\" padding=\"20px\">\n" + "    <div>Card 2</div>\n" + "  </Flex>\n" + "  <Flex flex=\"1\" background=\"#ff976a\" borderRadius=\"12px\" padding=\"20px\">\n" + "    <div>Card 3</div>\n" + "  </Flex>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex gap="16px">
                  <Flex
                    flex="1"
                    background="#07c160"
                    borderRadius="12px"
                    padding="20px"
                  ><Text color="#ffffff">"Card 1"</Text></Flex>

                  <Flex
                    flex="1"
                    background="#1989fa"
                    borderRadius="12px"
                    padding="20px"
                  ><Text color="#ffffff">"Card 2"</Text></Flex>

                  <Flex
                    flex="1"
                    background="#ff976a"
                    borderRadius="12px"
                    padding="20px"
                  ><Text color="#ffffff">"Card 3"</Text></Flex>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "Overflow - Scrollable Content",
            description: "Fixed height with scrollable overflow",
            snippet:
              {
                code:
                  "<Flex\n" + "  direction=\"column\"\n" + "  height=\"200px\"\n" + "  overflow=\"auto\"\n" + "  background=\"#f7f8fa\"\n" + "  borderRadius=\"8px\"\n" + "  padding=\"16px\"\n" + "  gap=\"8px\"\n" + ">\n" + "  <div>Item 1</div>\n" + "  <div>Item 2</div>\n" + "  <div>Item 3</div>\n" + "  <div>Item 4</div>\n" + "  <div>Item 5</div>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex
                  direction="column"
                  height="200px"
                  overflow="auto"
                  background="#f7f8fa"
                  borderRadius="8px"
                  padding="16px"
                  gap="8px"
                >
                  <div::demoCard>"Item 1"</div>
                  <div::demoCard>"Item 2"</div>
                  <div::demoCard>"Item 3"</div>
                  <div::demoCard>"Item 4"</div>
                  <div::demoCard>"Item 5 (scroll)"</div>
                </Flex>
              </div>,
            showReplay: false
          },
          {
            title: "App Layout Example",
            description: "Complete navbar + sidebar + content layout",
            snippet:
              {
                code:
                  "<Flex direction=\"column\" height=\"400px\">\n" + "  {/* Navbar */}\n" + "  <Flex justify=\"space-between\" align=\"center\" padding=\"16px 24px\" background=\"#1989fa\">\n" + "    <div>Logo</div>\n" + "    <div>Menu</div>\n" + "  </Flex>\n" + "\n" + "  {/* Main Area */}\n" + "  <Flex flex=\"1\" overflow=\"hidden\">\n" + "    {/* Sidebar */}\n" + "    <Flex direction=\"column\" width=\"200px\" background=\"#f7f8fa\" padding=\"16px\" gap=\"8px\">\n" + "      <div>Home</div>\n" + "      <div>Settings</div>\n" + "    </Flex>\n" + "\n" + "    {/* Content */}\n" + "    <Flex flex=\"1\" padding=\"24px\" overflow=\"auto\">\n" + "      <div>Main Content</div>\n" + "    </Flex>\n" + "  </Flex>\n" + "</Flex>",
                language: "mint"
              },
            previewContent:
              <div style="width: 100%;">
                <Flex
                  direction="column"
                  height="400px"
                  background="#ffffff"
                  borderRadius="12px"
                  overflow="hidden"
                >
                  <Flex
                    justify="space-between"
                    align="center"
                    padding="16px 24px"
                    background="#1989fa"
                  >
                    <Text color="#ffffff" weight="600">"App Title"</Text>
                    <Text color="#ffffff">"Menu"</Text>
                  </Flex>

                  <Flex flex="1" overflow="hidden">
                    <Flex
                      direction="column"
                      width="200px"
                      background="#f7f8fa"
                      padding="16px"
                      gap="8px"
                    >
                      <div::demoCard>"Home"</div>
                      <div::demoCard>"Dashboard"</div>
                      <div::demoCard>"Settings"</div>
                    </Flex>

                    <Flex
                      direction="column"
                      flex="1"
                      padding="24px"
                      overflow="auto"
                      gap="16px"
                    >
                      <Text weight="600">"Main Content Area"</Text>

                      <Flex gap="12px">
                        <Flex
                          flex="1"
                          background="#e4e9f2"
                          borderRadius="8px"
                          padding="20px"
                        ><Text>"Card 1"</Text></Flex>

                        <Flex
                          flex="1"
                          background="#e4e9f2"
                          borderRadius="8px"
                          padding="20px"
                        ><Text>"Card 2"</Text></Flex>
                      </Flex>
                    </Flex>
                  </Flex>
                </Flex>
              </div>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "Flex Properties",
            description:
              "Pure flexbox component. ✅ Has: flex property, visual props (background, borderRadius), overflow. ❌ No: size fractions, offset, responsive breakpoints - use Columns for those.",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "direction",
            description: "Flex direction: 'row' or 'column'",
            type: "String",
            defaultValue: "\"row\""
          },
          {
            name: "justify",
            description:
              "Justify content: 'flex-start', 'center', 'flex-end', 'space-between', 'space-around', 'space-evenly'",
            type: "String",
            defaultValue: "\"flex-start\""
          },
          {
            name: "align",
            description:
              "Align items: 'stretch', 'flex-start', 'center', 'flex-end'",
            type: "String",
            defaultValue: "\"stretch\""
          },
          {
            name: "gap",
            description: "Space between items (CSS value)",
            type: "String",
            defaultValue: "\"0\""
          },
          {
            name: "wrap",
            description: "Allow items to wrap to next line",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "flex",
            description:
              "Flex grow/shrink value for proportional sizing (e.g., '1', '2'). Automatically sets width to 'auto'. Note: This is NOT the same as Column's size='1-10' fractions.",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "width",
            description:
              "Width (CSS value). Default: '100%' when no flex, 'auto' when flex is set",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "height",
            description: "Height (CSS value)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "padding",
            description: "Internal spacing (CSS value)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "margin",
            description: "External spacing (CSS value)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "overflow",
            description: "Overflow behavior: 'auto', 'hidden', 'scroll', etc.",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "background",
            description: "Background color or gradient (CSS value)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "borderRadius",
            description: "Border radius (CSS value)",
            type: "String",
            defaultValue: "\"\""
          }
        ]
      }
    />
  }
}
