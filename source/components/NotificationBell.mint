/* Notification Bell Component - Reuses Badge */
component NotificationBell {
  property count : Number = 0
  property showBadge : Bool = true
  property onClick = (e : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    display: inline-flex;
    cursor: pointer;
  }

  style bell {
    font-size: 1.5rem;
    padding: 0.5rem;
    border-radius: 8px;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  style badge {
    position: absolute;
    top: -4px;
    right: -4px;
    min-width: 20px;
    height: 20px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.75rem;
    font-weight: 700;
    padding: 0 0.375rem;
  }

  fun getBellStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  fun getBadgeStyles : String {
    "
      background: #ef4444;
      color: white;
      box-shadow: 0 0 0 2px #{ThemeHelpers.getBackgroundPrimary(currentTheme)};
    "
  }

  fun render : Html {
    <div::container onClick={onClick}>
      <div::bell style={getBellStyles()}>"🔔"</div>

      {
        if showBadge && count > 0 {
          <div::badge style={getBadgeStyles()}>
            {
              if count > 99 {
                "99+"
              } else {
                Number.toString(count)
              }
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
