/* Theme Helper Functions - Direct theme-aware styling */
module ThemeHelpers {
  /* Get theme-aware colors based on current theme */
  fun getBackgroundPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #1e1b4b 100%)"
    } else {
      "linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #f1f5f9 100%)"
    }
  }

  fun getElevated (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  fun getSurface (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.05)"
    } else {
      "rgba(255, 255, 255, 0.8)"
    }
  }

  fun getTextPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.95)"
    } else {
      "rgba(15, 23, 42, 0.95)"
    }
  }

  fun getTextSecondary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.8)"
    } else {
      "rgba(51, 65, 85, 0.8)"
    }
  }

  fun getTextInverse (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(0, 0, 0, 0.9)"
    } else {
      "rgba(255, 255, 255, 0.95)"
    }
  }

  fun getBorderPrimary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.2)"
    } else {
      "rgba(15, 23, 42, 0.15)"
    }
  }

  fun getBorderSecondary (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(51, 65, 85, 0.1)"
    }
  }

  fun getBorderAccent (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(102, 126, 234, 0.5)"
    } else {
      "rgba(102, 126, 234, 0.3)"
    }
  }

  fun getAccent (currentTheme : String) : String {
    "linear-gradient(135deg, #667eea 0%, #764ba2 100%)"
  }

  fun getAccentHover (currentTheme : String) : String {
    "linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%)"
  }

  fun getSuccess (currentTheme : String) : String {
    "linear-gradient(135deg, #10b981 0%, #059669 100%)"
  }

  fun getWarning (currentTheme : String) : String {
    "linear-gradient(135deg, #f59e0b 0%, #d97706 100%)"
  }

  fun getError (currentTheme : String) : String {
    "linear-gradient(135deg, #ef4444 0%, #dc2626 100%)"
  }

  fun getInfo (currentTheme : String) : String {
    "linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%)"
  }

  fun getGlassBg (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.05)"
    } else {
      "rgba(255, 255, 255, 0.6)"
    }
  }

  fun getGlassHover (currentTheme : String) : String {
    if currentTheme == "dark" {
      "rgba(255, 255, 255, 0.1)"
    } else {
      "rgba(255, 255, 255, 0.8)"
    }
  }

  fun getShadowLight (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 2px 8px rgba(0, 0, 0, 0.1)"
    } else {
      "0 2px 8px rgba(15, 23, 42, 0.08)"
    }
  }

  fun getShadowMedium (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 8px 32px rgba(0, 0, 0, 0.15)"
    } else {
      "0 8px 32px rgba(15, 23, 42, 0.12)"
    }
  }

  fun getShadowHeavy (currentTheme : String) : String {
    if currentTheme == "dark" {
      "0 20px 50px rgba(0, 0, 0, 0.25)"
    } else {
      "0 20px 50px rgba(15, 23, 42, 0.15)"
    }
  }
}
