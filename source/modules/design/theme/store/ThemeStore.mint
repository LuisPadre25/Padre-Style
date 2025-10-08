store ThemeStore {
  state theme : String = "default"
  state primaryColor : String = "#1989fa"

  fun setTheme (newTheme : String) : Promise(Void) {
    next { theme: newTheme }
    applyThemeColors(newTheme)
  }

  fun setPrimaryColor (color : String) : Promise(Void) {
    next { primaryColor: color }
    applyColorToCSS(color)
  }

  fun applyThemeColors (themeName : String) : Promise(Void) {
    `
    (() => {
      const root = document.documentElement;

      switch(#{themeName}) {
        case 'default':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#eff2f5');
          root.style.setProperty('--text-color', '#333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#34495e');
          root.style.setProperty('--heading-color', '#1a1a1a');
          root.style.setProperty('--border-color', '#f7f8fa');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.05)');
          break;
        case 'dark':
          root.style.setProperty('--primary-color', '#4A9EFF');
          root.style.setProperty('--bg-color', '#18191A');
          root.style.setProperty('--text-color', '#E4E6EB');
          root.style.setProperty('--card-bg', '#242526');
          root.style.setProperty('--navbar-bg', '#242526');
          root.style.setProperty('--navbar-text', '#E4E6EB');
          root.style.setProperty('--sidebar-bg', '#242526');
          root.style.setProperty('--sidebar-text', '#B0B3B8');
          root.style.setProperty('--heading-color', '#E4E6EB');
          root.style.setProperty('--border-color', '#3A3B3C');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.5)');
          break;
        case 'light':
          root.style.setProperty('--primary-color', '#1989fa');
          root.style.setProperty('--bg-color', '#fafafa');
          root.style.setProperty('--text-color', '#333333');
          root.style.setProperty('--card-bg', '#ffffff');
          root.style.setProperty('--navbar-bg', '#ffffff');
          root.style.setProperty('--navbar-text', '#1a1a1a');
          root.style.setProperty('--sidebar-bg', '#ffffff');
          root.style.setProperty('--sidebar-text', '#555555');
          root.style.setProperty('--heading-color', '#000000');
          root.style.setProperty('--border-color', '#e8e8e8');
          root.style.setProperty('--shadow-color', 'rgba(0, 0, 0, 0.08)');
          break;
        case 'blue':
          root.style.setProperty('--primary-color', '#2a5298');
          root.style.setProperty('--bg-color', '#e8eef5');
          root.style.setProperty('--text-color', '#1e3c72');
          root.style.setProperty('--card-bg', '#f5f8fc');
          root.style.setProperty('--navbar-bg', '#1e3c72');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f5f8fc');
          root.style.setProperty('--sidebar-text', '#2a5298');
          root.style.setProperty('--heading-color', '#1e3c72');
          root.style.setProperty('--border-color', '#d0dce8');
          root.style.setProperty('--shadow-color', 'rgba(30, 60, 114, 0.1)');
          break;
        case 'green':
          root.style.setProperty('--primary-color', '#71b280');
          root.style.setProperty('--bg-color', '#e8f4ec');
          root.style.setProperty('--text-color', '#134e5e');
          root.style.setProperty('--card-bg', '#f0f8f3');
          root.style.setProperty('--navbar-bg', '#134e5e');
          root.style.setProperty('--navbar-text', '#ffffff');
          root.style.setProperty('--sidebar-bg', '#f0f8f3');
          root.style.setProperty('--sidebar-text', '#2d6a4f');
          root.style.setProperty('--heading-color', '#134e5e');
          root.style.setProperty('--border-color', '#c7e6d1');
          root.style.setProperty('--shadow-color', 'rgba(19, 78, 94, 0.1)');
          break;
      }
    })()
    `
    Promise.resolve(void)
  }

  fun applyColorToCSS (color : String) : Promise(Void) {
    `
    (() => {
      document.documentElement.style.setProperty('--primary-color', #{color});
    })()
    `
    Promise.resolve(void)
  }

  fun initialize : Promise(Void) {
    applyThemeColors(theme)
    applyColorToCSS(primaryColor)
  }

  fun resetTheme : Promise(Void) {
    next {
      theme: "default",
      primaryColor: "#1989fa"
    }
    initialize()
  }
}
