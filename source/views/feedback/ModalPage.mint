/* ModalPage - Interactive Modal Configurator */
component ModalPage {
  connect ModalStore exposing { open, closeAll }

  /* Custom Modal Configuration States */
  state customTitle : String = "Custom Modal"

  state customContent : String =
    "Configure all options on the right and click 'Open Custom Modal' to see your configuration in action!"

  state customPosition : String = "center"
  state customSize : String = "md"
  state customTheme : String = "default"
  state customIcon : String = "none"
  state customDraggable : Bool = false
  state customResizable : Bool = false
  state customMinimizable : Bool = false
  state customMaximizable : Bool = false
  state customBackdropBlur : Bool = false

  /* Open custom modal with current configuration */
  fun openCustomModal : Promise(Void) {
    closeAll()

    let options =
      { ModalDefaults.DEFAULT_OPTIONS |
        title: customTitle,
        content: customContent,
        position: customPosition,
        size: customSize,
        theme: customTheme,
        icon: customIcon,
        draggable: customDraggable,
        resizable: customResizable,
        minimizable: customMinimizable,
        maximizable: customMaximizable,
        backdropBlur: customBackdropBlur
      }

    open(options)
  }

  /* Update functions for form inputs */
  fun updateCustomTitle (event : Html.Event) : Promise(Void) {
    next { customTitle: Dom.getValue(event.target) }
  }

  fun updateCustomContent (event : Html.Event) : Promise(Void) {
    next { customContent: Dom.getValue(event.target) }
  }

  fun updateCustomPosition (event : Html.Event) : Promise(Void) {
    next { customPosition: Dom.getValue(event.target) }
  }

  fun updateCustomSize (event : Html.Event) : Promise(Void) {
    next { customSize: Dom.getValue(event.target) }
  }

  fun updateCustomTheme (event : Html.Event) : Promise(Void) {
    next { customTheme: Dom.getValue(event.target) }
  }

  fun updateCustomIcon (event : Html.Event) : Promise(Void) {
    next { customIcon: Dom.getValue(event.target) }
  }

  /* Toggle functions for checkboxes */
  fun toggleDraggable (event : Html.Event) : Promise(Void) {
    next { customDraggable: !customDraggable }
  }

  fun toggleResizable (event : Html.Event) : Promise(Void) {
    next { customResizable: !customResizable }
  }

  fun toggleMinimizable (event : Html.Event) : Promise(Void) {
    next { customMinimizable: !customMinimizable }
  }

  fun toggleMaximizable (event : Html.Event) : Promise(Void) {
    next { customMaximizable: !customMaximizable }
  }

  fun toggleBackdropBlur (event : Html.Event) : Promise(Void) {
    next { customBackdropBlur: !customBackdropBlur }
  }

  /* Code examples for documentation */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Modal",
        description: "Simple modal with title and message",
        snippet:
          {
            language: "mint",
            code:
              "let options = {\n  ModalDefaults.DEFAULT_OPTIONS |\n  title: \"Hello\",\n  content: \"Welcome!\"\n}\n\nModalStore.open(options)"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Positioned Modal",
        description: "Modal at specific position",
        snippet:
          {
            language: "mint",
            code:
              "let options = {\n  ModalDefaults.DEFAULT_OPTIONS |\n  title: \"Top Modal\",\n  position: \"top\"\n}\n\nModalStore.open(options)"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Themed Modal",
        description: "Apply beautiful themes",
        snippet:
          {
            language: "mint",
            code:
              "let options = {\n  ModalDefaults.DEFAULT_OPTIONS |\n  title: \"Glass Modal\",\n  theme: \"glass\",\n  backdropBlur: true\n}\n\nModalStore.open(options)"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Draggable Modal",
        description: "Allow user to drag modal",
        snippet:
          {
            language: "mint",
            code:
              "let options = {\n  ModalDefaults.DEFAULT_OPTIONS |\n  title: \"Drag Me!\",\n  draggable: true\n}\n\nModalStore.open(options)"
          },
        previewContent: Html.empty(),
        showReplay: false
      }
    ]
  }

  /* Styles */
  style controlsPanel {
    display: flex;
    flex-direction: column;
    gap: 16px;
    padding: 20px;
    background: white;
    border-radius: 12px;
  }

  style controlGroup {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  style controlLabel {
    font-size: 14px;
    font-weight: 500;
    color: #323233;
  }

  style controlInput {
    padding: 10px 12px;
    border: 1px solid #dcdee0;
    border-radius: 8px;
    font-size: 14px;
    transition: all 0.2s;

    &:focus {
      border-color: #1989fa;
      outline: none;
      box-shadow: 0 0 0 3px rgba(25, 137, 250, 0.1);
    }
  }

  style controlSelect {
    padding: 10px 12px;
    border: 1px solid #dcdee0;
    border-radius: 8px;
    font-size: 14px;
    background: white;
    cursor: pointer;
    transition: all 0.2s;

    &:focus {
      border-color: #1989fa;
      outline: none;
      box-shadow: 0 0 0 3px rgba(25, 137, 250, 0.1);
    }
  }

  style checkboxGroup {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 13px;
    color: #646566;
    cursor: pointer;
    user-select: none;
  }

  style checkboxInput {
    width: 18px;
    height: 18px;
    cursor: pointer;
  }

  style openModalButton {
    padding: 16px 24px;
    background: linear-gradient(135deg, #07c160 0%, #05a550 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(7, 193, 96, 0.3);
    margin-top: 8px;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 16px rgba(7, 193, 96, 0.4);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style previewText {
    font-size: 14px;
    line-height: 1.6;
    color: #646566;
    padding: 20px;
    background: #f7f8fa;
    border-radius: 12px;
    text-align: center;
  }

  /* Render controls panel */
  fun renderControlsPanel : Html {
    <div::controlsPanel>
      <div::controlGroup>
        <label::controlLabel>"Title"</label>

        <input::controlInput
          type="text"
          value={customTitle}
          onInput={updateCustomTitle}
        />
      </div>

      <div::controlGroup>
        <label::controlLabel>"Content"</label>

        <input::controlInput
          type="text"
          value={customContent}
          onInput={updateCustomContent}
        />
      </div>

      <div::controlGroup>
        <label::controlLabel>"Position"</label>

        <select::controlSelect
          value={customPosition}
          onChange={updateCustomPosition}
        >
          <option value="center">"Center"</option>
          <option value="top">"Top"</option>
          <option value="bottom">"Bottom"</option>
          <option value="left">"Left"</option>
          <option value="right">"Right"</option>
          <option value="full">"Full"</option>
        </select>
      </div>

      <div::controlGroup>
        <label::controlLabel>"Size"</label>

        <select::controlSelect value={customSize} onChange={updateCustomSize}>
          <option value="xs">"XS (300px)"</option>
          <option value="sm">"SM (400px)"</option>
          <option value="md">"MD (600px)"</option>
          <option value="lg">"LG (800px)"</option>
          <option value="xl">"XL (1000px)"</option>
        </select>
      </div>

      <div::controlGroup>
        <label::controlLabel>"Theme"</label>

        <select::controlSelect value={customTheme} onChange={updateCustomTheme}>
          <option value="default">"Default"</option>
          <option value="card">"Card"</option>
          <option value="glass">"Glass"</option>
          <option value="gradient">"Gradient"</option>
          <option value="neon">"Neon"</option>
          <option value="dark">"Dark"</option>
        </select>
      </div>

      <div::controlGroup>
        <label::controlLabel>"Icon"</label>

        <select::controlSelect value={customIcon} onChange={updateCustomIcon}>
          <option value="none">"None"</option>
          <option value="success">"Success"</option>
          <option value="error">"Error"</option>
          <option value="warning">"Warning"</option>
          <option value="info">"Info"</option>
          <option value="question">"Question"</option>
        </select>
      </div>

      <div::controlGroup>
        <label::controlLabel>"Features"</label>

        <div::checkboxGroup>
          <label::checkboxLabel>
            <input::checkboxInput
              type="checkbox"
              checked={customDraggable}
              onChange={toggleDraggable}
            />

            "Draggable"
          </label>

          <label::checkboxLabel>
            <input::checkboxInput
              type="checkbox"
              checked={customResizable}
              onChange={toggleResizable}
            />

            "Resizable"
          </label>

          <label::checkboxLabel>
            <input::checkboxInput
              type="checkbox"
              checked={customMinimizable}
              onChange={toggleMinimizable}
            />

            "Minimizable"
          </label>

          <label::checkboxLabel>
            <input::checkboxInput
              type="checkbox"
              checked={customMaximizable}
              onChange={toggleMaximizable}
            />

            "Maximizable"
          </label>

          <label::checkboxLabel>
            <input::checkboxInput
              type="checkbox"
              checked={customBackdropBlur}
              onChange={toggleBackdropBlur}
            />

            "Backdrop Blur"
          </label>
        </div>
      </div>
    </div>
  }

  /* Main render */
  fun render : Html {
    <>
      <Modal/>

      <ComponentShowcase
        title="Modal"
        description="Advanced modal system with 8+ positions, 6 sizes, 6 themes, draggable/resizable features, and more! Configure all options on the right and click 'Open Custom Modal' to see your configuration."
        badge="NEW"
        previewContent={
          <div
            style="display: flex; flex-direction: column; align-items: center; gap: 16px; padding: 20px;"
          >
            <div::previewText>
              "Configure all options on the right and click the button below to see your custom modal in action!"
            </div>

            <button::openModalButton onClick={openCustomModal}>
              "Open Custom Modal"
            </button>
          </div>
        }
        controlsContent={renderControlsPanel()}
        codeExamples={getCodeExamples()}
      />
    </>
  }
}
