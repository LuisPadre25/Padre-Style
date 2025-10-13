/* ComponentShowcase - Reusable component documentation showcase */
component ComponentShowcase {
  connect ViewModeStore exposing { viewMode }
  connect ThemeStore exposing { theme }

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

  /* Custom content for additional tabs */
  property iconsContent : Html = Html.empty()

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
          content: "",
          badgeVariant: "",
          badgeSize: "",
          badgeColor: "",
          dotStatus: "",
          dotSize: "",
          dotAnimation: ""
        },
        {
          name: "icons",
          title: "Icons",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: "",
          badgeVariant: "",
          badgeSize: "",
          badgeColor: "",
          dotStatus: "",
          dotSize: "",
          dotAnimation: ""
        },
        {
          name: "usage",
          title: "Usage",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: "",
          badgeVariant: "",
          badgeSize: "",
          badgeColor: "",
          dotStatus: "",
          dotSize: "",
          dotAnimation: ""
        },
        {
          name: "api",
          title: "API",
          disabled: false,
          dot: false,
          badge: "",
          titleStyle: "",
          icon: "",
          content: "",
          badgeVariant: "",
          badgeSize: "",
          badgeColor: "",
          dotStatus: "",
          dotSize: "",
          dotAnimation: ""
        }
      ]

    allTabs
    |> Array.select(
      (tab : TabItem) : Bool { Array.contains(enabledTabs, tab.name) })
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
          <h3::codeTitle>
            {
              example.title
            }
          </h3>

          if !String.isEmpty(example.description) {
            <p::exampleDescription>
              {
                example.description
              }
            </p>
          } else {
            <></>
          }
        </div>

        <button::previewButton
          onClick={
            (event : Html.Event) : Promise(Void) { openExampleModal(index) }
          }
        >"👁️ Preview"</button>
      </div>

      <CodeBlock
        code={example.snippet.code}
        language={example.snippet.language}
        showCopyButton={true}
      />
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

  style titleContainer {
    margin: 0 0 12px;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
  }

  style badge {
    display: inline-block;
    padding: 4px 10px;
    background: var(--primary-color);
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

  /* Mobile/Tablet Layout - Simulator + Controls side by side */
  style mobileTabletLayout {
    display: flex;
    gap: 24px;
    width: 100%;
    justify-content: center;
    align-items: flex-start;
    flex-wrap: wrap;

    @media (max-width: 1200px) {
      flex-direction: column;
      align-items: center;
    }
  }

  /* Controls outside simulator for mobile/tablet */
  style externalControlsCard {
    background: var(--card-bg);
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 2px 12px var(--shadow-color);
    flex: 1;
    min-width: 300px;
    max-width: 400px;
    max-height: 640px;
    overflow-y: auto;

    @media (max-width: 1200px) {
      max-width: 100%;
      width: 100%;
    }

    &::-webkit-scrollbar {
      width: 8px;
    }

    &::-webkit-scrollbar-track {
      background: rgba(0, 0, 0, 0.05);
      border-radius: 4px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(102, 126, 234, 0.5);
      border-radius: 4px;

      &:hover {
        background: rgba(102, 126, 234, 0.7);
      }
    }
  }

  /* Viewport Indicator */
  style viewportIndicator {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 16px;
    display: inline-block;
    box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
  }

  /* Mobile Simulator Styles - iPhone Realistic Frame */
  style simulatorFrame {
    flex: 1;
    min-width: 320px;
    max-width: 375px;

    /* Premium aluminum frame with gradient */
    background: linear-gradient(145deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
    border-radius: 42px;
    padding: 10px;

    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.35),
                0 10px 30px rgba(0, 0, 0, 0.2),
                inset 0 1px 0 rgba(255, 255, 255, 0.5),
                inset 0 -1px 0 rgba(0, 0, 0, 0.1);

    position: relative;
    transition: all 0.3s ease;

    /* Power button on the right side */
    &::before {
      content: "";
      position: absolute;
      right: -2px;
      top: 120px;
      width: 3px;
      height: 60px;
      background: linear-gradient(90deg, #b8bcc6 0%, #9ca0aa 100%);
      border-radius: 0 2px 2px 0;
      box-shadow: inset 1px 0 2px rgba(0, 0, 0, 0.3);
    }

    /* Volume buttons on the left side */
    &::after {
      content: "";
      position: absolute;
      left: -2px;
      top: 100px;
      width: 3px;
      height: 40px;
      background: linear-gradient(90deg, #9ca0aa 0%, #b8bcc6 100%);
      border-radius: 2px 0 0 2px;
      box-shadow: inset -1px 0 2px rgba(0, 0, 0, 0.3);
    }

    @media (max-width: 768px) {
      min-width: 280px;
      max-width: 100%;
      border-radius: 36px;
      padding: 8px;
    }
  }

  /* Tablet Simulator Styles - iPad Realistic Frame */
  style tabletFrame {
    flex: 1;
    min-width: 600px;
    max-width: 768px;

    /* Premium aluminum frame with gradient */
    background: linear-gradient(145deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
    border-radius: 32px;
    padding: 12px;

    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.35),
                0 10px 30px rgba(0, 0, 0, 0.2),
                inset 0 1px 0 rgba(255, 255, 255, 0.5),
                inset 0 -1px 0 rgba(0, 0, 0, 0.1);

    position: relative;
    transition: all 0.3s ease;

    /* Power button on top right */
    &::before {
      content: "";
      position: absolute;
      right: 80px;
      top: -2px;
      width: 50px;
      height: 3px;
      background: linear-gradient(180deg, #9ca0aa 0%, #b8bcc6 100%);
      border-radius: 2px 2px 0 0;
      box-shadow: inset 0 -1px 2px rgba(0, 0, 0, 0.3);
    }

    /* Volume buttons on right side */
    &::after {
      content: "";
      position: absolute;
      right: -2px;
      top: 200px;
      width: 3px;
      height: 50px;
      background: linear-gradient(90deg, #b8bcc6 0%, #9ca0aa 100%);
      border-radius: 0 2px 2px 0;
      box-shadow: inset 1px 0 2px rgba(0, 0, 0, 0.3);
    }

    @media (max-width: 768px) {
      min-width: 280px;
      max-width: 100%;
      border-radius: 28px;
      padding: 10px;
    }
  }

  /* Tablet Camera - Same style as mobile notch */
  style tabletCamera {
    position: absolute;
    top: 5px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 18px;
    background: #000;
    border-radius: 0 0 10px 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    z-index: 5;

    @media (max-width: 768px) {
      width: 50px;
      height: 16px;
      border-radius: 0 0 8px 8px;
      top: 4px;
    }
  }

  /* Tablet Camera Dot */
  style tabletCameraDot {
    width: 6px;
    height: 6px;
    background: #1a1a1a;
    border-radius: 50%;
    border: 1px solid #333;

    @media (max-width: 768px) {
      width: 5px;
      height: 5px;
    }
  }

  /* Tablet Status Bar (no notch) */
  style tabletStatusBar {
    height: 24px;
    background: var(--bg-color);
    border-radius: 20px 20px 0 0;
    position: relative;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    font-size: 12px;
    font-weight: 500;
    color: #000;

    @media (max-width: 768px) {
      padding: 0 16px;
      font-size: 11px;
    }
  }

  /* Safari Top Bar for Tablet */
  style safariTopBar {
    height: 44px;
    background: rgba(248, 248, 248, 0.95);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
    gap: 12px;

    @media (max-width: 768px) {
      height: 40px;
      padding: 0 12px;
      gap: 10px;
    }
  }

  style safariTopLeft {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  style safariTopRight {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  /* Touch ID Button - Home button with fingerprint */
  style touchIdButton {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: linear-gradient(135deg, #f5f7fa 0%, #e0e3e8 100%);
    border: 2px solid rgba(0, 0, 0, 0.15);
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    cursor: pointer;
    transition: all 0.2s ease;

    box-shadow: inset 0 2px 4px rgba(255, 255, 255, 0.5),
                inset 0 -2px 4px rgba(0, 0, 0, 0.1),
                0 2px 8px rgba(0, 0, 0, 0.15);

    z-index: 10;

    &::before {
      content: "";
      width: 40px;
      height: 40px;
      border-radius: 50%;
      border: 2px solid rgba(0, 0, 0, 0.12);
      background: linear-gradient(135deg, transparent 0%, rgba(0, 0, 0, 0.03) 100%);
    }

    &:active {
      transform: translateX(-50%) scale(0.95);

      box-shadow: inset 0 2px 6px rgba(0, 0, 0, 0.15),
                  0 1px 4px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 768px) {
      width: 48px;
      height: 48px;
      bottom: 16px;

      &::before {
        width: 34px;
        height: 34px;
      }
    }
  }

  /* iOS Status Bar */
  style iosStatusBar {
    height: 44px;
    background: var(--bg-color);
    border-radius: 32px 32px 0 0;
    position: relative;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    font-size: 15px;
    font-weight: 600;
    color: #000;

    @media (max-width: 768px) {
      padding: 0 16px;
      font-size: 14px;
      border-radius: 28px 28px 0 0;
    }
  }

  style statusBarLeft {
    display: flex;
    align-items: center;
    gap: 4px;
  }

  style statusBarCenter {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: 8px;
  }

  style notchCamera {
    width: 100px;
    height: 28px;
    background: #000;
    border-radius: 0 0 16px 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;

    @media (max-width: 768px) {
      width: 80px;
      height: 24px;
    }
  }

  style cameraDot {
    width: 8px;
    height: 8px;
    background: #1a1a1a;
    border-radius: 50%;
    border: 1px solid #333;

    @media (max-width: 768px) {
      width: 6px;
      height: 6px;
    }
  }

  style statusBarRight {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 14px;

    @media (max-width: 768px) {
      gap: 5px;
      font-size: 13px;
    }
  }

  /* Safari Bottom Bar */
  style safariBottomBar {
    height: 50px;
    background: rgba(248, 248, 248, 0.95);
    backdrop-filter: blur(20px);
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 0 16px;

    @media (max-width: 768px) {
      height: 44px;
      padding: 0 12px;
    }
  }

  style safariButton {
    min-width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #007AFF;
    cursor: pointer;
    transition: opacity 0.2s ease;

    &:active {
      opacity: 0.6;
    }

    @media (max-width: 768px) {
      min-width: 28px;
      height: 28px;
    }
  }

  style safariUrlBar {
    flex: 1;
    height: 36px;
    background: rgba(255, 255, 255, 0.9);
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    display: flex;
    align-items: center;
    padding: 0 12px;
    gap: 6px;
    font-size: 13px;
    color: #666;
    margin: 0 8px;

    span {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    @media (max-width: 768px) {
      height: 32px;
      font-size: 12px;
      padding: 0 10px;
      gap: 5px;
    }
  }

  style simulatorScreen {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    height: 596px;
    overflow: hidden;
    border-radius: 0 0 32px 32px;
    position: relative;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;

    @media (max-width: 768px) {
      height: 456px;
      border-radius: 0 0 28px 28px;
    }
  }

  /* Tablet Screen - Fixed height for tablets */
  style tabletScreen {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    height: 788px;
    overflow: hidden;
    border-radius: 0 0 20px 20px;
    position: relative;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;

    @media (max-width: 768px) {
      height: 492px;
      border-radius: 0 0 18px 18px;
    }
  }

  style previewArea {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 200px;
    overflow: auto;

    &::-webkit-scrollbar {
      width: 8px;
      height: 8px;
    }

    &::-webkit-scrollbar-track {
      background: rgba(0, 0, 0, 0.05);
      border-radius: 4px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(102, 126, 234, 0.5);
      border-radius: 4px;

      &:hover {
        background: rgba(102, 126, 234, 0.7);
      }
    }
  }

  style controlsCard {
    background: #fff;
    border-radius: 12px;
    padding: 16px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    margin-top: 16px;
  }

  /* Desktop Browser Styles - Premium Monitor Display */
  style desktopView {
    width: 100%;
    max-width: 1200px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0;

    @media (max-width: 768px) {
      max-width: 100%;
    }
  }

  /* Monitor Frame - Premium Aluminum like iMac */
  style monitorFrame {
    width: 100%;
    background: linear-gradient(145deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
    border-radius: 16px;
    padding: 12px;

    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.35),
                0 10px 30px rgba(0, 0, 0, 0.2),
                inset 0 1px 0 rgba(255, 255, 255, 0.5),
                inset 0 -1px 0 rgba(0, 0, 0, 0.1);

    position: relative;
    box-sizing: border-box;

    /* Camera on top bezel */
    &::before {
      content: "";
      position: absolute;
      top: 6px;
      left: 50%;
      transform: translateX(-50%);
      width: 8px;
      height: 8px;
      background: radial-gradient(circle, #2a2a2a 0%, #0a0a0a 100%);
      border-radius: 50%;

      box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.1),
                  inset 0 1px 1px rgba(255, 255, 255, 0.2);

      z-index: 10;
    }

    @media (max-width: 768px) {
      border-radius: 12px;
      padding: 10px;

      &::before {
        width: 6px;
        height: 6px;
        top: 5px;
      }
    }
  }

  /* Monitor Stand - Elegant aluminum stand */
  style monitorStand {
    width: 180px;
    height: 50px;
    background: linear-gradient(180deg, #d5d5d5 0%, #b8b8b8 100%);
    clip-path: polygon(45% 0%, 55% 0%, 70% 100%, 30% 100%);

    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);

    position: relative;

    @media (max-width: 768px) {
      width: 140px;
      height: 40px;
    }
  }

  /* Monitor Base - Premium round base */
  style monitorBase {
    width: 240px;
    height: 20px;
    background: linear-gradient(135deg, #e8eaf0 0%, #d4d7df 50%, #c8ccd6 100%);
    border-radius: 50%;

    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35),
                inset 0 2px 0 rgba(255, 255, 255, 0.4),
                inset 0 -1px 0 rgba(0, 0, 0, 0.1);

    margin-top: -10px;

    @media (max-width: 768px) {
      width: 200px;
      height: 16px;
      margin-top: -8px;
    }
  }

  style browserBar {
    background: #f6f6f6;
    height: 36px;
    display: flex;
    align-items: center;
    padding: 0 12px;
    gap: 8px;
    border-bottom: 1px solid #e0e0e0;
    border-radius: 12px 12px 0 0;
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
    background: var(--bg-color);
    border: 1px solid var(--border-color);
    border-radius: 6px;
    padding: 6px 12px;
    font-size: 12px;
    color: var(--text-color);
    margin-left: 12px;
  }

  style desktopScreen {
    background: linear-gradient(135deg, rgba(245, 247, 250, 0.9) 0%, rgba(228, 233, 242, 0.9) 100%),
                url('https://img.freepik.com/foto-gratis/hojas-otono-transparentes-vividas_23-2148239689.jpg');

    background-size: cover;
    background-position: center;
    border-radius: 8px;
    padding: 20px;
    display: grid;
    grid-template-columns: 1fr 19rem;
    grid-template-rows: 32rem;
    gap: 20px;
    width: 100%;
    height: calc(32rem + 40px);
    box-sizing: border-box;

    @media (max-width: 1024px) {
      grid-template-columns: 1fr 18rem;
      grid-template-rows: 28rem;
      gap: 16px;
      padding: 16px;
      height: calc(28rem + 32px);
    }

    @media (max-width: 768px) {
      gap: 20px;
      grid-template-columns: 1fr;
      grid-template-rows: auto;
      padding: 20px;
      height: auto;
      min-height: 400px;
    }
  }

  style desktopPreviewArea {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    overflow: hidden;
    box-sizing: border-box;

    @media (max-width: 768px) {
      min-height: 400px;
      height: auto;
    }
  }

  style previewContentArea {
    flex: 1;
    overflow: auto;
    display: flex;
    align-items: center;
    justify-content: center;

    &::-webkit-scrollbar {
      width: 8px;
      height: 8px;
    }

    &::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 4px;
    }

    &::-webkit-scrollbar-thumb {
      background: #1989fa;
      border-radius: 4px;

      &:hover {
        background: #1570d1;
      }
    }
  }

  style desktopControlsCard {
    background: var(--card-bg);
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    width: 100%;
    height: 100%;
    overflow-y: auto;
    overflow-x: hidden;
    box-sizing: border-box;

    @media (max-width: 1024px) {
      padding: 16px;
    }

    @media (max-width: 768px) {
      padding: 20px;
      height: auto;
    }

    &::-webkit-scrollbar {
      width: 6px;
    }

    &::-webkit-scrollbar-track {
      background: rgba(0, 0, 0, 0.05);
      border-radius: 3px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(102, 126, 234, 0.3);
      border-radius: 3px;

      &:hover {
        background: rgba(102, 126, 234, 0.5);
      }
    }
  }

  /* Documentation Styles */
  style docCard {
    background: var(--card-bg);
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 2px 12px var(--shadow-color);
    margin-bottom: 24px;

    @media (max-width: 768px) {
      padding: 20px;
      border-radius: 12px;
    }
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
    background: var(--border-color);
    text-align: left;
    padding: 12px;
    font-weight: 600;
    color: var(--heading-color);
    border-bottom: 2px solid var(--border-color);
  }

  style tableCell {
    padding: 12px;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-color);
  }

  style codeInline {
    background: var(--code-bg, var(--card-bg));
    padding: 2px 8px;
    border-radius: 4px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: var(--primary-color);
  }

  style codeSection {
    background: var(--card-bg);
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 2px 12px var(--shadow-color);
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
    color: var(--heading-color);
    margin: 0 0 4px;
  }

  style exampleDescription {
    font-size: 14px;
    color: var(--text-color);
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
      <div::titleContainer>
        <Heading level="1" margin="0">
          {
            title
          }
        </Heading>

        <span::badge>
          {
            badge
          }
        </span>
      </div>

      <Text size="base" margin="0 0 30px">
        {
          description
        }
      </Text>

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
        onChange={handleTabChange}
      />

      /* Tab Content */
      if activeTab == "preview" {
        <div>
          /* Preview Header (optional content before simulator) */
          {
            previewHeader
          }

          if hideSimulator {
            /* No simulator - direct preview */
            <div::playgroundSection>
              <div::previewArea>
                {
                  previewContent
                }
              </div>

              <div::controlsCard>
                {
                  controlsContent
                }
              </div>
            </div>
          } else {
            <div::playgroundSection>
              /* Viewport Indicator */
              <div::viewportIndicator>
                {
                  ViewModeStore.getViewportLabel()
                }
              </div>

              /* Mobile/Tablet/Desktop Simulator */
              if viewMode == "mobile" {
                <div::mobileTabletLayout>
                  <div::simulatorFrame>
                    /* iOS Status Bar */
                    <div::iosStatusBar>
                      <div::statusBarLeft>"9:41"</div>

                      <div::statusBarCenter>
                        <div::notchCamera><div::cameraDot/></div>
                      </div>

                      <div::statusBarRight>
                        <Icon name="signal" size="xs"/>
                        <Icon name="wifi" size="xs"/>
                        <Icon name="battery-full" size="xs"/>
                      </div>
                    </div>

                    <div::simulatorScreen>
                      /* Preview Area - Only preview, no controls */
                      <div::previewArea>
                        {
                          previewContent
                        }
                      </div>

                      /* Safari Bottom Bar */
                      <div::safariBottomBar>
                        <div::safariButton><Icon name="chevron-left" size="sm"/></div>

                        <div::safariButton>
                          <Icon name="chevron-right" size="sm"/>
                        </div>

                        <div::safariUrlBar>
                          <Icon name="lock" size="xs"/>
                          <span>"localhost:3000"</span>
                        </div>

                        <div::safariButton><Icon name="refresh" size="sm"/></div>

                        <div::safariButton><Icon name="copy" size="sm"/></div>
                      </div>
                    </div>
                  </div>

                  /* Controls OUTSIDE simulator */
                  <div::externalControlsCard>
                    {
                      controlsContent
                    }
                  </div>
                </div>
              } else if viewMode == "tablet" {
                <div::mobileTabletLayout>
                  <div::tabletFrame>
                    /* Tablet Camera */
                    <div::tabletCamera><div::tabletCameraDot/></div>

                    /* Tablet Status Bar (no notch) */
                    <div::tabletStatusBar>
                      <div::statusBarLeft>"9:41 AM"</div>

                      <div::statusBarRight>
                        <Icon name="wifi" size="xs"/>
                        <Icon name="battery-full" size="xs"/>
                      </div>
                    </div>

                    /* Safari Top Bar */
                    <div::safariTopBar>
                      <div::safariTopLeft>
                        <div::safariButton><Icon name="chevron-left" size="sm"/></div>

                        <div::safariButton>
                          <Icon name="chevron-right" size="sm"/>
                        </div>
                      </div>

                      <div::safariUrlBar>
                        <Icon name="lock" size="xs"/>
                        <span>"localhost:3000"</span>
                      </div>

                      <div::safariTopRight>
                        <div::safariButton><Icon name="refresh" size="sm"/></div>
                        <div::safariButton><Icon name="share" size="sm"/></div>
                        <div::safariButton><Icon name="book-open" size="sm"/></div>
                      </div>
                    </div>

                    <div::simulatorScreen::tabletScreen>
                      /* Preview Area - Only preview, no controls */
                      <div::previewArea>
                        {
                          previewContent
                        }
                      </div>
                    </div>
                  </div>

                  /* Controls OUTSIDE simulator */
                  <div::externalControlsCard>
                    {
                      controlsContent
                    }
                  </div>
                </div>
              } else {
                <div::desktopView>
                  /* Monitor Frame */
                  <div::monitorFrame>
                    <div::desktopScreen>
                      /* LEFT: Preview Area with Browser Bar */
                      <div::desktopPreviewArea>
                        /* Browser Bar inside preview */
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

                        /* Preview Content */
                        <div::previewContentArea>
                          {
                            previewContent
                          }
                        </div>
                      </div>

                      /* RIGHT: Controls */
                      <div::desktopControlsCard>
                        {
                          controlsContent
                        }
                      </div>
                    </div>
                  </div>

                  /* Monitor Stand */
                  <div::monitorStand/>

                  /* Monitor Base */
                  <div::monitorBase/>
                </div>
              }
            </div>
          }
        </div>
      } else if activeTab == "usage" {
        <div>
          if !String.isEmpty(usageText) {
            <div::docCard>
              <Heading level="3" margin="0 0 16px">"Usage"</Heading>

              <Text size="base" margin="0">
                {
                  usageText
                }
              </Text>
            </div>
          } else {
            <></>
          }

          /* Single code example (backward compatible) */
          if !String.isEmpty(usageCode.code) {
            <div::codeSection>
              <div::codeHeader>
                <h3::codeTitle>"Code Example"</h3>
                <button::previewButton onClick={openModal}>"👁️ Preview"</button>
              </div>

              <CodeBlock
                code={usageCode.code}
                language={usageCode.language}
                showCopyButton={true}
              />
            </div>
          } else {
            <></>
          }

          /* Multiple code examples */
          {
            Array.mapWithIndex(codeExamples,
              (example : UsageExample, index : Number) : Html {
                renderCodeExample(example, index)
              })
          }

          {
            additionalDocs
          }
        </div>
      } else if activeTab == "api" {
        <div>
          /* Props table */
          if !Array.isEmpty(apiProperties) {
            <div::docCard>
              <Heading level="3" margin="0 0 16px">"Props"</Heading>

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
                      <td::tableCell>
                        <code::codeInline>
                          {
                            prop.name
                          }
                        </code>
                      </td>

                      <td::tableCell>
                        {
                          prop.description
                        }
                      </td>

                      <td::tableCell>
                        {
                          prop.type
                        }
                      </td>

                      <td::tableCell>
                        {
                          prop.defaultValue
                        }
                      </td>
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
              <Heading level="3" margin="0 0 16px">"Events"</Heading>

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
                      <td::tableCell>
                        <code::codeInline>
                          {
                            event.name
                          }
                        </code>
                      </td>

                      <td::tableCell>
                        {
                          event.description
                        }
                      </td>

                      <td::tableCell>
                        {
                          event.type
                        }
                      </td>

                      <td::tableCell>
                        {
                          event.defaultValue
                        }
                      </td>
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
              <Heading level="3" margin="0 0 16px">"Methods"</Heading>

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
                      <td::tableCell>
                        <code::codeInline>
                          {
                            method.name
                          }
                        </code>
                      </td>

                      <td::tableCell>
                        {
                          method.description
                        }
                      </td>

                      <td::tableCell>
                        {
                          method.type
                        }
                      </td>

                      <td::tableCell>
                        {
                          method.defaultValue
                        }
                      </td>
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
              <Heading level="3" margin="0 0 16px">"Slots"</Heading>

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
                      <td::tableCell>
                        <code::codeInline>
                          {
                            slot.name
                          }
                        </code>
                      </td>

                      <td::tableCell>
                        {
                          slot.description
                        }
                      </td>

                      <td::tableCell>
                        {
                          slot.type
                        }
                      </td>

                      <td::tableCell>
                        {
                          slot.defaultValue
                        }
                      </td>
                    </tr>
                  }
                </tbody>
              </table>
            </div>
          } else {
            <></>
          }

          {
            additionalDocs
          }
        </div>
      } else if activeTab == "icons" {
        <div>
          {
            iconsContent
          }
        </div>
      } else {
        <div>
          {
            additionalDocs
          }
        </div>
      }

      /* Preview Modal */
      if modalOpen {
        <div::modalOverlay onClick={closeModal}>
          <div::modalContent onClick={stopPropagation}>
            <div::modalHeader>
              <h3::modalTitle>"👁️ Live Preview"</h3>
              <button::modalCloseButton onClick={closeModal}>"×"</button>
            </div>

            <div::modalBody>
              /* Simple preview without simulator - just the component */
              <div::playgroundSection>
                <div
                  style="background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%); padding: 40px; border-radius: 16px; display: flex; align-items: center; justify-content: center; min-height: 400px;"
                >
                  {
                    getModalPreviewContent()
                  }
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
