component DataShowcase {
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

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>
        "Data Display Components"
      </h3>

      <div::demoGrid>
        <Card title="Calendar"><Calendar currentDate="2024-12-15"/></Card>

        <Card title="Loading States">
          <div
            style="display: flex; flex-direction: column; gap: 2rem; align-items: center;"
          >
            <Loading variant="spinner" size="md" text="Cargando..."/>
            <Loading variant="dots" size="md"/>
            <Loading variant="pulse" size="md"/>
          </div>
        </Card>

        <Card title="Alerts">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Alert variant="success" title="Éxito">
              "Operación completada exitosamente"
            </Alert>

            <Alert variant="warning" title="Advertencia">
              "Ten cuidado con esta acción"
            </Alert>
          </div>
        </Card>
      </div>
    </div>
  }
}
