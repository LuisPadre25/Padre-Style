/* UtilitiesDocsPage - Documentación de componentes utilitarios */
component UtilitiesDocsPage {
  connect ThemeStore exposing { currentTheme }

  state rating : Number = 3
  state toggleValue : Bool = false
  state chipValue : String = "Mint"
  state dotNavIndex : Number = 0
  state selectedApp : String = ""

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
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    border: 1px solid;
  }

  fun getComponentCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
  }

  style componentDescription {
    opacity: 0.8;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin: 1.5rem 0;
    border: 1px dashed;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun updateRating (newRating : Number) : Promise(Void) {
    next { rating: newRating }
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Utilities"</h1>

      <p::pageDescription>
        "Componentes utilitarios y helpers para funcionalidades comunes."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Interactive Components"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"SimpleRating"</h3>

          <p::componentDescription>
            "Sistema de calificación con estrellas."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SimpleRating
              value={rating}
              onChange={updateRating}
            />
            <p>"Rating: #{Number.toString(rating)}/5"</p>
          </div>

          <CodeHighlight
            language="mint"
            code="<SimpleRating
  value={3}
  onChange={updateRating}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ToggleSwitch"</h3>

          <p::componentDescription>
            "Interruptor toggle con animación suave."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ToggleSwitch
              checked={toggleValue}
              onChange={(value : Bool) { next { toggleValue: value } }}
            />
            <p>
              "Status: #{
                if toggleValue {
                  "ON"
                } else {
                  "OFF"
                }
              }"
            </p>
          </div>

          <CodeHighlight
            language="mint"
            code="<ToggleSwitch
  checked={toggleValue}
  onChange={handleChange}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"SimpleAccordion"</h3>

          <p::componentDescription>
            "Acordeón expandible para contenido colapsable."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SimpleAccordion
              title="Click to expand"
              defaultOpen={false}
            >
              <p>"This is the accordion content. You can put any content here!"</p>
            </SimpleAccordion>
          </div>

          <CodeHighlight
            language="mint"
            code="<SimpleAccordion
  title=\"Click to expand\"
  defaultOpen={false}
>
  <p>\"Content here\"</p>
</SimpleAccordion>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Chip"</h3>

          <p::componentDescription>
            "Chip compacto para etiquetas y tags."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Chip label="Default"/>
            <Chip label="Primary" variant="primary"/>
            <Chip label="Success" variant="success"/>
            <Chip label="Closable" closable={true} onClose={(e : Html.Event) { Promise.resolve(void) }}/>
          </div>

          <CodeHighlight
            language="mint"
            code="<Chip label=\"Default\"/>
<Chip label=\"Primary\" variant=\"primary\"/>
<Chip label=\"Closable\" closable={true} onClose={handleClose}/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Tag"</h3>

          <p::componentDescription>
            "Etiqueta visual para categorías y estados."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Tag label="New"/>
            <Tag label="Featured" variant="primary"/>
            <Tag label="Sale" variant="danger"/>
          </div>

          <CodeHighlight
            language="mint"
            code="<Tag label=\"New\"/>
<Tag label=\"Featured\" variant=\"primary\"/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"DotNavigation"</h3>

          <p::componentDescription>
            "Navegación vertical con indicadores de puntos. Ideal para páginas de una sola página con scroll suave."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <div style="position: relative; height: 400px; background: linear-gradient(180deg, #667eea 0%, #764ba2 100%); border-radius: 12px; overflow: hidden;">
              <DotNavigation
                items={["Home", "About", "Services", "Portfolio", "Contact"]}
                activeIndex={dotNavIndex}
                position="right"
                dotSize="medium"
                showLabels={false}
                onItemClick={(index : Number) { next { dotNavIndex: index } }}
              />

              <div style="padding: 2rem; color: white;">
                <h2 style="font-size: 2rem; margin-bottom: 1rem;">
                  "Section #{Number.toString(dotNavIndex + 1)}"
                </h2>
                <p style="opacity: 0.9;">
                  "Active section: #{
                    case dotNavIndex {
                      0 => "Home"
                      1 => "About"
                      2 => "Services"
                      3 => "Portfolio"
                      4 => "Contact"
                      => "Unknown"
                    }
                  }"
                </p>
              </div>
            </div>
          </div>

          <CodeHighlight
            language="mint"
            code="<DotNavigation
  items={[\"Home\", \"About\", \"Services\", \"Portfolio\", \"Contact\"]}
  activeIndex={activeIndex}
  position=\"right\"
  dotSize=\"medium\"
  showLabels={false}
  onItemClick={handleNavClick}
/>

// Position options: \"left\" | \"right\"
// Dot sizes: \"small\" | \"medium\" | \"large\"
// Set showLabels={true} to always show labels"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"NineDotMenu"</h3>

          <p::componentDescription>
            "Menú estilo launcher de aplicaciones con grid 3x3. Ideal para acceso rápido a múltiples secciones o aplicaciones."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <div style="display: flex; justify-content: center; align-items: center; min-height: 300px; padding: 4rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border-radius: 8px;">
              <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 4rem; align-items: center;">
                <div style="display: flex; flex-direction: column; align-items: center; gap: 0.5rem;">
                  <p style="font-size: 0.875rem; font-weight: 600; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; margin-bottom: 0.5rem;">"Top"</p>
                  <NineDotMenu
                    placement="top"
                    menuItems={[
                      { icon: "📧", label: "Mail", href: "#mail" },
                      { icon: "📅", label: "Calendar", href: "#calendar" },
                      { icon: "💬", label: "Chat", href: "#chat" },
                      { icon: "📁", label: "Drive", href: "#drive" },
                      { icon: "📊", label: "Analytics", href: "#analytics" },
                      { icon: "⚙️", label: "Settings", href: "#settings" },
                      { icon: "👥", label: "Contacts", href: "#contacts" },
                      { icon: "📝", label: "Notes", href: "#notes" },
                      { icon: "🎨", label: "Design", href: "#design" }
                    ]}
                    onItemClick={(item : MenuItem) { next { selectedApp: item.label } }}
                  />
                </div>

                <div style="display: flex; flex-direction: column; align-items: center; gap: 0.5rem;">
                  <p style="font-size: 0.875rem; font-weight: 600; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; margin-bottom: 0.5rem;">"Bottom"</p>
                  <NineDotMenu
                    placement="bottom"
                    menuItems={[
                      { icon: "📧", label: "Mail", href: "#mail" },
                      { icon: "📅", label: "Calendar", href: "#calendar" },
                      { icon: "💬", label: "Chat", href: "#chat" },
                      { icon: "📁", label: "Drive", href: "#drive" },
                      { icon: "📊", label: "Analytics", href: "#analytics" },
                      { icon: "⚙️", label: "Settings", href: "#settings" },
                      { icon: "👥", label: "Contacts", href: "#contacts" },
                      { icon: "📝", label: "Notes", href: "#notes" },
                      { icon: "🎨", label: "Design", href: "#design" }
                    ]}
                    onItemClick={(item : MenuItem) { next { selectedApp: item.label } }}
                  />
                </div>

                <div style="display: flex; flex-direction: column; align-items: center; gap: 0.5rem;">
                  <p style="font-size: 0.875rem; font-weight: 600; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; margin-bottom: 0.5rem;">"Center"</p>
                  <NineDotMenu
                    placement="center"
                    menuItems={[
                      { icon: "📧", label: "Mail", href: "#mail" },
                      { icon: "📅", label: "Calendar", href: "#calendar" },
                      { icon: "💬", label: "Chat", href: "#chat" },
                      { icon: "📁", label: "Drive", href: "#drive" },
                      { icon: "📊", label: "Analytics", href: "#analytics" },
                      { icon: "⚙️", label: "Settings", href: "#settings" },
                      { icon: "👥", label: "Contacts", href: "#contacts" },
                      { icon: "📝", label: "Notes", href: "#notes" },
                      { icon: "🎨", label: "Design", href: "#design" }
                    ]}
                    onItemClick={(item : MenuItem) { next { selectedApp: item.label } }}
                  />
                </div>
              </div>
            </div>

            if String.size(selectedApp) > 0 {
              <p style="margin-top: 1rem; padding: 1rem; background: #{ThemeHelpers.getAccent(currentTheme)}22; border-radius: 8px; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">
                "Selected: #{selectedApp}"
              </p>
            } else {
              <></>
            }
          </div>

          <CodeHighlight
            language="mint"
            code="<NineDotMenu
  placement=\"top\"
  menuItems={[
    { icon: \"📧\", label: \"Mail\", href: \"#mail\" },
    { icon: \"📅\", label: \"Calendar\", href: \"#calendar\" },
    { icon: \"💬\", label: \"Chat\", href: \"#chat\" },
    // ... more items
  ]}
  onItemClick={handleAppClick}
/>

// Placement options:
// \"top\" | \"bottom\" | \"left\" | \"right\"
// \"top-left\" | \"top-right\" | \"bottom-left\" | \"bottom-right\"
// \"center\""
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Display Components"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Counter"</h3>

          <p::componentDescription>
            "Contador numérico interactivo."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Counter
              value={5}
              min={0}
              max={10}
              step={1}
              onChange={(val : Number) { Promise.resolve(void) }}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<Counter
  value={5}
  min={0}
  max={10}
  step={1}
  onChange={handleChange}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"NumberCounter"</h3>

          <p::componentDescription>
            "Contador numérico con formato."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <NumberCounter value={1234} prefix="$"/>
          </div>

          <CodeHighlight
            language="mint"
            code="<NumberCounter value={1234} prefix=\"$\"/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"PercentageRing"</h3>

          <p::componentDescription>
            "Anillo circular de porcentaje."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <PercentageRing percentage={75}/>
          </div>

          <CodeHighlight
            language="mint"
            code="<PercentageRing percentage={75}/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"PriceTag"</h3>

          <p::componentDescription>
            "Etiqueta de precio con descuento opcional."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <PriceTag price="$99.99"/>
            <PriceTag price="$79.99" discount="20% OFF"/>
          </div>

          <CodeHighlight
            language="mint"
            code="<PriceTag price=\"$99.99\"/>
<PriceTag price=\"$79.99\" discount=\"20% OFF\"/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Timeline"</h3>

          <p::componentDescription>
            "Línea de tiempo para eventos cronológicos."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Timeline
              items={[
                "Project created - Jan 1, 2024",
                "First commit pushed - Jan 5, 2024",
                "Beta release deployed - Feb 15, 2024",
                "User testing completed - Mar 10, 2024",
                "Version 1.0 launched - Apr 1, 2024"
              ]}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<Timeline
  items={[
    \"Project created - Jan 1, 2024\",
    \"First commit pushed - Jan 5, 2024\",
    \"Beta release deployed - Feb 15, 2024\",
    \"Version 1.0 launched - Apr 1, 2024\"
  ]}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Chat Components"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ChatBubble"</h3>

          <p::componentDescription>
            "Burbuja de mensaje de chat."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ChatBubble message="Hello!" sender="user" timestamp="10:30 AM"/>
            <ChatBubble message="Hi there!" sender="bot" timestamp="10:31 AM"/>
          </div>

          <CodeHighlight
            language="mint"
            code="<ChatBubble
  message=\"Hello!\"
  sender=\"user\"
  timestamp=\"10:30 AM\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"SimpleChatWindow"</h3>

          <p::componentDescription>
            "Ventana de chat completa."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SimpleChatWindow/>
          </div>

          <CodeHighlight
            language="mint"
            code="<SimpleChatWindow/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"SimpleChatInput"</h3>

          <p::componentDescription>
            "Campo de entrada para mensajes de chat."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SimpleChatInput
              onSend={(message : String) { Promise.resolve(void) }}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<SimpleChatInput
  onSend={handleSend}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Search & Code"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"SimpleSearchBar"</h3>

          <p::componentDescription>
            "Barra de búsqueda simple."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SimpleSearchBar
              onSearch={(query : String) { Promise.resolve(void) }}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<SimpleSearchBar
  onSearch={handleSearch}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"CodeHighlight"</h3>

          <p::componentDescription>
            "Resaltado de sintaxis para código."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <CodeHighlight
              language="mint"
              code="component Hello {
  fun render : Html {
    <div>\"Hello World!\"</div>
  }
}"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<CodeHighlight
  language=\"mint\"
  code=\"your code here\"
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Transfer"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Transfer - Dual List Selector"</h3>

          <p::componentDescription>
            "A dual-list transfer component for moving items between two lists with search and selection capabilities."
          </p>

          <TransferDocsPage/>
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Advanced Features"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ColorPicker"</h3>

          <p::componentDescription>
            "Selector de color completo con paleta y entrada manual."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <p>"Ver carpeta utilities/colorpicker/ para ColorPickerDemo"</p>
          </div>

          <CodeHighlight
            language="mint"
            code="// Ver ColorPickerDemo.mint para implementación completa"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Drag & Drop"</h3>

          <p::componentDescription>
            "Sistema de arrastrar y soltar elementos."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <p>"Ver carpeta utilities/dragdrop/ para DragDropDemo"</p>
          </div>

          <CodeHighlight
            language="mint"
            code="// Ver DragDropDemo.mint para implementación completa"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Markdown"</h3>

          <p::componentDescription>
            "Editor y parser de Markdown."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <p>"Ver carpeta utilities/markdown/ para MarkdownEditor"</p>
          </div>

          <CodeHighlight
            language="mint"
            code="// Ver MarkdownEditor.mint para implementación completa"
          />
        </div>
      </div>
    </div>
  }
}
