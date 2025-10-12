/*
ActionSheetPage - Professional ActionSheet Component Showcase
 * Using ComponentShowcase template with Mobile/Tablet/Desktop simulators
*/
component ActionSheetPage {
  connect NavigationStore exposing { setPage }
  connect ViewModeStore exposing { viewMode }
  connect ThemeStore exposing { theme }

  fun componentDidMount : Promise(Void) {
    setPage("action-sheet")
  }

  /* State for different ActionSheet examples */
  state showBasic : Bool = false

  state showWithIcons : Bool = false
  state showWithCancel : Bool = false
  state showWithDescription : Bool = false
  state showWithStatus : Bool = false
  state showCustomPanel : Bool = false

  /* Result state */
  state selectedAction : String = ""

  state selectCount : Number = 0
  state lastEvent : String = ""

  /* Configuration State */
  state round : Bool = true

  state closeable : Bool = true
  state closeOnClickAction : Bool = true
  state closeOnClickOverlay : Bool = true
  state showOverlay : Bool = true

  /* Actions data */
  fun getBasicActions : Array(ActionSheetAction) {
    [
      {
        name: "Option 1",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Option 2",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Option 3",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      }
    ]
  }

  fun getActionsWithIcons : Array(ActionSheetAction) {
    [
      {
        name: "Shopping Cart",
        subname: "",
        color: "",
        icon: "🛒",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Store",
        subname: "",
        color: "",
        icon: "🏪",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Favorites",
        subname: "",
        color: "",
        icon: "⭐",
        className: "",
        loading: false,
        disabled: false
      }
    ]
  }

  fun getActionsWithDescription : Array(ActionSheetAction) {
    [
      {
        name: "Option 1",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Option 2",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Option 3",
        subname: "This is a description",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      }
    ]
  }

  fun getActionsWithStatus : Array(ActionSheetAction) {
    [
      {
        name: "Colored Option",
        subname: "",
        color: "#ee0a24",
        icon: "",
        className: "",
        loading: false,
        disabled: false
      },
      {
        name: "Disabled Option",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: false,
        disabled: true
      },
      {
        name: "Loading Option",
        subname: "",
        color: "",
        icon: "",
        className: "",
        loading: true,
        disabled: false
      }
    ]
  }

  /* Event Handlers */
  fun handleSelect (event : ActionSheetSelectEvent) : Promise(Void) {
    next {
      selectedAction: event.action.name,
      selectCount: selectCount + 1,
      lastEvent: "Selected: " + event.action.name
    }
  }

  fun handleCancel (event : ActionSheetCancelEvent) : Promise(Void) {
    next { lastEvent: "Cancelled" }
  }

  fun handleOpen (event : ActionSheetStateEvent) : Promise(Void) {
    next { lastEvent: "Opened" }
  }

  fun handleClose (event : ActionSheetStateEvent) : Promise(Void) {
    next { lastEvent: "Closed" }
  }

  /* Show/Hide handlers */
  fun showBasicSheet (event : Html.Event) : Promise(Void) {
    next { showBasic: true }
  }

  fun showIconsSheet (event : Html.Event) : Promise(Void) {
    next { showWithIcons: true }
  }

  fun showCancelSheet (event : Html.Event) : Promise(Void) {
    next { showWithCancel: true }
  }

  fun showDescriptionSheet (event : Html.Event) : Promise(Void) {
    next { showWithDescription: true }
  }

  fun showStatusSheet (event : Html.Event) : Promise(Void) {
    next { showWithStatus: true }
  }

  fun showCustomSheet (event : Html.Event) : Promise(Void) {
    next { showCustomPanel: true }
  }

  /* Configuration Handlers */
  fun toggleRound (event : Html.Event) : Promise(Void) {
    next { round: !round }
  }

  fun toggleCloseable (event : Html.Event) : Promise(Void) {
    next { closeable: !closeable }
  }

  fun toggleCloseOnClickAction (event : Html.Event) : Promise(Void) {
    next { closeOnClickAction: !closeOnClickAction }
  }

  fun toggleCloseOnClickOverlay (event : Html.Event) : Promise(Void) {
    next { closeOnClickOverlay: !closeOnClickOverlay }
  }

  fun toggleOverlay (event : Html.Event) : Promise(Void) {
    next { showOverlay: !showOverlay }
  }

  /* Styles */
  style triggerButton {
    width: 100%;
    padding: 12px 20px;
    background: linear-gradient(135deg, var(--primary-color, #1989fa) 0%, #1e7fd8 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-bottom: 12px;
    box-shadow: 0 2px 8px rgba(25, 137, 250, 0.3);

    &:hover {
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(25, 137, 250, 0.4);
    }

    &:active {
      transform: translateY(0);
      box-shadow: 0 2px 4px rgba(25, 137, 250, 0.3);
    }
  }

  style examplesGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-bottom: 24px;
  }

  style statsBar {
    display: flex;
    gap: 16px;
    padding: 16px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 12px;
    margin-bottom: 24px;
    flex-wrap: wrap;
  }

  style statItem {
    flex: 1;
    min-width: 120px;
    text-align: center;
  }

  style statLabel {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.8);
    margin-bottom: 4px;
    font-weight: 500;
  }

  style statValue {
    font-size: 18px;
    font-weight: 700;
    color: white;
    word-break: break-word;
  }

  style customPanelContent {
    padding: 40px 20px;
    text-align: center;
  }

  style customPanelText {
    font-size: 16px;
    color: var(--text-color, #323233);
    margin-bottom: 20px;
  }

  style customPanelButton {
    padding: 10px 24px;
    background: var(--primary-color, #1989fa);
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.2s ease;

    &:active {
      transform: scale(0.95);
    }
  }

  /* Render preview content */
  fun renderPreviewContent : Html {
    <div style="position: relative; width: 100%; min-height: 600px;">
      <div style="padding: 16px;">
        <div::statsBar>
          <div::statItem>
            <div::statLabel>"Selected"</div>

            <div::statValue>
              {
                if String.isEmpty(selectedAction) {
                  "—"
                } else {
                  selectedAction
                }
              }
            </div>
          </div>

          <div::statItem>
            <div::statLabel>"Count"</div>

            <div::statValue>
              {
                Number.toString(selectCount)
              }
            </div>
          </div>

          <div::statItem>
            <div::statLabel>"Last Event"</div>

            <div::statValue>
              {
                if String.isEmpty(lastEvent) {
                  "—"
                } else {
                  lastEvent
                }
              }
            </div>
          </div>
        </div>

        <div::examplesGrid>
          <button::triggerButton onClick={showBasicSheet}>"Basic Usage"</button>
          <button::triggerButton onClick={showIconsSheet}>"With Icons"</button>
          <button::triggerButton onClick={showCancelSheet}>"With Cancel"</button>

          <button::triggerButton onClick={showDescriptionSheet}>
            "With Description"
          </button>

          <button::triggerButton onClick={showStatusSheet}>"Option Status"</button>
          <button::triggerButton onClick={showCustomSheet}>"Custom Panel"</button>
        </div>
      </div>

      <ActionSheet
        show={showBasic}
        actions={getBasicActions()}
        onSelect={handleSelect}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showBasic: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickAction={closeOnClickAction}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      />

      <ActionSheet
        show={showWithIcons}
        actions={getActionsWithIcons()}
        onSelect={handleSelect}
        onCancel={handleCancel}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showWithIcons: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickAction={closeOnClickAction}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      />

      <ActionSheet
        show={showWithCancel}
        actions={getBasicActions()}
        cancelText="Cancel"
        onSelect={handleSelect}
        onCancel={handleCancel}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showWithCancel: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickAction={true}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      />

      <ActionSheet
        show={showWithDescription}
        actions={getActionsWithDescription()}
        title="Action Sheet Title"
        description="This is a description of the action sheet"
        cancelText="Cancel"
        onSelect={handleSelect}
        onCancel={handleCancel}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showWithDescription: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickAction={true}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      />

      <ActionSheet
        show={showWithStatus}
        actions={getActionsWithStatus()}
        cancelText="Cancel"
        onSelect={handleSelect}
        onCancel={handleCancel}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showWithStatus: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickAction={true}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      />

      <ActionSheet
        show={showCustomPanel}
        title="Custom Content"
        cancelText="Close"
        onCancel={handleCancel}
        onOpen={handleOpen}
        onClose={handleClose}
        onClosed={
          (event : ActionSheetStateEvent) : Promise(Void) {
            next { showCustomPanel: false }
          }
        }
        round={round}
        closeable={closeable}
        closeOnClickOverlay={closeOnClickOverlay}
        overlay={showOverlay}
      >
        [
          <div::customPanelContent>
            <div::customPanelText>
              "This is custom panel content. You can put any HTML content here."
            </div>

            <button::customPanelButton
              onClick={
                (e : Html.Event) : Promise(Void) {
                  next { showCustomPanel: false }
                }
              }
            >"Confirm"</button>
          </div>
        ]
      </ActionSheet>
    </div>
  }

  /* Render controls */
  fun renderControls : Html {
    <div
      style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 12px; padding: 16px; background: var(--card-bg, #fff); border-radius: 12px;"
    >
      <label
        style="display: flex; align-items: center; gap: 8px; cursor: pointer;"
      >
        <input
          type="checkbox"
          checked={round}
          onChange={toggleRound}
          style="width: 18px; height: 18px;"
        />

        <span>"Round Corners"</span>
      </label>

      <label
        style="display: flex; align-items: center; gap: 8px; cursor: pointer;"
      >
        <input
          type="checkbox"
          checked={closeable}
          onChange={toggleCloseable}
          style="width: 18px; height: 18px;"
        />

        <span>"Closeable"</span>
      </label>

      <label
        style="display: flex; align-items: center; gap: 8px; cursor: pointer;"
      >
        <input
          type="checkbox"
          checked={closeOnClickAction}
          onChange={toggleCloseOnClickAction}
          style="width: 18px; height: 18px;"
        />

        <span>"Close on Click Action"</span>
      </label>

      <label
        style="display: flex; align-items: center; gap: 8px; cursor: pointer;"
      >
        <input
          type="checkbox"
          checked={closeOnClickOverlay}
          onChange={toggleCloseOnClickOverlay}
          style="width: 18px; height: 18px;"
        />

        <span>"Close on Click Overlay"</span>
      </label>

      <label
        style="display: flex; align-items: center; gap: 8px; cursor: pointer;"
      >
        <input
          type="checkbox"
          checked={showOverlay}
          onChange={toggleOverlay}
          style="width: 18px; height: 18px;"
        />

        <span>"Show Overlay"</span>
      </label>
    </div>
  }

  /* Code Examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Usage",
        description: "Simple action sheet with options",
        snippet:
          {
            code:
              "<ActionSheet
  show={show}
  actions={actions}
  onSelect={handleSelect}
/>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "With Cancel Button",
        description: "Action sheet with cancel button",
        snippet:
          {
            code:
              "<ActionSheet
  show={show}
  actions={actions}
  cancelText=\"Cancel\"
  closeOnClickAction={true}
  onSelect={handleSelect}
  onCancel={handleCancel}
/>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "With Icons and Description",
        description: "Full-featured action sheet",
        snippet:
          {
            code:
              "<ActionSheet
  show={show}
  actions={actionsWithIcons}
  title=\"Choose Action\"
  description=\"Please select an option\"
  cancelText=\"Cancel\"
  onSelect={handleSelect}
/>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      }
    ]
  }

  /* API Properties */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "show",
        type: "Bool",
        defaultValue: "false",
        description: "Whether to show ActionSheet"
      },
      {
        name: "actions",
        type: "Array(ActionSheetAction)",
        defaultValue: "[]",
        description: "List of action options"
      },
      {
        name: "title",
        type: "String",
        defaultValue: "\"\"",
        description: "Title of the sheet"
      },
      {
        name: "cancelText",
        type: "String",
        defaultValue: "\"\"",
        description: "Text for cancel button"
      },
      {
        name: "description",
        type: "String",
        defaultValue: "\"\"",
        description: "Description above options"
      },
      {
        name: "closeable",
        type: "Bool",
        defaultValue: "true",
        description: "Show close icon"
      },
      {
        name: "closeIcon",
        type: "String",
        defaultValue: "\"×\"",
        description: "Close icon character"
      },
      {
        name: "round",
        type: "Bool",
        defaultValue: "true",
        description: "Round top corners"
      },
      {
        name: "overlay",
        type: "Bool",
        defaultValue: "true",
        description: "Show background overlay"
      },
      {
        name: "closeOnClickAction",
        type: "Bool",
        defaultValue: "false",
        description: "Close when action clicked"
      },
      {
        name: "closeOnClickOverlay",
        type: "Bool",
        defaultValue: "true",
        description: "Close when overlay clicked"
      },
      {
        name: "duration",
        type: "Number",
        defaultValue: "300",
        description: "Animation duration (ms)"
      },
      {
        name: "zIndex",
        type: "Number",
        defaultValue: "2000",
        description: "Z-index value"
      },
      {
        name: "lockScroll",
        type: "Bool",
        defaultValue: "true",
        description: "Lock body scroll when open"
      },
      {
        name: "lazyRender",
        type: "Bool",
        defaultValue: "true",
        description: "Lazy render until shown"
      },
      {
        name: "safeAreaInsetBottom",
        type: "Bool",
        defaultValue: "true",
        description: "Safe area bottom padding"
      }
    ]
  }

  /* API Events */
  fun getApiEvents : Array(ApiProperty) {
    [
      {
        name: "onSelect",
        type: "ActionSheetSelectEvent",
        defaultValue: "{ action, index }",
        description: "Triggered when action is clicked"
      },
      {
        name: "onCancel",
        type: "ActionSheetCancelEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered when cancel is clicked"
      },
      {
        name: "onOpen",
        type: "ActionSheetStateEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered when opening"
      },
      {
        name: "onClose",
        type: "ActionSheetStateEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered when closing"
      },
      {
        name: "onOpened",
        type: "ActionSheetStateEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered after opened"
      },
      {
        name: "onClosed",
        type: "ActionSheetStateEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered after closed"
      },
      {
        name: "onClickOverlay",
        type: "ActionSheetOverlayEvent",
        defaultValue: "{ timestamp }",
        description: "Triggered when overlay clicked"
      }
    ]
  }

  fun render : Html {
    <ComponentShowcase
      title="ActionSheet"
      description="Bottom modal panel with action options for mobile-first experiences"
      badge="Feedback"
      previewContent={renderPreviewContent()}
      controlsContent={renderControls()}
      usageText="ActionSheet provides a mobile-optimized bottom panel for displaying multiple action options. It supports icons, descriptions, status states (loading, disabled), custom styling, and smooth animations."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={getApiEvents()}
      enabledTabs={["preview", "usage", "api"]}
      hideSimulator={false}
      mobileTitle="ActionSheet Demo"
      desktopUrl="padre-style.dev/action-sheet"
    />
  }
}
