/*
NavBar Examples - Demonstrates different NavBar configurations
 * Shows mobile-first responsive behavior
 * Different variants, positions, and configurations
*/
component NavBarExample {
  /* Sample menu items */
  fun getSampleMenuItems : Array(NavItem) {
    [
      {
        label: "Home",
        href: "/",
        active: true
      },
      {
        label: "Products",
        href: "/products",
        active: false
      },
      {
        label: "About",
        href: "/about",
        active: false
      },
      {
        label: "Blog",
        href: "/blog",
        active: false
      },
      {
        label: "Contact",
        href: "/contact",
        active: false
      }
    ]
  }

  style container {
    min-height: 100vh;
    background: linear-gradient(to bottom, #f9fafb, #ffffff);
  }

  style demoSection {
    padding: 80px 0 40px 0;
  }

  style sectionTitle {
    font-size: 24px;
    font-weight: 700;
    margin: 0 0 8px 0;
    color: #1f2937;
  }

  style sectionDesc {
    font-size: 14px;
    color: #6b7280;
    margin: 0 0 24px 0;
  }

  style demoContent {
    background: white;
    border-radius: 12px;
    padding: 32px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    margin-bottom: 48px;
  }

  style logoExample {
    font-size: 24px;
    font-weight: 700;
    color: #1989fa;
    text-decoration: none;
  }

  style button {
    padding: 8px 16px;
    border-radius: 6px;
    border: none;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
  }

  style buttonPrimary {
    background-color: #1989fa;
    color: white;

    &:hover {
      background-color: #1677d9;
    }
  }

  style buttonOutline {
    background-color: transparent;
    color: #1989fa;
    border: 2px solid #1989fa;

    &:hover {
      background-color: #f0f9ff;
    }
  }

  fun render : Html {
    <div::container>
      {/* Example 1: Light NavBar with logo text */}
      <NavBar
        logoText="MyBrand"
        menuItems={getSampleMenuItems()}
        variant="light"
        position="sticky"
        shadow={true}
      >
        <button::button::buttonOutline>
          {"Sign In"}
        </button>

        <button::button::buttonPrimary>
          {"Sign Up"}
        </button>
      </NavBar>

      <Container>
        <div::demoSection>
          <h2::sectionTitle>
            {"NavBar Component - Mobile First"}
          </h2>

          <p::sectionDesc>
            {"Resize your browser to see the responsive behavior: hamburger menu on mobile/tablet, horizontal menu on desktop (1024px+)"}
          </p>

          <div::demoContent>
            <Heading level="3" margin="0 0 24px 0">
              {"Features"}
            </Heading>

            <Grid cols="1" colsTablet="2" colsDesktop="3" gap="16px">
              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"📱 Mobile First"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Hamburger menu and drawer for mobile/tablet devices with smooth animations"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"🖥️ Desktop Ready"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Horizontal menu layout automatically appears on screens 1024px and wider"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"🎨 Multiple Variants"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Light, dark, primary, and transparent variants with automatic color theming"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"📌 Flexible Positioning"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Sticky, fixed, or relative positioning with backdrop blur effects"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"⚡ Touch Optimized"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"44x44px touch targets and tap feedback for optimal mobile experience"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"🎯 Customizable"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Custom logo, menu items, action buttons, and full styling control"}
                </Text>
              </div>
            </Grid>
          </div>

          <div::demoContent>
            <Heading level="3" margin="0 0 16px 0">
              {"Usage Example"}
            </Heading>

            <CodeBlock
              language="mint"
              code="/* Basic NavBar with logo and menu items */
component MyApp {
  fun getMenuItems : Array(NavItem) {
    [
      { label: \"Home\", href: \"/\", active: true },
      { label: \"Products\", href: \"/products\", active: false },
      { label: \"About\", href: \"/about\", active: false },
      { label: \"Contact\", href: \"/contact\", active: false }
    ]
  }

  fun render : Html {
    <>
      <NavBar
        logoText=\"MyBrand\"
        menuItems={getMenuItems()}
        variant=\"light\"
        position=\"sticky\"
        shadow={true}
      >
        <button>\"Sign In\"</button>
        <button>\"Sign Up\"</button>
      </NavBar>

      {/* Your page content */}
      <Section>
        {/* ... */}
      </Section>
    </>
  }
}

/* With custom logo */
<NavBar
  logo={<img src=\"/logo.png\" alt=\"Logo\" />}
  menuItems={getMenuItems()}
  variant=\"dark\"
/>

/* Transparent NavBar */
<NavBar
  logoText=\"Brand\"
  menuItems={getMenuItems()}
  variant=\"transparent\"
  transparent={true}
  shadow={false}
/>

/* Fixed position */
<NavBar
  logoText=\"Brand\"
  menuItems={getMenuItems()}
  position=\"fixed\"
/>
"
            />
          </div>

          <div::demoContent>
            <Heading level="3" margin="0 0 16px 0">
              {"Props"}
            </Heading>

            <Grid cols="1" gap="12px">
              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"logo : Html"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Custom logo component (e.g., image, icon). Use either logo or logoText"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"logoText : String"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Text-based logo. Simple and SEO-friendly"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"menuItems : Array(NavItem)"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Navigation items with label, href, and active state"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"children : Array(Html)"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Action buttons or other elements (shown on desktop, in mobile drawer)"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"variant : String"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Color variant: \"light\" (default), \"dark\", \"primary\", \"transparent\""}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"position : String"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Positioning: \"sticky\" (default), \"fixed\", \"relative\""}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"shadow : Bool"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Enable shadow (default: true)"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"transparent : Bool"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"Make background transparent (default: false)"}
                </Text>
              </Flex>

              <Flex direction="column" gap="4px">
                <Text weight="600" size="sm">
                  {"height : String"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"NavBar height (default: \"64px\")"}
                </Text>
              </Flex>
            </Grid>
          </div>

          <div::demoContent>
            <Heading level="3" margin="0 0 16px 0">
              {"Responsive Breakpoints"}
            </Heading>

            <Grid cols="1" colsTablet="3" gap="16px">
              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"📱 Mobile (< 768px)"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Hamburger menu button"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Slide-out drawer menu"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Compact logo"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• 16px horizontal padding"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"📱 Tablet (768px - 1023px)"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Still uses hamburger menu"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Larger logo"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• 24px horizontal padding"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Optimized drawer width"}
                </Text>
              </div>

              <div>
                <Text weight="600" margin="0 0 8px 0">
                  {"🖥️ Desktop (≥ 1024px)"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Horizontal menu layout"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Action buttons visible"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• Hover effects"}
                </Text>

                <Text size="sm" color="#6b7280">
                  {"• 32px horizontal padding"}
                </Text>
              </div>
            </Grid>
          </div>
        </div>
      </Container>
    </div>
  }
}
