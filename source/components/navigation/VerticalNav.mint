/* Vertical Navigation Component */
component VerticalNav {
  property items : Array(String) = []
  property activeItem : String = ""
  property onItemClick = (item : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style nav {
    width: 250px;
    padding: 1rem;
  }

  style item {
    padding: 0.75rem 1rem;
    margin: 0.5rem 0;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  fun getNavStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-right: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getItemStyles (item : String) : String {
    if item == activeItem {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        font-weight: 600;
      "
    } else {
      "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
    }
  }

  fun render : Html {
    <nav::nav style={getNavStyles()}>
      for item of items {
        <div::item
          style={getItemStyles(item)}
          onClick={(e : Html.Event) { onItemClick(item) }}
        >item</div>
      }
    </nav>
  }
}
