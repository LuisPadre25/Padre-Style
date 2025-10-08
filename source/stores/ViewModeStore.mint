store ViewModeStore {
  state viewMode : String = "desktop"

  fun setViewMode (mode : String) : Promise(Void) {
    next { viewMode: mode }
  }

  fun toggleViewMode : Promise(Void) {
    case viewMode {
      "mobile" => next { viewMode: "tablet" }
      "tablet" => next { viewMode: "desktop" }
      => next { viewMode: "mobile" }
    }
  }

  fun isMobileView : Bool {
    viewMode == "mobile"
  }

  fun isTabletView : Bool {
    viewMode == "tablet"
  }

  fun isDesktopView : Bool {
    viewMode == "desktop"
  }

  fun getViewportWidth : String {
    case viewMode {
      "mobile" => "375px"
      "tablet" => "768px"
      => "100%"
    }
  }

  fun getViewportLabel : String {
    case viewMode {
      "mobile" => "📱 Mobile (375px)"
      "tablet" => "📱💻 Tablet (768px)"
      => "🖥️ Desktop (1024px+)"
    }
  }
}
