/* Nine Dot Menu - App launcher style menu with 3x3 grid */
component NineDotMenu {
  property menuItems : Array(MenuItem) = []
  property placement : String = "top"
  property onItemClick = (item : MenuItem) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state isOpen : Bool = false

  style button {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    position: relative;
    padding: 8px;
  }

  style dotsGrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: repeat(3, 1fr);
    gap: 3px;
    width: 18px;
    height: 18px;
  }

  style dot {
    width: 4px;
    height: 4px;
    border-radius: 50%;
    transition: all 0.3s ease;
  }

  style overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 999;
  }

  style menu {
    position: absolute;
    border-radius: 12px;
    border: 1px solid;
    z-index: 1000;
    padding: 1rem;
    min-width: 300px;
  }

  style menuGrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 0.5rem;
  }

  style menuItem {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 1rem;
    border-radius: 8px;
    cursor: pointer;
    border: 1px solid transparent;
    transition: all 0.2s ease;
  }

  style menuIcon {
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
  }

  style menuLabel {
    font-size: 0.75rem;
    font-weight: 500;
    text-align: center;
  }

  fun getButtonStyles : String {
    let background =
      if isOpen {
        ThemeHelpers.getElevated(currentTheme)
      } else {
        "transparent"
      }

    "background: #{background};"
  }

  fun getDotStyles : String {
    let color =
      if isOpen {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        ThemeHelpers.getTextSecondary(currentTheme)
      }

    "background: #{color};"
  }

  fun getMenuPlacementStyles : String {
    case placement {
      "top" =>
        "bottom: calc(100% + 8px); left: 50%; transform: translateX(-50%);"

      "bottom" =>
        "top: calc(100% + 8px); left: 50%; transform: translateX(-50%);"

      "left" =>
        "right: calc(100% + 8px); top: 50%; transform: translateY(-50%);"

      "right" =>
        "left: calc(100% + 8px); top: 50%; transform: translateY(-50%);"

      "top-left" =>
        "bottom: calc(100% + 8px); right: 0;"

      "top-right" =>
        "bottom: calc(100% + 8px); left: 0;"

      "bottom-left" =>
        "top: calc(100% + 8px); right: 0;"

      "bottom-right" =>
        "top: calc(100% + 8px); left: 0;"

      "center" =>
        "top: 50%; left: 50%; transform: translate(-50%, -50%);"

      => "bottom: calc(100% + 8px); left: 50%; transform: translateX(-50%);"
    }
  }

  fun getMenuStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)}; border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)}; box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)}; #{getMenuPlacementStyles()}"
  }

  fun getMenuItemStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)}; &:hover { background: #{ThemeHelpers.getElevated(currentTheme)}; border-color: #{ThemeHelpers.getAccent(currentTheme)}; }"
  }

  fun toggle (event : Html.Event) : Promise(Void) {
    next { isOpen: !isOpen }
  }

  fun close (event : Html.Event) : Promise(Void) {
    next { isOpen: false }
  }

  fun handleClick (item : MenuItem, event : Html.Event) : Promise(Void) {
    onItemClick(item)
    next { isOpen: false }
  }

  fun renderMenuItem (item : MenuItem, index : Number) : Html {
    <div::menuItem
      onClick={(event : Html.Event) : Promise(Void) { handleClick(item, event) }}
      style={getMenuItemStyles()}
    >
      <div::menuIcon>{item.icon}</div>
      <div::menuLabel>{item.label}</div>
    </div>
  }

  fun render : Html {
    <div style="position: relative;">
      <button::button
        onClick={toggle}
        style={getButtonStyles()}
        type="button"
      >
        <div::dotsGrid>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
          <div::dot style={getDotStyles()}/>
        </div>
      </button>

      if isOpen {
        <>
          <div::overlay onClick={close}/>

          <div::menu style={getMenuStyles()}>
            <div::menuGrid>
              {
                for item, index of menuItems {
                  renderMenuItem(item, index)
                }
              }
            </div>
          </div>
        </>
      }
    </div>
  }
}
