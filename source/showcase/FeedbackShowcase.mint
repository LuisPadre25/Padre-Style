component FeedbackShowcase {
  state modalOpen : Bool = false

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

  fun handleModalOpen (event : Html.Event) : Promise(Void) {
    next { modalOpen: true }
  }

  fun handleModalClose (event : Html.Event) : Promise(Void) {
    next { modalOpen: false }
  }

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Feedback & Interaction"</h3>

      <div::demoGrid>
        <Card title="Motion Effects">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Motion initial="hidden" animate="bounce" duration="1s">
              <Button>"Bounce Animation"</Button>
            </Motion>

            <Motion initial="hidden" animate="pulse" duration="2s">
              <Button variant="secondary">"Pulse Animation"</Button>
            </Motion>
          </div>
        </Card>

        <Card title="Advanced Gestures">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Elastic intensity={1.1}>
              <Button variant="success">"Elastic Effect"</Button>
            </Elastic>

            <Tilt intensity={15}><Button>"3D Tilt Effect"</Button></Tilt>
          </div>
        </Card>

        <Card title="Modal Demo">
          <div style="text-align: center;">
            <Button onClick={handleModalOpen}>"Abrir Modal"</Button>

            <Modal
              isOpen={modalOpen}
              title="Modal de Ejemplo"
              onClose={handleModalClose}
            >
              <p>"Este es el contenido del modal."</p>

              <div
                style="display: flex; gap: 1rem; justify-content: center; margin-top: 1rem;"
              ><Button onClick={handleModalClose}>"Cerrar"</Button></div>
            </Modal>
          </div>
        </Card>
      </div>
    </div>
  }
}
