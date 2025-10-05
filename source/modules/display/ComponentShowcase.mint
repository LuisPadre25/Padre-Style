/* ComponentShowcase - Reusable component documentation showcase */

component ComponentShowcase {
  connect ViewModeStore exposing { viewMode }

  /* Props */
  property title : String = "Component"
  property description : String = ""
  property badge : String = "Component"

  /* Preview content */
  property previewHeader : Html = Html.empty()
  property previewContent : Html = Html.empty()
  property controlsContent : Html = Html.empty()
  property hideSimulator : Bool = false

  /* Documentation */
  property usageText : String = ""
  property usageCode : CodeSnippet = { code: "", language: "mint" }
  property codeExamples : Array(UsageExample) = []
  property apiProperties : Array(ApiProperty) = []
  property additionalDocs : Html = Html.empty()
  property events : Array(ApiProperty) = []
  property methods : Array(ApiProperty) = []
  property slots : Array(ApiProperty) = []

  /* Tabs configuration */
  property enabledTabs : Array(String) = ["preview", "usage", "api"]

  /* Simulator customization */
  property mobileTitle : String = ""
  property desktopUrl : String = "localhost:3000"

  /* State */
  state activeTab : String = "preview"
  state modalOpen : Bool = false
  state activeExampleIndex : Number = -1

  /* Get tabs based on enabled tabs */
  fun getTabs : Array(TabItem) {
    let allTabs =
      [
        {
          name: "preview",
          title: "Preview",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: ""
        },
        {
          name: "usage",
          title: "Usage",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: ""
        },
        {
          name: "api",
          title: "API",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: ""
        }
      ]

    allTabs
    |> Array.select((tab : TabItem) : Bool { Array.contains(enabledTabs, tab.name) })
  }

  /* Tab change handler */
  fun handleTabChange (event : TabChangeEvent) : Promise(Void) {
    next { activeTab: event.name }
  }

  /* Modal handlers */
  fun openModal : Promise(Void) {
    next { modalOpen: true, activeExampleIndex: -1 }
  }

  fun openExampleModal (index : Number) : Promise(Void) {
    next { modalOpen: true, activeExampleIndex: index }
  }

  fun closeModal : Promise(Void) {
    next { modalOpen: false, activeExampleIndex: -1 }
  }

  fun stopPropagation (event : Html.Event) : Promise(Void) {
    `#{event}.stopPropagation()`
    Promise.resolve(void)
  }

  /* Get the preview content for the modal */
  fun getModalPreviewContent : Html {
    if activeExampleIndex >= 0 {
      /* Show example-specific preview */
      Array.at(codeExamples, activeExampleIndex)
      |> Maybe.map((example : UsageExample) : Html { example.previewContent })
      |> Maybe.withDefault(Html.empty())
    } else {
      /* Show main preview content */
      previewContent
    }
  }

  /* Check if current example should show replay button */
  fun shouldShowReplay : Bool {
    if activeExampleIndex >= 0 {
      Array.at(codeExamples, activeExampleIndex)
      |> Maybe.map((example : UsageExample) : Bool { example.showReplay })
      |> Maybe.withDefault(false)
    } else {
      false
    }
  }

  /* Render code example with index */
  fun renderCodeExample (example : UsageExample, index : Number) : Html {
    <div::codeSection>
      <div::codeHeader>
        <div>
          <h3::codeTitle>{example.title}</h3>
          if !String.isEmpty(example.description) {
            <p::exampleDescription>{example.description}</p>
          } else {
            <></>
          }
        </div>
        <button::previewButton onClick={(event : Html.Event) : Promise(Void) { openExampleModal(index) }}>
          "👁️ Preview"
        </button>
      </div>
      <CodeBlock
        code={example.snippet.code}
        language={example.snippet.language}
        showCopyButton={true}/>
    </div>
  }

  /* Styles */
  style container {
    width: 100%;
    max-width: 1200px;

    @media (max-width: 768px) {
      max-width: 100%;
      padding: 0;
    }
  }

  style pageTitle {
    font-size: 34px;
    font-weight: 400;
    margin: 0 0 12px;
    line-height: 1.5;
    color: #333;

    @media (max-width: 768px) {
      font-size: 24px;
    }
  }

  style pageSubtitle {
    color: rgba(52, 73, 94, 0.7);
    margin-bottom: 30px;
    font-size: 16px;
    line-height: 26px;
  }

  style badge {
    display: inline-block;
    padding: 4px 10px;
    background: #1989fa;
    color: #fff;
    font-size: 12px;
    border-radius: 4px;
    margin-left: 8px;
    font-weight: 500;
  }

  style playgroundSection {
    display: flex;
    flex-direction: column;
    gap: 24px;
    margin-bottom: 40px;
    align-items: center;
  }

  /* Mobile Simulator Styles */
  style simulatorFrame {
    flex: 1;
    min-width: 320px;
    max-width: 375px;
    background: white;
    border-radius: 36px;
    padding: 12px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    position: relative;
    transition: all 0.3s ease;

    @media (max-width: 768px) {
      min-width: 280px;
      max-width: 100%;
      border-radius: 24px;
      padding: 8px;
    }
  }

  style simulatorNotch {
    height: 20px;
    background: #1a1a1a;
    border-radius: 24px 24px 0 0;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  style simulatorSpeaker {
    width: 80px;
    height: 4px;
    background: #2a2a2a;
    border-radius: 2px;
  }

  style simulatorScreen {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    min-height: 640px;
    overflow-y: auto;
    overflow-x: hidden;
    border-radius: 0 0 24px 24px;
    position: relative;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    padding: 20px 16px;
  }

  style previewArea {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 200px;
  }

  style controlsCard {
    background: #fff;
    border-radius: 12px;
    padding: 16px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    margin-top: 16px;
  }

  /* Desktop Browser Styles */
  style desktopView {
    width: 100%;
    max-width: 1200px;
    border-radius: 12px;
    padding: 0;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    background: #2a2a2a;
    overflow: hidden;

    @media (max-width: 768px) {
      max-width: 100%;
      border-radius: 8px;
    }
  }

  style browserBar {
    background: #f5f5f5;
    height: 40px;
    display: flex;
    align-items: center;
    padding: 0 16px;
    gap: 8px;
    border-bottom: 1px solid #ddd;
  }

  style browserDot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
  }

  style dotRed {
    background: #ff5f56;
  }

  style dotYellow {
    background: #ffbd2e;
  }

  style dotGreen {
    background: #27c93f;
  }

  style addressBar {
    flex: 1;
    background: white;
    border: 1px solid #ddd;
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 12px;
    color: #666;
    margin-left: 12px;
  }

  style desktopScreen {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    min-height: 600px;
    padding: 60px;
    display: grid;
    grid-template-columns: 1.2fr 0.8fr;
    gap: 60px;
    align-items: center;

    @media (max-width: 1024px) {
      padding: 40px;
      gap: 40px;
    }

    @media (max-width: 768px) {
      padding: 20px;
      gap: 20px;
      grid-template-columns: 1fr;
      min-height: auto;
    }
  }

  style desktopPreviewArea {
    background: white;
    border-radius: 16px;
    padding: 80px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 480px;

    @media (max-width: 1024px) {
      padding: 40px;
      min-height: 300px;
    }

    @media (max-width: 768px) {
      padding: 24px;
      min-height: 200px;
      border-radius: 12px;
    }
    position: relative;
  }

  style desktopControlsCard {
    background: #fff;
    border-radius: 12px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-top: 0;

    @media (max-width: 768px) {
      padding: 20px;
      border-radius: 8px;
    }
  }

  /* Documentation Styles */
  style docCard {
    background: #fff;
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 24px;

    @media (max-width: 768px) {
      padding: 20px;
      border-radius: 12px;
    }
  }

  style docTitle {
    font-size: 20px;
    font-weight: 600;
    color: #323233;
    margin: 0 0 16px;
  }

  style docText {
    font-size: 15px;
    line-height: 1.6;
    color: #646566;
    margin: 0;
  }

  style table {
    width: 100%;
    border-collapse: collapse;
    margin: 16px 0;
    overflow-x: auto;
    display: block;

    @media (max-width: 768px) {
      font-size: 13px;
    }
  }

  style tableHeader {
    background: #f7f8fa;
    text-align: left;
    padding: 12px;
    font-weight: 600;
    color: #323233;
    border-bottom: 2px solid #ebedf0;
  }

  style tableCell {
    padding: 12px;
    border-bottom: 1px solid #ebedf0;
    color: #646566;
  }

  style codeInline {
    background: #f7f8fa;
    padding: 2px 8px;
    border-radius: 4px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #d63200;
  }

  style codeSection {
    background: #fff;
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 40px;
  }

  style codeHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 16px;
  }

  style codeTitle {
    font-size: 16px;
    font-weight: 600;
    color: #323233;
    margin: 0 0 4px;
  }

  style exampleDescription {
    font-size: 14px;
    color: #646566;
    margin: 4px 0 0;
    line-height: 1.5;
  }

  style previewButton {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 8px 16px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }

    &:active {
      transform: translateY(0);
    }
  }

  /* Modal Styles */
  style modalOverlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(4px);
    z-index: 9999;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    animation: fadeIn 0.2s ease;

    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }
  }

  style modalContent {
    background: white;
    border-radius: 20px;
    max-width: 1200px;
    width: 100%;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    position: relative;
    animation: slideUp 0.3s ease;

    @keyframes slideUp {
      from {
        transform: translateY(30px);
        opacity: 0;
      }

      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    @media (max-width: 768px) {
      max-width: 100%;
      max-height: 95vh;
      border-radius: 16px;
    }
  }

  style modalHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 24px 32px;
    border-bottom: 1px solid #ebedf0;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 20px 20px 0 0;

    @media (max-width: 768px) {
      padding: 20px;
      border-radius: 16px 16px 0 0;
    }
  }

  style modalTitle {
    font-size: 20px;
    font-weight: 600;
    color: white;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  style modalCloseButton {
    background: rgba(255, 255, 255, 0.2);
    border: none;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    color: white;
    font-size: 20px;
    font-weight: bold;

    &:hover {
      background: rgba(255, 255, 255, 0.3);
      transform: rotate(90deg);
    }
  }

  style modalBody {
    padding: 32px;

    @media (max-width: 768px) {
      padding: 20px;
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <h1::pageTitle>
        {title}
        <span::badge>{badge}</span>
      </h1>

      <p::pageSubtitle>
        {description}
      </p>

      /* Tab Navigation */
      <Tabs
        tabs={getTabs()}
        active={activeTab}
        type="line"
        color="#1989fa"
        titleActiveColor="#1989fa"
        titleInactiveColor="#646566"
        border={true}
        lineWidth="60px"
        lineHeight="3px"
        duration={200}
        onChange={handleTabChange}/>

      /* Tab Content */
      if activeTab == "preview" {
        <div>
          /* Preview Header (optional content before simulator) */
          {previewHeader}

          if hideSimulator {
            /* No simulator - direct preview */
            <div::playgroundSection>
              <div::previewArea>
                {previewContent}
              </div>
              <div::controlsCard>
                {controlsContent}
              </div>
            </div>
          } else {
            <div::playgroundSection>
              /* Mobile/Desktop Simulator */
              if viewMode == "mobile" {
            <div::simulatorFrame>
              <div::simulatorNotch>
                <div::simulatorSpeaker/>
              </div>
              <div::simulatorScreen>
                /* Preview Area */
                <div::previewArea>
                  {previewContent}
                </div>

                /* Controls INSIDE Phone */
                <div::controlsCard>
                  {controlsContent}
                </div>
              </div>
            </div>
          } else {
            <div::simulatorFrame::desktopView>
              /* Browser Bar */
              <div::browserBar>
                <div::browserDot::dotRed/>
                <div::browserDot::dotYellow/>
                <div::browserDot::dotGreen/>
                <div::addressBar>
                  "🔒 " + if String.isEmpty(desktopUrl) {
                    "localhost:3000"
                  } else {
                    desktopUrl
                  }
                </div>
              </div>

              <div::simulatorScreen::desktopScreen>
                /* LEFT: Preview Area */
                <div::desktopPreviewArea>
                  {previewContent}
                </div>

                /* RIGHT: Controls */
                <div::desktopControlsCard>
                  {controlsContent}
                </div>
              </div>
            </div>
          }
            </div>
          }
        </div>
      } else if activeTab == "usage" {
        <div>
          if !String.isEmpty(usageText) {
            <div::docCard>
              <h3::docTitle>"Usage"</h3>
              <p::docText>
                {usageText}
              </p>
            </div>
          } else {
            <></>
          }

          /* Single code example (backward compatible) */
          if !String.isEmpty(usageCode.code) {
            <div::codeSection>
              <div::codeHeader>
                <h3::codeTitle>"Code Example"</h3>
                <button::previewButton onClick={openModal}>
                  "👁️ Preview"
                </button>
              </div>
              <CodeBlock
                code={usageCode.code}
                language={usageCode.language}
                showCopyButton={true}/>
            </div>
          } else {
            <></>
          }

          /* Multiple code examples */
          {
            Array.mapWithIndex(
              codeExamples,
              (example : UsageExample, index : Number) : Html { renderCodeExample(example, index) })
          }

          {additionalDocs}
        </div>
      } else if activeTab == "api" {
        <div>
          /* Props table */
          if !Array.isEmpty(apiProperties) {
            <div::docCard>
              <h3::docTitle>"Props"</h3>
              <table::table>
                <thead>
                  <tr>
                    <th::tableHeader>"Property"</th>
                    <th::tableHeader>"Description"</th>
                    <th::tableHeader>"Type"</th>
                    <th::tableHeader>"Default"</th>
                  </tr>
                </thead>
                <tbody>
                  for prop of apiProperties {
                    <tr>
                      <td::tableCell><code::codeInline>{prop.name}</code></td>
                      <td::tableCell>{prop.description}</td>
                      <td::tableCell>{prop.type}</td>
                      <td::tableCell>{prop.defaultValue}</td>
                    </tr>
                  }
                </tbody>
              </table>
            </div>
          } else {
            <></>
          }

          /* Events table */
          if !Array.isEmpty(events) {
            <div::docCard>
              <h3::docTitle>"Events"</h3>
              <table::table>
                <thead>
                  <tr>
                    <th::tableHeader>"Event"</th>
                    <th::tableHeader>"Description"</th>
                    <th::tableHeader>"Arguments"</th>
                    <th::tableHeader>"Type"</th>
                  </tr>
                </thead>
                <tbody>
                  for event of events {
                    <tr>
                      <td::tableCell><code::codeInline>{event.name}</code></td>
                      <td::tableCell>{event.description}</td>
                      <td::tableCell>{event.type}</td>
                      <td::tableCell>{event.defaultValue}</td>
                    </tr>
                  }
                </tbody>
              </table>
            </div>
          } else {
            <></>
          }

          /* Methods table */
          if !Array.isEmpty(methods) {
            <div::docCard>
              <h3::docTitle>"Methods"</h3>
              <table::table>
                <thead>
                  <tr>
                    <th::tableHeader>"Method"</th>
                    <th::tableHeader>"Description"</th>
                    <th::tableHeader>"Parameters"</th>
                    <th::tableHeader>"Returns"</th>
                  </tr>
                </thead>
                <tbody>
                  for method of methods {
                    <tr>
                      <td::tableCell><code::codeInline>{method.name}</code></td>
                      <td::tableCell>{method.description}</td>
                      <td::tableCell>{method.type}</td>
                      <td::tableCell>{method.defaultValue}</td>
                    </tr>
                  }
                </tbody>
              </table>
            </div>
          } else {
            <></>
          }

          /* Slots table */
          if !Array.isEmpty(slots) {
            <div::docCard>
              <h3::docTitle>"Slots"</h3>
              <table::table>
                <thead>
                  <tr>
                    <th::tableHeader>"Slot"</th>
                    <th::tableHeader>"Description"</th>
                    <th::tableHeader>"Type"</th>
                    <th::tableHeader>"Default"</th>
                  </tr>
                </thead>
                <tbody>
                  for slot of slots {
                    <tr>
                      <td::tableCell><code::codeInline>{slot.name}</code></td>
                      <td::tableCell>{slot.description}</td>
                      <td::tableCell>{slot.type}</td>
                      <td::tableCell>{slot.defaultValue}</td>
                    </tr>
                  }
                </tbody>
              </table>
            </div>
          } else {
            <></>
          }

          {additionalDocs}
        </div>
      } else {
        <div>
          {additionalDocs}
        </div>
      }

      /* Preview Modal */
      if modalOpen {
        <div::modalOverlay onClick={closeModal}>
          <div::modalContent onClick={stopPropagation}>
            <div::modalHeader>
              <h3::modalTitle>
                "👁️ Live Preview"
              </h3>
              <button::modalCloseButton onClick={closeModal}>
                "×"
              </button>
            </div>
            <div::modalBody>
              /* Simple preview without simulator - just the component */
              <div::playgroundSection>
                <div style="background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%); padding: 40px; border-radius: 16px; display: flex; align-items: center; justify-content: center; min-height: 400px;">
                  {getModalPreviewContent()}
                </div>
              </div>
            </div>
          </div>
        </div>
      } else {
        <></>
      }
    </div>
  }
}
