/* HeroPage - Documentation page for Hero component */
component HeroPage {
  connect ThemeStore exposing { theme }

  /* State for preview controls */
  state selectedSize : String = "medium"
  state selectedVariant : String = "primary"
  state textAlign : String = "center"
  state withImage : Bool = false
  state withOverlay : Bool = false

  /* Handle control changes */
  fun handleSizeChange (newSize : String) : Promise(Void) {
    next { selectedSize: newSize }
  }

  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { selectedVariant: newVariant }
  }

  fun handleAlignChange (newAlign : String) : Promise(Void) {
    next { textAlign: newAlign }
  }

  fun toggleImage : Promise(Void) {
    next { withImage: !withImage }
  }

  fun toggleOverlay : Promise(Void) {
    next { withOverlay: !withOverlay }
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

  style demoButton (variant : String) {
    padding: 14px 32px;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    border: 2px solid white;
    background: transparent;
    color: white;
    cursor: pointer;
    transition: all 0.2s ease;
    min-height: 48px;

    if variant == "solid" {
      background: white;
      color: #1989fa;
      border-color: white;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    @media (max-width: 640px) {
      width: 100%;
      padding: 12px 24px;
      font-size: 14px;
    }
  }

  /* Preview content */
  fun getPreviewContent : Html {
    <Hero
      title="Welcome to Padre Style"
      subtitle="A modern component library built with Mint"
      size={selectedSize}
      variant={selectedVariant}
      textAlign={textAlign}
      bgImage={
        if withImage {
          "https://images.unsplash.com/photo-1557683316-973673baf926?w=1200"
        } else {
          ""
        }
      }
      overlay={withOverlay}
    >
      <button::demoButton("solid")>"Get Started"</button>
      <button::demoButton("outline")>"Learn More"</button>
    </Hero>
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

            <button::button(selectedSize == "fullheight")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleSizeChange("fullheight")
                }
              }
            >"Full Height"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Variant"</span>

          <div::buttonGroup>
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

            <button::button(selectedVariant == "danger")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("danger")
                }
              }
            >"Danger"</button>

            <button::button(selectedVariant == "dark")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("dark")
                }
              }
            >"Dark"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Text Align"</span>

          <div::buttonGroup>
            <button::button(textAlign == "left")
              onClick={
                (e : Html.Event) : Promise(Void) { handleAlignChange("left") }
              }
            >"Left"</button>

            <button::button(textAlign == "center")
              onClick={
                (e : Html.Event) : Promise(Void) { handleAlignChange("center") }
              }
            >"Center"</button>

            <button::button(textAlign == "right")
              onClick={
                (e : Html.Event) : Promise(Void) { handleAlignChange("right") }
              }
            >"Right"</button>
          </div>
        </div>

        <div::controlGroup>
          <span::controlLabel>"Options"</span>

          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={withImage}
                onChange={(e : Html.Event) : Promise(Void) { toggleImage() }}
              />

              "Background Image"
            </label>

            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={withOverlay}
                onChange={(e : Html.Event) : Promise(Void) { toggleOverlay() }}
              />

              "Dark Overlay"
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
        title: "Basic Hero",
        description: "Simple hero with title and subtitle",
        snippet:
          {
            code:
              "/* Basic Hero */\n" + "<Hero\n" + "  title=\"Welcome to Our App\"\n" + "  subtitle=\"Build amazing things with our components\"\n" + "  variant=\"primary\"\n" + "  size=\"medium\"\n" + "/>",
            language: "mint"
          },
        previewContent:
          <Hero
            title="Welcome to Our App"
            subtitle="Build amazing things with our components"
            variant="primary"
            size="small"
          />,
        showReplay: false
      },
      {
        title: "Hero with Buttons",
        description: "Hero section with call-to-action buttons",
        snippet:
          {
            code:
              "/* Hero with CTA buttons */\n" + "<Hero\n" + "  title=\"Start Your Journey\"\n" + "  subtitle=\"Join thousands of users already building\"\n" + "  variant=\"success\"\n" + "  size=\"medium\"\n" + ">\n" + "  <button>\"Get Started\"</button>\n" + "  <button>\"Learn More\"</button>\n" + "</Hero>",
            language: "mint"
          },
        previewContent:
          <Hero
            title="Start Your Journey"
            subtitle="Join thousands of users already building"
            variant="success"
            size="small"
          >
            <button::demoButton("solid")>"Get Started"</button>
            <button::demoButton("outline")>"Learn More"</button>
          </Hero>,
        showReplay: false
      },
      {
        title: "Hero Sizes",
        description: "Available hero sizes: small, medium, large, fullheight",
        snippet:
          {
            code:
              "/* Small Hero */\n" + "<Hero title=\"Small Hero\" size=\"small\"/>\n\n" + "/* Medium Hero (default) */\n" + "<Hero title=\"Medium Hero\" size=\"medium\"/>\n\n" + "/* Large Hero */\n" + "<Hero title=\"Large Hero\" size=\"large\"/>\n\n" + "/* Full Height Hero */\n" + "<Hero title=\"Full Height\" size=\"fullheight\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 16px;">
            <Hero title="Small Hero" size="small" variant="info"/>
            <Hero title="Medium Hero" size="small" variant="secondary"/>
          </div>,
        showReplay: false
      },
      {
        title: "Hero Variants",
        description: "All available color variants",
        snippet:
          {
            code:
              "/* Color Variants */\n" + "<Hero title=\"Primary\" variant=\"primary\"/>\n" + "<Hero title=\"Success\" variant=\"success\"/>\n" + "<Hero title=\"Warning\" variant=\"warning\"/>\n" + "<Hero title=\"Danger\" variant=\"danger\"/>\n" + "<Hero title=\"Dark\" variant=\"dark\"/>",
            language: "mint"
          },
        previewContent:
          <div style="display: flex; flex-direction: column; gap: 16px;">
            <Hero title="Primary Hero" size="small" variant="primary"/>
            <Hero title="Success Hero" size="small" variant="success"/>
            <Hero title="Danger Hero" size="small" variant="danger"/>
          </div>,
        showReplay: false
      },
      {
        title: "Hero with Background Image",
        description: "Hero with background image and overlay",
        snippet:
          {
            code:
              "/* Hero with background image */\n" + "<Hero\n" + "  title=\"Beautiful Backgrounds\"\n" + "  subtitle=\"Add stunning images to your hero sections\"\n" + "  bgImage=\"https://images.unsplash.com/photo-1557683316-973673baf926\"\n" + "  overlay={true}\n" + "  size=\"large\"\n" + ">\n" + "  <button>\"Explore\"</button>\n" + "</Hero>",
            language: "mint"
          },
        previewContent:
          <Hero
            title="Beautiful Backgrounds"
            subtitle="Add stunning images to your hero sections"
            bgImage="https://images.unsplash.com/photo-1557683316-973673baf926?w=800"
            overlay={true}
            size="small"
          >
            <button::demoButton("solid")>"Explore"</button>
          </Hero>,
        showReplay: false
      },
      {
        title: "Left Aligned Hero",
        description: "Hero with left-aligned text",
        snippet:
          {
            code:
              "/* Left aligned hero */\n" + "<Hero\n" + "  title=\"Tell Your Story\"\n" + "  subtitle=\"Create compelling narratives with left-aligned content\"\n" + "  textAlign=\"left\"\n" + "  variant=\"secondary\"\n" + ">\n" + "  <button>\"Start Writing\"</button>\n" + "</Hero>",
            language: "mint"
          },
        previewContent:
          <Hero
            title="Tell Your Story"
            subtitle="Create compelling narratives with left-aligned content"
            textAlign="left"
            variant="secondary"
            size="small"
          >
            <button::demoButton("solid")>"Start Writing"</button>
          </Hero>,
        showReplay: false
      }
    ]
  }

  /* API Properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "title",
        description: "Hero title text. Displayed as large heading (h1).",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "subtitle",
        description:
          "Hero subtitle text. Displayed below title with lower emphasis.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "children",
        description:
          "Content to display below subtitle (buttons, links, etc.). Rendered in flex layout with gap.",
        type: "Array(Html)",
        defaultValue: "[]"
      },
      {
        name: "size",
        description:
          "Hero section size. Options: small (48px padding), medium (96px), large (144px), fullheight (100vh min-height). Responsive on mobile.",
        type: "String",
        defaultValue: "\"medium\""
      },
      {
        name: "variant",
        description:
          "Color variant. Options: primary, success, warning, danger, error, info, secondary, dark, light. Sets background and text colors.",
        type: "String",
        defaultValue: "\"primary\""
      },
      {
        name: "bgImage",
        description:
          "Background image URL. Sets image with cover sizing and center positioning. Works with overlay option.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "overlay",
        description:
          "Adds dark overlay (rgba(0,0,0,0.5)) over background image. Only applies when bgImage is set. Improves text readability.",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "textAlign",
        description:
          "Text alignment. Options: left, center, right. Also aligns action buttons accordingly.",
        type: "String",
        defaultValue: "\"center\""
      },
      {
        name: "bgColor",
        description:
          "Custom background color. Overrides variant color. Use hex codes (#FF5733) or CSS color names.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "textColor",
        description:
          "Custom text color. Overrides variant text color. Use hex codes or CSS color names.",
        type: "String",
        defaultValue: "\"\""
      }
    ]
  }

  /* Render */
  fun render : Html {
    <div>
      <ComponentShowcase
        title="Hero Component"
        description="Large hero section component for landing pages and feature highlights. Inspired by Bulma's hero component with flexible sizing, color variants, and background images."
        badge="Layout"
        previewContent={getPreviewContent()}
        controlsContent={getControlsContent()}
        usageText="The Hero component creates impactful landing sections with titles, subtitles, and call-to-action buttons. Features multiple sizes from compact to full viewport height, color variants, background images with overlay support, and responsive text alignment. Perfect for page headers, feature highlights, and attention-grabbing sections."
        codeExamples={getCodeExamples()}
        apiProperties={getApiProperties()}
        enabledTabs={["preview", "usage", "api"]}
      />
    </div>
  }
}
