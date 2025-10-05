component ThemeCustomizer {
  connect ThemeStore exposing { theme, primaryColor }

  style container {
    width: 100%;
    max-width: 1200px;
  }

  style card {
    background: var(--card-bg, white);
    border-radius: 12px;
    padding: 24px;
    box-shadow: 0 2px 8px var(--shadow-color, rgba(0, 0, 0, 0.1));
    margin-bottom: 24px;
    transition: all 0.3s ease;
  }

  style cardHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 24px;
    padding-bottom: 16px;
    border-bottom: 1px solid var(--border-color, #f0f0f0);
    transition: border-color 0.3s ease;
  }

  style cardTitle {
    font-size: 20px;
    font-weight: 600;
    color: var(--heading-color, #1a1a1a);
    transition: color 0.3s ease;
  }

  style formSection {
    margin-bottom: 32px;
  }

  style formLabel {
    font-size: 14px;
    font-weight: 600;
    color: var(--text-color, #333);
    margin-bottom: 16px;
    display: block;
    transition: color 0.3s ease;
  }

  style themeGrid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
    gap: 16px;
    margin-top: 12px;
  }

  style themeOption {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    padding: 12px;
    border-radius: 8px;
    border: 2px solid transparent;
    transition: all 0.3s;

    &:hover {
      background: color-mix(in srgb, var(--primary-color, #1989fa) 5%, transparent);
    }

    &.selected {
      border-color: var(--primary-color, #1989fa);
      background: color-mix(in srgb, var(--primary-color, #1989fa) 8%, transparent);
    }
  }

  style themePreview {
    width: 80px;
    height: 60px;
    border-radius: 6px;
    background: var(--bg-color, #f0f0f0);
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    transition: background 0.3s ease;
  }

  style themeLabel {
    font-size: 13px;
    color: var(--text-color, #666);
    font-weight: 500;
    transition: color 0.3s ease;
  }

  style colorGrid {
    display: flex;
    gap: 12px;
    align-items: center;
    flex-wrap: wrap;
    margin-top: 12px;
  }

  style colorInput {
    width: 120px;
    padding: 8px 12px;
    border: 1px solid var(--border-color, #d9d9d9);
    border-radius: 6px;
    font-size: 14px;
    font-family: monospace;
    background: var(--card-bg, white);
    color: var(--text-color, #333);
    transition: all 0.3s ease;

    &:focus {
      outline: none;
      border-color: var(--primary-color, #1989fa);
    }
  }

  style colorSwatch {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    cursor: pointer;
    border: 3px solid transparent;
    transition: all 0.2s;

    &:hover {
      transform: scale(1.1);
    }

    &.selected {
      border-color: var(--primary-color, #1989fa);
      box-shadow: 0 0 0 2px color-mix(in srgb, var(--primary-color, #1989fa) 20%, transparent);
    }
  }

  style sliderContainer {
    display: flex;
    gap: 16px;
    align-items: center;
    margin-top: 12px;
  }

  style radiusInput {
    width: 80px;
    padding: 8px 12px;
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    font-size: 14px;
  }

  style slider {
    flex: 1;
    max-width: 200px;
    height: 4px;
    background: #e8e8e8;
    border-radius: 2px;
    position: relative;
    cursor: pointer;
  }

  style sliderThumb {
    width: 16px;
    height: 16px;
    background: #1989fa;
    border-radius: 50%;
    position: absolute;
    top: -6px;
    cursor: grab;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  style radioGroup {
    display: flex;
    gap: 16px;
    margin-top: 12px;
  }

  style radioOption {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
  }

  style radioButton {
    width: 18px;
    height: 18px;
    border: 2px solid #d9d9d9;
    border-radius: 50%;
    position: relative;
    transition: all 0.2s;

    &.selected {
      border-color: #1989fa;
    }

    &.selected::after {
      content: "";
      width: 10px;
      height: 10px;
      background: #1989fa;
      border-radius: 50%;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  }

  style radioLabel {
    font-size: 14px;
    color: #333;
  }

  style buttonGroup {
    display: flex;
    gap: 12px;
  }

  style button {
    padding: 8px 16px;
    border-radius: 6px;
    border: 1px solid var(--border-color, #d9d9d9);
    background: var(--card-bg, white);
    color: var(--text-color, #333);
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s ease;

    &:hover {
      border-color: var(--primary-color, #1989fa);
      color: var(--primary-color, #1989fa);
    }

    &.primary {
      background: var(--primary-color, #1989fa);
      border-color: var(--primary-color, #1989fa);
      color: white;

      &:hover {
        background: color-mix(in srgb, var(--primary-color, #1989fa) 85%, black);
      }
    }
  }

  fun handleThemeChange (newTheme : String) : Promise(Void) {
    ThemeStore.setTheme(newTheme)
  }

  fun handleColorChange (color : String) : Promise(Void) {
    ThemeStore.setPrimaryColor(color)
  }

  fun handleReset : Promise(Void) {
    ThemeStore.resetTheme()
  }

  fun handleApply : Promise(Void) {
    ThemeStore.initialize()
  }

  fun renderThemeOption (id : String, label : String, bgColor : String) : Html {
    <div::themeOption
      class={
        if theme == id {
          "selected"
        } else {
          ""
        }
      }
      onClick={(event : Html.Event) : Promise(Void) { handleThemeChange(id) }}>

      <div::themePreview style={"background: " + bgColor + ";"}>
      </div>

      <span::themeLabel>{label}</span>
    </div>
  }

  fun renderColorSwatch (color : String) : Html {
    <div::colorSwatch
      class={
        if primaryColor == color {
          "selected"
        } else {
          ""
        }
      }
      style={"background: " + color + ";"}
      onClick={(event : Html.Event) : Promise(Void) { handleColorChange(color) }}>
    </div>
  }

  fun render : Html {
    <div::container>
      <div::card>
        <div::cardHeader>
          <h2::cardTitle>"Customize Theme"</h2>

          <div::buttonGroup>
            <button::button onClick={(event : Html.Event) : Promise(Void) { handleReset() }}>"Reset"</button>
            <button::button class="primary" onClick={(event : Html.Event) : Promise(Void) { handleApply() }}>"Apply Theme"</button>
          </div>
        </div>

        <div::formSection>
          <label::formLabel>"Theme Preset"</label>

          <div::themeGrid>
            {renderThemeOption("default", "Default", "linear-gradient(135deg, #667eea 0%, #764ba2 100%)")}
            {renderThemeOption("dark", "Dark", "#1a1a1a")}
            {renderThemeOption("light", "Light", "#ffffff")}
            {renderThemeOption("blue", "Blue Ocean", "linear-gradient(135deg, #1e3c72 0%, #2a5298 100%)")}
            {renderThemeOption("green", "Nature", "linear-gradient(135deg, #134e5e 0%, #71b280 100%)")}
          </div>
        </div>

        <div::formSection>
          <label::formLabel>"Accent Color"</label>

          <div::colorGrid>
            <input::colorInput
              type="text"
              value={primaryColor}/>

            {renderColorSwatch("#1989fa")}
            {renderColorSwatch("#5a54f9")}
            {renderColorSwatch("#9e339f")}
            {renderColorSwatch("#ed4192")}
            {renderColorSwatch("#e0282e")}
            {renderColorSwatch("#f4801a")}
            {renderColorSwatch("#f2bd27")}
            {renderColorSwatch("#00b96b")}
          </div>
        </div>
      </div>
    </div>
  }
}
