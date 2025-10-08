/* ContainerPage - Showcase for Container component */
component ContainerPage {
  connect NavigationStore exposing { setPage }

  /* State for component controls */
  state width : String = "1200px"

  state fluid : Bool = false
  state padding : String = ""

  fun componentDidMount : Promise(Void) {
    setPage("container")
  }

  /* Event handlers */
  fun handleWidthChange (event : Html.Event) : Promise(Void) {
    next { width: Dom.getValue(event.target) }
  }

  fun toggleFluid : Promise(Void) {
    next { fluid: !fluid }
  }

  fun handlePaddingChange (event : Html.Event) : Promise(Void) {
    next { padding: Dom.getValue(event.target) }
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div style="background: #f0f2f5; padding: 40px 0; min-height: 400px;">
      <Container
        width={width}
        fluid={fluid}
        padding={
          if String.isEmpty(padding) {
            ""
          } else {
            padding
          }
        }
      >
        <div::contentBox>
          <Heading level="3" margin="0 0 16px">"Container Content"</Heading>

          <Text margin="0 0 16px">
            "This content is centered within the container. "
            "Resize your browser to see how the container adapts to different screen sizes."
          </Text>

          <Text margin="0">
            <strong>"Current width: "</strong>

            {
              if fluid {
                "Fluid (100%)"
              } else {
                width
              }
            }
          </Text>
        </div>
      </Container>
    </div>
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <Heading level="4" margin="0 0 16px">"Container Controls"</Heading>

      <div::controlGroup>
        <Text size="sm" weight="semibold" color="#323233" margin="0 0 8px">
          "Width"
        </Text>

        <input::input
          type="text"
          value={width}
          placeholder="e.g. 1200px, 90%, 60rem"
          onInput={handleWidthChange}
        />

        <Text size="xs" color="#969799" margin="8px 0 0">
          "Use any CSS value: px, %, rem, vw, etc."
        </Text>
      </div>

      <div::controlGroup>
        <Text size="sm" weight="semibold" color="#323233" margin="0 0 8px">
          "Padding"
        </Text>

        <input::input
          type="text"
          value={padding}
          placeholder="Auto (16px mobile, 24px tablet, 32px desktop)"
          onInput={handlePaddingChange}
        />
      </div>

      <div::controlGroup>
        <Text size="sm" weight="semibold" color="#323233" margin="0 0 8px">
          "Options"
        </Text>

        <div::buttonGroup>
          <button::toggleButton(fluid)
            onClick={(e : Html.Event) : Promise(Void) { toggleFluid() }}
          >"Fluid (100%)"</button>
        </div>
      </div>
    </div>
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Container",
        description: "Default container with 1200px max-width",
        snippet:
          {
            code:
              "<Container>\n" + "  <Heading level=\"1\">\"Welcome\"</Heading>\n" + "  <Text>\"Your content here\"</Text>\n" + "</Container>",
            language: "mint"
          },
        previewContent:
          <div style="background: #f0f2f5; padding: 20px;">
            <Container>
              <div::demoBox>
                <Heading level="4" margin="0">"Default (1200px)"</Heading>
              </div>
            </Container>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Width",
        description: "Use any CSS value for width",
        snippet:
          {
            code:
              "<Container width=\"800px\">\n" + "  <Text>\"Narrow content\"</Text>\n" + "</Container>\n\n" + "<Container width=\"90%\">\n" + "  <Text>\"Responsive width\"</Text>\n" + "</Container>\n\n" + "<Container width=\"60rem\">\n" + "  <Text>\"Rem-based width\"</Text>\n" + "</Container>",
            language: "mint"
          },
        previewContent:
          <div
            style="background: #f0f2f5; padding: 20px; display: flex; flex-direction: column; gap: 16px;"
          >
            <Container width="800px"><div::demoBox>"800px"</div></Container>
            <Container width="90%"><div::demoBox>"90%"</div></Container>
            <Container width="60rem"><div::demoBox>"60rem"</div></Container>
          </div>,
        showReplay: false
      },
      {
        title: "Fluid Container",
        description: "Full width container (100%)",
        snippet:
          {
            code:
              "<Container fluid={true}>\n" + "  <Text>\"Full width content\"</Text>\n" + "</Container>",
            language: "mint"
          },
        previewContent:
          <div style="background: #f0f2f5; padding: 20px;">
            <Container fluid={true}><div::demoBox>"Fluid Container (100%)"</div></Container>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Padding",
        description: "Override default responsive padding",
        snippet:
          {
            code:
              "<Container padding=\"40px\">\n" + "  <Text>\"Custom padding\"</Text>\n" + "</Container>",
            language: "mint"
          },
        previewContent:
          <div style="background: #f0f2f5; padding: 20px;">
            <Container padding="40px"><div::demoBox>"40px padding"</div></Container>
          </div>,
        showReplay: false
      },
      {
        title: "In Navbar",
        description: "Common pattern for navigation",
        snippet:
          {
            code:
              "<nav style=\"background: #1989fa; padding: 16px 0;\">\n" + "  <Container>\n" + "    <Flex justify=\"space-between\" align=\"center\">\n" + "      <Text color=\"white\">\"Logo\"</Text>\n" + "      <Text color=\"white\">\"Menu\"</Text>\n" + "    </Flex>\n" + "  </Container>\n" + "</nav>",
            language: "mint"
          },
        previewContent:
          <nav style="background: #1989fa; padding: 16px 0;">
            <Container>
              <Flex justify="space-between" align="center">
                <Text color="white" weight="bold">"Logo"</Text>
                <Text color="white">"Menu"</Text>
              </Flex>
            </Container>
          </nav>,
        showReplay: false
      },
      {
        title: "In Section",
        description: "Content sections with consistent width",
        snippet:
          {
            code:
              "<section style=\"padding: 60px 0;\">\n" + "  <Container width=\"900px\">\n" + "    <Heading level=\"2\">\"Features\"</Heading>\n" + "    <Text>\"Feature description\"</Text>\n" + "  </Container>\n" + "</section>",
            language: "mint"
          },
        previewContent:
          <section style="padding: 40px 0; background: #f8f9fa;">
            <Container width="900px">
              <Heading level="3" margin="0 0 12px">"Features Section"</Heading>
              <Text margin="0">"This content is centered with 900px width"</Text>
            </Container>
          </section>,
        showReplay: false
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "width",
        description:
          "Container max-width. Any CSS value: 1200px, 90%, 60rem, 80vw, etc. Ignored if fluid=true",
        type: "String",
        defaultValue: "\"1200px\""
      },
      {
        name: "fluid",
        description: "Full width mode (100%). Removes max-width constraint",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "padding",
        description:
          "Horizontal padding override. Default: 16px mobile → 24px tablet → 32px desktop",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "children",
        description: "Container content",
        type: "Array(Html)",
        defaultValue: "[]"
      }
    ]
  }

  /* Styles */
  style contentBox {
    background: white;
    padding: 32px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    border: 2px dashed #1989fa;
  }

  style demoBox {
    background: white;
    padding: 20px;
    border-radius: 8px;
    text-align: center;
    font-weight: 600;
    color: #1989fa;
    border: 2px solid #e0e0e0;
  }

  style controlGroup {
    margin-bottom: 20px;
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style toggleButton (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      border: 2px solid #52c41a;
      background: #52c41a;
      color: #fff;
    } else {
      border: 2px solid #d9d9d9;
      background: #fff;
      color: #666;
    }

    &:hover {
      transform: translateY(-2px);
    }
  }

  style input {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    font-size: 14px;
    color: #323233;
    transition: all 0.2s ease;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #1989fa;
      box-shadow: 0 0 0 3px rgba(25, 137, 250, 0.1);
    }

    &::placeholder {
      color: #c8c9cc;
    }
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Container"
      description="Simple, responsive container that centers content. Accepts any CSS value for width. Mobile-first with automatic responsive padding."
      badge="Layout"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Container centers content with flexible width control. Use any CSS value (px, %, rem, vw). Auto-responsive padding: 16px mobile, 24px tablet, 32px desktop. Perfect for navbar, sections, hero, footer layouts."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      enabledTabs={["preview", "usage", "api"]}
    />
  }
}
