/* Live Indicator Component - Reuses StatusDot */
component LiveIndicator {
  property isLive : Bool = true
  property label : String = "LIVE"
  property showPulse : Bool = true

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.375rem 0.75rem;
    border-radius: 6px;
    font-weight: 600;
    font-size: 0.875rem;
  }

  fun getLiveStyles : String {
    "background: rgba(239, 68, 68, 0.1); color: #ef4444; border: 1px solid rgba(239, 68, 68, 0.3);"
  }

  fun getOfflineStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)}; color: #{ThemeHelpers.getTextSecondary(
      currentTheme)}; border: 1px solid #{ThemeHelpers.getBorderPrimary(
      currentTheme)};"
  }

  fun getContainerStyles : String {
    if isLive {
      getLiveStyles()
    } else {
      getOfflineStyles()
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        if isLive {
          <StatusDot status="error" pulse={showPulse}/>
        } else {
          <StatusDot status="default" pulse={false}/>
        }
      }

      <span>label</span>
    </div>
  }
}
