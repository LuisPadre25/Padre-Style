/* Breadcrumbs Component */
component Breadcrumbs {
  property items : Array(String) = []
  property separator : String = "/"

  property onItemClick =
    (item : String, index : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.75rem 1rem;
  }

  style item {
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 0.875rem;
  }

  style separator {
    opacity: 0.5;
    font-size: 0.875rem;
    user-select: none;
  }

  style lastItem {
    font-weight: 600;
    cursor: default;
    font-size: 0.875rem;
  }

  fun getItemStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun getLastItemStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getSeparatorStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun render : Html {
    <nav::container>
      {
        Array.mapWithIndex(items,
          (item : String, index : Number) {
            let isLast =
              index == (Array.size(items) - 1)

            if isLast {
              <span::lastItem style={getLastItemStyles()}>item</span>
            } else {
              <>
                <span::item
                  style={getItemStyles()}
                  onClick={(e : Html.Event) { onItemClick(item, index) }}
                >item</span>

                <span::separator style={getSeparatorStyles()}>separator</span>
              </>
            }
          })
      }
    </nav>
  }
}
