/* NavBarPage - Documentation page for NavBar component */
component NavBarPage {
  connect ThemeStore exposing { theme }
  connect ViewModeStore exposing { viewMode }

  /* State for preview controls */
  state selectedVariant : String = "light"

  /* Handle control changes */
  fun handleVariantChange (newVariant : String) : Promise(Void) {
    next { selectedVariant: newVariant }
  }

  /* Sample menu items */
  fun getSampleMenuItems : Array(NavItem) {
    [
      { label: "Home", href: "/", active: true },
      { label: "Products", href: "/products", active: false },
      { label: "About", href: "/about", active: false },
      { label: "Blog", href: "/blog", active: false },
      { label: "Contact", href: "/contact", active: false }
    ]
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
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
    border: none;

    if variant == "primary" {
      background-color: #1989fa;
      color: white;

      &:hover {
        background-color: #1677d9;
      }
    }

    else if variant == "outline" {
      background-color: transparent;
      color: #1989fa;
      border: 2px solid #1989fa;

      &:hover {
        background-color: #f0f9ff;
      }
    }

    else {
      background-color: #f9fafb;
      color: #374151;
      border: 1px solid #e5e7eb;

      &:hover {
        background-color: #f3f4f6;
      }
    }
  }

  /* Styles for realistic preview - NavBar at top, full width */
  style previewWrapper {
    position: relative;
    width: 100%;
    min-height: 100%;
    display: flex;
    flex-direction: column;
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    overflow: hidden;
    isolation: isolate;
  }

  style pageContent {
    flex: 1;
    padding: 40px 20px;
    text-align: center;
    color: #374151;
  }

  /* Preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      <div
        style="position: relative; width: 100%; flex: 1; display: flex; flex-direction: column;"
      >
        <NavBar
          logoText="MyBrand"
          menuItems={getSampleMenuItems()}
          variant={selectedVariant}
          fluid={true}
        >
          <button::demoButton("outline")>"Sign In"</button>
          <button::demoButton("primary")>"Sign Up"</button>
        </NavBar>

        <div::pageContent>
          <Heading level="3" margin="0 0 16px">"Page Content"</Heading>
          <Text margin="0" size="sm">"This simulates content below the NavBar"</Text>
        </div>
      </div>
    </div>
  }

  /* Controls content */
  fun getControlsContent : Html {
    <div>
      <div::controlsGrid>
        <div::controlGroup>
          <span::controlLabel>"Variant"</span>

          <div::buttonGroup>
            <button::button(selectedVariant == "light")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("light")
                }
              }
            >"Light"</button>

            <button::button(selectedVariant == "dark")
              onClick={
                (e : Html.Event) : Promise(Void) { handleVariantChange("dark") }
              }
            >"Dark"</button>

            <button::button(selectedVariant == "primary")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("primary")
                }
              }
            >"Primary"</button>

            <button::button(selectedVariant == "transparent")
              onClick={
                (e : Html.Event) : Promise(Void) {
                  handleVariantChange("transparent")
                }
              }
            >"Transparent"</button>
          </div>
        </div>
      </div>
    </div>
  }

  /* Code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic NavBar",
        description: "Simple navigation bar with menu items",
        snippet:
          {
            code:
              "<NavBar\n" + "  logoText=\"MyBrand\"\n" + "  menuItems={getMenuItems()}\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div::previewWrapper>
            <div
              style="position: relative; width: 100%; flex: 1; display: flex; flex-direction: column;"
            >
              <NavBar
                logoText="MyBrand"
                menuItems={getSampleMenuItems()}
                variant="light"
                fluid={true}
              />

              <div::pageContent><Text>"Light variant"</Text></div>
            </div>
          </div>,
        showReplay: false
      },
      {
        title: "Dark NavBar",
        description: "Navigation bar with dark variant",
        snippet:
          {
            code:
              "<NavBar\n" + "  logoText=\"MyApp\"\n" + "  menuItems={getMenuItems()}\n" + "  variant=\"dark\"\n" + "/>",
            language: "mint"
          },
        previewContent:
          <div::previewWrapper>
            <div
              style="position: relative; width: 100%; flex: 1; display: flex; flex-direction: column;"
            >
              <NavBar
                logoText="MyApp"
                menuItems={getSampleMenuItems()}
                variant="dark"
                fluid={true}
              />

              <div::pageContent><Text>"Dark variant"</Text></div>
            </div>
          </div>,
        showReplay: false
      },
      {
        title: "NavBar with Actions",
        description: "NavBar with action buttons",
        snippet:
          {
            code:
              "<NavBar\n" + "  logoText=\"MyBrand\"\n" + "  menuItems={getMenuItems()}\n" + ">\n" + "  <button>\"Sign In\"</button>\n" + "  <button>\"Sign Up\"</button>\n" + "</NavBar>",
            language: "mint"
          },
        previewContent:
          <div::previewWrapper>
            <div
              style="position: relative; width: 100%; flex: 1; display: flex; flex-direction: column;"
            >
              <NavBar
                logoText="MyBrand"
                menuItems={getSampleMenuItems()}
                variant="light"
                fluid={true}
              >
                <button::demoButton("outline")>"Sign In"</button>
                <button::demoButton("primary")>"Sign Up"</button>
              </NavBar>

              <div::pageContent><Text>"With action buttons"</Text></div>
            </div>
          </div>,
        showReplay: false
      }
    ]
  }

  /* API Properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "logo",
        description:
          "Custom logo component (image, icon, SVG, etc.). If provided, logoText is ignored.",
        type: "Html",
        defaultValue: "<></>"
      },
      {
        name: "logoText",
        description:
          "Text-based logo. Displayed as heading. Used when logo prop is not provided.",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "menuItems",
        description:
          "Navigation menu items. Array of { label, href, active }. Shows horizontally on desktop (≥768px), in drawer on mobile/tablet.",
        type: "Array(NavItem)",
        defaultValue: "[]"
      },
      {
        name: "children",
        description:
          "Action buttons or content (sign in, sign up, etc.). Shown in desktop right side and mobile drawer bottom. Supports multiple elements.",
        type: "Array(Html)",
        defaultValue: "[]"
      },
      {
        name: "variant",
        description:
          "Color variant. Options: light (white bg, dark text), dark (dark bg, white text), primary (brand color bg), transparent (no bg).",
        type: "String",
        defaultValue: "\"light\""
      },
      {
        name: "height",
        description:
          "NavBar height in CSS units. Default 64px provides good touch targets.",
        type: "String",
        defaultValue: "\"64px\""
      },
      {
        name: "fluid",
        description:
          "Make container fluid (100% width). When true, container expands to full width.",
        type: "Bool",
        defaultValue: "false"
      }
    ]
  }

  /* Render */
  fun render : Html {
    <div>
      <ComponentShowcase
        title="NavBar Component"
        description="Responsive navigation bar with mobile-first design. Features hamburger menu and slide-out drawer for mobile/tablet (< 1024px), horizontal menu for desktop (≥ 1024px). Supports multiple variants, positioning options, and action buttons. Built with Icon component integration and Container for responsive padding."
        badge="Navigation"
        previewContent={getPreviewContent()}
        controlsContent={getControlsContent()}
        usageText="The NavBar component provides a flexible, responsive navigation solution. On mobile and tablet devices, it displays a hamburger menu that opens a slide-out drawer from the right. On desktop, it automatically switches to a horizontal layout with centered menu items. Supports custom logos (text or component), menu items with active states, variant colors, positioning modes (sticky, fixed, relative), and action buttons. Perfect for app headers, site navigation, and landing pages."
        codeExamples={getCodeExamples()}
        apiProperties={getApiProperties()}
        enabledTabs={["preview", "usage", "api"]}
      />
    </div>
  }
}
