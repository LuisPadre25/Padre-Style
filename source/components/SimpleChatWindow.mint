/* Simple Chat Window Component - Composes ChatBubble and SimpleChatInput */
component SimpleChatWindow {
  property title : String = "Chat"
  property messages : Array(String) = []
  property height : String = "500px"
  property onSend = (message : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    border-radius: 12px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
  }

  style header {
    padding: 1rem 1.5rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  style messagesContainer {
    flex: 1;
    overflow-y: auto;
    padding: 1rem;
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
  }

  style status {
    font-size: 0.75rem;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackgroundPrimary(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
      height: #{height};
    "
  }

  fun getHeaderStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getMessagesContainerStyles : String {
    "background: #{ThemeHelpers.getBackgroundPrimary(currentTheme)};"
  }

  fun getStatusStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::header style={getHeaderStyles()}>
        <span>title</span>

        <div::status style={getStatusStyles()}>
          <StatusDot status="success" pulse={false}/>
          <span>"Online"</span>
        </div>
      </div>

      <div::messagesContainer style={getMessagesContainerStyles()}>
        {
          Array.mapWithIndex(messages,
            (msg : String, index : Number) {
              <ChatBubble
                message={msg}
                sender={
                  if index % 2 == 0 {
                    "User"
                  } else {
                    "Bot"
                  }
                }
                timestamp="Just now"
                isOwn={index % 2 == 0}
                avatar={
                  if index % 2 == 0 {
                    "U"
                  } else {
                    "B"
                  }
                }
              />
            })
        }
      </div>

      <SimpleChatInput onSend={onSend}/>
    </div>
  }
}
