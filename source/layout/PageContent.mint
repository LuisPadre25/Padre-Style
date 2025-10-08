component PageContent {
  connect NavigationStore exposing { currentPage, currentSection }

  style pageContainer {
    width: 100%;
    max-width: 1200px;
  }

  style codeBlock {
    background-color: var(--code-bg, var(--card-bg));
    border-radius: 20px;
    padding: 16px 20px;
    margin-top: 16px;
    font-family: var(--font-code);
    font-size: 14px;
    color: var(--text-color);
  }

  fun renderPageContent : Html {
    case currentPage {
      "introduction" => <IntroductionPage/>

      "home" =>
        <>
          <Heading level="1" margin="0 0 30px">"Introduction"</Heading>

          <Text margin="16px 0">
            "Welcome to the Mint UI Component Library. "
            "This is a comprehensive collection of reusable components."
          </Text>

          <Heading level="2" margin="52px 0 20px">"Getting Started"</Heading>

          <Text margin="16px 0">
            "Browse through the sidebar to explore different components."
          </Text>
        </>

      "quickstart" =>
        <>
          <Heading level="1" margin="0 0 30px">"Quickstart Guide"</Heading>

          <Text margin="16px 0">
            "Get started quickly with our component library."
          </Text>

          <div::codeBlock>"mint install my-component"</div>
        </>

      "advanced-usage" =>
        <>
          <Heading level="1" margin="0 0 30px">"Advanced Usage"</Heading>
          <Text margin="16px 0">"Learn advanced techniques and patterns."</Text>
          <Heading level="2" margin="52px 0 20px">"Custom Styling"</Heading>

          <Text margin="16px 0">
            "You can customize components using CSS variables."
          </Text>
        </>

      "avatar" => <AvatarPage/>

      "icon" => <IconPage/>

      "button" =>
        <>
          <Heading level="1" margin="0 0 30px">"Button Component"</Heading>

          <Text margin="16px 0">
            "Buttons allow users to take actions with a single tap."
          </Text>

          <Heading level="2" margin="52px 0 20px">"Basic Usage"</Heading>
          <div::codeBlock>"<button>Click me</button>"</div>
        </>

      "grid-layout" => <LayoutPage/>

      "flex" => <FlexPage/>

      "container" => <ContainerPage/>

      "typography" => <TypographyPage/>

      "calendar" =>
        <>
          <Heading level="1" margin="0 0 30px">"Calendar Component"</Heading>
          <Text margin="16px 0">"Calendar component for date selection."</Text>
        </>

      "badge" => <BadgePage/>

      "chip" => <ChipPage/>

      "status-dot" => <StatusDotPage/>

      "circle-progress" => <CircleProgressPage/>

      "collapse" => <CollapsePage/>

      "codes" => <CodesPageNew/>

      "themes" => <ThemePage/>

      "video-player" => <VideoPlayerPage/>

      "matrix" => <MatrixPage/>

      "tabs" => <TabsPage/>

      "address-edit" => <AddressEditPage/>

      "enter-exit" => <EnterExitPage/>

      "dialog" => <DialogPage/>

      "gestures" =>
        <>
          <Heading level="1" margin="0 0 30px">"Gestures Animations"</Heading>

          <Text margin="16px 0">
            "Interactive gesture-based animations. Content coming soon..."
          </Text>
        </>

      "scroll" =>
        <>
          <Heading level="1" margin="0 0 30px">"Scroll Animations"</Heading>

          <Text margin="16px 0">
            "Scroll-triggered reveal animations. Content coming soon..."
          </Text>
        </>

      "keyframes" =>
        <>
          <Heading level="1" margin="0 0 30px">"Keyframes"</Heading>

          <Text margin="16px 0">
            "Complex animation sequences. Content coming soon..."
          </Text>
        </>

      "transforms" =>
        <>
          <Heading level="1" margin="0 0 30px">"Transforms"</Heading>

          <Text margin="16px 0">
            "Rotation, scale, and transform animations. Content coming soon..."
          </Text>
        </>

      "spring" =>
        <>
          <Heading level="1" margin="0 0 30px">"Spring Physics"</Heading>

          <Text margin="16px 0">
            "Physics-based spring animations. Content coming soon..."
          </Text>
        </>

      "orchestration" =>
        <>
          <Heading level="1" margin="0 0 30px">"Orchestration"</Heading>

          <Text margin="16px 0">
            "Stagger and sequence animations. Content coming soon..."
          </Text>
        </>

      "not-found" =>
        <>
          <Heading level="1" margin="0 0 30px">"404 - Page Not Found"</Heading>
          <Text margin="16px 0">"The page you are looking for does not exist."</Text>
        </>

      =>
        <>
          <Heading level="1" margin="0 0 30px">
            {
              String.capitalize(currentPage)
            }
          </Heading>

          <Text margin="16px 0">
            "This is the "

            {
              currentPage
            }

            " page. Content coming soon..."
          </Text>

          <Text margin="16px 0">
            "Section: "

            {
              currentSection
            }
          </Text>
        </>
    }
  }

  fun render : Html {
    <div::pageContainer>
      {
        renderPageContent()
      }
    </div>
  }
}
