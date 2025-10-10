/*
NavBar - Professional Responsive Navigation Bar
 * Mobile-first design with hamburger menu
 * Works in emulators and standalone
 * Uses Flex, Container, Icon components from library
*/
component NavBar {
  connect ViewModeStore exposing { viewMode }

  /* Content */
  property logo : Html = <></>

  property logoText : String = ""
  property menuItems : Array(NavItem) = []
  property children : Array(Html) = []

  /* Style */
  property variant : String = "light"

  property height : String = "64px"

  /* Container */
  property fluid : Bool = false

  /* State */
  state isMenuOpen : Bool = false

  /* Toggle mobile menu */
  fun toggleMenu : Promise(Void) {
    next { isMenuOpen: !isMenuOpen }
  }

  /* Close menu */
  fun closeMenu : Promise(Void) {
    next { isMenuOpen: false }
  }

  /* Handle menu item click */
  fun handleItemClick (event : Html.Event) : Promise(Void) {
    closeMenu()
  }

  /* Get background color based on variant */
  fun getBgColor : String {
    case variant {
      "primary" => "#1989fa"
      "dark" => "#1f2937"
      "light" => "#ffffff"
      "transparent" => "transparent"
      => "#ffffff"
    }
  }

  /* Get text color based on variant */
  fun getTextColor : String {
    case variant {
      "primary" => "#ffffff"
      "dark" => "#ffffff"
      "light" => "#1f2937"
      "transparent" => "#1f2937"
      => "#1f2937"
    }
  }

  /* Check if should show mobile view */
  fun isMobileView : Bool {
    viewMode == "mobile" || viewMode == "tablet"
  }

  /* Styles */
  style navbar {
    position: relative;
    width: 100%;
    height: #{height};
    background-color: #{getBgColor()};
    color: #{getTextColor()};
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    z-index: 100;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    display: flex;
    align-items: center;
  }

  style mobileMenuPortal {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    pointer-events: none;
    z-index: 997;

    if isMenuOpen {
      pointer-events: auto;
    }
  }

  style logoText {
    font-size: 18px;
    font-weight: 700;
    color: inherit;
    text-decoration: none;
    margin: 0;
  }

  style menuLink {
    color: inherit;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 500;
    transition: background-color 0.2s ease;
    white-space: nowrap;

    &:hover {
      background-color: rgba(0, 0, 0, 0.06);
    }
  }

  style menuLinkActive {
    color: inherit;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    transition: background-color 0.2s ease;
    white-space: nowrap;
    background-color: rgba(0, 0, 0, 0.1);

    &:hover {
      background-color: rgba(0, 0, 0, 0.12);
    }
  }

  /* Mobile overlay - covers entire previewWrapper */
  style overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1;
    opacity: 0;
    transition: opacity 0.3s cubic-bezier(0.4, 0, 0.2, 1);

    if isMenuOpen {
      opacity: 1;
    }
  }

  /* Mobile drawer - full height from top */
  style drawer {
    position: absolute;
    top: 0;
    right: 0;
    width: 280px;
    max-width: 85%;
    height: 100%;
    background-color: #{getBgColor()};
    box-shadow: -4px 0 16px rgba(0, 0, 0, 0.2);
    z-index: 2;
    transform: translateX(100%);
    transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    overflow-y: auto;
    padding: 80px 20px 24px;
    display: flex;
    flex-direction: column;
    gap: 8px;

    if isMenuOpen {
      transform: translateX(0);
    }
  }

  style drawerLink {
    color: inherit;
    text-decoration: none;
    padding: 14px 16px;
    border-radius: 10px;
    font-size: 16px;
    font-weight: 500;
    display: flex;
    align-items: center;
    transition: all 0.2s ease;

    &:active {
      background-color: rgba(0, 0, 0, 0.08);
      transform: scale(0.98);
    }
  }

  style drawerLinkActive {
    color: inherit;
    text-decoration: none;
    padding: 14px 16px;
    border-radius: 10px;
    font-size: 16px;
    font-weight: 600;
    display: flex;
    align-items: center;
    transition: all 0.2s ease;
    background-color: rgba(0, 0, 0, 0.1);

    &:active {
      background-color: rgba(0, 0, 0, 0.12);
      transform: scale(0.98);
    }
  }

  style drawerDivider {
    margin: 16px 0;
    border-top: 1px solid rgba(0, 0, 0, 0.08);
  }

  style drawerActions {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  /* Render logo */
  fun renderLogo : Html {
    if String.isNotEmpty(logoText) {
      <a::logoText href="/">
        <Text weight="700" size="lg" color="inherit">
          {
            logoText
          }
        </Text>
      </a>
    } else {
      logo
    }
  }

  /* Render desktop menu */
  fun renderDesktopMenu : Html {
    <>
      for item of menuItems {
        if item.active {
          <a::menuLinkActive href={item.href}>
            {
              item.label
            }
          </a>
        } else {
          <a::menuLink href={item.href}>
            {
              item.label
            }
          </a>
        }
      }
    </>
  }

  /* Render mobile drawer */
  fun renderMobileDrawer : Html {
    <>
      <div::overlay onClick={closeMenu}/>

      <div::drawer>
        for item of menuItems {
          if item.active {
            <a::drawerLinkActive href={item.href} onClick={handleItemClick}>
              {
                item.label
              }
            </a>
          } else {
            <a::drawerLink href={item.href} onClick={handleItemClick}>
              {
                item.label
              }
            </a>
          }
        }

        if !Array.isEmpty(children) {
          <>
            <div::drawerDivider/>

            <div::drawerActions>
              for child of children {
                child
              }
            </div>
          </>
        }
      </div>
    </>
  }

  /* Main render */
  fun render : Html {
    <>
      <header::navbar>
        <Container fluid={fluid}>
          <Flex justify="space-between" align="center" gap="16px">
            {
              renderLogo()
            }

            if isMobileView() {
              /* Mobile: Show hamburger button */
              <Icon
                name={
                  if isMenuOpen {
                    "x"
                  } else {
                    "menu"
                  }
                }
                size="md"
                clickable={true}
                onClick={(e : IconClickEvent) : Promise(Void) { toggleMenu() }}
              />
            } else {
              /* Desktop: Show horizontal menu */
              <>
                <Flex justify="center" align="center" gap="8px">
                  {
                    renderDesktopMenu()
                  }
                </Flex>

                if !Array.isEmpty(children) {
                  <Flex align="center" gap="12px">
                    for child of children {
                      child
                    }
                  </Flex>
                }
              </>
            }
          </Flex>
        </Container>
      </header>

      if isMobileView() {
        <div::mobileMenuPortal>
          {
            renderMobileDrawer()
          }
        </div>
      }
    </>
  }
}
