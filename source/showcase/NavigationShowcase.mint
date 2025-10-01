component NavigationShowcase {
  state activeTab : String = "Layout"
  state currentStep : Number = 0
  state currentPage : Number = 1

  connect ThemeStore exposing { currentTheme }

  style tabContent {
    margin-top: 2rem;
  }

  style sectionTitle {
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 2rem;
    text-align: center;
  }

  fun getSectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style demoGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 2.5rem;
    margin: 2rem 0;
    width: 100%;
    box-sizing: border-box;
  }

  fun handleStepNext (event : Html.Event) : Promise(Void) {
    next { currentStep: (currentStep + 1) % 4 }
  }

  fun handlePagePrev (event : Html.Event) : Promise(Void) {
    next {
      currentPage:
        if currentPage > 1 {
          currentPage - 1
        } else {
          1
        }
    }
  }

  fun handlePageNext (event : Html.Event) : Promise(Void) {
    next {
      currentPage:
        if currentPage < 10 {
          currentPage + 1
        } else {
          10
        }
    }
  }

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Navigation & Layout"</h3>

      <div::demoGrid>
        <Card title="Tabs Demo">
          <div style="text-align: center;">
            <p>"Estas son las pestañas que estás usando ahora"</p>
            <Badge variant="primary">"Tab: #{activeTab}"</Badge>
          </div>
        </Card>

        <Card title="Progress">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="text-align: center;">
              <p>"Paso actual: #{Number.toString(currentStep + 1)}/4"</p>
              <Button onClick={handleStepNext}>"Siguiente Paso"</Button>
            </div>
          </div>
        </Card>

        <Card title="Page Navigation">
          <div style="text-align: center;">
            <p>"Página actual: #{Number.toString(currentPage)}/10"</p>

            <div
              style="display: flex; gap: 0.5rem; justify-content: center; margin-top: 1rem;"
            >
              <Button onClick={handlePagePrev}>"← Anterior"</Button>
              <Button onClick={handlePageNext}>"Siguiente →"</Button>
            </div>
          </div>
        </Card>
      </div>
    </div>
  }
}
