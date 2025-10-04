/* Dynamic Theme-Aware Card Component */
component DynamicCard {
  property children : Array(Html) = []
  property padding : String = "1.5rem"
  property title : String = ""

  connect ThemeStore exposing { currentTheme }

  style card {
    border-radius: 12px;
    padding: #{padding};
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform: translateY(0px) scale(1);
    backdrop-filter: blur(10px);

    &:hover {
      transform: translateY(-6px) scale(1.02);
    }
  }

  fun getCardStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun render : Html {
    <div::card style={getCardStyles()}>
      {
        if !String.isEmpty(title) {
          <h3
            style="
            margin: 0 0 1rem 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          "
          >title</h3>
        } else {
          <div/>
        }
      }

      for child of children {
        child
      }
    </div>
  }
}
