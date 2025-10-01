/* Simple Accordion Component */
component SimpleAccordion {
  property title : String = ""
  property children : Array(Html) = []
  property defaultOpen : Bool = false

  connect ThemeStore exposing { currentTheme }

  state open : Bool = false

  fun toggle : Promise(Void) {
    next { open: !open }
  }

  style item {
    border-radius: 8px;
    margin-bottom: 0.5rem;
    overflow: hidden;
  }

  style header {
    padding: 1rem 1.5rem;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  style content {
    padding: 0 1.5rem 1rem 1.5rem;
  }

  fun getItemStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getHeaderStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      font-weight: 600;
    "
  }

  fun render : Html {
    <div::item style={getItemStyles()}>
      <div::header
        style={getHeaderStyles()}
        onClick={(e : Html.Event) { toggle() }}
      >
        <span>title</span>

        <span>
          {
            if open {
              "▼"
            } else {
              "▶"
            }
          }
        </span>
      </div>

      {
        if open {
          <div::content>
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
