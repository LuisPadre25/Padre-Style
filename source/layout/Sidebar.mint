component Sidebar {
  connect NavigationStore exposing { currentPage, currentSection, sidebarOpen }

  property fixed : Bool = true

  state categories : Array(SidebarCategory) = []
  state collapsedCategories : Set(String) = Set.empty()

  fun scrollToActiveItem : Void {
    `
    (() => {
      setTimeout(() => {
        const currentPath = window.location.pathname;

        // Remover clase active de todos los links
        document.querySelectorAll('.sidebar a').forEach(link => {
          link.classList.remove('active');
        });

        // Agregar clase active al link actual
        const activeLink = document.querySelector('a[href="' + currentPath + '"]');
        if (activeLink) {
          activeLink.classList.add('active');

          const parentItem = activeLink.closest('[id^="sidebar-item-"]');
          if (parentItem) {
            parentItem.scrollIntoView({ behavior: 'smooth', block: 'center' });
          }
        }
      }, 100);
    })()
    `
  }

  fun componentDidMount : Promise(Void) {
    scrollToActiveItem()
    next { categories: SidebarConfig.getCategories() }
  }

  fun componentDidUpdate : Promise(Void) {
    scrollToActiveItem()
    Promise.resolve(void)
  }


  fun toggleCategory (categoryId : String) : Promise(Void) {
    if Set.has(collapsedCategories, categoryId) {
      next { collapsedCategories: Set.delete(collapsedCategories, categoryId) }
    } else {
      next { collapsedCategories: Set.add(collapsedCategories, categoryId) }
    }
  }

  fun isCategoryCollapsed (categoryId : String) : Bool {
    Set.has(collapsedCategories, categoryId)
  }

  fun closeSidebar : Promise(Void) {
    NavigationStore.closeSidebar()
  }

  style nav {
    left: 0;
    top: 0;
    z-index: 50;
    width: 220px;
    min-width: 220px;
    max-width: 220px;
    background-color: var(--sidebar-bg, #ffffff);
    padding: 8px 0;
    position: relative;
    height: calc(100vh - 64px);
    overflow-y: auto;
    scroll-behavior: smooth;
    box-shadow: 2px 0 8px var(--shadow-color, rgba(0, 0, 0, 0.05));
    transition: all 0.3s ease;

    &::-webkit-scrollbar {
      background-color: transparent;
      width: 6px;
      height: 6px;
    }

    &::-webkit-scrollbar-thumb {
      background-color: transparent;
      border-radius: 6px;
    }

    &:hover::-webkit-scrollbar-thumb {
      background-color: rgba(69, 90, 100, 0.2);
    }

    &.fixed {
      position: fixed;
      top: 64px;
      left: 0;
      height: calc(100vh - 64px);
    }

    @media (max-width: 768px) {
      position: fixed;
      top: 64px;
      width: 220px;
      height: calc(100vh - 64px);
      z-index: 1000;
      background-color: var(--sidebar-bg, #ffffff);
      box-shadow: 2px 0 20px var(--shadow-color, rgba(0, 0, 0, 0.15));
      transition: left 0.3s ease;
    }
  }

  style sidebarOpen {
    @media (max-width: 768px) {
      left: 0;
    }
  }

  style sidebarClosed {
    @media (max-width: 768px) {
      left: -220px;
    }
  }


  style navGroup {
    margin-bottom: 16px;
    padding-left: 6px;
  }

  style navTitle {
    padding: 24px 0 8px 32px;
    color: var(--heading-color, rgba(51, 51, 51, 0.9));
    font-size: 16px;
    font-weight: 600;
    line-height: 28px;
    cursor: pointer;
    user-select: none;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: color 0.3s ease;

    &:hover {
      color: var(--primary-color, #1989fa);
    }
  }

  style categoryIcon {
    font-size: 12px;
    transition: transform 0.3s ease;
    display: inline-block;

    &.collapsed {
      transform: rotate(-90deg);
    }
  }

  style navItems {
    overflow: hidden;
    transition: max-height 0.3s ease, opacity 0.3s ease;

    &.collapsed {
      max-height: 0;
      opacity: 0;
    }

    &.expanded {
      max-height: 2000px;
      opacity: 1;
    }
  }

  style navItem {
    display: block;
  }

  style link {
    padding: 8px 12px 8px 32px;
    color: var(--sidebar-text, rgba(52, 73, 94, 1));
    margin: 2px 6px;
    font-size: 14px;
    line-height: 20px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    text-decoration: none;
    cursor: pointer;
    border-radius: 8px;
    border-left: 4px solid transparent;
    position: relative;

    &:hover {
      color: var(--primary-color, #1989fa);
      background-color: color-mix(in srgb, var(--primary-color, #1989fa) 5%, transparent);
    }

    &.active {
      color: var(--primary-color, #1989fa);
      font-weight: 700;
      background-color: color-mix(in srgb, var(--primary-color, #1989fa) 10%, transparent);
      border-left-color: var(--primary-color, #1989fa);
      box-shadow: 0 2px 8px color-mix(in srgb, var(--primary-color, #1989fa) 15%, transparent);
    }
  }

  style subtitle {
    font-size: 12px;
    margin-left: 4px;
    color: #969799;
  }

  style badge {
    margin-left: auto;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 2px 6px;
    border-radius: 8px;
    font-size: 10px;
    font-weight: 600;
    text-transform: uppercase;
  }


  fun isItemActive (item : SidebarItem) : Bool {
    currentPage == item.id
  }

  fun renderItem (item : SidebarItem) : Html {
    <div::navItem
      id={"sidebar-item-" + item.id}
      data-route={item.route}>

      <a::link
        href={item.route}
        class={
          if isItemActive(item) {
            "active"
          } else {
            ""
          }
        }
        data-item-id={item.id}
        onClick={(event : Html.Event) : Promise(Void) { closeSidebar() }}>

        <span>
          {item.label}

          if String.isNotEmpty(item.subtitle) {
            <span::subtitle>{item.subtitle}</span>
          }
        </span>

        if String.isNotEmpty(item.badge) {
          <span::badge>{item.badge}</span>
        }
      </a>
    </div>
  }

  fun renderCategory (category : SidebarCategory) : Html {
    <div::navGroup>
      <div::navTitle onClick={(event : Html.Event) : Promise(Void) { toggleCategory(category.id) }}>
        <span::categoryIcon
          class={
            if isCategoryCollapsed(category.id) {
              "collapsed"
            } else {
              ""
            }
          }>

          "▼"
        </span>

        {category.icon}
        " "
        {category.title}
      </div>

      <div::navItems
        class={
          if isCategoryCollapsed(category.id) {
            "collapsed"
          } else {
            "expanded"
          }
        }>

        for item of category.items {
          renderItem(item)
        }
      </div>
    </div>
  }

  style overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 999;
    transition: opacity 0.3s ease;

    @media (max-width: 768px) {
      display: block;
    }
  }

  style overlayVisible {
    opacity: 1;
  }

  style overlayHidden {
    opacity: 0;
    pointer-events: none;
  }

  fun render : Html {
    <>
      <div::overlay
        class={
          if sidebarOpen {
            "overlayVisible"
          } else {
            "overlayHidden"
          }
        }
        onClick={closeSidebar}></div>

      <div::nav
        class={
          "sidebar " +
          if fixed {
            "fixed"
          } else {
            ""
          } +
          " " +
          if sidebarOpen {
            "sidebarOpen"
          } else {
            "sidebarClosed"
          }
        }>

        for category of categories {
          renderCategory(category)
        }
      </div>
    </>
  }
}
