/* Simple Theme System */

/* Theme Toggle Button Component */
component ThemeToggle {
  connect ThemeStore exposing { currentTheme }

  style toggleButton {
    position: fixed;
    top: 2rem;
    right: 2rem;
    width: 3.5rem;
    height: 3.5rem;
    border-radius: 50%;
    border: 2px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    background: var(--glass-bg, rgba(255, 255, 255, 0.05));
    backdrop-filter: blur(10px);
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
    transition: all 0.3s ease;
    z-index: 1000;
    box-shadow: var(--shadow-medium, 0 8px 32px rgba(0, 0, 0, 0.15));
    color: var(--text-primary, white);

    &:hover {
      background: var(--glass-hover, rgba(255, 255, 255, 0.1));
      transform: scale(1.1);
      box-shadow: var(--shadow-heavy, 0 20px 50px rgba(0, 0, 0, 0.25));
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

/* Enhanced Theme Provider with CSS Variable Injection */
component SimpleThemeProvider {
  property children : Array(Html) = []

  connect ThemeStore exposing { currentTheme }

  style themeProvider {
    width: 100%;
    height: 100%;
    min-height: 100vh;
    transition: all 0.3s ease;
  }

  style dark {
    /* Dark theme styles */
    --color-primary: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #1e1b4b 100%);
    --color-secondary: rgba(30, 27, 75, 0.95);
    --color-tertiary: rgba(49, 46, 129, 0.8);
    --surface: rgba(255, 255, 255, 0.05);
    --elevated: rgba(255, 255, 255, 0.1);

    --text-primary: rgba(255, 255, 255, 0.95);
    --text-secondary: rgba(255, 255, 255, 0.8);
    --text-tertiary: rgba(255, 255, 255, 0.6);
    --text-inverse: rgba(0, 0, 0, 0.9);

    --border-primary: rgba(255, 255, 255, 0.2);
    --border-secondary: rgba(255, 255, 255, 0.1);
    --border-accent: rgba(102, 126, 234, 0.5);

    --accent: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --accent-hover: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
    --success: linear-gradient(135deg, #10b981 0%, #059669 100%);
    --warning: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
    --error: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
    --info: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);

    --glass-bg: rgba(255, 255, 255, 0.05);
    --glass-hover: rgba(255, 255, 255, 0.1);
    --glass-border: rgba(255, 255, 255, 0.2);

    --shadow-light: 0 2px 8px rgba(0, 0, 0, 0.1);
    --shadow-medium: 0 8px 32px rgba(0, 0, 0, 0.15);
    --shadow-heavy: 0 20px 50px rgba(0, 0, 0, 0.25);

    background: var(--color-primary);
    color: var(--text-primary);
  }

  style light {
    /* Light theme styles */
    --color-primary: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #f1f5f9 100%);
    --color-secondary: rgba(248, 250, 252, 0.95);
    --color-tertiary: rgba(226, 232, 240, 0.8);
    --surface: rgba(255, 255, 255, 0.8);
    --elevated: rgba(255, 255, 255, 0.95);

    --text-primary: rgba(15, 23, 42, 0.95);
    --text-secondary: rgba(51, 65, 85, 0.8);
    --text-tertiary: rgba(100, 116, 139, 0.7);
    --text-inverse: rgba(255, 255, 255, 0.95);

    --border-primary: rgba(15, 23, 42, 0.15);
    --border-secondary: rgba(51, 65, 85, 0.1);
    --border-accent: rgba(102, 126, 234, 0.3);

    --accent: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --accent-hover: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
    --success: linear-gradient(135deg, #10b981 0%, #059669 100%);
    --warning: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
    --error: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
    --info: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);

    --glass-bg: rgba(255, 255, 255, 0.6);
    --glass-hover: rgba(255, 255, 255, 0.8);
    --glass-border: rgba(15, 23, 42, 0.1);

    --shadow-light: 0 2px 8px rgba(15, 23, 42, 0.08);
    --shadow-medium: 0 8px 32px rgba(15, 23, 42, 0.12);
    --shadow-heavy: 0 20px 50px rgba(15, 23, 42, 0.15);

    background: var(--color-primary);
    color: var(--text-primary);
  }

  fun toggleTheme (event : Html.Event) : Promise(Void) {
    ThemeStore.toggleTheme()
  }

  fun getThemeClass : String {
    currentTheme
  }

  fun render : Html {
    <div::themeProvider class={getThemeClass()}>
      <div
        style="position: fixed; top: 1rem; left: 1rem; padding: 0.5rem; background: rgba(0,0,0,0.8); color: white; border-radius: 4px; z-index: 1001; font-size: 0.75rem;"
      >"Theme: #{currentTheme}"</div>

      for child of children {
        child
      }
    </div>
  }
}
