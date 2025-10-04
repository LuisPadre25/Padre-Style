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
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    padding: 8px;

    &:hover {
      transform: scale(1.05);
    }
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
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  }

  style overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 999;
    background: rgba(0, 0, 0, 0);
    animation: overlayFadeIn 0.2s ease forwards;

    @keyframes overlayFadeIn {
      to {
        background: rgba(0, 0, 0, 0.3);
      }
    }
  }

  style menu {
    position: absolute;
    border-radius: 50%;
    border: 1px solid;
    z-index: 1000;
    width: 40px;
    height: 40px;
    padding: 0;
    opacity: 0;
    animation: menuGrow 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;

    @keyframes menuGrow {
      0% {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        padding: 0;
        opacity: 0;
        overflow: hidden;
      }
      50% {
        opacity: 1;
        border-radius: 20px;
        overflow: hidden;
      }
      70% {
        overflow: visible;
      }
      100% {
        width: 320px;
        height: auto;
        border-radius: 12px;
        padding: 1rem;
        opacity: 1;
        overflow: visible;
      }
    }
  }

  style menuGrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 0.5rem;
    opacity: 0;
    animation: gridShow 0.2s ease 0.3s forwards;

    @keyframes gridShow {
      to {
        opacity: 1;
      }
    }
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
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
    opacity: 0;
    transform: scale(0.3) rotate(-180deg);
    animation: itemEnter 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;

    @keyframes itemEnter {
      to {
        opacity: 1;
        transform: scale(1) rotate(0deg);
      }
    }

    &:hover {
      transform: scale(1.05) translateY(-2px) !important;
      opacity: 1 !important;
    }
  }

  style menuIcon {
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
    line-height: 1;
    display: block;
  }

  style menuLabel {
    font-size: 0.75rem;
    font-weight: 500;
    text-align: center;
    line-height: 1.2;
    display: block;
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

  fun getMenuItemStyles (index : Number) : String {
    let animationOrder =
      case index {
        4 => 0
        1 => 1
        3 => 1
        5 => 1
        7 => 1
        0 => 2
        2 => 2
        6 => 2
        8 => 2
        => 3
      }

    let delay =
      Number.toString(0.4 + (animationOrder * 0.1))

    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      animation-delay: #{delay}s;
    "
  }

  fun getMenuItemHoverStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-color: #{ThemeHelpers.getAccent(currentTheme)};
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    "
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
      style={getMenuItemStyles(index)}
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
