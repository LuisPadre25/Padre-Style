/* Chat Bubble Component */
component ChatBubble {
  property message : String = ""
  property sender : String = ""
  property timestamp : String = ""
  property isOwn : Bool = false
  property avatar : String = ""

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.75rem;
    margin-bottom: 1rem;
  }

  style bubble {
    max-width: 70%;
    padding: 0.875rem 1.125rem;
    border-radius: 16px;
    word-wrap: break-word;
    position: relative;
    backdrop-filter: blur(10px);
    transition: all 0.2s ease;
  }

  style header {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: 0.25rem;
    font-size: 0.75rem;
    font-weight: 600;
  }

  style message {
    font-size: 0.875rem;
    line-height: 1.5;
  }

  style timestamp {
    font-size: 0.7rem;
    opacity: 0.6;
    margin-top: 0.25rem;
  }

  style avatar {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 0.875rem;
    flex-shrink: 0;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.2s ease;
  }

  fun getContainerStyles : String {
    if isOwn {
      "flex-direction: row-reverse;"
    } else {
      "flex-direction: row;"
    }
  }

  fun getBubbleStyles : String {
    if isOwn {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        border-bottom-right-radius: 6px;
        box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
      "
    } else {
      "
        background: #{ThemeHelpers.getElevated(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
        border-bottom-left-radius: 6px;
        box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
      "
    }
  }

  fun getAvatarStyles : String {
    if isOwn {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        border: 2px solid rgba(102, 126, 234, 0.3);
      "
    } else {
      "
        background: #{ThemeHelpers.getSurface(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      "
    }
  }

  fun getTimestampStyles : String {
    if isOwn {
      "text-align: right;"
    } else {
      "text-align: left;"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        if !String.isEmpty(avatar) {
          <div::avatar style={getAvatarStyles()}>avatar</div>
        } else {
          <div/>
        }
      }

      <div>
        <div::bubble style={getBubbleStyles()}>
          {
            if !String.isEmpty(sender) {
              <div::header>sender</div>
            } else {
              <div/>
            }
          }

          <div::message>message</div>
        </div>

        {
          if !String.isEmpty(timestamp) {
            <div::timestamp style={getTimestampStyles()}>timestamp</div>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}
