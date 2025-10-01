/* Tab Bar Component */
component TabBar {
  property tabs : Array(String) = []
  property activeTab : String = ""
  property onTabChange = (tab : String) : Promise(Void) { Promise.never() }
  property variant : String = "default"

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.25rem;
    padding: 0.25rem;
    border-radius: 10px;
    width: fit-content;
  }

  style tab {
    padding: 0.5rem 1.25rem;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.2s ease;
    border: none;
    background: transparent;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getTabStyles (tab : String) : String {
    if tab == activeTab {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      "
    } else {
      "
        color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      "
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      for tab of tabs {
        <button::tab
          style={getTabStyles(tab)}
          onClick={(e : Html.Event) { onTabChange(tab) }}
        >tab</button>
      }
    </div>
  }
}
