/* LayoutPage - Showcase for Layout components */

component LayoutPage {
  connect NavigationStore exposing { setPage }

  /* State for component selection */
  state selectedComponent : String = "flex"
  state flexDirection : String = "row"
  state flexJustify : String = "flex-start"
  state flexAlign : String = "center"
  state flexGap : String = "1.5rem"
  state gridColumns : String = "repeat(3, 1fr)"
  state gridGap : String = "1.5rem"
  state containerSize : String = "lg"
  state itemCount : Number = 3
  state flexWrap : String = "nowrap"

  fun componentDidMount : Promise(Void) {
    setPage("layout")
  }

  /* Event handlers */
  fun handleComponentChange (component : String) : Promise(Void) {
    next { selectedComponent: component }
  }

  fun handleFlexDirectionChange (direction : String) : Promise(Void) {
    next { flexDirection: direction }
  }

  fun handleFlexJustifyChange (justify : String) : Promise(Void) {
    next { flexJustify: justify }
  }

  fun handleFlexAlignChange (align : String) : Promise(Void) {
    next { flexAlign: align }
  }

  fun handleGridColumnsChange (columns : String) : Promise(Void) {
    next { gridColumns: columns }
  }

  fun handleContainerSizeChange (size : String) : Promise(Void) {
    next { containerSize: size }
  }

  fun handleFlexWrapChange (wrap : String) : Promise(Void) {
    next { flexWrap: wrap }
  }

  fun increaseItems : Promise(Void) {
    if itemCount < 12 {
      next { itemCount: itemCount + 1 }
    } else {
      Promise.resolve(void)
    }
  }

  fun decreaseItems : Promise(Void) {
    if itemCount > 1 {
      next { itemCount: itemCount - 1 }
    } else {
      Promise.resolve(void)
    }
  }

  fun resetItems : Promise(Void) {
    next { itemCount: 3 }
  }

  /* Generate dynamic items */
  fun getItemColor (index : Number) : String {
    `
    (() => {
      const colors = [
        "#1989fa",
        "#52c41a",
        "#faad14",
        "#f5222d",
        "#722ed1",
        "#13c2c2",
        "#eb2f96",
        "#fa8c16",
        "#a0d911",
        "#2f54eb",
        "#fa541c",
        "#389e0d"
      ];
      return colors[#{index} % colors.length];
    })()
    `
  }

  fun generateItems : Array(Html) {
    `
    (() => {
      const result = [];
      for (let i = 0; i < #{itemCount}; i++) {
        result.push(i);
      }
      return result;
    })()
    `
    |> Array.map(
      (i : Number) : Html {
        <Box
          background={getItemColor(i)}
          padding="1.25rem 2rem"
          borderRadius="6px"
          minWidth="100px"
          height="100%"
          display="flex"
          key={"item-" + Number.toString(i)}>

          <Center width="100%" height="100%">
            <span style="color: white; font-weight: 600; font-size: 16px;">{Number.toString(i + 1)}</span>
          </Center>
        </Box>
      })
  }

  /* Get component tabs */
  fun getComponentTabs : Array(TabItem) {
    [
      { name: "flex", title: "Flex", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "grid", title: "Grid", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "stack", title: "Stack", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "box", title: "Box", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "container", title: "Container", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "divider", title: "Divider", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" }
    ]
  }

  fun handleComponentTabChange (event : TabChangeEvent) : Promise(Void) {
    handleComponentChange(event.name)
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    case selectedComponent {
      "flex" =>
        <Flex
          direction={flexDirection}
          justify={flexJustify}
          align={flexAlign}
          wrap={flexWrap}
          gap={flexGap}
          background="#f0f2f5"
          borderRadius="8px"
          padding="1.5rem"
          width={
            if flexDirection == "row" || flexDirection == "row-reverse" {
              if flexWrap == "wrap" {
                "500px"
              } else {
                "auto"
              }
            } else {
              "450px"
            }
          }
          minHeight="300px">

          {generateItems()}
        </Flex>

      "grid" =>
        <Grid
          columns={gridColumns}
          gap={gridGap}
          background="#f0f2f5"
          borderRadius="8px"
          padding="1.5rem"
          width="auto">

          {
            `
            (() => {
              const result = [];
              for (let i = 0; i < #{itemCount}; i++) {
                result.push(i);
              }
              return result;
            })()
            `
            |> Array.map(
              (i : Number) : Html {
                <Box
                  background={getItemColor(i)}
                  padding="1.5rem"
                  borderRadius="6px"
                  height="90px"
                  display="flex"
                  width="100%"
                  key={"grid-item-" + Number.toString(i)}>

                  <Center width="100%">
                    <span style="color: white; font-weight: 600; font-size: 16px;">{Number.toString(i + 1)}</span>
                  </Center>
                </Box>
              })
          }
        </Grid>

      "stack" =>
        <Stack
          spacing="1.5rem"
          align="stretch"
          background="#f0f2f5"
          borderRadius="8px"
          padding="1.5rem"
          width="auto">

          {generateItems()}
        </Stack>

      "box" =>
        <Box
          background="linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
          padding="2rem"
          borderRadius="12px"
          boxShadow="0 10px 30px rgba(0,0,0,0.2)"
          maxWidth="400px">

          <span style="color: white; font-size: 18px; font-weight: 600;">"Styled Box Component"</span>
        </Box>

      "container" =>
        <Container size={containerSize} background="#f0f2f5" borderRadius="8px" padding="2rem">
          <h3 style="margin: 0 0 1rem 0;">"Responsive Container"</h3>
          <p style="margin: 0; color: #666;">"Max-width: " + {
            case containerSize {
              "sm" => "640px"
              "md" => "768px"
              "lg" => "1024px"
              "xl" => "1280px"
              => "1024px"
            }
          }</p>
        </Container>

      "divider" =>
        <VStack spacing="2rem" width="400px">
          <Box>
            <p>"Content above divider"</p>
            <Divider/>
            <p>"Content below divider"</p>
          </Box>

          <Box>
            <p>"Content above"</p>
            <Divider label="OR"/>
            <p>"Content below"</p>
          </Box>

          <HStack spacing="1rem">
            <p>"Left"</p>
            <Divider orientation="vertical" length="50px" margin="0"/>
            <p>"Right"</p>
          </HStack>
        </VStack>

      => <div>"Select a component"</div>
    }
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"Layout Controls"</h3>

      <div::controlGroup>
        <div::controlLabel>"Component Type"</div>
        <Tabs
          tabs={getComponentTabs()}
          active={selectedComponent}
          type="line"
          color="#1989fa"
          titleActiveColor="#1989fa"
          border={true}
          onChange={handleComponentTabChange}/>
      </div>

      if selectedComponent != "box" && selectedComponent != "container" && selectedComponent != "divider" {
        <div::controlGroup>
          <div::controlLabel>"Items: " + Number.toString(itemCount)</div>
          <div::itemControls>
            <button::itemButton(false) onClick={(e : Html.Event) { decreaseItems() }} disabled={itemCount <= 1}>
              "−"
            </button>
            <span::itemCount>{Number.toString(itemCount)}</span>
            <button::itemButton(false) onClick={(e : Html.Event) { increaseItems() }} disabled={itemCount >= 12}>
              "+"
            </button>
            <button::resetButton onClick={(e : Html.Event) { resetItems() }}>
              "Reset"
            </button>
          </div>
        </div>
      }

      {
        case selectedComponent {
          "flex" =>
            <>
              <div::controlGroup>
                <div::controlLabel>"Direction"</div>
                <div::buttonGroup>
                  <button::button(flexDirection == "row") onClick={(e : Html.Event) { handleFlexDirectionChange("row") }}>
                    "Row"
                  </button>
                  <button::button(flexDirection == "column") onClick={(e : Html.Event) { handleFlexDirectionChange("column") }}>
                    "Column"
                  </button>
                </div>
              </div>

              <div::controlGroup>
                <div::controlLabel>"Wrap"</div>
                <div::buttonGroup>
                  <button::button(flexWrap == "nowrap") onClick={(e : Html.Event) { handleFlexWrapChange("nowrap") }}>
                    "No Wrap"
                  </button>
                  <button::button(flexWrap == "wrap") onClick={(e : Html.Event) { handleFlexWrapChange("wrap") }}>
                    "Wrap"
                  </button>
                </div>
              </div>

              <div::controlGroup>
                <div::controlLabel>"Justify"</div>
                <div::buttonGroup>
                  <button::button(flexJustify == "flex-start") onClick={(e : Html.Event) { handleFlexJustifyChange("flex-start") }}>
                    "Start"
                  </button>
                  <button::button(flexJustify == "center") onClick={(e : Html.Event) { handleFlexJustifyChange("center") }}>
                    "Center"
                  </button>
                  <button::button(flexJustify == "flex-end") onClick={(e : Html.Event) { handleFlexJustifyChange("flex-end") }}>
                    "End"
                  </button>
                  <button::button(flexJustify == "space-between") onClick={(e : Html.Event) { handleFlexJustifyChange("space-between") }}>
                    "Between"
                  </button>
                </div>
              </div>

              <div::controlGroup>
                <div::controlLabel>"Align"</div>
                <div::buttonGroup>
                  <button::button(flexAlign == "flex-start") onClick={(e : Html.Event) { handleFlexAlignChange("flex-start") }}>
                    "Start"
                  </button>
                  <button::button(flexAlign == "center") onClick={(e : Html.Event) { handleFlexAlignChange("center") }}>
                    "Center"
                  </button>
                  <button::button(flexAlign == "flex-end") onClick={(e : Html.Event) { handleFlexAlignChange("flex-end") }}>
                    "End"
                  </button>
                  <button::button(flexAlign == "stretch") onClick={(e : Html.Event) { handleFlexAlignChange("stretch") }}>
                    "Stretch"
                  </button>
                </div>
              </div>
            </>

          "grid" =>
            <div::controlGroup>
              <div::controlLabel>"Columns"</div>
              <div::buttonGroup>
                <button::button(gridColumns == "repeat(2, 1fr)") onClick={(e : Html.Event) { handleGridColumnsChange("repeat(2, 1fr)") }}>
                  "2 Cols"
                </button>
                <button::button(gridColumns == "repeat(3, 1fr)") onClick={(e : Html.Event) { handleGridColumnsChange("repeat(3, 1fr)") }}>
                  "3 Cols"
                </button>
                <button::button(gridColumns == "repeat(4, 1fr)") onClick={(e : Html.Event) { handleGridColumnsChange("repeat(4, 1fr)") }}>
                  "4 Cols"
                </button>
                <button::button(gridColumns == "1fr 2fr 1fr") onClick={(e : Html.Event) { handleGridColumnsChange("1fr 2fr 1fr") }}>
                  "Custom"
                </button>
              </div>
            </div>

          "container" =>
            <div::controlGroup>
              <div::controlLabel>"Size"</div>
              <div::buttonGroup>
                <button::button(containerSize == "sm") onClick={(e : Html.Event) { handleContainerSizeChange("sm") }}>
                  "Small"
                </button>
                <button::button(containerSize == "md") onClick={(e : Html.Event) { handleContainerSizeChange("md") }}>
                  "Medium"
                </button>
                <button::button(containerSize == "lg") onClick={(e : Html.Event) { handleContainerSizeChange("lg") }}>
                  "Large"
                </button>
                <button::button(containerSize == "xl") onClick={(e : Html.Event) { handleContainerSizeChange("xl") }}>
                  "XL"
                </button>
              </div>
            </div>

          => <div/>
        }
      }
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Flex Layout",
        description: "Flexible box layout with gap and alignment",
        snippet: {
          code: "<Flex direction=\"row\" justify=\"space-between\" align=\"center\" gap=\"1rem\">\n" +
                "  <Box>Item 1</Box>\n" +
                "  <Box>Item 2</Box>\n" +
                "  <Box>Item 3</Box>\n" +
                "</Flex>",
          language: "mint"
        },
        previewContent: <Flex direction="row" justify="space-between" align="center" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <Box background="#1989fa" padding="0.5rem 1rem" borderRadius="4px">
            <span style="color: white;">"Item 1"</span>
          </Box>
          <Box background="#52c41a" padding="0.5rem 1rem" borderRadius="4px">
            <span style="color: white;">"Item 2"</span>
          </Box>
          <Box background="#faad14" padding="0.5rem 1rem" borderRadius="4px">
            <span style="color: white;">"Item 3"</span>
          </Box>
        </Flex>,
        showReplay: false
      },
      {
        title: "Grid Layout",
        description: "CSS Grid with responsive columns",
        snippet: {
          code: "<Grid columns=\"repeat(3, 1fr)\" gap=\"1rem\">\n" +
                "  <Box>1</Box>\n" +
                "  <Box>2</Box>\n" +
                "  <Box>3</Box>\n" +
                "</Grid>",
          language: "mint"
        },
        previewContent: <Grid columns="repeat(3, 1fr)" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <Box background="#1989fa" padding="1rem" borderRadius="4px" height="60px">
            <span style="color: white;">"1"</span>
          </Box>
          <Box background="#52c41a" padding="1rem" borderRadius="4px" height="60px">
            <span style="color: white;">"2"</span>
          </Box>
          <Box background="#faad14" padding="1rem" borderRadius="4px" height="60px">
            <span style="color: white;">"3"</span>
          </Box>
        </Grid>,
        showReplay: false
      },
      {
        title: "Stack (Vertical)",
        description: "Vertical layout with consistent spacing",
        snippet: {
          code: "<Stack spacing=\"1rem\">\n" +
                "  <Box>First</Box>\n" +
                "  <Box>Second</Box>\n" +
                "  <Box>Third</Box>\n" +
                "</Stack>",
          language: "mint"
        },
        previewContent: <Stack spacing="1rem" width="200px" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <Box background="#1989fa" padding="0.75rem" borderRadius="4px">
            <span style="color: white;">"First"</span>
          </Box>
          <Box background="#52c41a" padding="0.75rem" borderRadius="4px">
            <span style="color: white;">"Second"</span>
          </Box>
          <Box background="#faad14" padding="0.75rem" borderRadius="4px">
            <span style="color: white;">"Third"</span>
          </Box>
        </Stack>,
        showReplay: false
      },
      {
        title: "HStack & Spacer",
        description: "Horizontal stack with spacer pushing items apart",
        snippet: {
          code: "<HStack>\n" +
                "  <Box>Left</Box>\n" +
                "  <Spacer/>\n" +
                "  <Box>Right</Box>\n" +
                "</HStack>",
          language: "mint"
        },
        previewContent: <HStack spacing="0" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <Box background="#1989fa" padding="0.5rem 1rem" borderRadius="4px">
            <span style="color: white;">"Left"</span>
          </Box>
          <Spacer/>
          <Box background="#52c41a" padding="0.5rem 1rem" borderRadius="4px">
            <span style="color: white;">"Right"</span>
          </Box>
        </HStack>,
        showReplay: false
      },
      {
        title: "Center Component",
        description: "Perfect centering horizontally and vertically",
        snippet: {
          code: "<Center minHeight=\"200px\">\n" +
                "  <Box>Centered Content</Box>\n" +
                "</Center>",
          language: "mint"
        },
        previewContent: <Center minHeight="150px" background="#f0f2f5" borderRadius="8px">
          <Box background="#1989fa" padding="1rem" borderRadius="4px">
            <span style="color: white;">"Centered"</span>
          </Box>
        </Center>,
        showReplay: false
      },
      {
        title: "Divider",
        description: "Visual separator with optional label",
        snippet: {
          code: "<Divider/>\n" +
                "<Divider label=\"OR\"/>\n" +
                "<Divider orientation=\"vertical\" length=\"50px\"/>",
          language: "mint"
        },
        previewContent: <VStack spacing="1.5rem" width="300px">
          <Divider/>
          <Divider label="OR"/>
          <HStack>
            <span>"Left"</span>
            <Divider orientation="vertical" length="30px" margin="0"/>
            <span>"Right"</span>
          </HStack>
        </VStack>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "Flex",
        description: "Flexbox layout: direction, justify, align, wrap, gap",
        type: "Component",
        defaultValue: "direction=\"row\""
      },
      {
        name: "Grid",
        description: "CSS Grid layout: columns, rows, gap, autoFlow",
        type: "Component",
        defaultValue: "columns=\"1fr\""
      },
      {
        name: "Stack/VStack",
        description: "Vertical layout: spacing, align, justify, divider",
        type: "Component",
        defaultValue: "spacing=\"1rem\""
      },
      {
        name: "HStack",
        description: "Horizontal layout: spacing, align, justify, wrap",
        type: "Component",
        defaultValue: "spacing=\"1rem\""
      },
      {
        name: "Box",
        description: "Layout primitive: padding, margin, size, background, borders",
        type: "Component",
        defaultValue: "padding=\"0\""
      },
      {
        name: "Container",
        description: "Responsive container: size (sm|md|lg|xl), fluid, centerContent",
        type: "Component",
        defaultValue: "size=\"lg\""
      },
      {
        name: "Center",
        description: "Perfect centering: minHeight, inline",
        type: "Component",
        defaultValue: "minHeight=\"auto\""
      },
      {
        name: "Spacer",
        description: "Flex spacer: takes available space, optional fixed size",
        type: "Component",
        defaultValue: "size=\"\""
      },
      {
        name: "Divider",
        description: "Visual separator: orientation, color, thickness, label",
        type: "Component",
        defaultValue: "orientation=\"horizontal\""
      },
      {
        name: "AspectRatio",
        description: "Maintains aspect ratio: ratio (width/height)",
        type: "Component",
        defaultValue: "ratio=1"
      }
    ]
  }

  /* Custom styles */
  style controlsTitle {
    font-size: 15px;
    font-weight: 600;
    margin: 0 0 16px;
    color: #323233;
  }

  style controlGroup {
    margin-bottom: 20px;
  }

  style controlLabel {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 8px;
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    border: 2px solid #1989fa;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      background: #1989fa;
      color: #fff;
    } else {
      background: #fff;
      color: #1989fa;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(25, 137, 250, 0.3);
    }
  }

  style itemControls {
    display: flex;
    gap: 8px;
    align-items: center;
    background: #f7f8fa;
    padding: 8px 12px;
    border-radius: 8px;
    width: fit-content;
  }

  style itemButton (active : Bool) {
    width: 36px;
    height: 36px;
    border-radius: 6px;
    border: 2px solid #1989fa;
    font-size: 20px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    background: #fff;
    color: #1989fa;
    display: flex;
    align-items: center;
    justify-content: center;

    &:hover:not(:disabled) {
      background: #1989fa;
      color: #fff;
      transform: scale(1.1);
    }

    &:disabled {
      opacity: 0.4;
      cursor: not-allowed;
    }
  }

  style itemCount {
    font-size: 18px;
    font-weight: 700;
    color: #1989fa;
    min-width: 32px;
    text-align: center;
  }

  style resetButton {
    padding: 6px 12px;
    border-radius: 6px;
    border: 2px solid #52c41a;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    background: #fff;
    color: #52c41a;
    margin-left: 8px;

    &:hover {
      background: #52c41a;
      color: #fff;
      transform: translateY(-2px);
    }
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Layout"
      description="Powerful layout components for building modern, responsive interfaces. Includes Flex, Grid, Stack, Box, Container, and more."
      badge="Components"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Layout components provide the building blocks for creating complex, responsive layouts. Use Flex for one-dimensional layouts, Grid for two-dimensional layouts, Stack for vertical/horizontal spacing, Box for styled containers, and Container for responsive max-width wrappers."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={[]}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
