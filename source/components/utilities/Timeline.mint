/* Timeline Component */
component Timeline {
  property items : Array(String) = []

  connect ThemeStore exposing { currentTheme }

  style timeline {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    padding-left: 2rem;
    position: relative;
  }

  style item {
    position: relative;
  }

  style dot {
    position: absolute;
    left: -2rem;
    top: 0.25rem;
    width: 12px;
    height: 12px;
    border-radius: 50%;
  }

  style line {
    position: absolute;
    left: calc(-2rem + 5px);
    top: calc(0.25rem + 12px);
    width: 2px;
    height: calc(100% + 1.5rem);
  }

  fun getDotStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getAccent(currentTheme)};
    "
  }

  fun getLineStyles : String {
    "background: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  fun render : Html {
    <div::timeline>
      {
        let indexedItems =
          Array.mapWithIndex(items,
            (item : String, index : Number) : Html {
              <div::item>
                <div::dot style={getDotStyles()}/>

                {
                  if index < Array.size(items) - 1 {
                    <div::line style={getLineStyles()}/>
                  } else {
                    <div/>
                  }
                }

                <div>
                  {
                    item
                  }
                </div>
              </div>
            })

        for item of indexedItems {
          item
        }
      }
    </div>
  }
}
