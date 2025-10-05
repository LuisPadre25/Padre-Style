/* EnterExitPage - Showcase for EnterExit animation component using ComponentShowcase */

component EnterExitPage {
  /* State for component controls */
  state selectedAnimation : String = "fadeIn"
  state duration : Number = 0.6
  state delay : Number = 0
  state easing : String = "ease-out"
  state key : Number = 0

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
        selectedAnimation: animationType,
        key: key + 1
      }
  }

  fun playAnimation : Promise(Void) {
    next { key: key + 1 }
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

  /* Get preview content */
  fun getPreviewContent : Html {
    <EnterExit
      animation={selectedAnimation}
      duration={duration}
      easing={easing}
      delay={delay}
      key={Number.toString(key)}
      content={
        <div::previewElement>
          "Preview"
        </div>
      }/>
  }

  /* Get animation label by id */
  fun getAnimationLabel (id : String) : String {
    getAnimations()
    |> Array.find((item : AnimationItem) : Bool { item.id == id })
    |> Maybe.map((item : AnimationItem) : String { item.label })
    |> Maybe.withDefault("Unknown")
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"Animation Controls"</h3>

      <div::activeAnimationBadge>
        "Active: " <strong>{getAnimationLabel(selectedAnimation)}</strong>
      </div>

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
          <option value="ease-out">"ease-out (recommended)"</option>
          <option value="ease-in">"ease-in"</option>
          <option value="ease-in-out">"ease-in-out"</option>
          <option value="linear">"linear"</option>
          <option value="cubic-bezier(0.4, 0, 0.2, 1)">"cubic-bezier: smooth"</option>
          <option value="cubic-bezier(0.34, 1.56, 0.64, 1)">"cubic-bezier: bouncy ⭐"</option>
          <option value="cubic-bezier(0.68, -0.55, 0.265, 1.55)">"cubic-bezier: back"</option>
          <option value="cubic-bezier(0.175, 0.885, 0.32, 1.275)">"cubic-bezier: anticipate"</option>
        </select>
      </div>

      <button::playButton onClick={(event : Html.Event) : Promise(Void) { playAnimation() }}>
        "▶ Replay Animation"
      </button>
    </div>
  }

  /* Get multiple code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Usage",
        description: "Simple fade-in animation with default settings",
        snippet: {
          code: "<EnterExit\n" +
                "  animation=\"fadeIn\"\n" +
                "  duration={0.6}\n" +
                "  content={\n" +
                "    <div>\"Hello World\"</div>\n" +
                "  }/>",
          language: "mint"
        }
      },
      {
        title: "With Replay Control",
        description: "Use the key prop to trigger animation replay",
        snippet: {
          code: "component MyPage {\n" +
                "  state key : Number = 0\n\n" +
                "  fun replay : Promise(Void) {\n" +
                "    next { key: key + 1 }\n" +
                "  }\n\n" +
                "  fun render : Html {\n" +
                "    <>\n" +
                "      <EnterExit\n" +
                "        animation=\"#{selectedAnimation}\"\n" +
                "        duration={#{Number.toString(duration)}}\n" +
                "        easing=\"#{easing}\"\n" +
                "        delay={#{Number.toString(delay)}}\n" +
                "        key={Number.toString(key)}\n" +
                "        content={\n" +
                "          <div>\"Your content here\"</div>\n" +
                "        }/>\n\n" +
                "      <button onClick={(e) { replay() }}>\"Replay\"</button>\n" +
                "    </>\n" +
                "  }\n" +
                "}",
          language: "mint"
        }
      },
      {
        title: "Advanced: Multiple Elements",
        description: "Stagger animations with different delays",
        snippet: {
          code: "<div>\n" +
                "  <EnterExit\n" +
                "    animation=\"fadeInUp\"\n" +
                "    duration={0.5}\n" +
                "    delay={0}\n" +
                "    content={<h1>\"Title\"</h1>}/>\n\n" +
                "  <EnterExit\n" +
                "    animation=\"fadeInUp\"\n" +
                "    duration={0.5}\n" +
                "    delay={0.2}\n" +
                "    content={<p>\"Subtitle\"</p>}/>\n\n" +
                "  <EnterExit\n" +
                "    animation=\"fadeInUp\"\n" +
                "    duration={0.5}\n" +
                "    delay={0.4}\n" +
                "    content={<button>\"Action\"</button>}/>\n" +
                "</div>",
          language: "mint"
        }
      },
      {
        title: "Custom Timing Function",
        description: "Use cubic-bezier for smooth custom easing",
        snippet: {
          code: "<EnterExit\n" +
                "  animation=\"scaleIn\"\n" +
                "  duration={0.8}\n" +
                "  easing=\"cubic-bezier(0.34, 1.56, 0.64, 1)\"\n" +
                "  content={\n" +
                "    <div class=\"card\">\"Bouncy animation\"</div>\n" +
                "  }/>",
          language: "mint"
        }
      }
    ]
  }

  /* Get API properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "animation",
        description: "Animation type to apply. Available: fadeIn, fadeInUp, fadeInDown, slideInRight, slideInLeft, scaleIn, zoomIn, rotateIn",
        type: "String",
        defaultValue: "\"fadeIn\""
      },
      {
        name: "duration",
        description: "Animation duration in seconds",
        type: "Number",
        defaultValue: "0.6"
      },
      {
        name: "easing",
        description: "CSS timing function. Available: ease-out, ease-in, ease-in-out, linear, or any cubic-bezier()",
        type: "String",
        defaultValue: "\"ease-out\""
      },
      {
        name: "delay",
        description: "Delay before animation starts (seconds)",
        type: "Number",
        defaultValue: "0"
      },
      {
        name: "content",
        description: "Content to animate",
        type: "Html",
        defaultValue: "Html.empty()"
      },
      {
        name: "key",
        description: "Unique key to trigger re-animation. Change this value to replay the animation",
        type: "String",
        defaultValue: "\"\""
      }
    ]
  }

  /* Get additional API documentation */
  fun getAdditionalApiDocs : Html {
    <div>
      <div::docCard>
        <h3::docTitle>"Available Animations"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Animation"</th>
              <th::tableHeader>"Effect"</th>
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
      </div>

      <div::docCard>
        <h3::docTitle>"Easing Functions"</h3>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Easing"</th>
              <th::tableHeader>"Description"</th>
              <th::tableHeader>"Best For"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell><code::codeInline>"ease-out"</code></td>
              <td::tableCell>"Starts fast, ends slow"</td>
              <td::tableCell>"Entering elements ⭐ recommended"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"ease-in"</code></td>
              <td::tableCell>"Starts slow, ends fast"</td>
              <td::tableCell>"Exiting elements"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"ease-in-out"</code></td>
              <td::tableCell>"Slow start and end"</td>
              <td::tableCell>"Looping animations"</td>
            </tr>
            <tr>
              <td::tableCell><code::codeInline>"linear"</code></td>
              <td::tableCell>"Constant speed"</td>
              <td::tableCell>"Loading indicators"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::docCard>
        <h3::docTitle>"Custom Cubic-Bezier Functions"</h3>
        <p::docText>
          "Try these pre-made cubic-bezier curves in the preview above:"
        </p>
        <table::apiTable>
          <thead>
            <tr>
              <th::tableHeader>"Name"</th>
              <th::tableHeader>"Cubic-Bezier"</th>
              <th::tableHeader>"Effect"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::tableCell>"Smooth"</td>
              <td::tableCell><code::codeInline>"cubic-bezier(0.4, 0, 0.2, 1)"</code></td>
              <td::tableCell>"Smooth acceleration"</td>
            </tr>
            <tr>
              <td::tableCell>"Bouncy ⭐"</td>
              <td::tableCell><code::codeInline>"cubic-bezier(0.34, 1.56, 0.64, 1)"</code></td>
              <td::tableCell>"Playful bounce effect"</td>
            </tr>
            <tr>
              <td::tableCell>"Back"</td>
              <td::tableCell><code::codeInline>"cubic-bezier(0.68, -0.55, 0.265, 1.55)"</code></td>
              <td::tableCell>"Goes back before moving forward"</td>
            </tr>
            <tr>
              <td::tableCell>"Anticipate"</td>
              <td::tableCell><code::codeInline>"cubic-bezier(0.175, 0.885, 0.32, 1.275)"</code></td>
              <td::tableCell>"Slight overshoot at the end"</td>
            </tr>
          </tbody>
        </table>
        <p::docText>
          "💡 Tip: Use " <code::codeInline>"cubic-bezier: bouncy"</code> " from the easing selector to see the effect in real-time!"
        </p>
      </div>
    </div>
  }

  /* Get preview header content */
  fun getPreviewHeader : Html {
    <div::animationSelectorCard>
      <h3::controlsTitle>"Choose Animation Type"</h3>
      <div::animationGrid>
        for item of getAnimations() {
          <div::animationCard
            class={
              if selectedAnimation == item.id {
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
  }

  /* Styles for custom elements */
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

  style controlsTitle {
    font-size: 15px;
    font-weight: 600;
    margin: 0 0 12px;
    color: #323233;
  }

  style activeAnimationBadge {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 8px 12px;
    border-radius: 8px;
    font-size: 13px;
    margin-bottom: 16px;
    text-align: center;
    font-weight: 500;

    strong {
      font-weight: 700;
    }
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

  style animationSelectorCard {
    background: #fff;
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 24px;
  }

  style animationGrid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 16px;
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

  /* API Documentation Styles */
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

  style apiTable {
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

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="EnterExit"
      description="Create smooth enter and exit animations for your elements. Adjust duration, delay, and easing to see the effects in real-time."
      badge="Component"
      previewHeader={getPreviewHeader()}
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Wrap any content with the EnterExit component to apply animations. The component automatically handles animation timing and easing. Use the key prop to trigger replay - changing the key value will restart the animation."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      additionalDocs={getAdditionalApiDocs()}
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
