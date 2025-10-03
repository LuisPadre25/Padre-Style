/* DocsPage - Documentación completa de Padre Style */
component DocsPage {
  connect ThemeStore exposing { currentTheme }

  state activeCategory : String = "Getting Started"
  state activeComponent : String = ""
  state searchQuery : String = ""

  style container {
    min-height: 100vh;
    display: flex;
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getBackground(currentTheme)}; color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  style sidebar {
    width: 280px;
    border-right: 1px solid;
    padding: 2rem 1.5rem;
    overflow-y: auto;
    position: sticky;
    top: 0;
    height: 100vh;
  }

  fun getSidebarStyles : String {
    "
      border-right-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style mainContent {
    flex: 1;
    padding: 2rem;
    overflow-y: auto;
  }

  style sidebarTitle {
    font-size: 1.5rem;
    font-weight: 800;
    margin-bottom: 0.5rem;
  }

  style sidebarSubtitle {
    font-size: 0.875rem;
    opacity: 0.7;
    margin-bottom: 2rem;
  }

  style categoryTitle {
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    opacity: 0.6;
    margin-top: 1.5rem;
    margin-bottom: 0.75rem;
  }

  style navItem {
    padding: 0.5rem 0.75rem;
    border-radius: 6px;
    cursor: pointer;
    margin-bottom: 0.25rem;
    transition: all 0.2s ease;
    font-size: 0.875rem;
  }

  fun getNavItemStyles (isActive : Bool) : String {
    if isActive {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        font-weight: 600;
      "
    } else {
      "
        background: transparent;
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        &:hover {
          background: #{ThemeHelpers.getElevated(currentTheme)};
        }
      "
    }
  }

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style pageDescription {
    font-size: 1.125rem;
    opacity: 0.8;
    margin-bottom: 3rem;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 700;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentCard {
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    border: 1px solid;
  }

  fun getComponentCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
  }

  style componentDescription {
    opacity: 0.8;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin-bottom: 1rem;
    border: 1px dashed;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style codeBlock {
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    overflow-x: auto;
    font-family: 'Fira Code', 'Courier New', monospace;
    font-size: 0.875rem;
    line-height: 1.6;
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style propsTable {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
  }

  style propsTableHeader {
    text-align: left;
    padding: 0.75rem;
    border-bottom: 2px solid;
    font-weight: 700;
  }

  fun getPropsTableHeaderStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style propsTableCell {
    padding: 0.75rem;
    border-bottom: 1px solid;
  }

  fun getPropsTableCellStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: 0.5rem;
  }

  fun getBadgeStyles (variant : String) : String {
    case variant {
      "new" =>
        "background: #10b981; color: white;"

      "updated" =>
        "background: #3b82f6; color: white;"

      "experimental" =>
        "background: #f59e0b; color: white;"

      => "background: #{ThemeHelpers.getAccent(currentTheme)}; color: white;"
    }
  }

  fun setCategory (category : String) : Promise(Void) {
    next { activeCategory: category, activeComponent: "" }
  }

  fun setComponent (component : String) : Promise(Void) {
    next { activeComponent: component }
  }

  fun renderNavItem (label : String, category : String) : Html {
    let isActive =
      activeCategory == category

    <div::navItem
      style={getNavItemStyles(isActive)}
      onClick={() { setCategory(category) }}
    >label</div>
  }

  fun renderGettingStarted : Html {
    <div>
      <h1::pageTitle>"Getting Started"</h1>

      <p::pageDescription>
        "Padre Style is a modern, comprehensive UI component library built with Mint Lang.
        It provides a complete set of customizable, themeable components for building
        beautiful web applications."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Installation"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Clone the Repository"</h3>

          <CodeHighlight
            language="bash"
            code="git clone https://github.com/your-username/padre-style.git
cd padre-style
mint install
mint start"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Quick Example"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Using a Button Component"</h3>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DynamicButton
              onClick={(event : Html.Event) { Promise.resolve(void) }}
              variant="primary"
            >"Click Me"</DynamicButton>
          </div>

          <CodeHighlight
            language="mint"
            code="<DynamicButton
  onClick={(event : Html.Event) { Promise.resolve(void) }}
  variant=\"primary\"
>\"Click Me\"</DynamicButton>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Theming"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Theme System"</h3>

          <p::componentDescription>
            "Padre Style includes a powerful theming system with multiple built-in themes:
            Glass, Dark, Light, Dracula, Nord, Monokai, and Solarized."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DynamicThemeToggle/>
          </div>

          <CodeHighlight
            language="mint"
            code="// Wrap your app with theme provider
<DynamicThemeProvider>
  <YourApp/>
</DynamicThemeProvider>

// Use theme in components
connect ThemeStore exposing { currentTheme }

// Access theme colors
ThemeHelpers.getAccent(currentTheme)
ThemeHelpers.getBackground(currentTheme)"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Component Categories"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <ul>
            <li>"📐 Layout - Flex, Grid, Stack, Box, Container"</li>
            <li>"📝 Forms - Input, Select, Checkbox, Radio, Date Picker"</li>
            <li>"📊 Charts - Line, Bar, Area, Donut, Radar, Heatmap"</li>
            <li>"🖼️ Media - Image Carousel, Lightbox, Video Player"</li>
            <li>"🔔 Feedback - Alerts, Toasts, Modals, Tooltips"</li>
            <li>"🧭 Navigation - Navbar, Sidebar, Tabs, Breadcrumbs"</li>
            <li>"📋 Data Display - Tables, Cards, Lists, Badges"</li>
            <li>"💻 Code - Syntax Highlighting, Code Editor"</li>
          </ul>
        </div>
      </div>
    </div>
  }

  fun renderContent : Html {
    case activeCategory {
      "Getting Started" => renderGettingStarted()
      "Layout" => <LayoutDocsPage/>
      "Forms" => <FormsDocsPage/>
      "Charts" => <ChartsDocsPage/>
      "Media" => <MediaDocsPage/>
      "Data Display" => <DataDisplayDocsPage/>
      "Navigation" => <NavigationDocsPage/>
      "Feedback" => <FeedbackDocsPage/>
      "Toast" => <ToastDocsPage/>
      => <div>"Select a category"</div>
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <aside::sidebar style={getSidebarStyles()}>
        <div::sidebarTitle>"Padre Style"</div>
        <div::sidebarSubtitle>"Component Library"</div>

        <div::categoryTitle>"Documentation"</div>
        renderNavItem("🚀 Getting Started", "Getting Started")
        renderNavItem("📖 Theme Guide", "Theme Guide")
        renderNavItem("🎨 Customization", "Customization")

        <div::categoryTitle>"Components"</div>
        renderNavItem("📐 Layout", "Layout")
        renderNavItem("📝 Forms", "Forms")
        renderNavItem("📊 Charts", "Charts")
        renderNavItem("🖼️ Media", "Media")
        renderNavItem("📋 Data Display", "Data Display")
        renderNavItem("🧭 Navigation", "Navigation")
        renderNavItem("🔔 Toast", "Toast")
        renderNavItem("💬 Feedback", "Feedback")
        renderNavItem("💻 Code", "Code")

        <div::categoryTitle>"Examples"</div>
        renderNavItem("🎯 Dashboard", "Dashboard Example")
        renderNavItem("📱 Landing Page", "Landing Example")
        renderNavItem("🛒 E-commerce", "Ecommerce Example")
      </aside>

      <main::mainContent>renderContent()</main>
    </div>
  }
}
