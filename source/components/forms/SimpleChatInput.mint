/* Simple Chat Input Component */
component SimpleChatInput {
  property placeholder : String = "Type a message..."
  property onSend = (message : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state message : String = ""

  style container {
    display: flex;
    gap: 0.75rem;
    padding: 1rem;
    align-items: center;
  }

  style input {
    flex: 1;
    padding: 0.875rem 1.25rem;
    border-radius: 28px;
    border: none;
    outline: none;
    font-size: 0.9375rem;
    font-weight: 500;
    transition: all 0.2s ease;
  }

  style button {
    padding: 0.875rem 1.75rem;
    border-radius: 28px;
    border: none;
    cursor: pointer;
    font-weight: 700;
    font-size: 0.9375rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-top: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      backdrop-filter: blur(20px);
    "
  }

  fun getInputStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getButtonStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
    "
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    next { message: Dom.getValue(event.target) }
  }

  fun handleSend (event : Html.Event) : Promise(Void) {
    if !String.isEmpty(message) {
      onSend(message)
    } else {
      Promise.never()
    }
  }

  fun clearMessage (event : Html.Event) : Promise(Void) {
    next { message: "" }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <input::input
        type="text"
        placeholder={placeholder}
        value={message}
        style={getInputStyles()}
        onInput={handleInput}
      />

      <button::button style={getButtonStyles()} onClick={handleSend}>"Send"</button>
    </div>
  }
}
