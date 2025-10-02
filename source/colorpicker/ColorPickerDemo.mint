/* Complete Color Picker - RGB, HSL, HEX, Palettes, Gradients */
component ColorPickerDemo {
  /* State */
  state mode : String = "HSL"
  state hue : Number = 200
  state saturation : Number = 70
  state lightness : Number = 50
  state red : Number = 38
  state green : Number = 132
  state blue : Number = 191
  state hexValue : String = "#2684bf"
  state selectedPalette : String = ""
  state gradientColors : Array(String) = ["#667eea", "#764ba2"]
  state gradientAngle : Number = 135

  /* Get predefined palettes */
  fun getPalettes : Array(Array(String)) {
    [
      ["#FF6B6B", "#4ECDC4", "#45B7D1", "#FFA07A", "#98D8C8"],
      ["#667eea", "#764ba2", "#f093fb", "#4facfe", "#00f2fe"],
      ["#fa709a", "#fee140", "#30cfd0", "#330867", "#a8edea"],
      ["#ff9a9e", "#fecfef", "#ffecd2", "#fcb69f", "#ff9a9e"]
    ]
  }

  /* Styles */
  style container {
    padding: 2rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    min-height: 100vh;
  }

  style title {
    font-size: 2.5rem;
    font-weight: 800;
    color: white;
    text-align: center;
    margin-bottom: 0.5rem;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  }

  style subtitle {
    font-size: 1.125rem;
    color: rgba(255, 255, 255, 0.9);
    text-align: center;
    margin-bottom: 2rem;
  }

  style content {
    max-width: 1200px;
    margin: 0 auto;
    background: white;
    border-radius: 16px;
    padding: 2rem;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  }

  style modeSelector {
    display: flex;
    gap: 1rem;
    margin-bottom: 2rem;
    justify-content: center;
  }

  style modeButton {
    padding: 0.75rem 1.5rem;
    border: 2px solid #e0e0e0;
    background: white;
    color: #666;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.2s ease;

    &:hover {
      border-color: #667eea;
      color: #667eea;
    }
  }

  style modeButtonActive {
    padding: 0.75rem 1.5rem;
    border: 2px solid #667eea;
    background: #667eea;
    color: white;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
  }

  style pickerGrid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    margin-bottom: 2rem;
  }

  style colorPreview {
    grid-column: 1 / -1;
    height: 150px;
    border-radius: 12px;
    box-shadow: inset 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
  }

  style sliderGroup {
    margin-bottom: 1.5rem;
  }

  style sliderLabel {
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: #333;
  }

  style slider {
    width: 100%;
    height: 12px;
    border-radius: 6px;
    outline: none;
    cursor: pointer;
  }

  style valueDisplay {
    color: #667eea;
    font-weight: 700;
  }

  style hexInput {
    width: 100%;
    padding: 1rem;
    font-size: 1.5rem;
    font-weight: 700;
    font-family: 'Courier New', monospace;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    text-align: center;
    text-transform: uppercase;

    &:focus {
      outline: none;
      border-color: #667eea;
    }
  }

  style paletteGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(60px, 1fr));
    gap: 1rem;
    margin-top: 1rem;
  }

  style paletteColor {
    height: 60px;
    border-radius: 8px;
    cursor: pointer;
    transition: transform 0.2s ease;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);

    &:hover {
      transform: scale(1.1);
    }
  }

  style gradientPreview {
    height: 150px;
    border-radius: 12px;
    margin-bottom: 1.5rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  style sectionTitle {
    font-size: 1.25rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 1rem;
  }

  style addButton {
    width: 100%;
    padding: 0.75rem 1.5rem;
    background: #667eea;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin: 1rem 0;

    &:hover {
      background: #5568d3;
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }
  }

  style removeButton {
    padding: 0.25rem 0.5rem;
    background: #ff6b6b;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 1.25rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.2s ease;
    margin-left: 0.5rem;

    &:hover {
      background: #ee5a5a;
      transform: scale(1.1);
    }
  }

  style colorInfo {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 1rem;
    margin-top: 1.5rem;
  }

  style infoCard {
    padding: 1rem;
    background: #f8f9fa;
    border-radius: 8px;
    text-align: center;
  }

  style infoLabel {
    font-size: 0.75rem;
    color: #666;
    text-transform: uppercase;
    font-weight: 600;
    margin-bottom: 0.5rem;
  }

  style infoValue {
    font-size: 1.125rem;
    font-weight: 700;
    color: #333;
    font-family: 'Courier New', monospace;
  }

  /* Event Handlers */
  fun setMode (newMode : String) : Promise(Void) {
    next { mode: newMode }
  }

  fun updateHue (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {r, g, b} =
      ColorUtils.hslToRgb(value, saturation, lightness)

    let hex =
      ColorUtils.rgbToHex(r, g, b)

    next {
      hue: value,
      red: r,
      green: g,
      blue: b,
      hexValue: hex
    }
  }

  fun updateSaturation (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {r, g, b} =
      ColorUtils.hslToRgb(hue, value, lightness)

    let hex =
      ColorUtils.rgbToHex(r, g, b)

    next {
      saturation: value,
      red: r,
      green: g,
      blue: b,
      hexValue: hex
    }
  }

  fun updateLightness (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {r, g, b} =
      ColorUtils.hslToRgb(hue, saturation, value)

    let hex =
      ColorUtils.rgbToHex(r, g, b)

    next {
      lightness: value,
      red: r,
      green: g,
      blue: b,
      hexValue: hex
    }
  }

  fun updateRed (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {h, s, l} =
      ColorUtils.rgbToHsl(value, green, blue)

    let hex =
      ColorUtils.rgbToHex(value, green, blue)

    next {
      red: value,
      hue: h,
      saturation: s,
      lightness: l,
      hexValue: hex
    }
  }

  fun updateGreen (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {h, s, l} =
      ColorUtils.rgbToHsl(red, value, blue)

    let hex =
      ColorUtils.rgbToHex(red, value, blue)

    next {
      green: value,
      hue: h,
      saturation: s,
      lightness: l,
      hexValue: hex
    }
  }

  fun updateBlue (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(0)

    let {h, s, l} =
      ColorUtils.rgbToHsl(red, green, value)

    let hex =
      ColorUtils.rgbToHex(red, green, value)

    next {
      blue: value,
      hue: h,
      saturation: s,
      lightness: l,
      hexValue: hex
    }
  }

  fun updateHex (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)

    if String.size(value) == 7 {
      let {r, g, b} =
        ColorUtils.hexToRgb(value)

      let {h, s, l} =
        ColorUtils.rgbToHsl(r, g, b)

      next {
        hexValue: value,
        red: r,
        green: g,
        blue: b,
        hue: h,
        saturation: s,
        lightness: l
      }
    } else {
      Promise.resolve(void)
    }
  }

  fun selectPaletteColor (color : String) : Promise(Void) {
    let {r, g, b} =
      ColorUtils.hexToRgb(color)

    let {h, s, l} =
      ColorUtils.rgbToHsl(r, g, b)

    next {
      hexValue: color,
      red: r,
      green: g,
      blue: b,
      hue: h,
      saturation: s,
      lightness: l,
      selectedPalette: color
    }
  }

  /* Helper functions */
  fun getCurrentColor : String {
    ColorUtils.rgbToHex(red, green, blue)
  }

  fun getCurrentGradient : String {
    let colorsList =
      `#{gradientColors}.join(', ')`

    "linear-gradient(" + Number.toString(gradientAngle) + "deg, " + colorsList + ")"
  }


  fun updateGradientAngle (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)
      |> Number.fromString
      |> Maybe.withDefault(135)

    next { gradientAngle: value }
  }

  /* Render Helpers */
  fun renderModeButton (label : String) : Html {
    if mode == label {
      <button::modeButtonActive onClick={() { setMode(label) }}>
        {label}
      </button>
    } else {
      <button::modeButton onClick={() { setMode(label) }}>
        {label}
      </button>
    }
  }

  fun renderHSLMode : Html {
    <div>
      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Hue"</span>
          <span::valueDisplay>
            {Number.toString(hue) + "°"}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="360"
          value={Number.toString(hue)}
          onInput={updateHue}
          style={"background: linear-gradient(to right, #ff0000, #ffff00, #00ff00, #00ffff, #0000ff, #ff00ff, #ff0000);"}/>
      </div>

      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Saturation"</span>
          <span::valueDisplay>
            {Number.toString(saturation) + "%"}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="100"
          value={Number.toString(saturation)}
          onInput={updateSaturation}
          style="background: linear-gradient(to right, #808080, #4285f4);"/>
      </div>

      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Lightness"</span>
          <span::valueDisplay>
            {Number.toString(lightness) + "%"}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="100"
          value={Number.toString(lightness)}
          onInput={updateLightness}
          style="background: linear-gradient(to right, #000000, #808080, #ffffff);"/>
      </div>
    </div>
  }

  fun renderRGBMode : Html {
    <div>
      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Red"</span>
          <span::valueDisplay>
            {Number.toString(red)}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="255"
          value={Number.toString(red)}
          onInput={updateRed}
          style="background: linear-gradient(to right, #000000, #ff0000);"/>
      </div>

      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Green"</span>
          <span::valueDisplay>
            {Number.toString(green)}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="255"
          value={Number.toString(green)}
          onInput={updateGreen}
          style="background: linear-gradient(to right, #000000, #00ff00);"/>
      </div>

      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Blue"</span>
          <span::valueDisplay>
            {Number.toString(blue)}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="255"
          value={Number.toString(blue)}
          onInput={updateBlue}
          style="background: linear-gradient(to right, #000000, #0000ff);"/>
      </div>
    </div>
  }

  fun renderHexMode : Html {
    <div>
      <input::hexInput
        type="text"
        value={hexValue}
        onInput={updateHex}
        placeholder="#000000"/>
    </div>
  }

  fun renderPalettesMode : Html {
    <div>
      <div::sectionTitle>
        "Predefined Palettes"
      </div>

      {
        for palette of getPalettes() {
          <div::paletteGrid>
            {
              for color of palette {
                <div::paletteColor
                  style={"background: " + color + ";"}
                  onClick={() { selectPaletteColor(color) }}/>
              }
            }
          </div>
        }
      }
    </div>
  }

  fun renderGradientsMode : Html {
    <div>
      <div::gradientPreview style={"background: " + getCurrentGradient() + ";"}/>

      <div::sectionTitle>
        "Gradient Colors"
      </div>

      <div::paletteGrid>
        {
          for color of gradientColors {
            <div::paletteColor
              style={"background: " + color + ";"}/>
          }
        }
      </div>

      <p style="text-align: center; color: #666; font-size: 0.9rem; margin: 1rem 0;">
        "Showing " + Number.toString(Array.size(gradientColors)) + " colors"
      </p>

      <div::sliderGroup>
        <div::sliderLabel>
          <span>"Angle"</span>
          <span::valueDisplay>
            {Number.toString(gradientAngle) + "°"}
          </span>
        </div>

        <input::slider
          type="range"
          min="0"
          max="360"
          value={Number.toString(gradientAngle)}
          onInput={updateGradientAngle}/>
      </div>
    </div>
  }

  /* Main Render */
  fun render : Html {
    <div::container>
      <h1::title>
        "🎨 Color Picker Pro"
      </h1>

      <p::subtitle>
        "Complete color picker with HSL, RGB, HEX, Palettes & Gradients"
      </p>

      <div::content>
        <div::modeSelector>
          renderModeButton("HSL")
          renderModeButton("RGB")
          renderModeButton("HEX")
          renderModeButton("Palettes")
          renderModeButton("Gradients")
        </div>

        {
          if mode == "Gradients" {
            <></>
          } else {
            <div::colorPreview style={"background: " + getCurrentColor() + ";"}/>
          }
        }

        <div::pickerGrid>
          {
            case mode {
              "HSL" => renderHSLMode()
              "RGB" => renderRGBMode()
              "HEX" => renderHexMode()
              "Palettes" => renderPalettesMode()
              "Gradients" => renderGradientsMode()
              => <div/>
            }
          }
        </div>

        {
          if mode != "Gradients" {
            <div::colorInfo>
              <div::infoCard>
                <div::infoLabel>"HEX"</div>
                <div::infoValue>{hexValue}</div>
              </div>

              <div::infoCard>
                <div::infoLabel>"RGB"</div>
                <div::infoValue>
                  {Number.toString(red) + "," + Number.toString(green) + "," + Number.toString(blue)}
                </div>
              </div>

              <div::infoCard>
                <div::infoLabel>"HSL"</div>
                <div::infoValue>
                  {Number.toString(hue) + "," + Number.toString(saturation) + "," + Number.toString(lightness)}
                </div>
              </div>
            </div>
          } else {
            <div::infoCard>
              <div::infoLabel>"CSS GRADIENT"</div>
              <div::infoValue style="font-size: 0.875rem;">
                {getCurrentGradient()}
              </div>
            </div>
          }
        }
      </div>
    </div>
  }
}
