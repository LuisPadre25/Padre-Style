/* Tag Component */
component Tag {
  property label : String = ""
  property variant : String = "default"
  property onRemove = (e : Html.Event) : Promise(Void) { Promise.never() }
  property removable : Bool = false

  connect ThemeStore exposing { currentTheme }

  style tag {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.375rem 0.875rem;
    border-radius: 8px;
    font-size: 0.8125rem;
    font-weight: 600;
    transition: all 0.2s ease;
    cursor: default;
    letter-spacing: 0.01em;
  }

  style removeBtn {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    font-size: 1.125rem;
    line-height: 1;
    transition: all 0.2s ease;
    opacity: 0.7;
    width: 18px;
    height: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
  }

  fun getTagStyles : String {
    case variant {
      "primary" =>
        "background: #{ThemeHelpers.getAccent(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)}; box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);"

      "success" =>
        "background: #{ThemeHelpers.getSuccess(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)}; box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);"

      "warning" =>
        "background: #{ThemeHelpers.getWarning(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)}; box-shadow: 0 2px 8px rgba(245, 158, 11, 0.3);"

      "error" =>
        "background: #{ThemeHelpers.getError(currentTheme)}; color: #{ThemeHelpers.getTextInverse(
          currentTheme)}; box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);"

      _ =>
        "background: #{ThemeHelpers.getGlassBg(currentTheme)}; color: #{ThemeHelpers.getTextPrimary(
          currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(
          currentTheme)};"
    }
  }

  fun render : Html {
    <span::tag style={getTagStyles()}>
      <span>label</span>

      {
        if removable {
          <button::removeBtn onClick={onRemove}>"×"</button>
        } else {
          <span/>
        }
      }
    </span>
  }
}
