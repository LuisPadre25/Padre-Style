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
    width: 0.75rem;
    height: 0.75rem;
    border-radius: 50%;
  }

  style line {
    position: absolute;
    left: -1.625rem;
    top: 1rem;
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
