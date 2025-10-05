component PageContent {
  connect NavigationStore exposing { currentPage, currentSection }

  style pageContainer {
    width: 100%;
    max-width: 1200px;
  }

  style pageTitle {
    font-size: 34px;
    font-weight: 400;
    margin: 0 0 30px;
    line-height: 1.5;
    color: #333;
  }

  style pageSection {
    font-size: 26px;
    font-weight: 400;
    margin: 52px 0 20px;
    line-height: 1.5;
    color: #333;
  }

  style pageText {
    color: rgba(52, 73, 94, 1);
    margin-top: 16px;
    font-size: 15px;
    line-height: 26px;
  }

  style codeBlock {
    background-color: #f7f8fa;
    border-radius: 20px;
    padding: 16px 20px;
    margin-top: 16px;
    font-family: monospace;
    font-size: 14px;
    color: #58727e;
  }

  fun renderPageContent : Html {
    case currentPage {
      "introduction" =>
        <IntroductionPage/>

      "home" =>
        <>
          <h1::pageTitle>"Introduction"</h1>
          <p::pageText>
            "Welcome to the Mint UI Component Library. "
            "This is a comprehensive collection of reusable components."
          </p>
          <h2::pageSection>"Getting Started"</h2>
          <p::pageText>
            "Browse through the sidebar to explore different components."
          </p>
        </>

      "quickstart" =>
        <>
          <h1::pageTitle>"Quickstart Guide"</h1>
          <p::pageText>
            "Get started quickly with our component library."
          </p>
          <div::codeBlock>
            "mint install my-component"
          </div>
        </>

      "advanced-usage" =>
        <>
          <h1::pageTitle>"Advanced Usage"</h1>
          <p::pageText>
            "Learn advanced techniques and patterns."
          </p>
          <h2::pageSection>"Custom Styling"</h2>
          <p::pageText>
            "You can customize components using CSS variables."
          </p>
        </>

      "button" =>
        <>
          <h1::pageTitle>"Button Component"</h1>
          <p::pageText>
            "Buttons allow users to take actions with a single tap."
          </p>
          <h2::pageSection>"Basic Usage"</h2>
          <div::codeBlock>
            "<button>Click me</button>"
          </div>
        </>

      "calendar" =>
        <>
          <h1::pageTitle>"Calendar Component"</h1>
          <p::pageText>
            "Calendar component for date selection."
          </p>
        </>

      "badge" =>
        <>
          <h1::pageTitle>"Badge Component"</h1>
          <p::pageText>
            "Badge is used to display notification counts or status."
          </p>
        </>

      "codes" =>
        <CodesPage/>

      "themes" =>
        <ThemePage/>

      "video-player" =>
        <VideoPlayerPage/>

      "matrix" =>
        <MatrixPage/>

      "tabs" =>
        <TabsPage/>

      "address-edit" =>
        <AddressEditPage/>

      "enter-exit" =>
        <EnterExitPage/>

      "dialog" =>
        <DialogPage/>

      "gestures" =>
        <>
          <h1::pageTitle>"Gestures Animations"</h1>
          <p::pageText>
            "Interactive gesture-based animations. Content coming soon..."
          </p>
        </>

      "scroll" =>
        <>
          <h1::pageTitle>"Scroll Animations"</h1>
          <p::pageText>
            "Scroll-triggered reveal animations. Content coming soon..."
          </p>
        </>

      "keyframes" =>
        <>
          <h1::pageTitle>"Keyframes"</h1>
          <p::pageText>
            "Complex animation sequences. Content coming soon..."
          </p>
        </>

      "transforms" =>
        <>
          <h1::pageTitle>"Transforms"</h1>
          <p::pageText>
            "Rotation, scale, and transform animations. Content coming soon..."
          </p>
        </>

      "spring" =>
        <>
          <h1::pageTitle>"Spring Physics"</h1>
          <p::pageText>
            "Physics-based spring animations. Content coming soon..."
          </p>
        </>

      "orchestration" =>
        <>
          <h1::pageTitle>"Orchestration"</h1>
          <p::pageText>
            "Stagger and sequence animations. Content coming soon..."
          </p>
        </>

      "not-found" =>
        <>
          <h1::pageTitle>"404 - Page Not Found"</h1>
          <p::pageText>
            "The page you are looking for does not exist."
          </p>
        </>

      =>
        <>
          <h1::pageTitle>{String.capitalize(currentPage)}</h1>
          <p::pageText>
            "This is the "
            {currentPage}
            " page. Content coming soon..."
          </p>
          <p::pageText>
            "Section: "
            {currentSection}
          </p>
        </>
    }
  }

  fun render : Html {
    <div::pageContainer>
      {renderPageContent()}
    </div>
  }
}
