component Navbar {
  connect ViewModeStore exposing { viewMode }
  connect NavigationStore exposing { sidebarOpen }
  connect ThemeStore exposing { theme }

  style header {
    background: var(--navbar-bg, #fff);
    border-bottom: 1px solid var(--border-color, #f7f8fa);
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: 0 2px 8px var(--shadow-color, rgba(0, 0, 0, 0.05));
    transition: all 0.3s ease;
  }

  style row {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 20px;
  }

  style top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 64px;
  }

  style logo {
    display: flex;
    align-items: center;
    gap: 12px;
    text-decoration: none;
    cursor: pointer;
  }

  style logoImg {
    width: 32px;
    height: 32px;
  }

  style title {
    font-size: 22px;
    font-weight: 600;
    color: var(--navbar-text, #1a1a1a);
    transition: color 0.3s ease;
  }

  style subtitle {
    font-size: 14px;
    color: #969799;
    font-weight: 400;
    margin-left: 4px;

    @media (max-width: 768px) {
      display: none;
    }
  }

  style topNav {
    display: flex;
    align-items: center;
    gap: 16px;
    list-style: none;
    margin: 0;
    padding: 0;

    @media (max-width: 768px) {
      gap: 8px;
    }
  }

  style navItem {
    display: flex;
    align-items: center;

    @media (max-width: 768px) {
      &.hideOnMobile {
        display: none;
      }
    }
  }

  style link {
    display: flex;
    align-items: center;
    padding: 8px;
    cursor: pointer;
    transition: opacity 0.2s;
    text-decoration: none;

    &:hover {
      opacity: 0.7;
    }
  }

  style icon {
    width: 20px;
    height: 20px;
  }

  style cube {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 32px;
    height: 32px;
    padding: 0 8px;
    background: color-mix(in srgb, var(--primary-color, #1989fa) 10%, transparent);
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    color: var(--text-color, #323233);
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;

    &:hover {
      background: color-mix(in srgb, var(--primary-color, #1989fa) 20%, transparent);
    }
  }

  style version {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    cursor: default;

    &:hover {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }
  }

  style viewModeToggle {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 6px 12px;
    background: var(--mint-background, #f7f8fa);
    border-radius: 20px;
    cursor: pointer;
    transition: all 0.2s;

    &:hover {
      background: var(--mint-border-color, #ebedf0);
    }
  }

  style viewModeIcon {
    width: 18px;
    height: 18px;
    transition: transform 0.2s;
  }

  style viewModeText {
    font-size: 13px;
    font-weight: 500;
    color: var(--mint-text-color, #323233);
    user-select: none;
  }

  style viewModeActive {
    background: var(--mint-primary-color, #1989fa);

    & .viewModeText {
      color: white;
    }

    & .viewModeIcon {
      filter: brightness(0) invert(1);
    }
  }

  style hamburgerButton {
    display: none;
    flex-direction: column;
    justify-content: space-around;
    width: 24px;
    height: 24px;
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 0;
    z-index: 10;
    margin-right: 16px;

    @media (max-width: 768px) {
      display: flex;
    }

    &:focus {
      outline: none;
    }
  }

  style hamburgerLine {
    width: 100%;
    height: 2px;
    background-color: var(--navbar-text, #1a1a1a);
    transition: all 0.3s ease;
    transform-origin: center;
  }

  style hamburgerLine1Open {
    transform: rotate(45deg) translate(5px, 5px);
  }

  style hamburgerLine2Open {
    opacity: 0;
  }

  style hamburgerLine3Open {
    transform: rotate(-45deg) translate(7px, -6px);
  }

  fun toggleDarkMode : Promise(Void) {
    if theme == "dark" {
      ThemeStore.setTheme("default")
    } else {
      ThemeStore.setTheme("dark")
    }
  }

  fun toggleViewMode : Promise(Void) {
    ViewModeStore.toggleViewMode()
  }

  fun toggleSidebar : Promise(Void) {
    NavigationStore.toggleSidebar()
  }

  fun render : Html {
    <div::header>
      <div::row>
        <div::top>
          <button::hamburgerButton onClick={toggleSidebar}>
            <span::hamburgerLine
              class={
                if sidebarOpen {
                  "hamburgerLine1Open"
                } else {
                  ""
                }
              }></span>

            <span::hamburgerLine
              class={
                if sidebarOpen {
                  "hamburgerLine2Open"
                } else {
                  ""
                }
              }></span>

            <span::hamburgerLine
              class={
                if sidebarOpen {
                  "hamburgerLine3Open"
                } else {
                  ""
                }
              }></span>
          </button>

          <a::logo href="/">
            <img::logoImg src="https://fastly.jsdelivr.net/npm/@vant/assets/logo.png"/>
            <span::title>"Mint Wū"</span>
            <span::subtitle>"(Mint Lang 0.28.0)"</span>
          </a>

          <ul::topNav>
            <li::navItem class="hideOnMobile">
              <div::viewModeToggle
                class={
                  if viewMode == "mobile" {
                    "viewModeActive"
                  } else {
                    ""
                  }
                }
                onClick={toggleViewMode}>

                if viewMode == "mobile" {
                  <svg::viewModeIcon
                    class="viewModeIcon"
                    viewBox="0 0 24 24"
                    fill="currentColor">

                    <path d="M17 1.01L7 1c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z"/>
                  </svg>
                } else {
                  <svg::viewModeIcon
                    class="viewModeIcon"
                    viewBox="0 0 24 24"
                    fill="currentColor">

                    <path d="M21 2H3c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h7v2H8v2h8v-2h-2v-2h7c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H3V4h18v12z"/>
                  </svg>
                }

                <span::viewModeText class="viewModeText">
                  if viewMode == "mobile" {
                    "📱 Mobile"
                  } else {
                    "🖥️ Desktop"
                  }
                </span>
              </div>
            </li>

            <li::navItem class="hideOnMobile">
              <a::link
                target="_blank"
                href="https://github.com/mint-lang/mint">

                <img::icon src="https://fastly.jsdelivr.net/npm/@vant/assets/github.svg"/>
              </a>
            </li>

            <li::navItem>
              <a::link onClick={toggleDarkMode}>
                <img::icon src="https://b.yzcdn.cn/vant/dark-theme.svg"/>
              </a>
            </li>

            <li::navItem class="hideOnMobile">
              <span::cube::version>"v0.28.0"</span>
            </li>

            <li::navItem class="hideOnMobile">
              <a::cube href="https://mint-lang.com" target="_blank">
                "Docs"
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  }
}
