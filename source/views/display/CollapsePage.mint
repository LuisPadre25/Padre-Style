/* CollapsePage - Professional showcase for Collapse component */

component CollapsePage {
  /* State for examples */
  state activeBasic : Array(String) = []
  state activeAccordion : Array(String) = ["faq1"]
  state users : Array(Number) = [1]
  state activeUsers : Array(String) = ["user-1"]

  /* State for controls */
  state accordion : Bool = false
  state border : Bool = true
  state animated : Bool = true
  state animationDuration : Number = 0.3
  state previewTab : String = "faqs"
  state width : String = "100%"

  /* Handlers */
  fun handleBasicChange (event : CollapseChangeEvent) : Promise(Void) {
    next { activeBasic: event.active }
  }

  fun handleAccordionChange (event : CollapseChangeEvent) : Promise(Void) {
    next { activeAccordion: event.active }
  }

  fun handleUsersChange (event : CollapseChangeEvent) : Promise(Void) {
    next { activeUsers: event.active }
  }

  fun addUser : Promise(Void) {
    `
    (() => {
      const users = #{users};
      const newId = Math.max(...users, 0) + 1;
      const newUsers = [...users, newId];
      const newActive = [...#{activeUsers}, 'user-' + newId];
      #{next { users: `newUsers`, activeUsers: `newActive` }};
    })()
    `
  }

  fun handleRemoveUser (event : CollapseRemoveEvent) : Promise(Void) {
    `
    (() => {
      const name = #{event}.name;
      const userId = parseInt(name.replace('user-', ''));
      const users = #{users}.filter(id => id !== userId);
      const activeUsers = #{activeUsers}.filter(item => item !== name);
      #{next { users: `users`, activeUsers: `activeUsers` }};
    })()
    `
  }

  /* Control handlers */
  fun toggleAccordion : Promise(Void) {
    next { accordion: !accordion, activeAccordion: if !accordion { ["faq1"] } else { [] } }
  }

  fun toggleBorder : Promise(Void) {
    next { border: !border }
  }

  fun toggleAnimated : Promise(Void) {
    next { animated: !animated }
  }

  fun handleDurationChange (duration : Number) : Promise(Void) {
    next { animationDuration: duration }
  }

  fun handleWidthChange (newWidth : String) : Promise(Void) {
    next { width: newWidth }
  }

  fun expandAll : Promise(Void) {
    if previewTab == "faqs" {
      next { activeAccordion: ["faq1", "faq2", "faq3"] }
    } else if previewTab == "forms" {
      `
      (() => {
        const users = #{users};
        const allUserIds = users.map(id => 'user-' + id);
        #{next { activeUsers: `allUserIds` }};
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun collapseAll : Promise(Void) {
    if previewTab == "faqs" {
      next { activeAccordion: [] }
    } else if previewTab == "forms" {
      next { activeUsers: [] }
    } else {
      Promise.never()
    }
  }

  fun handlePreviewTabChange (event : TabChangeEvent) : Promise(Void) {
    next { previewTab: event.name }
  }


  /* Get data */
  fun getBasicItems : Array(CollapseItem) {
    [
      {
        name: "item1",
        title: "What is Mint Lang?",
        content: <div>"Mint Lang is a refreshing programming language for the front-end web."</div>,
        disabled: false,
        icon: "",
        badge: "",
        removable: false,
        extraData: ""
      },
      {
        name: "item2",
        title: "Why use Collapse?",
        content: <div>"Perfect for FAQs, forms, and organizing content sections."</div>,
        disabled: false,
        icon: "",
        badge: "",
        removable: false,
        extraData: ""
      },
      {
        name: "item3",
        title: "Disabled Panel",
        content: <div>"This panel is disabled."</div>,
        disabled: true,
        icon: "",
        badge: "",
        removable: false,
        extraData: ""
      }
    ]
  }

  fun getAccordionItems : Array(CollapseItem) {
    [
      {
        name: "faq1",
        title: "How does accordion mode work?",
        content: <div>"Only one panel can be open at a time. Great for FAQs!"</div>,
        disabled: false,
        icon: "",
        badge: "",
        removable: false,
        extraData: ""
      },
      {
        name: "faq2",
        title: "Can I have multiple panels open?",
        content: <div>"Yes! Disable accordion mode for multiple open panels."</div>,
        disabled: false,
        icon: "",
        badge: "",
        removable: false,
        extraData: ""
      },
      {
        name: "faq3",
        title: "Is it responsive?",
        content: <div>"Absolutely! Mobile-first design with touch-friendly areas."</div>,
        disabled: false,
        icon: "",
        badge: "Popular",
        removable: false,
        extraData: ""
      }
    ]
  }

  fun getUserItems : Array(CollapseItem) {
    `
    (() => {
      const users = #{users};
      return users.map((userId, index) => ({
        name: 'user-' + userId,
        title: 'Usuario ' + (index + 1),
        content: #{getUserFormContent(`userId`)},
        disabled: false,
        icon: '',
        badge: index > 0 ? 'Adicional' : '',
        removable: users.length > 1,
        extraData: ''
      }));
    })()
    `
  }

  fun getUserFormContent (userId : Number) : Html {
    <div::formContent>
      <div::formGroup>
        <label::formLabel>"Nombre"</label>
        <input::formInput type="text" placeholder="Juan Pérez"/>
      </div>
      <div::formGroup>
        <label::formLabel>"Email"</label>
        <input::formInput type="email" placeholder="usuario@ejemplo.com"/>
      </div>
      <div::formGroup>
        <label::formLabel>"Teléfono"</label>
        <input::formInput type="tel" placeholder="+52 123 456 7890"/>
      </div>
    </div>
  }

  /* Get preview content with tabs */
  fun getPreviewContent : Html {
    <div>
      <Tabs
        tabs={getPreviewTabs()}
        active={previewTab}
        type="line"
        animated={true}
        onChange={handlePreviewTabChange}/>

      if previewTab == "faqs" {
        <div style="margin-top: 24px; width: 100%;">
          <Collapse
            items={getAccordionItems()}
            active={activeAccordion}
            accordion={accordion}
            border={border}
            animated={animated}
            animationDuration={animationDuration}
            width={width}
            minWidth="0"
            onChange={handleAccordionChange}/>

          <div style="height: 60px; margin-top: 16px;"/>
        </div>
      } else if previewTab == "forms" {
        <div style="margin-top: 24px; width: 100%;">
          <Collapse
            items={getUserItems()}
            active={activeUsers}
            accordion={false}
            border={border}
            animated={animated}
            animationDuration={animationDuration}
            width={width}
            minWidth="0"
            onChange={handleUsersChange}
            onRemove={handleRemoveUser}/>

          <button::addButton onClick={(e : Html.Event) { addUser() }}>
            "+"
            " Agregar Usuario"
          </button>
        </div>
      } else {
        <></>
      }
    </div>
  }

  /* Get preview tabs */
  fun getPreviewTabs : Array(TabItem) {
    [
      {
        name: "faqs",
        title: "FAQs",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "❓",
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      },
      {
        name: "forms",
        title: "Forms",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "📝",
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      }
    ]
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <h3::controlsTitle>"Collapse Controls"</h3>

      <div::controlGroup>
        <div::controlLabel>"Width"</div>
        <div::buttonGroup>
          <button::button(width == "300px") onClick={(e : Html.Event) { handleWidthChange("300px") }}>
            "300px"
          </button>
          <button::button(width == "auto") onClick={(e : Html.Event) { handleWidthChange("auto") }}>
            "Auto"
          </button>
          <button::button(width == "100%") onClick={(e : Html.Event) { handleWidthChange("100%") }}>
            "100%"
          </button>
          <button::button(width == "450px") onClick={(e : Html.Event) { handleWidthChange("450px") }}>
            "450px"
          </button>
          <button::button(width == "500px") onClick={(e : Html.Event) { handleWidthChange("500px") }}>
            "500px"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Animation Duration"</div>
        <div::buttonGroup>
          <button::button(animationDuration == 0.1) onClick={(e : Html.Event) { handleDurationChange(0.1) }}>
            "0.1s"
          </button>
          <button::button(animationDuration == 0.3) onClick={(e : Html.Event) { handleDurationChange(0.3) }}>
            "0.3s"
          </button>
          <button::button(animationDuration == 0.5) onClick={(e : Html.Event) { handleDurationChange(0.5) }}>
            "0.5s"
          </button>
          <button::button(animationDuration == 1) onClick={(e : Html.Event) { handleDurationChange(1) }}>
            "1s"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Actions"</div>
        <div::buttonGroup>
          <button::actionButton onClick={(e : Html.Event) { expandAll() }}>
            "Expand All"
          </button>
          <button::actionButton onClick={(e : Html.Event) { collapseAll() }}>
            "Collapse All"
          </button>
        </div>
      </div>

      <div::controlGroup>
        <div::controlLabel>"Options"</div>
        <div::buttonGroup>
          <button::toggleButton(accordion) onClick={(e : Html.Event) { toggleAccordion() }}>
            "Accordion"
          </button>
          <button::toggleButton(border) onClick={(e : Html.Event) { toggleBorder() }}>
            "Border"
          </button>
          <button::toggleButton(animated) onClick={(e : Html.Event) { toggleAnimated() }}>
            "Animated"
          </button>
        </div>
      </div>
    </div>
  }

  /* Styles */
  style formContent {
    display: flex;
    flex-direction: column;
    gap: 14px;
    width: 100%;
    max-width: 100%;
    box-sizing: border-box;
  }

  style formGroup {
    display: flex;
    flex-direction: column;
    gap: 6px;
    width: 100%;
    max-width: 100%;
    box-sizing: border-box;
  }

  style formLabel {
    font-size: 13px;
    font-weight: 500;
    color: #646566;
  }

  style formInput {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    font-size: 14px;
    color: #323233;
    transition: all 0.2s ease;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #1890ff;
      box-shadow: 0 0 0 3px rgba(24, 144, 255, 0.1);
    }

    &::placeholder {
      color: #c8c9cc;
    }
  }

  style textareaInput {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    font-size: 14px;
    color: #323233;
    transition: all 0.2s ease;
    font-family: inherit;
    resize: vertical;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #1890ff;
      box-shadow: 0 0 0 3px rgba(24, 144, 255, 0.1);
    }

    &::placeholder {
      color: #c8c9cc;
    }
  }

  style selectInput {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    font-size: 14px;
    color: #323233;
    transition: all 0.2s ease;
    background: #fff;
    cursor: pointer;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #1890ff;
      box-shadow: 0 0 0 3px rgba(24, 144, 255, 0.1);
    }
  }

  style radioGroup {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  style radioLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-size: 14px;
    color: #323233;
    padding: 6px 0;

    &:hover {
      color: #1890ff;
    }
  }

  style radioInput {
    width: 18px;
    height: 18px;
    cursor: pointer;
    accent-color: #1890ff;
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-size: 14px;
    color: #323233;
    padding: 6px 0;

    &:hover {
      color: #1890ff;
    }
  }

  style checkboxInput {
    width: 18px;
    height: 18px;
    cursor: pointer;
    accent-color: #1890ff;
  }

  style addButton {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 16px;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style controlsTitle {
    font-size: 15px;
    font-weight: 600;
    margin: 0 0 16px;
    color: #323233;
  }

  style controlGroup {
    margin-bottom: 20px;
  }

  style controlLabel {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 8px;
  }

  style buttonGroup {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    border: 2px solid #1890ff;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      background: #1890ff;
      color: #fff;
    } else {
      background: #fff;
      color: #1890ff;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(24, 144, 255, 0.3);
    }
  }

  style toggleButton (active : Bool) {
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;

    if active {
      border: 2px solid #52c41a;
      background: #52c41a;
      color: #fff;
    } else {
      border: 2px solid #d9d9d9;
      background: #fff;
      color: #666;
    }

    &:hover {
      transform: translateY(-2px);
    }
  }

  style actionButton {
    padding: 8px 16px;
    border-radius: 6px;
    border: 2px solid #722ed1;
    font-size: 13px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
    background: #fff;
    color: #722ed1;

    &:hover {
      background: #722ed1;
      color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(114, 46, 209, 0.3);
    }

    &:active {
      transform: translateY(0);
    }
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Collapse"
      description="Collapsible panels for organizing content. Perfect for FAQs, forms, and dynamic sections."
      badge="Display"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="Collapse organiza contenido en paneles expandibles con animaciones suaves. Ideal para FAQs, formularios dinámicos, y secciones de contenido. Controla el ancho con la propiedad width (min 420px), velocidad de animación, expande/colapsa todos, y usa modo acordeón para mostrar solo un panel a la vez. Perfecto para interfaces móviles y desktop."
      codeExamples={
        [
          {
            title: "Basic Collapse",
            description: "Paneles colapsables básicos con múltiples paneles abiertos permitidos. Incluye panel deshabilitado.",
            snippet: {
              code: "state active : Array(String) = []\n\nfun handleChange (event : CollapseChangeEvent) : Promise(Void) {\n  next { active: event.active }\n}\n\n<Collapse\n  items={[\n    {\n      name: \"item1\",\n      title: \"What is Mint Lang?\",\n      content: <div>\"A refreshing language for front-end web\"</div>,\n      disabled: false,\n      icon: \"\",\n      badge: \"\",\n      removable: false,\n      extraData: \"\"\n    },\n    {\n      name: \"item2\",\n      title: \"Disabled Panel\",\n      content: <div>\"This panel cannot be opened\"</div>,\n      disabled: true,\n      icon: \"\",\n      badge: \"\",\n      removable: false,\n      extraData: \"\"\n    }\n  ]}\n  active={active}\n  accordion={false}\n  border={true}\n  animated={true}\n  onChange={handleChange}/>",
              language: "mint"
            },
            previewContent: <div style="width: 100%;">
              <Collapse
                items={getBasicItems()}
                active={activeBasic}
                accordion={false}
                border={true}
                onChange={handleBasicChange}/>
            </div>,
            showReplay: false
          },
          {
            title: "Accordion Mode (FAQs)",
            description: "Modo acordeón para FAQs - solo un panel abierto a la vez. Incluye badge \"Popular\".",
            snippet: {
              code: "state activeAccordion : Array(String) = [\"faq1\"]\n\nfun handleAccordionChange (event : CollapseChangeEvent) : Promise(Void) {\n  next { activeAccordion: event.active }\n}\n\n<Collapse\n  items={[\n    {\n      name: \"faq1\",\n      title: \"How does accordion mode work?\",\n      content: <div>\"Only one panel open at a time\"</div>,\n      disabled: false,\n      icon: \"\",\n      badge: \"\",\n      removable: false,\n      extraData: \"\"\n    },\n    {\n      name: \"faq2\",\n      title: \"Is it responsive?\",\n      content: <div>\"Yes! Mobile-first design\"</div>,\n      disabled: false,\n      icon: \"\",\n      badge: \"Popular\",\n      removable: false,\n      extraData: \"\"\n    }\n  ]}\n  active={activeAccordion}\n  accordion={true}\n  border={true}\n  animated={true}\n  animationDuration={0.3}\n  onChange={handleAccordionChange}/>",
              language: "mint"
            },
            previewContent: <div style="width: 100%;">
              <Collapse
                items={getAccordionItems()}
                active={activeAccordion}
                accordion={true}
                border={true}
                onChange={handleAccordionChange}/>
            </div>,
            showReplay: false
          },
          {
            title: "Dynamic Forms",
            description: "Formularios dinámicos: agrega/elimina usuarios con badge \"Adicional\" en usuarios adicionales.",
            snippet: {
              code: "state users : Array(Number) = [1]\nstate activeUsers : Array(String) = [\"user-1\"]\n\n// Contenido del formulario (puedes personalizarlo)\nfun getUserFormContent (userId : Number) : Html {\n  <div>\n    <label>\"Nombre\"</label>\n    <input type=\"text\" placeholder=\"Juan Pérez\"/>\n    \n    <label>\"Email\"</label>\n    <input type=\"email\" placeholder=\"email@ejemplo.com\"/>\n    \n    <label>\"Teléfono\"</label>\n    <input type=\"tel\" placeholder=\"+52 123 456 7890\"/>\n  </div>\n}\n\n// Mapear state users a CollapseItems con JS\nfun getUserItems : Array(CollapseItem) {\n  // Usa JavaScript inline para mapear dinámicamente\n  // cada userId se convierte en un CollapseItem\n  // badge: index > 0 ? 'Adicional' : ''\n  // removable: users.length > 1\n}\n\n<Collapse\n  items={getUserItems()}\n  active={activeUsers}\n  onChange={handleUsersChange}\n  onRemove={handleRemoveUser}/>\n\n<button onClick={addUser}>\n  \"+ Agregar Usuario\"\n</button>",
              language: "mint"
            },
            previewContent: <div style="width: 100%;">
              <Collapse
                items={getUserItems()}
                active={activeUsers}
                accordion={false}
                border={true}
                onChange={handleUsersChange}
                onRemove={handleRemoveUser}/>
              <button::addButton onClick={(e : Html.Event) { addUser() }}>
                "+ Agregar Usuario"
              </button>
            </div>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          { name: "items", description: "Array of collapse items to display", type: "Array(CollapseItem)", defaultValue: "[]" },
          { name: "active", description: "Array of active item names (expanded panels)", type: "Array(String)", defaultValue: "[]" },
          { name: "accordion", description: "Only allow one panel open at a time", type: "Bool", defaultValue: "false" },
          { name: "border", description: "Show borders around the collapse", type: "Bool", defaultValue: "true" },
          { name: "animated", description: "Enable smooth animations", type: "Bool", defaultValue: "true" },
          { name: "animationDuration", description: "Duration of expand/collapse animation in seconds", type: "Number", defaultValue: "0.3" },
          { name: "width", description: "Width of the collapse component (auto, 100%, 300px, 500px, etc.)", type: "String", defaultValue: "\"100%\"" },
          { name: "minWidth", description: "Minimum width of the collapse component (0, 420px, etc.). Set to 0 to allow smaller widths", type: "String", defaultValue: "\"420px\"" }
        ]
      }
      events={
        [
          { name: "onChange", description: "Triggered when a panel is expanded or collapsed", type: "CollapseChangeEvent", defaultValue: "{ name, active, expanded }" },
          { name: "onRemove", description: "Triggered when a removable item is removed", type: "CollapseRemoveEvent", defaultValue: "{ name, index }" }
        ]
      }
      enabledTabs={["preview", "usage", "api"]}/>
  }
}
