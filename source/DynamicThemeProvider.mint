/* Dynamic Theme Provider - Applies theme styles directly */
component DynamicThemeProvider {
  property children : Array(Html) = []

  connect ThemeStore exposing { currentTheme }

  style themeProvider {
    width: 100%;
    height: 100%;
    min-height: 100vh;
    transition: all 0.3s ease;
    position: relative;
  }

  fun render : Html {
    <div::themeProvider
      style="
        background: #{ThemeHelpers.getBackgroundPrimary(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      "
    >
      <div
        style="
        position: fixed;
        top: 1rem;
        left: 1rem;
        padding: 0.5rem;
        background: #{if currentTheme == "dark" {
          "rgba(0,0,0,0.8)"
        } else {
          "rgba(255,255,255,0.8)"
        }};
        color: #{if currentTheme == "dark" {
          "white"
        } else {
          "black"
        }};
        border-radius: 4px;
        z-index: 1001;
        font-size: 0.75rem;
        border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      "
      >"Theme: #{currentTheme} - ACTIVE"</div>

      for child of children {
        child
      }
    </div>
  }
}

/* Updated Theme Toggle Button */
component DynamicThemeToggle {
  connect ThemeStore exposing { currentTheme }

  style toggleButton {
    position: fixed;
    top: 2rem;
    right: 2rem;
    width: 3.5rem;
    height: 3.5rem;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    transition: all 0.3s ease;
    z-index: 1000;
    backdrop-filter: blur(10px);

    &:hover {
      transform: scale(1.1);
    }

    &:active {
      transform: scale(0.95);
    }
  }

  fun handleToggle (event : Html.Event) : Promise(Void) {
    ThemeStore.toggleTheme()
  }

  fun getIcon : String {
    if currentTheme == "dark" {
      "☀️"
    } else {
      "🌙"
    }
  }

  fun render : Html {
    <button::toggleButton
      style="
        border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
        background: #{ThemeHelpers.getGlassBg(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      "
      onClick={handleToggle}
      title={
        if currentTheme == "dark" {
          "Switch to Light Mode"
        } else {
          "Switch to Dark Mode"
        }
      }
    >
      <span>
        {
          getIcon()
        }
      </span>

      <span style="font-size: 0.5rem; position: absolute; bottom: 0.2rem;">
        {
          currentTheme
        }
      </span>
    </button>
  }
}
