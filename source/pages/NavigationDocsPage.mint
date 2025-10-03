/* NavigationDocsPage - Documentación de Navigation */
component NavigationDocsPage {
  connect ThemeStore exposing { currentTheme }

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style section {
    margin-bottom: 3rem;
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Navigation Components"</h1>
      <p>"Components for application navigation: navbar, sidebar, tabs, breadcrumbs."</p>

      <div::section>
        <h2>"TopNav - Top Navigation Bar"</h2>
        <p>"Responsive navigation bar with logo, links, and actions."</p>
      </div>

      <div::section>
        <h2>"VerticalNav - Sidebar Navigation"</h2>
        <p>"Collapsible sidebar with icons and nested navigation."</p>
      </div>

      <div::section>
        <h2>"TabBar - Horizontal Tabs"</h2>
        <p>"Tab navigation with active indicators and animations."</p>
      </div>

      <div::section>
        <h2>"Breadcrumbs - Breadcrumb Navigation"</h2>
        <p>"Hierarchical navigation breadcrumbs."</p>
      </div>
    </div>
  }
}
