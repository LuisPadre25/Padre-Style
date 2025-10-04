/* Dot Navigation Menu - Vertical navigation with dot indicators */
component DotNavigation {
  property items : Array(String) = []
  property activeIndex : Number = 0
  property position : String = "right"
  property dotSize : String = "medium"
  property showLabels : Bool = false
  property onItemClick = (index : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
    z-index: 1000;
    display: flex;
    flex-direction: column;
    gap: 1rem;
    padding: 1rem;
  }

  style navItem {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
  }

  style dot {
    border-radius: 50%;
    border: 2px solid;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
  }

  style label {
    font-size: 0.875rem;
    font-weight: 500;
    opacity: 0;
    transform: translateX(10px);
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    white-space: nowrap;
    pointer-events: none;
    position: absolute;
  }

  style activeDot {
    transform: scale(1.2);
  }

  fun getContainerStyles : String {
    let positionStyle =
      if position == "left" {
        "left: 2rem;"
      } else {
        "right: 2rem;"
      }

    "#{positionStyle}"
  }

  fun getNavItemStyles (index : Number) : String {
    let flexDirection =
      if position == "left" {
        "flex-direction: row;"
      } else {
        "flex-direction: row-reverse;"
      }

    "#{flexDirection}"
  }

  fun getDotStyles (index : Number) : String {
    let isActive =
      index == activeIndex

    let size =
      if dotSize == "small" {
        "width: 8px; height: 8px;"
      } else {
        if dotSize == "large" {
          "width: 16px; height: 16px;"
        } else {
          "width: 12px; height: 12px;"
        }
      }

    let borderColor =
      if isActive {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        ThemeHelpers.getBorderPrimary(currentTheme)
      }

    let background =
      if isActive {
        "background: #{ThemeHelpers.getAccent(currentTheme)};"
      } else {
        "background: transparent;"
      }

    let shadow =
      if isActive {
        "box-shadow: 0 0 0 4px #{ThemeHelpers.getAccent(currentTheme)}33;"
      } else {
        ""
      }

    "
      #{size}
      border-color: #{borderColor};
      #{background}
      #{shadow}
    "
  }

  fun getLabelStyles (index : Number) : String {
    let isActive =
      index == activeIndex

    let direction =
      if position == "left" {
        "left: calc(100% + 1rem);"
      } else {
        "right: calc(100% + 1rem);"
      }

    let color =
      if isActive {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        ThemeHelpers.getTextSecondary(currentTheme)
      }

    let opacity =
      if showLabels {
        "opacity: 1; transform: translateX(0);"
      } else {
        ""
      }

    "
      color: #{color};
      #{direction}
      #{opacity}
    "
  }

  fun getNavItemHoverStyles : String {
    "
      &:hover .label {
        opacity: 1;
        transform: translateX(0);
      }

      &:hover .dot {
        transform: scale(1.15);
        border-color: #{ThemeHelpers.getAccent(currentTheme)};
      }
    "
  }

  fun handleClick (index : Number) : Promise(Void) {
    onItemClick(index)
  }

  fun renderNavItem (item : String, index : Number) : Html {
    <div::navItem
      onClick={(event : Html.Event) : Promise(Void) { handleClick(index) }}
      style={getNavItemStyles(index) + getNavItemHoverStyles()}
    >
      <div::dot
        class="dot"
        style={getDotStyles(index)}
      />

      <span::label
        class="label"
        style={getLabelStyles(index)}
      >{item}</span>
    </div>
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        for item, index of items {
          renderNavItem(item, index)
        }
      }
    </div>
  }
}
