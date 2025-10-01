/* Theme Store - Global state management for theme switching */
store ThemeStore {
  state currentTheme : String = "dark"

  fun setTheme (theme : String) : Promise(Void) {
    next { currentTheme: theme }
  }

  fun toggleTheme : Promise(Void) {
    let newTheme =
      if currentTheme == "dark" {
        "light"
      } else {
        "dark"
      }

    next { currentTheme: newTheme }
  }

  fun isDark : Bool {
    currentTheme == "dark"
  }

  fun isLight : Bool {
    currentTheme == "light"
  }
}
