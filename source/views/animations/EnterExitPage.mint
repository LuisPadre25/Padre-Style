/* EnterExitPage - Interactive playground for enter/exit animations */

component EnterExitPage {
  state activeAnimation : String = "fadeIn"
  state isPlaying : Bool = false
  state duration : Number = 0.6
  state delay : Number = 0
  state easing : String = "ease-out"

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
    next { activeAnimation: animationType }
  }

  fun playAnimation : Promise(Void) {
    next { isPlaying: !isPlaying }
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

  fun componentDidUpdate : Promise(Void) {
    `
    (() => {
      const el = document.querySelector('.EnterExitPage_previewElement');
      if (el) {
        el.style.setProperty('--animation-name', #{activeAnimation});
        el.style.setProperty('--animation-duration', #{Number.toString(duration)} + 's');
        el.style.setProperty('--animation-easing', #{easing});
        el.style.setProperty('--animation-delay', #{Number.toString(delay)} + 's');
      }
    })()
    `
  }

  /* Get code snippet */
  fun getCodeSnippet : String {
    "@keyframes #{activeAnimation} {\n" +
    "  from { ... }\n" +
    "  to { ... }\n" +
    "}\n\n" +
    ".element {\n" +
    "  animation: #{activeAnimation} #{Number.toString(duration)}s #{easing} #{Number.toString(delay)}s;\n" +
    "}"
  }

  fun copyCode : Promise(Void) {
    `navigator.clipboard.writeText(#{getCodeSnippet()})`
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
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
    margin-bottom: 40px;
  }

  style previewCard {
    background: #fff;
    border-radius: 16px;
    padding: 40px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 400px;
    position: relative;
  }

  style previewElement {
    width: 160px;
    height: 160px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 18px;
    font-weight: 600;
    box-shadow: 0 10px 40px rgba(102, 126, 234, 0.4);
  }

  style animated {
    animation-name: var(--animation-name);
    animation-duration: var(--animation-duration);
    animation-timing-function: var(--animation-easing);
    animation-delay: var(--animation-delay);
    animation-fill-mode: both;
  }

  style controlsCard {
    background: #fff;
    border-radius: 16px;
    padding: 32px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
  }

  style controlsTitle {
    font-size: 18px;
    font-weight: 600;
    margin: 0 0 24px;
    color: #333;
  }

  style controlGroup {
    margin-bottom: 24px;
  }

  style controlLabel {
    display: block;
    font-size: 14px;
    font-weight: 500;
    color: #646566;
    margin-bottom: 8px;
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
    padding: 14px;
    background: #1989fa;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      background: #1677d9;
      transform: translateY(-2px);
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
    background: #f7f8fa;
    border-radius: 12px;
    padding: 20px;
    font-family: 'Courier New', monospace;
    font-size: 13px;
    color: #58727e;
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

  /* Render */
  fun render : Html {
    <div::container>
      <h1::pageTitle>
        "Enter & Exit Animations"
        <span::badge>"Interactive"</span>
      </h1>

      <p::pageSubtitle>
        "Create smooth enter and exit animations for your elements. "
        "Adjust duration, delay, and easing to see the effects in real-time."
      </p>

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
              onClick={() { handleAnimationChange(item.id) }}>

              <div::animationCardTitle>{item.label}</div>
              <div::animationCardCode>{item.code}</div>
            </div>
          }
        </div>
      </div>

      <div::playgroundSection>
        <div::previewCard>
          <div::previewElement
            class={
              if isPlaying {
                "animated"
              } else {
                ""
              }
            }>
            "Preview"
          </div>
        </div>

        <div::controlsCard>
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
              onInput={(event : Html.Event) { handleDurationChange(Dom.getValue(event.target)) }}/>
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
              onInput={(event : Html.Event) { handleDelayChange(Dom.getValue(event.target)) }}/>
          </div>

          <div::controlGroup>
            <label::controlLabel>"Easing Function"</label>
            <select::select value={easing} onChange={(event : Html.Event) { handleEasingChange(Dom.getValue(event.target)) }}>
              <option value="ease-out">"ease-out"</option>
              <option value="ease-in">"ease-in"</option>
              <option value="ease-in-out">"ease-in-out"</option>
              <option value="linear">"linear"</option>
              <option value="cubic-bezier(0.4, 0, 0.2, 1)">"cubic-bezier (smooth)"</option>
            </select>
          </div>

          <button::playButton onClick={playAnimation}>
            "▶ Replay Animation"
          </button>
        </div>
      </div>

      <div::codeSection>
        <div::codeHeader>
          <h3::codeTitle>"Code Snippet"</h3>
          <button::copyButton onClick={copyCode}>
            "📋 Copy Code"
          </button>
        </div>
        <div::codeBlock>
          {getCodeSnippet()}
        </div>
      </div>
    </div>
  }
}
