/* Theme Test Showcase - Testing dynamic theme components */
component ThemeTestShowcase {
  connect ThemeStore exposing { currentTheme }

  style showcase {
    padding: 2rem;
    max-width: 800px;
    margin: 0 auto;
  }

  style section {
    margin-bottom: 3rem;
  }

  style title {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 1rem;
    text-align: center;
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-top: 2rem;
  }

  fun handleButtonClick (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    <div::showcase>
      <div::section>
        <h1::title style="color: #{ThemeHelpers.getTextPrimary(currentTheme)};">
          "🎨 Theme Test Showcase"
        </h1>

        <div
          style="
          text-align: center;
          padding: 1rem;
          background: #{ThemeHelpers.getSurface(currentTheme)};
          border-radius: 8px;
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          margin-bottom: 2rem;
        "
        >
          <p
            style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; margin: 0;"
          >
            "Current Theme: #{currentTheme} - Click the theme button to see changes!"
          </p>
        </div>
      </div>

      <div::section>
        <h2
          style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin-bottom: 1.5rem;"
        >"Dynamic Buttons"</h2>

        <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
          <DynamicButton onClick={handleButtonClick}>"Primary Button"</DynamicButton>

          <DynamicButton variant="secondary" onClick={handleButtonClick}>
            "Secondary Button"
          </DynamicButton>

          <DynamicButton variant="success" onClick={handleButtonClick}>
            "Success Button"
          </DynamicButton>
        </div>
      </div>

      <div::section>
        <h2
          style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin-bottom: 1.5rem;"
        >"Dynamic Cards"</h2>

        <div::grid>
          <DynamicCard title="Card 1">
            <p style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
              "This card should change background and text colors based on the theme."
            </p>

            <DynamicButton onClick={handleButtonClick}>"Card Button"</DynamicButton>
          </DynamicCard>

          <DynamicCard title="Card 2">
            <p style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
              "Another card to test theme switching. Notice how the colors adapt!"
            </p>

            <DynamicButton variant="secondary" onClick={handleButtonClick}>
              "Secondary"
            </DynamicButton>
          </DynamicCard>

          <DynamicCard title="Card 3">
            <p style="color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
              "A third card with success button to test all variants."
            </p>

            <DynamicButton variant="success" onClick={handleButtonClick}>
              "Success"
            </DynamicButton>
          </DynamicCard>
        </div>
      </div>

      <div::section>
        <h2
          style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin-bottom: 1.5rem;"
        >"Theme Colors Preview"</h2>

        <div
          style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem;"
        >
          <div
            style="
            padding: 1rem;
            background: #{ThemeHelpers.getAccent(currentTheme)};
            color: #{ThemeHelpers.getTextInverse(currentTheme)};
            border-radius: 8px;
            text-align: center;
          "
          >"Accent"</div>

          <div
            style="
            padding: 1rem;
            background: #{ThemeHelpers.getSuccess(currentTheme)};
            color: #{ThemeHelpers.getTextInverse(currentTheme)};
            border-radius: 8px;
            text-align: center;
          "
          >"Success"</div>

          <div
            style="
            padding: 1rem;
            background: #{ThemeHelpers.getWarning(currentTheme)};
            color: #{ThemeHelpers.getTextInverse(currentTheme)};
            border-radius: 8px;
            text-align: center;
          "
          >"Warning"</div>

          <div
            style="
            padding: 1rem;
            background: #{ThemeHelpers.getError(currentTheme)};
            color: #{ThemeHelpers.getTextInverse(currentTheme)};
            border-radius: 8px;
            text-align: center;
          "
          >"Error"</div>
        </div>
      </div>
    </div>
  }
}
