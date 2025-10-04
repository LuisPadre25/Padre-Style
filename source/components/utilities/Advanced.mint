/* Advanced UI Components */

/* Dropdown Component - Advanced dropdown menu */
component Dropdown {
  property children : Array(Html) = []
  property trigger : String = "Click to open"
  property placement : String = "bottom"
  property disabled : Bool = false

  state isOpen : Bool = false

  connect ThemeStore exposing { currentTheme }

  style dropdown {
    position: relative;
    display: inline-block;
  }

  style trigger {
    border-radius: 8px;
    padding: 0.75rem 1rem;
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);
    display: flex;
    align-items: center;
    gap: 0.5rem;

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  fun getTriggerStyles : String {
    "
      background: #{ThemeHelpers.getGlassBg(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      text-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  style menu {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    border-radius: 8px;
    backdrop-filter: blur(20px);
    z-index: 1000;
    margin-top: 0.5rem;
    min-width: 200px;
    animation: slideDown 0.2s ease-out;
  }

  fun getMenuStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style topPlacement {
    bottom: 100%;
    top: auto;
    margin-bottom: 0.5rem;
    margin-top: 0;
    animation: slideUp 0.2s ease-out;
  }

  style keyframes {
    @keyframes slideDown {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes slideUp {
      from {
        opacity: 0;
        transform: translateY(10px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  fun toggleDropdown (event : Html.Event) : Promise(Void) {
    if !disabled {
      next { isOpen: !isOpen }
    } else {
      Promise.never()
    }
  }

  fun closeDropdown (event : Html.Event) : Promise(Void) {
    next { isOpen: false }
  }

  fun render : Html {
    <div::dropdown>
      <div::trigger
        style={getTriggerStyles()}
        disabled={disabled}
        onClick={toggleDropdown}
      >
        {
          trigger
        }

        <span>
          {
            if isOpen {
              "▲"
            } else {
              "▼"
            }
          }
        </span>
      </div>

      {
        if isOpen {
          <div::menu::keyframes style={getMenuStyles()} class={placement}>
            for child of children {
              child
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* DropdownItem Component */
component DropdownItem {
  property children : Array(Html) = []
  property onClick = (event : Html.Event) : Promise(Void) { Promise.never() }
  property disabled : Bool = false

  connect ThemeStore exposing { currentTheme }

  style item {
    padding: 0.75rem 1rem;
    cursor: pointer;
    transition: background 0.2s ease;

    &:last-child {
      border-bottom: none;
    }

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  fun getItemStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom: 1px solid #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  fun render : Html {
    <div::item style={getItemStyles()} disabled={disabled} onClick={onClick}>
      for child of children {
        child
      }
    </div>
  }
}

/* Tooltip Component */
component Tooltip {
  property children : Array(Html) = []
  property content : String = ""
  property placement : String = "top"
  property delay : Number = 500

  state isVisible : Bool = false

  connect ThemeStore exposing { currentTheme }

  style tooltip {
    position: relative;
    display: inline-block;
  }

  style tooltipContent {
    position: absolute;
    background: var(--glass-bg, rgba(0, 0, 0, 0.9));
    color: var(--text-inverse, white);
    padding: 0.5rem 0.75rem;
    border-radius: 6px;
    font-size: 0.875rem;
    white-space: nowrap;
    z-index: 1000;
    opacity: 0;
    transition: opacity 0.2s ease;
    pointer-events: none;
    border: 1px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    backdrop-filter: blur(10px);
  }

  style visible {
    opacity: 1;
  }

  style top {
    bottom: 100%;
    left: 50%;
    transform: translateX(-50%);
    margin-bottom: 0.5rem;

    &::after {
      content: "";
      position: absolute;
      top: 100%;
      left: 50%;
      transform: translateX(-50%);
      border-left: 5px solid transparent;
      border-right: 5px solid transparent;
      border-top: 5px solid rgba(0, 0, 0, 0.9);
    }
  }

  style bottom {
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    margin-top: 0.5rem;

    &::after {
      content: "";
      position: absolute;
      bottom: 100%;
      left: 50%;
      transform: translateX(-50%);
      border-left: 5px solid transparent;
      border-right: 5px solid transparent;
      border-bottom: 5px solid rgba(0, 0, 0, 0.9);
    }
  }

  style left {
    right: 100%;
    top: 50%;
    transform: translateY(-50%);
    margin-right: 0.5rem;

    &::after {
      content: "";
      position: absolute;
      left: 100%;
      top: 50%;
      transform: translateY(-50%);
      border-top: 5px solid transparent;
      border-bottom: 5px solid transparent;
      border-left: 5px solid rgba(0, 0, 0, 0.9);
    }
  }

  style right {
    left: 100%;
    top: 50%;
    transform: translateY(-50%);
    margin-left: 0.5rem;

    &::after {
      content: "";
      position: absolute;
      right: 100%;
      top: 50%;
      transform: translateY(-50%);
      border-top: 5px solid transparent;
      border-bottom: 5px solid transparent;
      border-right: 5px solid rgba(0, 0, 0, 0.9);
    }
  }

  fun handleMouseEnter (event : Html.Event) : Promise(Void) {
    next { isVisible: true }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    next { isVisible: false }
  }

  fun render : Html {
    <div::tooltip
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      for child of children {
        child
      }

      <div::tooltipContent
        class="#{placement} #{if isVisible {
          "visible"
        } else {
          ""
        }}"
      >
        {
          content
        }
      </div>
    </div>
  }
}

/* Progress Component */
component Progress {
  property value : Number = 0
  property max : Number = 100
  property size : String = "md"
  property variant : String = "primary"
  property showLabel : Bool = false

  connect ThemeStore exposing { currentTheme }

  style progress {
    width: 100%;
    height: 0.75rem;
    border-radius: 9999px;
    overflow: hidden;
    backdrop-filter: blur(10px);
  }

  fun getProgressStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  style sm {
    height: 0.5rem;
  }

  style md {
    height: 0.75rem;
  }

  style lg {
    height: 1rem;
  }

  style bar {
    height: 100%;
    transition: width 0.5s ease;
    border-radius: 9999px;
  }

  style label {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.5rem;
    font-size: 0.875rem;
    font-weight: 500;
  }

  fun getBarStyles : String {
    case variant {
      "success" =>
        "
          background: #{ThemeHelpers.getSuccess(currentTheme)};
        "

      "warning" =>
        "
          background: #{ThemeHelpers.getWarning(currentTheme)};
        "

      "error" =>
        "
          background: #{ThemeHelpers.getError(currentTheme)};
        "

      _ =>
        "
          background: #{ThemeHelpers.getAccent(currentTheme)};
        "
    }
  }

  fun getLabelStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun getPercentage : Number {
    Math.min(100, Math.max(0, (value / max) * 100))
  }

  fun render : Html {
    <div>
      {
        if showLabel {
          <div::label style={getLabelStyles()}>
            <span>"Progress"</span>
            <span>"#{Number.toString(Math.floor(getPercentage()))}%"</span>
          </div>
        } else {
          <div/>
        }
      }

      <div::progress style={getProgressStyles()} class={size}>
        <div::bar
          style="#{getBarStyles()} width: #{Number.toString(getPercentage())}%;"
        />
      </div>
    </div>
  }
}

/* Accordion Component */
component Accordion {
  property title : String = ""
  property children : Array(Html) = []
  property defaultOpen : Bool = false

  state isOpen : Bool = false

  connect ThemeStore exposing { currentTheme }

  style accordion {
    border-radius: 8px;
    backdrop-filter: blur(10px);
    overflow: hidden;
  }

  fun getAccordionStyles : String {
    "
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style header {
    padding: 1rem 1.25rem;
    cursor: pointer;
    transition: all 0.2s ease;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: 600;
    user-select: none;
  }

  fun getHeaderStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      text-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  style content {
    padding: 0 1.25rem 1rem;
    animation: slideDown 0.3s ease-out;
  }

  fun getContentStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      border-top: 1px solid #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  style chevron {
    transition: transform 0.2s ease;
    font-size: 0.875rem;
  }

  style rotated {
    transform: rotate(180deg);
  }

  style keyframes {
    @keyframes slideDown {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  fun toggleAccordion (event : Html.Event) : Promise(Void) {
    next { isOpen: !isOpen }
  }

  fun render : Html {
    <div::accordion style={getAccordionStyles()}>
      <div::header style={getHeaderStyles()} onClick={toggleAccordion}>
        <span>
          {
            title
          }
        </span>

        <span::chevron
          class={
            if isOpen {
              "rotated"
            } else {
              ""
            }
          }
        >"▼"</span>
      </div>

      {
        if isOpen {
          <div::content::keyframes style={getContentStyles()}>
            for child of children {
              child
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* Divider Component */
component Divider {
  property text : String = ""
  property orientation : String = "horizontal"

  connect ThemeStore exposing { currentTheme }

  style divider {
    display: flex;
    align-items: center;
    margin: 1rem 0;
  }

  style vertical {
    flex-direction: column;
    height: 100px;
    margin: 0 1rem;
  }

  style line {
    flex: 1;
    height: 1px;
    background: linear-gradient(135deg, transparent 0%, rgba(255, 255, 255, 0.3) 50%, transparent 100%);
  }

  style verticalLine {
    width: 1px;
    flex: 1;
    background: linear-gradient(to bottom, transparent 0%, rgba(255, 255, 255, 0.3) 50%, transparent 100%);
  }

  style text {
    padding: 0 1rem;
    font-size: 0.875rem;
    font-weight: 500;
    border-radius: 4px;
    white-space: nowrap;
  }

  fun getTextStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      background: #{ThemeHelpers.getGlassBg(currentTheme)};
    "
  }

  style verticalText {
    padding: 1rem 0;
    writing-mode: vertical-rl;
    text-orientation: mixed;
  }

  fun render : Html {
    if orientation == "vertical" {
      <div::divider::vertical>
        <div::verticalLine/>

        {
          if !String.isEmpty(text) {
            <span::text::verticalText style={getTextStyles()}>
              {
                text
              }
            </span>
          } else {
            <span/>
          }
        }

        <div::verticalLine/>
      </div>
    } else {
      <div::divider>
        <div::line/>

        {
          if !String.isEmpty(text) {
            <span::text style={getTextStyles()}>
              {
                text
              }
            </span>
          } else {
            <span/>
          }
        }

        <div::line/>
      </div>
    }
  }
}
