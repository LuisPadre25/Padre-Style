/* Chip Component */
component Chip {
  property label : String = ""
  property variant : String = "default"
  property onClose = (e : Html.Event) : Promise(Void) { Promise.never() }
  property closable : Bool = false

  connect ThemeStore exposing { currentTheme }

  style chip {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.375rem 0.75rem;
    border-radius: 9999px;
    font-size: 0.875rem;
    font-weight: 500;
  }

  style closeBtn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    font-size: 1rem;
    line-height: 1;
  }

  fun getChipStyles : String {
    case variant {
      "primary" =>
        "background: #{ThemeHelpers.getAccent(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)};"

      "success" =>
        "background: #{ThemeHelpers.getSuccess(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)};"

      _ =>
        "background: #{ThemeHelpers.getGlassBg(currentTheme)}; color: #{ThemeHelpers.getTextPrimary(
          currentTheme)}; border: 1px solid #{ThemeHelpers.getBorderPrimary(
          currentTheme)};"
    }
  }

  fun render : Html {
    <span::chip style={getChipStyles()}>
      <span>label</span>

      {
        if closable {
          <button::closeBtn onClick={onClose}>"×"</button>
        } else {
          <span/>
        }
      }
    </span>
  }
}
