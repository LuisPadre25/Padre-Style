/* EnterExitPage - Showcase and documentation for EnterExit component */

component EnterExitPage {
  connect ViewModeStore exposing { viewMode }

  state activeAnimation : String = "fadeIn"
  state animationKey : Number = 0
  state duration : Number = 0.6
  state delay : Number = 0
  state easing : String = "ease-out"
  state activeTab : String = "preview"

  /* Animation types */
  fun getAnimations : Array(AnimationItem) {
    [
      { id: "fadeIn", label: "Fade In", code: "opacity: 0 → 1" },
      { id: "fadeInUp", label: "Fade In Up", code: "opacity: 0, translateY(30px) → opacity: 1, translateY(0)" },
      { id: "fadeInDown", label: "Fade In Down", code: "opacity: 0, translateY(-30px) → opacity: 1, translateY(0)" },
      { id: "slideInRight", label: "Slide In Right", code: "translateX(30px) → translateX(0)" },
      { id: "slideInLeft", label: "Slide In Left", code: "translateX(-30px) → translateX(0)" },
      { id: "scaleIn", label: "Scale In", code: "scale(0.9) → scale(1)" },
      { id: "zoomIn", label: "Zoom In", code: "scale(0) → scale(1)" },
      { id: "rotateIn", label: "Rotate In", code: "rotate(-180deg) → rotate(0)" }
    ]
  }

  /* Event handlers */
  fun handleAnimationChange (animationType : String) : Promise(Void) {
    next
      {
        activeAnimation: animationType,
        animationKey: animationKey + 1
      }
  }

  fun playAnimation : Promise(Void) {
    next { animationKey: animationKey + 1 }
  }

  fun handleDurationChange (newValue : String) : Promise(Void) {
    next
      {
        duration:
          Number.fromString(newValue)
          |> Maybe.withDefault(0.6)
      }
  }

  fun handleDelayChange (newValue : String) : Promise(Void) {
    next
      {
        delay:
          Number.fromString(newValue)
          |> Maybe.withDefault(0)
      }
  }

  fun handleEasingChange (newValue : String) : Promise(Void) {
    next { easing: newValue }
  }


  /* Tab handlers */
  fun handleTabChange (tab : String) : Promise(Void) {
    next { activeTab: tab }
  }

  /* Get code snippets */
  fun getMintCodeSnippet : String {
    "/* Import the component (automatic in Mint) */\n" +
    "component MyPage {\n" +
    "  state key : Number = 0\n\n" +
    "  fun replay : Promise(Void) {\n" +
    "    next { key: key + 1 }\n" +
    "  }\n\n" +
    "  fun render : Html {\n" +
    "    <EnterExit\n" +
    "      animation=\"#{activeAnimation}\"\n" +
    "      duration={#{Number.toString(duration)}}\n" +
    "      easing=\"#{easing}\"\n" +
    "      delay={#{Number.toString(delay)}}\n" +
    "      key={Number.toString(key)}\n" +
    "      content={\n" +
    "        <div>\n" +
    "          \"Your content here\"\n" +
    "        </div>\n" +
    "      }/>\n" +
    "  }\n" +
    "}"
  }

  fun getCSSCodeSnippet : String {
    if activeAnimation == "fadeIn" {
      "@keyframes fadeIn {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "fadeInUp" {
      "@keyframes fadeInUp {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: translateY(30px);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: translateY(0);\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "fadeInDown" {
      "@keyframes fadeInDown {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: translateY(-30px);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: translateY(0);\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "slideInRight" {
      "@keyframes slideInRight {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: translateX(30px);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: translateX(0);\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "slideInLeft" {
      "@keyframes slideInLeft {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: translateX(-30px);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: translateX(0);\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "scaleIn" {
      "@keyframes scaleIn {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: scale(0.9);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: scale(1);\n" +
      "  }\n" +
      "}"
    } else if activeAnimation == "zoomIn" {
      "@keyframes zoomIn {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: scale(0);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: scale(1);\n" +
      "  }\n" +
      "}"
    } else {
      "@keyframes rotateIn {\n" +
      "  from {\n" +
      "    opacity: 0;\n" +
      "    transform: rotate(-180deg);\n" +
      "  }\n" +
      "  to {\n" +
      "    opacity: 1;\n" +
      "    transform: rotate(0);\n" +
      "  }\n" +
      "}"
    }
  }

  fun copyCode : Promise(Void) {
    `navigator.clipboard.writeText(#{getMintCodeSnippet()})`
  }

  fun copyCSSCode : Promise(Void) {
    `navigator.clipboard.writeText(#{getCSSCodeSnippet()})`
  }

  /* Styles */
  style container {
    width: 100%;
    max-width: 1200px;
  }

  style pageTitle {
    font-size: 34px;
    font-weight: 400;
    margin: 0 0 12px;
    line-height: 1.5;
    color: #333;
  }

  style pageSubtitle {
    color: rgba(52, 73, 94, 0.7);
    margin-bottom: 30px;
    font-size: 16px;
    line-height: 26px;
  }

  style playgroundSection {
    display: flex;
    flex-direction: column;
    gap: 24px;
    margin-bottom: 40px;
    align-items: center;
  }

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
  }

  style desktopView {
    width: 100%;
    max-width: 1200px;
    border-radius: 12px;
    padding: 0;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    background: #2a2a2a;
    overflow: hidden;
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
    height: 640px;
    overflow-y: auto;
    overflow-x: hidden;
    border-radius: 0 0 24px 24px;
    position: relative;
    transition: all 0.3s ease;
    display: flex;
    flex-direction: column;
    padding: 20px 16px;
  }

  style desktopScreen {
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e9f2 100%);
    min-height: 600px;
    padding: 60px;
    display: grid;
    grid-template-columns: 1.2fr 0.8fr;
    gap: 60px;
    align-items: center;
  }

  style previewArea {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 200px;
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
    position: relative;
  }

  style previewElement {
    width: 100px;
    height: 100px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 14px;
    font-weight: 600;
    box-shadow: 0 10px 40px rgba(102, 126, 234, 0.4);
  }

  style desktopPreviewElement {
    width: 200px;
    height: 200px;
    font-size: 20px;
  }

  style controlsCard {
    background: #fff;
    border-radius: 12px;
    padding: 16px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    margin-top: 16px;
  }

  style desktopControlsCard {
    background: #fff;
    border-radius: 12px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-top: 0;
  }

  style controlsTitle {
    font-size: 15px;
    font-weight: 600;
    margin: 0 0 16px;
    color: #323233;
  }

  style controlGroup {
    margin-bottom: 16px;
  }

  style controlLabel {
    display: block;
    font-size: 13px;
    font-weight: 500;
    color: #646566;
    margin-bottom: 6px;
  }

  style controlValue {
    float: right;
    color: #1989fa;
    font-weight: 600;
  }

  style slider {
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background: #f7f8fa;
    outline: none;
    -webkit-appearance: none;

    &::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: #1989fa;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(25, 137, 250, 0.3);
    }

    &::-moz-range-thumb {
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background: #1989fa;
      cursor: pointer;
      border: none;
      box-shadow: 0 2px 8px rgba(25, 137, 250, 0.3);
    }
  }

  style select {
    width: 100%;
    padding: 12px;
    border: 1px solid #ebedf0;
    border-radius: 8px;
    font-size: 14px;
    color: #323233;
    background: #fff;
    cursor: pointer;

    &:focus {
      outline: none;
      border-color: #1989fa;
    }
  }

  style playButton {
    width: 100%;
    padding: 12px;
    background: #1989fa;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      background: #1677d9;
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style animationGrid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 16px;
    margin-bottom: 40px;
  }

  style animationCard {
    background: #fff;
    border: 2px solid #ebedf0;
    border-radius: 12px;
    padding: 20px;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      border-color: #1989fa;
      transform: translateY(-4px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    }
  }

  style animationCardActive {
    border-color: #1989fa;
    background: #f0f9ff;
  }

  style animationCardTitle {
    font-size: 15px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 6px;
  }

  style animationCardCode {
    font-size: 12px;
    color: #969799;
    font-family: 'Courier New', monospace;
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
  }

  style copyButton {
    padding: 8px 16px;
    background: #f7f8fa;
    border: 1px solid #ebedf0;
    border-radius: 6px;
    font-size: 13px;
    color: #646566;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      background: #ebedf0;
      color: #323233;
    }
  }

  style codeBlock {
    background: #1e1e1e;
    border-radius: 12px;
    padding: 20px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #d4d4d4;
    line-height: 1.6;
    overflow-x: auto;
    white-space: pre;
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

  /* Documentation Styles */
  style docCard {
    background: #fff;
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 24px;
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

  style tabNav {
    display: flex;
    gap: 8px;
    margin-bottom: 24px;
    border-bottom: 2px solid #ebedf0;
  }

  style tab {
    padding: 12px 24px;
    background: transparent;
    border: none;
    border-bottom: 2px solid transparent;
    font-size: 14px;
    font-weight: 500;
    color: #646566;
    cursor: pointer;
    transition: all 0.2s ease;
    margin-bottom: -2px;

    &:hover {
      color: #1989fa;
    }
  }

  style tabActive {
    color: #1989fa;
    border-bottom-color: #1989fa;
  }

  /* Render */
  fun render : Html {
    <div::container>
      <h1::pageTitle>
        "EnterExit"
        <span::badge>"Component"</span>
      </h1>

      <p::pageSubtitle>
        "Create smooth enter and exit animations for your elements. "
        "Adjust duration, delay, and easing to see the effects in real-time."
      </p>

      /* Tab Navigation */
      <div::tabNav>
        <button::tab
          class={
            if activeTab == "preview" {
              "tabActive"
            } else {
              ""
            }
          }
          onClick={(event : Html.Event) : Promise(Void) { handleTabChange("preview") }}>

          "Preview"
        </button>
        <button::tab
          class={
            if activeTab == "usage" {
              "tabActive"
            } else {
              ""
            }
          }
          onClick={(event : Html.Event) : Promise(Void) { handleTabChange("usage") }}>

          "Usage"
        </button>
        <button::tab
          class={
            if activeTab == "api" {
              "tabActive"
            } else {
              ""
            }
          }
          onClick={(event : Html.Event) : Promise(Void) { handleTabChange("api") }}>

          "API"
        </button>
        <button::tab
          class={
            if activeTab == "animations" {
              "tabActive"
            } else {
              ""
            }
          }
          onClick={(event : Html.Event) : Promise(Void) { handleTabChange("animations") }}>

          "Animations"
        </button>
      </div>

      /* Tab Content */
      if activeTab == "preview" {
        <div>
          <div>
            <h3::controlsTitle>"Choose Animation Type"</h3>
            <div::animationGrid>
              for item of getAnimations() {
                <div::animationCard
                  class={
                    if activeAnimation == item.id {
                      "animationCardActive"
                    } else {
                      ""
                    }
                  }
                  onClick={(event : Html.Event) : Promise(Void) { handleAnimationChange(item.id) }}>

                  <div::animationCardTitle>{item.label}</div>
                  <div::animationCardCode>{item.code}</div>
                </div>
              }
            </div>
          </div>

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
                <EnterExit
                  animation={activeAnimation}
                  duration={duration}
                  easing={easing}
                  delay={delay}
                  key={Number.toString(animationKey)}
                  content={
                    <div::previewElement>
                      "Preview"
                    </div>
                  }/>
              </div>

              /* Controls INSIDE Phone */
              <div::controlsCard>
                <h3::controlsTitle>"Controls"</h3>

                <div::controlGroup>
                  <label::controlLabel>
                    "Duration"
                    <span::controlValue>{Number.toString(duration) + "s"}</span>
                  </label>
                  <input::slider
                    type="range"
                    min="0.1"
                    max="3"
                    step="0.1"
                    value={Number.toString(duration)}
                    onInput={(event : Html.Event) : Promise(Void) { handleDurationChange(Dom.getValue(event.target)) }}/>
                </div>

                <div::controlGroup>
                  <label::controlLabel>
                    "Delay"
                    <span::controlValue>{Number.toString(delay) + "s"}</span>
                  </label>
                  <input::slider
                    type="range"
                    min="0"
                    max="2"
                    step="0.1"
                    value={Number.toString(delay)}
                    onInput={(event : Html.Event) : Promise(Void) { handleDelayChange(Dom.getValue(event.target)) }}/>
                </div>

                <div::controlGroup>
                  <label::controlLabel>"Easing"</label>
                  <select::select value={easing} onChange={(event : Html.Event) : Promise(Void) { handleEasingChange(Dom.getValue(event.target)) }}>
                    <option value="ease-out">"ease-out"</option>
                    <option value="ease-in">"ease-in"</option>
                    <option value="ease-in-out">"ease-in-out"</option>
                    <option value="linear">"linear"</option>
                  </select>
                </div>

                <button::playButton onClick={(event : Html.Event) : Promise(Void) { playAnimation() }}>
                  "▶ Replay"
                </button>
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
                "🔒 localhost:3000/animations/enter-exit"
              </div>
            </div>

            <div::simulatorScreen::desktopScreen>
              /* LEFT: Preview Area */
              <div::desktopPreviewArea>
                <EnterExit
                  animation={activeAnimation}
                  duration={duration}
                  easing={easing}
                  delay={delay}
                  key={Number.toString(animationKey)}
                  content={
                    <div::previewElement::desktopPreviewElement>
                      "Preview"
                    </div>
                  }/>
              </div>

              /* RIGHT: Controls */
              <div::desktopControlsCard>
                <h3::controlsTitle>"Animation Controls"</h3>

                <div::controlGroup>
                  <label::controlLabel>
                    "Duration"
                    <span::controlValue>{Number.toString(duration) + "s"}</span>
                  </label>
                  <input::slider
                    type="range"
                    min="0.1"
                    max="3"
                    step="0.1"
                    value={Number.toString(duration)}
                    onInput={(event : Html.Event) : Promise(Void) { handleDurationChange(Dom.getValue(event.target)) }}/>
                </div>

                <div::controlGroup>
                  <label::controlLabel>
                    "Delay"
                    <span::controlValue>{Number.toString(delay) + "s"}</span>
                  </label>
                  <input::slider
                    type="range"
                    min="0"
                    max="2"
                    step="0.1"
                    value={Number.toString(delay)}
                    onInput={(event : Html.Event) : Promise(Void) { handleDelayChange(Dom.getValue(event.target)) }}/>
                </div>

                <div::controlGroup>
                  <label::controlLabel>"Easing Function"</label>
                  <select::select value={easing} onChange={(event : Html.Event) : Promise(Void) { handleEasingChange(Dom.getValue(event.target)) }}>
                    <option value="ease-out">"ease-out"</option>
                    <option value="ease-in">"ease-in"</option>
                    <option value="ease-in-out">"ease-in-out"</option>
                    <option value="linear">"linear"</option>
                    <option value="cubic-bezier(0.4, 0, 0.2, 1)">"cubic-bezier (smooth)"</option>
                  </select>
                </div>

                <button::playButton onClick={(event : Html.Event) : Promise(Void) { playAnimation() }}>
                  "▶ Replay Animation"
                </button>
              </div>
            </div>
          </div>
        }
          </div>
        </div>
      } else if activeTab == "usage" {
        <div>
          <div::docCard>
            <h3::docTitle>"Basic Usage"</h3>
            <p::docText>
              "Wrap any content with the EnterExit component to apply animations. "
              "The component automatically handles animation timing and easing."
            </p>
          </div>

          <div::codeSection>
            <div::codeHeader>
              <h3::codeTitle>"Mint Code Example"</h3>
            </div>
            <CodeBlock
              code={getMintCodeSnippet()}
              language="mint"
              showCopyButton={true}/>
          </div>

          <div::docCard>
            <h3::docTitle>"Replay Animations"</h3>
            <p::docText>
              "Use the " <code::codeInline>"key"</code> " prop to trigger replay. "
              "Changing the key value will restart the animation."
            </p>
          </div>
        </div>
      } else if activeTab == "api" {
        <div>
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
                <tr>
                  <td::tableCell><code::codeInline>"animation"</code></td>
                  <td::tableCell>"Animation type to apply"</td>
                  <td::tableCell>"String"</td>
                  <td::tableCell>"\"fadeIn\""</td>
                </tr>
                <tr>
                  <td::tableCell><code::codeInline>"duration"</code></td>
                  <td::tableCell>"Animation duration in seconds"</td>
                  <td::tableCell>"Number"</td>
                  <td::tableCell>"0.6"</td>
                </tr>
                <tr>
                  <td::tableCell><code::codeInline>"easing"</code></td>
                  <td::tableCell>"CSS timing function"</td>
                  <td::tableCell>"String"</td>
                  <td::tableCell>"\"ease-out\""</td>
                </tr>
                <tr>
                  <td::tableCell><code::codeInline>"delay"</code></td>
                  <td::tableCell>"Delay before animation starts (seconds)"</td>
                  <td::tableCell>"Number"</td>
                  <td::tableCell>"0"</td>
                </tr>
                <tr>
                  <td::tableCell><code::codeInline>"content"</code></td>
                  <td::tableCell>"Content to animate"</td>
                  <td::tableCell>"Html"</td>
                  <td::tableCell>"Html.empty()"</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div::docCard>
            <h3::docTitle>"Easing Functions"</h3>
            <p::docText>
              "Supported timing functions: "
              <code::codeInline>"ease-out"</code> ", "
              <code::codeInline>"ease-in"</code> ", "
              <code::codeInline>"ease-in-out"</code> ", "
              <code::codeInline>"linear"</code> ", or any valid CSS cubic-bezier."
            </p>
          </div>
        </div>
      } else {
        <div>
          <div::docCard>
            <h3::docTitle>"Available Animations"</h3>
            <p::docText>
              "Choose from 8 pre-built enter/exit animations."
            </p>
          </div>

          <table::table>
            <thead>
              <tr>
                <th::tableHeader>"Animation"</th>
                <th::tableHeader>"Description"</th>
                <th::tableHeader>"Transform"</th>
              </tr>
            </thead>
            <tbody>
              for item of getAnimations() {
                <tr>
                  <td::tableCell><code::codeInline>{item.id}</code></td>
                  <td::tableCell>{item.label}</td>
                  <td::tableCell>{item.code}</td>
                </tr>
              }
            </tbody>
          </table>

          <div::codeSection>
            <div::codeHeader>
              <h3::codeTitle>
                "CSS @keyframes for " <code::codeInline>{activeAnimation}</code>
              </h3>
            </div>
            <CodeBlock
              code={getCSSCodeSnippet()}
              language="css"
              showCopyButton={true}/>
          </div>
        </div>
      }
    </div>
  }
}
