/* NavigationDocsPage - Documentación de Navigation */
component NavigationDocsPage {
  connect ThemeStore exposing { currentTheme }

  state selectedTopNavItem : String = "Home"
  state selectedVerticalNavItem : String = "Dashboard"
  state selectedTabBar : String = "Profile"
  state selectedMenuDropdown : String = ""

  fun handleTopNavClick (item : String) : Promise(Void) {
    next { selectedTopNavItem: item }
  }

  fun handleVerticalNavClick (item : String) : Promise(Void) {
    next { selectedVerticalNavItem: item }
  }

  fun handleTabBarClick (tab : String) : Promise(Void) {
    next { selectedTabBar: tab }
  }

  fun handleMenuDropdownSelect (item : String) : Promise(Void) {
    next { selectedMenuDropdown: item }
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
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.5rem;
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
    margin: 1.5rem 0;
  }

  fun getExampleContainerStyles : String {
    "background: #{ThemeHelpers.getBackground(currentTheme)};"
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
      "navigation" => "background: #3b82f6; color: white;"
      => "background: #{ThemeHelpers.getAccent(currentTheme)}; color: white;"
    }
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Navigation Components"</h1>

      <p::pageDescription>
        "Complete navigation system including breadcrumbs, top navigation, sidebars, tabs, and menus.
        All components are responsive and theme-aware."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Breadcrumbs"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Breadcrumbs"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Hierarchical navigation showing the current page location with clickable path."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Breadcrumbs
              items={["Home", "Products", "Electronics", "Laptops"]}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<Breadcrumbs
  items={[\"Home\", \"Products\", \"Electronics\", \"Laptops\"]}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Top Navigation"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "TopNav"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Responsive top navigation bar with active item highlighting."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <TopNav
              items={["Home", "About", "Services", "Portfolio", "Contact"]}
              activeItem={selectedTopNavItem}
              onItemClick={handleTopNavClick}
            />
            <div style="margin-top: 1rem; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;">
              <strong>"Selected: "</strong>
              <span>{selectedTopNavItem}</span>
            </div>
          </div>

          <CodeHighlight
            language="mint"
            code="state selectedItem : String = \"Home\"

fun handleClick (item : String) : Promise(Void) {
  sequence {
    next { selectedItem: item }
  }
}

<TopNav
  items={[\"Home\", \"About\", \"Services\", \"Contact\"]}
  activeItem={selectedItem}
  onItemClick={handleClick}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Vertical Navigation"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "VerticalNav"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Sidebar navigation perfect for dashboards and admin panels."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <div style="display: flex; gap: 2rem;">
              <div style="width: 250px;">
                <VerticalNav
                  items={["Dashboard", "Analytics", "Reports", "Settings", "Help"]}
                  activeItem={selectedVerticalNavItem}
                  onItemClick={handleVerticalNavClick}
                />
              </div>
              <div style="flex: 1; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;">
                <strong>"Selected: "</strong>
                <span>{selectedVerticalNavItem}</span>
              </div>
            </div>
          </div>

          <CodeHighlight
            language="mint"
            code="<VerticalNav
  items={[\"Dashboard\", \"Analytics\", \"Reports\", \"Settings\"]}
  activeItem={selectedItem}
  onItemClick={handleClick}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Tab Bar"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "TabBar"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Horizontal tab navigation with smooth animations and active indicator."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <TabBar
              tabs={["Profile", "Settings", "Notifications", "Security"]}
              activeTab={selectedTabBar}
              onTabChange={handleTabBarClick}
            />
            <div style="margin-top: 2rem; padding: 2rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;">
              <h4 style="margin-bottom: 0.5rem;">
                <strong>{selectedTabBar}" Tab Content"</strong>
              </h4>
              <p>"This is the content for the "{selectedTabBar}" tab."</p>
            </div>
          </div>

          <CodeHighlight
            language="mint"
            code="<TabBar
  tabs={[\"Profile\", \"Settings\", \"Notifications\"]}
  activeTab={activeTab}
  onTabClick={handleTabClick}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Menu Dropdown"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "MenuDropdown"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Dropdown menu for navigation items or action menus."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <MenuDropdown
              label="Options Menu"
              items={["Edit Profile", "Change Password", "Preferences", "Logout"]}
              onSelect={handleMenuDropdownSelect}
            />
            if String.isEmpty(selectedMenuDropdown) {
              <div style="margin-top: 1rem; padding: 1rem; background: rgba(156, 163, 175, 0.2); border-radius: 8px;">
                <em>"Select an option from the menu above"</em>
              </div>
            } else {
              <div style="margin-top: 1rem; padding: 1rem; background: rgba(59, 130, 246, 0.1); border-radius: 8px;">
                <strong>"Selected: "</strong>
                <span>{selectedMenuDropdown}</span>
              </div>
            }
          </div>

          <CodeHighlight
            language="mint"
            code="<MenuDropdown
  label=\"Options Menu\"
  items={[\"Edit\", \"Delete\", \"Share\", \"Export\"]}
  onSelect={handleSelect}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Pagination"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Pagination"
            <span::badge style={getBadgeStyles("navigation")}>"Navigation"</span>
          </h3>

          <p::componentDescription>
            "Navigation between pages with page numbers and next/previous controls."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <p style="margin-bottom: 1rem;">"Example from DataShowcase:"</p>
            <CodeHighlight
              language="mint"
              code="<Pagination
  currentPage={1}
  totalPages={10}
  onPageChange={handlePageChange}
/>"
            />
          </div>
        </div>
      </div>

    </div>
  }
}
