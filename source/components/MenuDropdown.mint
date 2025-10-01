/* Menu Dropdown Component */
component MenuDropdown {
  property label : String = "Menu"
  property items : Array(String) = []
  property onSelect = (item : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state open : Bool = false

  fun toggle : Promise(Void) {
    next { open: !open }
  }

  fun close : Promise(Void) {
    next { open: false }
  }

  fun handleSelect (item : String) : Promise(Void) {
    onSelect(item)
  }

  style container {
    position: relative;
    display: inline-block;
  }

  style button {
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.2s ease;
  }

  style menu {
    position: absolute;
    top: 100%;
    left: 0;
    margin-top: 0.5rem;
    min-width: 200px;
    border-radius: 8px;
    padding: 0.5rem;
    z-index: 1000;
  }

  style menuItem {
    padding: 0.75rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  fun getButtonStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
    "
  }

  fun getMenuStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  fun getMenuItemStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun render : Html {
    <div::container>
      <button::button
        style={getButtonStyles()}
        onClick={(e : Html.Event) { toggle() }}
      >label</button>

      {
        if open {
          <>
            <div::menu style={getMenuStyles()}>
              for item of items {
                <div::menuItem
                  style={getMenuItemStyles()}
                  onClick={(e : Html.Event) { handleSelect(item) }}
                >item</div>
              }
            </div>

            <div
              style="position: fixed; inset: 0; z-index: 999;"
              onClick={(e : Html.Event) { close() }}
            />
          </>
        } else {
          <div/>
        }
      }
    </div>
  }
}
