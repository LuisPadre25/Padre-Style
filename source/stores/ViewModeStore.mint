store ViewModeStore {
  state viewMode : String = "desktop"

  fun setViewMode (mode : String) : Promise(Void) {
    next { viewMode: mode }
  }

  fun toggleViewMode : Promise(Void) {
    if viewMode == "desktop" {
      next { viewMode: "mobile" }
    } else {
      next { viewMode: "desktop" }
    }
  }

  fun isMobileView : Bool {
    viewMode == "mobile"
  }

  fun isDesktopView : Bool {
    viewMode == "desktop"
  }
}
