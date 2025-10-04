/* Top Navigation Component */
component TopNav {
  property brand : String = "Brand"
  property items : Array(String) = []
  property activeItem : String = ""
  property onItemClick = (item : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    backdrop-filter: blur(20px);
    position: relative;
  }

  style brand {
    font-size: 1.5rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  style navItems {
    display: flex;
    gap: 0.5rem;
    align-items: center;
  }

  style navItem {
    cursor: pointer;
    font-weight: 500;
    padding: 0.625rem 1.25rem;
    border-radius: 10px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
  }

  fun getNavBarStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-bottom: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getBrandStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getNavItemStyles (item : String) : String {
    if item == activeItem {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4), #{ThemeHelpers.getShadowLight(
        currentTheme)};
        transform: translateY(-2px);
      "
    } else {
      "
        color: #{ThemeHelpers.getTextSecondary(currentTheme)};
        background: transparent;
      "
    }
  }

  fun render : Html {
    <nav::navbar style={getNavBarStyles()}>
      <div::brand style={getBrandStyles()}>brand</div>

      <div::navItems>
        for item of items {
          <div::navItem
            style={getNavItemStyles(item)}
            onClick={(e : Html.Event) { onItemClick(item) }}
          >item</div>
        }
      </div>
    </nav>
  }
}
