/* ToastDocsPage - Documentación completa de Toast Notifications */
component ToastDocsPage {
  connect ThemeStore exposing { currentTheme }

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style pageDescription {
    font-size: 1.125rem;
    opacity: 0.8;
    margin-bottom: 3rem;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 700;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentCard {
    border-radius: 12px;
    padding: 2rem;
    margin-bottom: 2rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  fun getComponentCardStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)}; border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentName {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  style componentDescription {
    font-size: 1rem;
    opacity: 0.8;
    margin-bottom: 2rem;
    line-height: 1.6;
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.75rem;
    border-radius: 12px;
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
  }

  fun getBadgeStyles (type : String) : String {
    case type {
      "new" => "background: #10b981; color: white;"
      "pro" => "background: #667eea; color: white;"
      => "background: #6b7280; color: white;"
    }
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin-bottom: 1.5rem;
  }

  fun getExampleContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"🔔 Toast Notifications"</h1>

      <p::pageDescription>
        "Sistema completo de notificaciones toast con múltiples tipos, posiciones, acciones y animaciones.
        Incluye auto-dismiss, barra de progreso, y soporte para acciones personalizadas."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Toast Pro Demo"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ToastPro"
            <span::badge style={getBadgeStyles("pro")}>"Pro"</span>
          </h3>

          <p::componentDescription>
            "Demo interactivo completo del sistema de notificaciones toast. Prueba diferentes tipos,
            posiciones, acciones y configuraciones para ver todas las capacidades del componente."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ToastProDemo/>
          </div>

          <CodeHighlight
            language="mint"
            code="/* Ejemplo básico de uso */
<ToastPro
  id=\"unique-id\"
  message=\"¡Operación completada exitosamente!\"
  type=\"success\"
  duration={3000}
  hasProgress={true}
  onClose={handleClose}
/>

/* Toast con acción */
<ToastPro
  id=\"undo-toast\"
  message=\"Archivo eliminado correctamente\"
  type=\"success\"
  duration={4000}
  actionLabel=\"Deshacer\"
  actionCallback={handleUndo}
  onClose={handleClose}
/>

/* Toast persistente (sin auto-dismiss) */
<ToastPro
  id=\"persistent-toast\"
  message=\"Este mensaje permanece hasta que lo cierres\"
  type=\"info\"
  duration={0}
  hasProgress={false}
  onClose={handleClose}
/>

/* Toast con icono personalizado */
<ToastPro
  id=\"custom-icon\"
  message=\"Tienes 3 nuevas notificaciones\"
  type=\"info\"
  duration={4000}
  customIcon=\"🔔\"
  onClose={handleClose}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Propiedades"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <p::componentDescription>
            "El componente ToastPro acepta las siguientes propiedades:"
          </p>

          <CodeHighlight
            language="mint"
            code="property id : String
  /* Identificador único del toast (requerido) */

property message : String = \"\"
  /* Mensaje a mostrar en el toast */

property type : String = \"info\"
  /* Tipo de toast: \"success\", \"error\", \"warning\", \"info\" */

property duration : Number = 3000
  /* Duración en milisegundos (0 = sin auto-dismiss) */

property hasProgress : Bool = true
  /* Mostrar barra de progreso */

property actionLabel : String = \"\"
  /* Texto del botón de acción (opcional) */

property actionCallback : Function = defaultAction
  /* Función a ejecutar cuando se clickea la acción */

property customIcon : String = \"\"
  /* Icono personalizado (emoji o texto) */

property onClose : Function(String, Promise(Void)) = defaultClose
  /* Callback cuando el toast se cierra */"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Tipos de Toast"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <p::componentDescription>
            "ToastPro soporta 4 tipos diferentes de notificaciones, cada una con su propio color y estilo:"
          </p>

          <CodeHighlight
            language="mint"
            code="/* Success - Verde */
type=\"success\"
  /* Para confirmar operaciones exitosas */

/* Error - Rojo */
type=\"error\"
  /* Para mostrar errores y fallos */

/* Warning - Naranja/Amarillo */
type=\"warning\"
  /* Para advertencias importantes */

/* Info - Azul */
type=\"info\"
  /* Para información general */"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Posicionamiento"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <p::componentDescription>
            "Los toasts se pueden posicionar en 6 ubicaciones diferentes de la pantalla.
            El posicionamiento se controla mediante estilos en el contenedor:"
          </p>

          <CodeHighlight
            language="mint"
            code="/* Top Right (por defecto) */
style toastContainer {
  position: fixed;
  top: 20px;
  right: 20px;
  z-index: 9999;
}

/* Top Left */
style toastContainer {
  position: fixed;
  top: 20px;
  left: 20px;
  z-index: 9999;
}

/* Top Center */
style toastContainer {
  position: fixed;
  top: 20px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
}

/* Bottom Right */
style toastContainer {
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 9999;
}

/* Bottom Left */
style toastContainer {
  position: fixed;
  bottom: 20px;
  left: 20px;
  z-index: 9999;
}

/* Bottom Center */
style toastContainer {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 9999;
}"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Ejemplo Completo"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <p::componentDescription>
            "Ejemplo completo de implementación de un sistema de toast en tu componente:"
          </p>

          <CodeHighlight
            language="mint"
            code="component MyComponent {
  state showToast : Bool = false

  style toastContainer {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 9999;
  }

  fun showSuccessToast (event : Html.Event) : Promise(Void) {
    next { showToast: true }
  }

  fun closeToast (id : String) : Promise(Void) {
    next { showToast: false }
  }

  fun render : Html {
    <div>
      <div::toastContainer>
        {
          if showToast {
            <ToastPro
              id=\"my-toast\"
              message=\"¡Operación completada!\"
              type=\"success\"
              duration={3000}
              hasProgress={true}
              onClose={closeToast}
            />
          } else {
            <></>
          }
        }
      </div>

      <Button onClick={showSuccessToast}>
        \"Mostrar Toast\"
      </Button>
    </div>
  }
}"
          />
        </div>
      </div>
    </div>
  }
}
