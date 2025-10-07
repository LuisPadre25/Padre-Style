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
        <div
          style={
            "background: " + getItemColor(i) + "; " +
            "padding: 1.25rem 2rem; " +
            "border-radius: 6px; " +
            "min-width: 100px; " +
            "height: 100%; " +
            "display: flex; " +
            "align-items: center; " +
            "justify-content: center;"
          }
          key={"item-" + Number.toString(i)}>

          <span style="color: white; font-weight: 600; font-size: 16px;">{Number.toString(i + 1)}</span>
        </div>
      })
  }

  /* Get component tabs */
  fun getComponentTabs : Array(TabItem) {
    [
      { name: "flex", title: "Flex", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" },
      { name: "grid", title: "Grid", disabled: false, dot: false, badge: "", titleStyle: "", icon: "", content: "" }
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
                <div
                  style={
                    "background: " + getItemColor(i) + "; " +
                    "padding: 1.5rem; " +
                    "border-radius: 6px; " +
                    "height: 90px; " +
                    "display: flex; " +
                    "width: 100%; " +
                    "align-items: center; " +
                    "justify-content: center;"
                  }
                  key={"grid-item-" + Number.toString(i)}>

                  <span style="color: white; font-weight: 600; font-size: 16px;">{Number.toString(i + 1)}</span>
                </div>
              })
          }
        </Grid>

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

          => <div/>
        }
      }
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Flex - Horizontal Layout",
        description: "One-dimensional layout with space-between alignment",
        snippet: {
          code: "<Flex \n" +
                "  direction=\"row\" \n" +
                "  justify=\"space-between\" \n" +
                "  align=\"center\" \n" +
                "  gap=\"1rem\">\n" +
                "  <div>Item 1</div>\n" +
                "  <div>Item 2</div>\n" +
                "  <div>Item 3</div>\n" +
                "</Flex>",
          language: "mint"
        },
        previewContent: <Flex direction="row" justify="space-between" align="center" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <div style="background: #1989fa; padding: 0.5rem 1rem; border-radius: 4px;">
            <span style="color: white;">"Item 1"</span>
          </div>
          <div style="background: #52c41a; padding: 0.5rem 1rem; border-radius: 4px;">
            <span style="color: white;">"Item 2"</span>
          </div>
          <div style="background: #faad14; padding: 0.5rem 1rem; border-radius: 4px;">
            <span style="color: white;">"Item 3"</span>
          </div>
        </Flex>,
        showReplay: false
      },
      {
        title: "Flex - Vertical Stack",
        description: "Column direction with stretch alignment",
        snippet: {
          code: "<Flex \n" +
                "  direction=\"column\" \n" +
                "  align=\"stretch\" \n" +
                "  gap=\"1rem\">\n" +
                "  <div>First</div>\n" +
                "  <div>Second</div>\n" +
                "  <div>Third</div>\n" +
                "</Flex>",
          language: "mint"
        },
        previewContent: <Flex direction="column" align="stretch" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px" width="200px">
          <div style="background: #1989fa; padding: 0.75rem; border-radius: 4px; text-align: center;">
            <span style="color: white;">"First"</span>
          </div>
          <div style="background: #52c41a; padding: 0.75rem; border-radius: 4px; text-align: center;">
            <span style="color: white;">"Second"</span>
          </div>
          <div style="background: #faad14; padding: 0.75rem; border-radius: 4px; text-align: center;">
            <span style="color: white;">"Third"</span>
          </div>
        </Flex>,
        showReplay: false
      },
      {
        title: "Grid - 3 Columns",
        description: "Two-dimensional grid with equal columns",
        snippet: {
          code: "<Grid \n" +
                "  columns=\"repeat(3, 1fr)\" \n" +
                "  gap=\"1rem\">\n" +
                "  <div>1</div>\n" +
                "  <div>2</div>\n" +
                "  <div>3</div>\n" +
                "  <div>4</div>\n" +
                "  <div>5</div>\n" +
                "  <div>6</div>\n" +
                "</Grid>",
          language: "mint"
        },
        previewContent: <Grid columns="repeat(3, 1fr)" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <div style="background: #1989fa; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"1"</span>
          </div>
          <div style="background: #52c41a; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"2"</span>
          </div>
          <div style="background: #faad14; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"3"</span>
          </div>
          <div style="background: #722ed1; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"4"</span>
          </div>
          <div style="background: #13c2c2; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"5"</span>
          </div>
          <div style="background: #eb2f96; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"6"</span>
          </div>
        </Grid>,
        showReplay: false
      },
      {
        title: "Grid - Custom Columns",
        description: "Asymmetric grid with custom column sizes",
        snippet: {
          code: "<Grid \n" +
                "  columns=\"2fr 1fr 1fr\" \n" +
                "  gap=\"1rem\">\n" +
                "  <div>Wide</div>\n" +
                "  <div>Small</div>\n" +
                "  <div>Small</div>\n" +
                "</Grid>",
          language: "mint"
        },
        previewContent: <Grid columns="2fr 1fr 1fr" gap="1rem" background="#f0f2f5" padding="1rem" borderRadius="8px">
          <div style="background: #1989fa; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"Wide"</span>
          </div>
          <div style="background: #52c41a; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"Small"</span>
          </div>
          <div style="background: #faad14; padding: 1rem; border-radius: 4px; height: 60px; display: flex; align-items: center; justify-content: center;">
            <span style="color: white;">"Small"</span>
          </div>
        </Grid>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "direction",
        description: "Flex direction: row, column, row-reverse, column-reverse",
        type: "String",
        defaultValue: "\"row\""
      },
      {
        name: "justify",
        description: "Main axis alignment: flex-start, center, flex-end, space-between, space-around, space-evenly",
        type: "String",
        defaultValue: "\"flex-start\""
      },
      {
        name: "align",
        description: "Cross axis alignment: flex-start, center, flex-end, stretch, baseline",
        type: "String",
        defaultValue: "\"stretch\""
      },
      {
        name: "wrap",
        description: "Flex wrap: nowrap, wrap, wrap-reverse",
        type: "String",
        defaultValue: "\"nowrap\""
      },
      {
        name: "gap",
        description: "Space between items (Flex/Grid)",
        type: "String",
        defaultValue: "\"1rem\""
      },
      {
        name: "columns",
        description: "Grid template columns: e.g. \"repeat(3, 1fr)\", \"1fr 2fr 1fr\"",
        type: "String",
        defaultValue: "\"1fr\""
      },
      {
        name: "rows",
        description: "Grid template rows: e.g. \"auto\", \"100px 200px\"",
        type: "String",
        defaultValue: "\"auto\""
      },
      {
        name: "autoFlow",
        description: "Grid auto flow: row, column, dense, row dense, column dense",
        type: "String",
        defaultValue: "\"row\""
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
      description="Pure layout components for building modern, responsive interfaces using Flexbox and CSS Grid."
      badge="Components"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Layout components provide powerful, flexible systems for arranging content. Use Flex for one-dimensional layouts with full flexbox control (direction, justify, align, wrap, gap). Use Grid for two-dimensional layouts with template columns, rows, and advanced positioning."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={[]}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
