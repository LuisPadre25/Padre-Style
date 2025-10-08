/* LayoutPage - Grid Component Showcase */

component LayoutPage {
  connect NavigationStore exposing { setPage }
  connect ViewModeStore exposing { viewMode }

  fun componentDidMount : Promise(Void) {
    setPage("grid-layout")
  }

  /* State for interactive controls */
  state cols : String = "3"
  state colsTablet : String = "4"
  state colsDesktop : String = "6"
  state gap : String = "1rem"
  state itemCount : Number = 6

  /* Get current columns based on viewport */
  fun getCurrentCols : String {
    case viewMode {
      "mobile" => cols
      "tablet" => colsTablet
      => colsDesktop
    }
  }

  /* Get label based on viewport */
  fun getColsLabel : String {
    case viewMode {
      "mobile" => "Columns (Mobile) 📱"
      "tablet" => "Columns (Tablet) 📱💻"
      => "Columns (Desktop) 🖥️"
    }
  }

  /* Get hint based on viewport */
  fun getColsHint : String {
    case viewMode {
      "mobile" => "Cambia las columnas para móviles (< 768px)"
      "tablet" => "Cambia las columnas para tablets (768px+)"
      => "Cambia las columnas para desktop (1024px+)"
    }
  }

  /* Event handlers */
  fun handleColsChange (event : Html.Event) : Promise(Void) {
    let value = Dom.getValue(event.target)

    case viewMode {
      "mobile" => next { cols: value }
      "tablet" => next { colsTablet: value }
      => next { colsDesktop: value }
    }
  }

  fun handleGapChange (event : Html.Event) : Promise(Void) {
    next { gap: Dom.getValue(event.target) }
  }

  fun handleItemCountChange (value : String) : Promise(Void) {
    case Number.fromString(value) {
      Just(num) => next { itemCount: num }
      Nothing => Promise.resolve(void)
    }
  }

  /* Generate grid items */
  fun generateItems (count : Number) : Array(Html) {
    Array.range(1, count)
    |> Array.map(
      (i : Number) : Html {
        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem; border-radius: 8px; color: white; text-align: center; font-weight: 500; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
          "Item " + Number.toString(i)
        </div>
      })
  }

  /* Styles */
  style controlGroup {
    margin-bottom: 20px;
  }

  style label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 8px;
  }

  style input {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #dcdee0;
    border-radius: 8px;
    font-size: 14px;
    transition: all 0.2s ease;

    &:focus {
      outline: none;
      border-color: #1989fa;
      box-shadow: 0 0 0 2px rgba(25, 137, 250, 0.1);
    }
  }

  style rangeInput {
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background: #dcdee0;
    outline: none;
    -webkit-appearance: none;

    &::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: #1989fa;
      cursor: pointer;
      transition: all 0.2s ease;

      &:hover {
        transform: scale(1.2);
      }
    }

    &::-moz-range-thumb {
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: #1989fa;
      cursor: pointer;
      border: none;
      transition: all 0.2s ease;

      &:hover {
        transform: scale(1.2);
      }
    }
  }

  style hint {
    display: block;
    font-size: 12px;
    color: #969799;
    margin-top: 4px;
    font-style: italic;
  }

  fun render : Html {
    <ComponentShowcase
      title="Grid"
      description="Responsive CSS Grid layout component with mobile-first design and support for 12-column grid system"
      badge="Layout"
      previewContent={
        <Grid
          cols={cols}
          colsTablet={colsTablet}
          colsDesktop={colsDesktop}
          gap={gap}>
          {generateItems(itemCount)}
        </Grid>
      }
      controlsContent={
        <div>
          <Heading level="4" margin="0 0 16px">"Grid Configuration"</Heading>

          <div::controlGroup>
            <label::label>{getColsLabel()}</label>
            <input::input
              type="text"
              value={getCurrentCols()}
              placeholder="Ej: auto, 1-12, o número custom"
              onChange={handleColsChange}/>
            <small::hint>{getColsHint()}</small>
          </div>

          <div::controlGroup>
            <label::label>"Gap"</label>
            <input::input
              type="text"
              value={gap}
              placeholder="1rem, 20px, etc."
              onChange={handleGapChange}/>
          </div>

          <div::controlGroup>
            <label::label>
              "Item Count: " + Number.toString(itemCount)
            </label>
            <input::rangeInput
              type="range"
              value={Number.toString(itemCount)}
              min="1"
              max="24"
              step="1"
              onInput={(event : Html.Event) : Promise(Void) { handleItemCountChange(Dom.getValue(event.target)) }}/>
          </div>
        </div>
      }
      usageText="Grid is a powerful responsive layout component that uses CSS Grid. It supports mobile-first design with breakpoints for tablet, desktop, widescreen, and fullhd screens."
      codeExamples={
        [
          {
            title: "Auto Grid (Responsive)",
            description: "Automatically adjusts columns based on available space",
            snippet: {
              code:
                "<Grid cols=\"auto\" gap=\"1rem\">\n" +
                "  <div>\"Item 1\"</div>\n" +
                "  <div>\"Item 2\"</div>\n" +
                "  <div>\"Item 3\"</div>\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid cols="auto" gap="1rem">
                <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem; border-radius: 8px; color: white; text-align: center; font-weight: 500;">
                  "Item 1"
                </div>
                <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem; border-radius: 8px; color: white; text-align: center; font-weight: 500;">
                  "Item 2"
                </div>
                <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem; border-radius: 8px; color: white; text-align: center; font-weight: 500;">
                  "Item 3"
                </div>
              </Grid>,
            showReplay: false
          },
          {
            title: "Fixed 3 Columns",
            description: "Grid with exactly 3 columns",
            snippet: {
              code:
                "<Grid cols=\"3\" gap=\"1rem\">\n" +
                "  <div>\"Col 1\"</div>\n" +
                "  <div>\"Col 2\"</div>\n" +
                "  <div>\"Col 3\"</div>\n" +
                "  <div>\"Col 4\"</div>\n" +
                "  <div>\"Col 5\"</div>\n" +
                "  <div>\"Col 6\"</div>\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid cols="3" gap="1rem">
                {generateItems(6)}
              </Grid>,
            showReplay: false
          },
          {
            title: "Responsive Breakpoints",
            description: "Mobile-first: 1 col mobile, 2 tablet, 3 desktop",
            snippet: {
              code:
                "<Grid\n" +
                "  cols=\"1\"\n" +
                "  colsTablet=\"2\"\n" +
                "  colsDesktop=\"3\"\n" +
                "  gap=\"1rem\">\n" +
                "  <div>\"Item 1\"</div>\n" +
                "  <div>\"Item 2\"</div>\n" +
                "  <div>\"Item 3\"</div>\n" +
                "  <div>\"Item 4\"</div>\n" +
                "  <div>\"Item 5\"</div>\n" +
                "  <div>\"Item 6\"</div>\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid
                cols="1"
                colsTablet="2"
                colsDesktop="3"
                gap="1rem">
                {generateItems(6)}
              </Grid>,
            showReplay: false
          },
          {
            title: "12 Column Grid",
            description: "Maximum columns in the grid system",
            snippet: {
              code:
                "<Grid cols=\"12\" gap=\"0.5rem\">\n" +
                "  <div>\"1\"</div>\n" +
                "  <div>\"2\"</div>\n" +
                "  <div>\"3\"</div>\n" +
                "  ...\n" +
                "  <div>\"12\"</div>\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid cols="12" gap="0.5rem">
                {generateItems(12)}
              </Grid>,
            showReplay: false
          },
          {
            title: "Custom 20 Columns",
            description: "Grid supports any number beyond 12",
            snippet: {
              code:
                "<Grid cols=\"20\" gap=\"0.5rem\">\n" +
                "  {/* 20 items */}\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid cols="20" gap="0.5rem">
                {generateItems(20)}
              </Grid>,
            showReplay: false
          },
          {
            title: "Custom Gap",
            description: "Different row and column gaps",
            snippet: {
              code:
                "<Grid\n" +
                "  cols=\"4\"\n" +
                "  rowGap=\"2rem\"\n" +
                "  columnGap=\"0.5rem\">\n" +
                "  <div>\"Item 1\"</div>\n" +
                "  <div>\"Item 2\"</div>\n" +
                "  <div>\"Item 3\"</div>\n" +
                "  <div>\"Item 4\"</div>\n" +
                "</Grid>",
              language: "mint"
            },
            previewContent:
              <Grid
                cols="4"
                rowGap="2rem"
                columnGap="0.5rem">
                {generateItems(8)}
              </Grid>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "cols",
            description: "Number of columns (mobile-first). Supports: 'auto', '0'-'12', or any number/CSS value",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "colsTablet",
            description: "Columns for tablet (768px+)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "colsDesktop",
            description: "Columns for desktop (1024px+)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "colsWidescreen",
            description: "Columns for widescreen (1216px+)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "colsFullhd",
            description: "Columns for full HD (1408px+)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "gap",
            description: "Gap between grid items",
            type: "String",
            defaultValue: "\"1rem\""
          },
          {
            name: "rowGap",
            description: "Gap between rows (overrides gap)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "columnGap",
            description: "Gap between columns (overrides gap)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "justifyItems",
            description: "Align items horizontally within their grid area",
            type: "String",
            defaultValue: "\"stretch\""
          },
          {
            name: "alignItems",
            description: "Align items vertically within their grid area",
            type: "String",
            defaultValue: "\"stretch\""
          },
          {
            name: "justifyContent",
            description: "Align grid within container horizontally",
            type: "String",
            defaultValue: "\"start\""
          },
          {
            name: "alignContent",
            description: "Align grid within container vertically",
            type: "String",
            defaultValue: "\"start\""
          },
          {
            name: "autoFlow",
            description: "Grid auto-flow direction",
            type: "String",
            defaultValue: "\"row\""
          },
          {
            name: "autoRows",
            description: "Size of auto-generated rows",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "autoCols",
            description: "Size of auto-generated columns",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "width",
            description: "Grid container width",
            type: "String",
            defaultValue: "\"100%\""
          },
          {
            name: "height",
            description: "Grid container height",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "minHeight",
            description: "Minimum grid container height",
            type: "String",
            defaultValue: "\"auto\""
          },
          {
            name: "padding",
            description: "Grid container padding",
            type: "String",
            defaultValue: "\"0\""
          },
          {
            name: "margin",
            description: "Grid container margin",
            type: "String",
            defaultValue: "\"0\""
          },
          {
            name: "background",
            description: "Grid container background",
            type: "String",
            defaultValue: "\"transparent\""
          },
          {
            name: "border",
            description: "Grid container border",
            type: "String",
            defaultValue: "\"none\""
          },
          {
            name: "borderRadius",
            description: "Grid container border radius",
            type: "String",
            defaultValue: "\"0\""
          },
          {
            name: "boxShadow",
            description: "Grid container box shadow",
            type: "String",
            defaultValue: "\"none\""
          },
          {
            name: "className",
            description: "Additional CSS class name",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "children",
            description: "Grid items to display",
            type: "Array(Html)",
            defaultValue: "[]"
          }
        ]
      }/>
  }
}
