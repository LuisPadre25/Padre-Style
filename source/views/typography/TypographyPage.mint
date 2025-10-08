/* TypographyPage - Typography Components Showcase */
component TypographyPage {
  connect NavigationStore exposing { setPage }
  connect ViewModeStore exposing { viewMode }

  fun componentDidMount : Promise(Void) {
    setPage("typography")
  }

  /* State */
  state headingLevel : String = "1"

  state textSize : String = "base"
  state textWeight : String = "400"
  state textAlign : String = "left"
  state fontFamily : String = ""

  /* Event handlers */
  fun handleHeadingLevelChange (event : Html.Event) : Promise(Void) {
    next { headingLevel: Dom.getValue(event.target) }
  }

  fun handleTextSizeChange (event : Html.Event) : Promise(Void) {
    next { textSize: Dom.getValue(event.target) }
  }

  fun handleTextWeightChange (event : Html.Event) : Promise(Void) {
    next { textWeight: Dom.getValue(event.target) }
  }

  fun handleTextAlignChange (event : Html.Event) : Promise(Void) {
    next { textAlign: Dom.getValue(event.target) }
  }

  fun handleFontFamilyChange (event : Html.Event) : Promise(Void) {
    next { fontFamily: Dom.getValue(event.target) }
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
      box-shadow: 0 0 0 2px rgba(96, 165, 250, 0.1);
    }
  }

  style demoContainer {
    padding: 2rem;
    background: var(--bg-color);
    border-radius: 12px;
    border: 1px solid var(--border-color);
  }

  fun render : Html {
    <ComponentShowcase
      title="Typography"
      description="Flexible typography components for headings, body text, and captions with theme support"
      badge="Typography"
      previewContent={
        <div style="width: 100%; padding: 20px;">
          <Heading
            level={headingLevel}
            align={textAlign}
            fontFamily={fontFamily}
          >"This is a Heading"</Heading>

          <Text
            size={textSize}
            weight={textWeight}
            align={textAlign}
            margin="16px 0"
            fontFamily={fontFamily}
          >
            "This is body text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
          </Text>

          <Caption align={textAlign} fontFamily={fontFamily}>
            "This is a caption or small text"
          </Caption>
        </div>
      }
      controlsContent={
        <div>
          <div::controlGroup>
            <label::label>"Heading Level"</label>

            <select::select
              value={headingLevel}
              onChange={handleHeadingLevelChange}
            >
              <option value="1">"H1 (34px)"</option>
              <option value="2">"H2 (28px)"</option>
              <option value="3">"H3 (24px)"</option>
              <option value="4">"H4 (20px)"</option>
              <option value="5">"H5 (18px)"</option>
              <option value="6">"H6 (16px)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Text Size"</label>

            <select::select value={textSize} onChange={handleTextSizeChange}>
              <option value="xs">"XS (12px)"</option>
              <option value="sm">"SM (14px)"</option>
              <option value="base">"Base (16px)"</option>
              <option value="lg">"LG (18px)"</option>
              <option value="xl">"XL (20px)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Font Weight"</label>

            <select::select value={textWeight} onChange={handleTextWeightChange}>
              <option value="300">"Light (300)"</option>
              <option value="400">"Regular (400)"</option>
              <option value="500">"Medium (500)"</option>
              <option value="600">"Semibold (600)"</option>
              <option value="700">"Bold (700)"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Text Align"</label>

            <select::select value={textAlign} onChange={handleTextAlignChange}>
              <option value="left">"Left"</option>
              <option value="center">"Center"</option>
              <option value="right">"Right"</option>
              <option value="justify">"Justify"</option>
            </select>
          </div>

          <div::controlGroup>
            <label::label>"Font Family"</label>

            <select::select value={fontFamily} onChange={handleFontFamilyChange}>
              <option value="">"Default (Sans-serif)"</option>
              <option value="var(--font-serif)">"Serif"</option>
              <option value="var(--font-mono)">"Monospace"</option>
              <option value="Georgia, serif">"Georgia"</option>
              <option value="'Times New Roman', serif">"Times New Roman"</option>
              <option value="'Courier New', monospace">"Courier New"</option>
              <option value="Arial, sans-serif">"Arial"</option>
              <option value="Verdana, sans-serif">"Verdana"</option>
            </select>
          </div>
        </div>
      }
      usageText="Typography components provide consistent text styling across your application with automatic theme support."
      codeExamples={
        [
          {
            title: "Headings",
            description: "Different heading levels",
            snippet:
              {
                code:
                  "<Heading level=\"1\">Main Title</Heading>\n" + "<Heading level=\"2\">Section Title</Heading>\n" + "<Heading level=\"3\" color=\"#60A5FA\">Colored Heading</Heading>",
                language: "mint"
              },
            previewContent:
              <div::demoContainer>
                <Heading level="1">"Main Title"</Heading>
                <Heading level="2">"Section Title"</Heading>
                <Heading level="3" color="#60A5FA">"Colored Heading"</Heading>
              </div>,
            showReplay: false
          },
          {
            title: "Body Text",
            description: "Different text sizes and weights",
            snippet:
              {
                code:
                  "<Text size=\"lg\" weight=\"600\">Large bold text</Text>\n" + "<Text size=\"base\">Regular body text</Text>\n" + "<Text size=\"sm\" color=\"#60A5FA\">Small colored text</Text>",
                language: "mint"
              },
            previewContent:
              <div::demoContainer>
                <Text size="lg" weight="600">"Large bold text"</Text>
                <Text size="base" margin="8px 0">"Regular body text"</Text>
                <Text size="sm" color="#60A5FA">"Small colored text"</Text>
              </div>,
            showReplay: false
          },
          {
            title: "Captions",
            description: "Small text for labels and hints",
            snippet:
              {
                code:
                  "<Caption>Default caption</Caption>\n" + "<Caption weight=\"600\">Bold caption</Caption>\n" + "<Caption align=\"center\">Centered caption</Caption>",
                language: "mint"
              },
            previewContent:
              <div::demoContainer>
                <Caption>"Default caption"</Caption>
                <Caption weight="600" margin="8px 0">"Bold caption"</Caption>
                <Caption align="center">"Centered caption"</Caption>
              </div>,
            showReplay: false
          },
          {
            title: "Font Families",
            description: "Different font families for varied styles",
            snippet:
              {
                code:
                  "<Heading level=\"2\" fontFamily=\"var(--font-serif)\">Serif Heading</Heading>\n" + "<Text fontFamily=\"var(--font-mono)\">Monospace text for code</Text>\n" + "<Text fontFamily=\"Georgia, serif\">Georgia serif text</Text>",
                language: "mint"
              },
            previewContent:
              <div::demoContainer>
                <Heading level="2" fontFamily="var(--font-serif)">
                  "Serif Heading"
                </Heading>

                <Text fontFamily="var(--font-mono)" margin="12px 0">
                  "Monospace text for code"
                </Text>

                <Text fontFamily="Georgia, serif">"Georgia serif text"</Text>
              </div>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "Heading Properties",
            description: "",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "level",
            description: "Heading level (1-6)",
            type: "String",
            defaultValue: "\"1\""
          },
          {
            name: "color",
            description: "Text color (CSS color or empty for theme default)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "weight",
            description: "Font weight (300-700)",
            type: "String",
            defaultValue: "\"600\""
          },
          {
            name: "align",
            description: "Text alignment (left, center, right, justify)",
            type: "String",
            defaultValue: "\"left\""
          },
          {
            name: "fontFamily",
            description:
              "Font family (CSS font-family or empty for theme default)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "Text Properties",
            description: "",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "size",
            description: "Text size (xs, sm, base, lg, xl)",
            type: "String",
            defaultValue: "\"base\""
          },
          {
            name: "color",
            description: "Text color (CSS color or empty for theme default)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "weight",
            description: "Font weight (300-700)",
            type: "String",
            defaultValue: "\"400\""
          },
          {
            name: "lineHeight",
            description: "Line height",
            type: "String",
            defaultValue: "\"1.6\""
          },
          {
            name: "fontFamily",
            description:
              "Font family (CSS font-family or empty for theme default)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "Caption Properties",
            description: "",
            type: "Component",
            defaultValue: ""
          },
          {
            name: "color",
            description: "Text color (defaults to muted theme color)",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "weight",
            description: "Font weight (300-700)",
            type: "String",
            defaultValue: "\"400\""
          },
          {
            name: "fontFamily",
            description:
              "Font family (CSS font-family or empty for theme default)",
            type: "String",
            defaultValue: "\"\""
          }
        ]
      }
    />
  }
}
