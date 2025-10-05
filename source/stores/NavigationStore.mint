store NavigationStore {
  state currentPage : String = "home"
  state currentSection : String = "Essentials"
  state sidebarOpen : Bool = false

  fun setPage (page : String) : Promise(Void) {
    next { currentPage: page }
  }

  fun setSection (section : String) : Promise(Void) {
    next { currentSection: section }
  }

  fun setPageAndSection (page : String, section : String) : Promise(Void) {
    next {
      currentPage: page,
      currentSection: section
    }
  }

  fun toggleSidebar : Promise(Void) {
    next { sidebarOpen: !sidebarOpen }
  }

  fun closeSidebar : Promise(Void) {
    next { sidebarOpen: false }
  }
}
