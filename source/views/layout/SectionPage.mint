/* SectionPage - Documentation page for Section component */
component SectionPage {
  connect ThemeStore exposing { theme }

  /* State for preview controls */
  state selectedSize : String = "medium"

  state selectedVariant : String = "default"
  state bordered : Bool = false

  /* Handle control changes */
  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { selectedSize: newSize }
  }

  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { selectedVariant: newVariant }
  }

  fun toggleBordered : Promise(Void) {
    next { bordered: !bordered }
  }

  /* Styles for controls */
  style controlsGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-bottom: 24px;

    @media (max-width: 640px) {
      grid-template-columns: 1fr;
      gap: 12px;
    }
  }

  style controlGroup {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  style controlLabel {
    font-size: 13px;
    font-weight: 600;
    color: #374151;

    @media (max-width: 640px) {
      font-size: 12px;
    }
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 500;
    border: 1px solid #e5e7eb;
    background: white;
    color: #374151;
    cursor: pointer;
    transition: all 0.2s ease;
    min-height: 44px;

    if active {
      background: #1989fa;
      color: white;
      border-color: #1989fa;
    }

    &:hover {
      if !active {
        background: #f9fafb;
        border-color: #d1d5db;
      }
    }

    @media (max-width: 640px) {
      font-size: 12px;
      padding: 6px 12px;
    }
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    user-select: none;
    font-size: 13px;
    color: #374151;
    min-height: 44px;

    @media (max-width: 640px) {
      font-size: 12px;
    }
  }

  style checkbox {
    width: 20px;
    height: 20px;
    cursor: pointer;

    @media (max-width: 640px) {
      width: 24px;
      height: 24px;
    }
  }

  style demoContent {
    padding: 20px;
    background: white;
    border-radius: 8px;
    border: 2px dashed #e5e7eb;
  }

  /* Preview content */
  fun getPreviewContent : Html {
    <div>
      <Section
        title="This is a Section"
        subtitle="A simple container to divide your page into sections"
        size={selectedSize}
        variant={selectedVariant}
        bordered={bordered}
      >
        <div::demoContent>
          <Text color="#6b7280">
            "This is the content inside the section. You can put any HTML elements here like text, images, buttons, cards, and more. Sections help organize your page into logical parts with optional titles, subtitles, and background colors."
          </Text>
        </div>
      </Section>
    </div>
  }

  /* Controls content */
  fun getControlsContent : Html {
    <div>
      <div::controlsGrid>
        <div::controlGroup>
          <span::controlLabel>"Size"</span>

          <div::buttonGroup>
            <button::button(selectedSize == "small")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("small") }
              }
            >"Small"</button>

            <button::button(selectedSize == "medium")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("medium") }
              }
            >"Medium"</button>

            <button::button(selectedSize == "large")
              onClick={
                (e : Html.Event) : Promise(Void) { handleSizeChange("large") }
              }
            >"Large"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Variant"</span>

          <div::buttonGroup>
            <button::button(selectedVariant == "default")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("default")
                }
              }
            >"Default"</button>

            <button::button(selectedVariant == "light")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("light")
                }
              }
            >"Light"</button>

            <button::button(selectedVariant == "primary")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("primary")
                }
              }
            >"Primary"</button>

            <button::button(selectedVariant == "success")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("success")
                }
              }
            >"Success"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Options"</span>

          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={bordered}
                onChange={(e : Html.Event) : Promise(Void) { toggleBordered() }}
              />

              "Bordered"
            </label>
          </div>
        </div>
      </div>
    </div>
  }

  /* Code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Section",
        description: "Simple section with title and content",
        snippet:
          {
            code:
              "/* Basic Section */\n" + "<Section\n" + "  title=\"Welcome\"\n" + "  subtitle=\"Getting started with sections\"\n" + ">\n" + "  <p>\"Your content here\"</p>\n" + "</Section>",
            language: "mint"
          },
        previewContent:
          <Section
            title="Welcome"
            subtitle="Getting started with sections"
            size="small"
          >
            <div::demoContent><Text color="#6b7280">"Your content here"</Text></div>
          </Section>,
        showReplay: false
      },
      {
        title: "Section Sizes",
        description: "Available sizes: small, medium, large",
        snippet:
          {
            code:
              "/* Small Section */\n" + "<Section title=\"Small\" size=\"small\">\n" + "  <p>\"Content\"</p>\n" + "</Section>\n\n" + "/* Medium Section (default) */\n" + "<Section title=\"Medium\" size=\"medium\">\n" + "  <p>\"Content\"</p>\n" + "</Section>\n\n" + "/* Large Section */\n" + "<Section title=\"Large\" size=\"large\">\n" + "  <p>\"Content\"</p>\n" + "</Section>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 0;">
            <Section title="Small Section" size="small">
              <div::demoContent><Text color="#6b7280">"Less padding"</Text></div>
            </Section>

            <Section title="Medium Section" size="small">
              <div::demoContent><Text color="#6b7280">"Default padding"</Text></div>
            </Section>
          </div>,
        showReplay: false
      },
      {
        title: "Section Variants",
        description: "Background color variants",
        snippet:
          {
            code:
              "/* Color Variants */\n" + "<Section variant=\"light\">...</Section>\n" + "<Section variant=\"primary\">...</Section>\n" + "<Section variant=\"success\">...</Section>\n" + "<Section variant=\"warning\">...</Section>\n" + "<Section variant=\"danger\">...</Section>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 0;">
            <Section title="Primary Section" variant="primary" size="small">
              <div::demoContent>
                <Text color="#6b7280">"Light blue background"</Text>
              </div>
            </Section>

            <Section title="Success Section" variant="success" size="small">
              <div::demoContent>
                <Text color="#6b7280">"Light green background"</Text>
              </div>
            </Section>

            <Section title="Light Section" variant="light" size="small">
              <div::demoContent>
                <Text color="#6b7280">"Light gray background"</Text>
              </div>
            </Section>
          </div>,
        showReplay: false
      },
      {
        title: "Bordered Section",
        description: "Section with top and bottom borders",
        snippet:
          {
            code:
              "/* Bordered Section */\n" + "<Section\n" + "  title=\"Bordered Section\"\n" + "  bordered={true}\n" + ">\n" + "  <p>\"Content with borders\"</p>\n" + "</Section>",
            language: "mint"
          },
        previewContent:
          <Section
            title="Bordered Section"
            subtitle="With top and bottom borders"
            bordered={true}
            size="small"
          >
            <div::demoContent>
              <Text color="#6b7280">"This section has borders on top and bottom"</Text>
            </div>
          </Section>,
        showReplay: false
      },
      {
        title: "Multiple Sections",
        description: "Stacking sections to divide page content",
        snippet:
          {
            code:
              "/* Multiple Sections */\n" + "<Section title=\"Features\" variant=\"light\">\n" + "  <p>\"Feature list here\"</p>\n" + "</Section>\n\n" + "<Section title=\"Pricing\" variant=\"primary\">\n" + "  <p>\"Pricing tables here\"</p>\n" + "</Section>\n\n" + "<Section title=\"Contact\" variant=\"success\">\n" + "  <p>\"Contact form here\"</p>\n" + "</Section>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 0;">
            <Section title="Features" variant="light" size="small">
              <div::demoContent><Text color="#6b7280">"Feature list here"</Text></div>
            </Section>

            <Section title="Pricing" variant="primary" size="small">
              <div::demoContent>
                <Text color="#6b7280">"Pricing tables here"</Text>
              </div>
            </Section>

            <Section title="Contact" variant="success" size="small">
              <div::demoContent><Text color="#6b7280">"Contact form here"</Text></div>
            </Section>
          </div>,
        showReplay: false
      },
      {
        title: "Custom Max Width",
        description: "Control section content width",
        snippet:
          {
            code:
              "/* Custom Max Width */\n" + "<Section\n" + "  title=\"Narrow Section\"\n" + "  maxWidth=\"800px\"\n" + ">\n" + "  <p>\"Narrower content area\"</p>\n" + "</Section>",
            language: "mint"
          },
        previewContent:
          <Section
            title="Narrow Section"
            subtitle="Max width set to 800px"
            maxWidth="800px"
            size="small"
          >
            <div::demoContent>
              <Text color="#6b7280">
                "This section has a custom maximum width of 800px instead of the default 1200px"
              </Text>
            </div>
          </Section>,
        showReplay: false
      }
    ]
  }

  /* API Properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "children",
        description:
          "Content to display inside the section. Can be any HTML elements like text, images, cards, forms, etc.",
        type: "Array(Html)",
        defaultValue: "[]"
      },
      {
        name: "title",
        description:
          "Section title displayed at the top. Rendered as h2 heading with large font size. Optional.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "subtitle",
        description:
          "Section subtitle displayed below title. Provides additional context. Smaller font with reduced opacity.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "size",
        description:
          "Section padding size. Options: small (32px), medium (64px), large (96px). Automatically reduces on mobile devices.",
        type: "String",
        defaultValue: "\"medium\""
      },
      {
        name: "maxWidth",
        description:
          "Maximum width of section content. Passed to internal Container component. Default 1200px. Use \"800px\", \"90%\", etc. Content is automatically centered with responsive padding.",
        type: "String",
        defaultValue: "\"1200px\""
      },
      {
        name: "bgColor",
        description:
          "Custom background color. Overrides variant colors. Use hex codes (#F3F4F6) or CSS color names (lightgray).",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "variant",
        description:
          "Background color variant. Options: default (transparent), light (gray), primary (blue tint), success (green tint), warning (yellow tint), danger (red tint), info (blue), dark (dark gray with white text).",
        type: "String",
        defaultValue: "\"default\""
      },
      {
        name: "bordered",
        description:
          "Adds subtle top and bottom borders. Creates visual separation between sections. Border color: #e5e7eb.",
        type: "Bool",
        defaultValue: "false"
      }
    ]
  }

  /* Render */
  fun render : Html {
    <div>
      <ComponentShowcase
        title="Section Component"
        description="A simple container to divide your page into sections, like the one you're currently reading. Perfect for organizing content into logical parts with optional titles, backgrounds, and spacing."
        badge="Layout"
        previewContent={getPreviewContent()}
        controlsContent={getControlsContent()}
        usageText="The Section component helps structure your pages by creating distinct content areas with consistent spacing and styling. Each section can have a title and subtitle, customizable padding (small/medium/large), background colors, and borders. Sections are fully responsive and automatically adjust padding on mobile devices. Stack multiple sections to create well-organized page layouts."
        codeExamples={getCodeExamples()}
        apiProperties={getApiProperties()}
        enabledTabs={["preview", "usage", "api"]}
      />
    </div>
  }
}
