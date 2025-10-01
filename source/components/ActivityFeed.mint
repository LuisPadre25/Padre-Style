/* Activity Feed Component */
component ActivityFeed {
  property activities : Array(String) = []
  property maxHeight : String = "400px"

  connect ThemeStore exposing { currentTheme }

  style container {
    border-radius: 12px;
    overflow: hidden;
  }

  style content {
    overflow-y: auto;
    display: flex;
    flex-direction: column;
  }

  style item {
    padding: 1rem;
    display: flex;
    gap: 1rem;
    transition: all 0.2s ease;
  }

  style dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    margin-top: 0.5rem;
    flex-shrink: 0;
  }

  style text {
    flex: 1;
    font-size: 0.875rem;
    line-height: 1.5;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getContentStyles : String {
    "max-height: #{maxHeight};"
  }

  fun getItemStyles (index : Number) : String {
    let borderStyle =
      if index < (Array.size(activities) - 1) {
        "border-bottom: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};"
      } else {
        ""
      }

    "#{borderStyle}"
  }

  fun getDotStyles : String {
    "background: #{ThemeHelpers.getAccent(currentTheme)};"
  }

  fun getTextStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::content style={getContentStyles()}>
        {
          Array.mapWithIndex(activities,
            (activity : String, index : Number) {
              <div::item style={getItemStyles(index)}>
                <div::dot style={getDotStyles()}/>
                <div::text style={getTextStyles()}>activity</div>
              </div>
            })
        }
      </div>
    </div>
  }
}
