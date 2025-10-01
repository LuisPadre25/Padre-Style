/* Dynamic Theme-Aware Button Component */
component DynamicButton {
  property children : Array(Html) = []
  property onClick = (event : Html.Event) : Promise(Void) { Promise.never() }
  property variant : String = "primary"

  connect ThemeStore exposing { currentTheme }

  style button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-family: inherit;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform: translateY(0px);

    &:hover {
      transform: translateY(-3px);
    }

    &:active {
      transform: translateY(0px) scale(0.98);
      transition: all 0.1s ease;
    }

    &:focus {
      outline: 2px solid rgba(102, 126, 234, 0.6);
      outline-offset: 2px;
    }
  }

  fun getButtonStyles : String {
    case variant {
      "secondary" =>
        "
          background: #{ThemeHelpers.getGlassBg(currentTheme)};
          color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "

      "success" =>
        "
          background: #{ThemeHelpers.getSuccess(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "

      _ =>
        "
          background: #{ThemeHelpers.getAccent(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "
    }
  }

  fun render : Html {
    <button::button style={getButtonStyles()} onClick={onClick}>
      for child of children {
        child
      }
    </button>
  }
}
