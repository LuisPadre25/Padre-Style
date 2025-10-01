component Content {
  state currentDemo : String = "motion"
  state morphState : String = "initial"

  style showcase {
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-family: system-ui, -apple-system, sans-serif;
    padding: 2rem;
    overflow-x: hidden;
  }

  style header {
    text-align: center;
    padding: 3rem 0;
  }

  style title {
    font-size: 4rem;
    font-weight: 700;
    margin-bottom: 1rem;
    text-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background: linear-gradient(45deg, #ffffff, #e0e7ff);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  style subtitle {
    font-size: 1.5rem;
    opacity: 0.9;
    margin-bottom: 1rem;
  }

  style description {
    font-size: 1.1rem;
    opacity: 0.8;
    max-width: 600px;
    margin: 0 auto 3rem;
  }

  style section {
    max-width: 1200px;
    margin: 0 auto;
    padding: 4rem 0;
  }

  style sectionTitle {
    font-size: 2.5rem;
    font-weight: 600;
    text-align: center;
    margin-bottom: 3rem;
    background: linear-gradient(45deg, #ffffff, #fbbf24);
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  style demoGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin: 3rem 0;
  }

  style gestureDemo {
    display: flex;
    gap: 2rem;
    justify-content: center;
    flex-wrap: wrap;
    margin: 3rem 0;
  }

  style motionShowcase {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin: 3rem 0;
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun handleMorph (event : Html.Event) : Promise(Void) {
    if morphState == "initial" {
      next { morphState: "morphed" }
    } else {
      next { morphState: "initial" }
    }
  }

  fun render : Html {
    <div::showcase>
      <Motion initial="hidden" animate="slideDown" duration="1s">
        <div::header>
          <Motion
            initial="hidden"
            animate="scaleIn"
            duration="1.2s"
            delay="0.3s"
          ><h1::title>"Padre Style"</h1></Motion>

          <Motion initial="hidden" animate="fadeIn" duration="0.8s" delay="0.6s">
            <p::subtitle>"Advanced Motion Library for Mint Lang"</p>

            <p::description>
              "Una librería completa con animaciones avanzadas, transiciones fluidas, y gestos interactivos inspirada en Framer Motion."
            </p>
          </Motion>
        </div>
      </Motion>

      <Motion initial="hidden" animate="slideUp" duration="0.8s" delay="0.9s">
        <div::section>
          <h2::sectionTitle>"🎭 Componentes con Motion"</h2>

          <div::motionShowcase>
            <Motion initial="hidden" animate="bounce" duration="1s" delay="0.2s">
              <Card>
                <h3>"Bounce Animation"</h3>
                <p>"Animación con efecto rebote"</p>
                <Badge variant="primary">"Bounce"</Badge>
              </Card>
            </Motion>

            <Motion initial="hidden" animate="flip" duration="1s" delay="0.4s">
              <Card>
                <h3>"Flip Animation"</h3>
                <p>"Efecto de volteo 3D"</p>
                <Badge variant="success">"Flip"</Badge>
              </Card>
            </Motion>

            <Motion initial="hidden" animate="pulse" duration="2s" delay="0.6s">
              <Card>
                <h3>"Pulse Animation"</h3>
                <p>"Pulsación continua"</p>
                <Badge>"Pulse"</Badge>
              </Card>
            </Motion>
          </div>
        </div>
      </Motion>

      <Motion initial="hidden" animate="slideLeft" duration="0.8s" delay="1.2s">
        <div::section>
          <h2::sectionTitle>"🚀 Gestos Avanzados"</h2>

          <div::gestureDemo>
            <Tilt intensity={15}>
              <Card padding="2rem">
                <h3>"Tilt Effect"</h3>
                <p>"Efecto 3D que sigue el mouse"</p>
                <Badge variant="primary">"Tilt"</Badge>
              </Card>
            </Tilt>

            <Elastic intensity={1.1}>
              <Card padding="2rem">
                <h3>"Elastic Click"</h3>
                <p>"Presiona para ver el efecto elástico"</p>
                <Badge variant="success">"Elastic"</Badge>
              </Card>
            </Elastic>

            <Magnetic strength={0.4}>
              <Card padding="2rem">
                <h3>"Magnetic Effect"</h3>
                <p>"Atrae el cursor como un imán"</p>
                <Badge>"Magnetic"</Badge>
              </Card>
            </Magnetic>
          </div>
        </div>
      </Motion>

      <Motion initial="hidden" animate="slideRight" duration="0.8s" delay="1.5s">
        <div::section>
          <h2::sectionTitle>"⚡ Botones Interactivos"</h2>

          <div::gestureDemo>
            <Motion whileHover="lift" whileTap="scale">
              <Button onClick={handleClick}>"Hover & Tap Effects"</Button>
            </Motion>

            <Ripple>
              <Button variant="secondary" onClick={handleClick}>"Ripple Effect"</Button>
            </Ripple>

            <Spring>
              <Button variant="success" onClick={handleClick}>"Spring Animation"</Button>
            </Spring>
          </div>
        </div>
      </Motion>

      <Motion initial="hidden" animate="fadeIn" duration="1s" delay="1.8s">
        <div::section>
          <h2::sectionTitle>"🔄 Transformaciones"</h2>

          <Container>
            <div style="text-align: center;">
              <Morph morphState={morphState}>
                <Card padding="3rem">
                  <h3>"Morphing Card"</h3>
                  <p>"Click para ver la transformación"</p>
                  <Button onClick={handleMorph}>"Transform"</Button>
                </Card>
              </Morph>
            </div>
          </Container>
        </div>
      </Motion>

      <Motion initial="hidden" animate="slideUp" duration="0.8s" delay="2.1s">
        <div::section>
          <h2::sectionTitle>"🎪 Animaciones Escalonadas"</h2>

          <Stagger staggerDelay={0.2} initial="hidden" animate="slideUp">
            <Grid columns={4} gap="1.5rem">
              <Card>
                <h4>"Item 1"</h4>
                <Badge>"Stagger"</Badge>
              </Card>

              <Card>
                <h4>"Item 2"</h4>
                <Badge variant="primary">"Effect"</Badge>
              </Card>

              <Card>
                <h4>"Item 3"</h4>
                <Badge variant="success">"Demo"</Badge>
              </Card>

              <Card>
                <h4>"Item 4"</h4>
                <Badge>"Cool"</Badge>
              </Card>
            </Grid>
          </Stagger>
        </div>
      </Motion>

      <Motion initial="hidden" animate="scaleIn" duration="1s" delay="2.5s">
        <div::section>
          <Container>
            <Card padding="4rem">
              <div style="text-align: center;">
                <Motion animate="pulse" duration="2s">
                  <h2>"🎉 Librería Lista para Producción!"</h2>
                </Motion>

                <p>
                  "Padre Style - Motion Library completa con animaciones avanzadas, gestos interactivos y transiciones fluidas."
                </p>

                <div style="margin-top: 2rem;">
                  <Motion whileHover="glow" whileTap="scale">
                    <Button variant="success" onClick={handleClick}>
                      "Empezar a Crear"
                    </Button>
                  </Motion>
                </div>
              </div>
            </Card>
          </Container>
        </div>
      </Motion>
    </div>
  }
}
