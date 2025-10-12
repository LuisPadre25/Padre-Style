/*
ActionSheet - Professional bottom action sheet panel
 * Based on Vant UI ActionSheet with enhanced features
 * Features: Overlay, Animations, Custom content, Cancel button, Icons, Status states
 * Mobile-first responsive design with safe area support
*/
component ActionSheet {
  /* Core Properties */
  property show : Bool = false

  property actions : Array(ActionSheetAction) = []
  property title : String = ""
  property cancelText : String = ""
  property description : String = ""

  /* Appearance */
  property closeable : Bool = true

  property closeIcon : String = "×"
  property round : Bool = true
  property overlay : Bool = true
  property overlayClass : String = ""
  property overlayStyle : String = ""

  /* Behavior */
  property duration : Number = 250

  property zIndex : Number = 2000
  property lockScroll : Bool = true
  property lazyRender : Bool = true
  property closeOnPopstate : Bool = true
  property closeOnClickAction : Bool = false
  property closeOnClickOverlay : Bool = true
  property safeAreaInsetBottom : Bool = true

  /* Events */
  property onSelect : Function(ActionSheetSelectEvent, Promise(Void)) =
    (event : ActionSheetSelectEvent) : Promise(Void) { Promise.never() }

  property onCancel : Function(ActionSheetCancelEvent, Promise(Void)) =
    (event : ActionSheetCancelEvent) : Promise(Void) { Promise.never() }

  property onOpen : Function(ActionSheetStateEvent, Promise(Void)) =
    (event : ActionSheetStateEvent) : Promise(Void) { Promise.never() }

  property onClose : Function(ActionSheetStateEvent, Promise(Void)) =
    (event : ActionSheetStateEvent) : Promise(Void) { Promise.never() }

  property onOpened : Function(ActionSheetStateEvent, Promise(Void)) =
    (event : ActionSheetStateEvent) : Promise(Void) { Promise.never() }

  property onClosed : Function(ActionSheetStateEvent, Promise(Void)) =
    (event : ActionSheetStateEvent) : Promise(Void) { Promise.never() }

  property onClickOverlay : Function(ActionSheetOverlayEvent, Promise(Void)) =
    (event : ActionSheetOverlayEvent) : Promise(Void) { Promise.never() }

  property beforeClose : Function(String, Promise(Bool)) =
    (action : String) : Promise(Bool) { Promise.resolve(true) }

  /* Custom Content */
  property children : Array(Html) = []

  /* State */
  state visible : Bool = false

  state animating : Bool = false
  state hasRendered : Bool = false

  /* Lifecycle */
  fun componentDidUpdate : Promise(Void) {
    if show && !visible {
      handleOpen()
    } else if !show && visible {
      handleClose()
    } else {
      Promise.never()
    }
  }

  /* Open handler */
  fun handleOpen : Promise(Void) {
    next { visible: true, animating: true, hasRendered: true }

    if lockScroll {
      `document.body.style.overflow = 'hidden'`
    } else {
      Promise.never()
    }

    onOpen({ timestamp: `Date.now()` })

    `
    setTimeout(() => {
      #{setAnimating}(false);
      #{triggerOpened}();
    }, #{Number.toString(duration)})
    `

    Promise.resolve(void)
  }

  /* Close handler */
  fun handleClose : Promise(Void) {
    next { visible: false, animating: true }

    `
    setTimeout(() => {
      #{setAnimating}(false);
      document.body.style.overflow = '';
      #{triggerClosed}();
    }, #{Number.toString(duration)})
    `

    Promise.resolve(void)
  }

  fun setVisible (value : Bool) : Promise(Void) {
    next { visible: value }
  }

  fun setAnimating (value : Bool) : Promise(Void) {
    next { animating: value }
  }

  fun triggerOpened : Promise(Void) {
    onOpened({ timestamp: `Date.now()` })
  }

  fun triggerClosed : Promise(Void) {
    onClosed({ timestamp: `Date.now()` })
  }

  /* Action click handler */
  fun handleActionClick (
    action : ActionSheetAction,
    index : Number,
    event : Html.Event
  ) : Promise(Void) {
    if action.disabled || action.loading {
      Promise.never()
    } else {
      `#{event}.preventDefault()`
      onSelect({ action: action, index: index })

      if closeOnClickAction {
        handleCloseRequest("action")
      } else {
        Promise.never()
      }
    }
  }

  /* Cancel click handler */
  fun handleCancelClick (event : Html.Event) : Promise(Void) {
    `#{event}.preventDefault()`
    onCancel({ timestamp: `Date.now()` })
    handleCloseRequest("cancel")
  }

  /* Overlay click handler */
  fun handleOverlayClick (event : Html.Event) : Promise(Void) {
    if closeOnClickOverlay {
      `#{event}.preventDefault()`
      onClickOverlay({ timestamp: `Date.now()` })
      handleCloseRequest("overlay")
    } else {
      Promise.never()
    }
  }

  /* Close icon click handler */
  fun handleCloseClick (event : Html.Event) : Promise(Void) {
    `#{event}.preventDefault()`
    handleCloseRequest("close")
  }

  /* Close request with beforeClose callback */
  fun handleCloseRequest (action : String) : Promise(Void) {
    `
    (async () => {
      const shouldClose = await #{beforeClose}(#{action});
      if (shouldClose) {
        #{onClose}({ timestamp: Date.now() });
        #{handleClose}();
      }
    })()
    `

    Promise.resolve(void)
  }

  /* Styles */
  style overlay (visible : Bool, animating : Bool) {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.7);
    z-index: #{Number.toString(zIndex)};

    if visible {
      animation: fadeIn 0.25s ease-in-out;
    } else {
      animation: fadeOut 0.25s ease-in-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }

    @keyframes fadeOut {
      from {
        opacity: 1;
      }

      to {
        opacity: 0;
      }
    }

    pointer-events: #{if visible {
      "auto"
    } else {
      "none"
    }};
  }

  style container (visible : Bool, animating : Bool, roundEnabled : Bool) {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    max-height: 80%;
    background: var(--van-background-2, #fff);
    z-index: #{Number.toString(zIndex + 1)};
    overflow: hidden;
    display: flex;
    flex-direction: column;

    if visible {
      animation: slideUp 0.25s ease-in-out;
    } else {
      animation: slideDown 0.25s ease-in-out;
    }

    @keyframes slideUp {
      from {
        transform: translateY(100%);
      }

      to {
        transform: translateY(0);
      }
    }

    @keyframes slideDown {
      from {
        transform: translateY(0);
      }

      to {
        transform: translateY(100%);
      }
    }

    if roundEnabled {
      border-radius: 16px 16px 0 0;
    }

    if safeAreaInsetBottom {
      padding-bottom: env(safe-area-inset-bottom);
    }
  }

  style header {
    position: relative;
    height: 48px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: var(--van-font-size-lg, 16px);
    font-weight: 500;
    color: var(--van-text-color, #323233);
    border-bottom: 1px solid var(--van-border-color, #ebedf0);
  }

  style closeButton {
    position: absolute;
    right: 0;
    top: 0;
    height: 48px;
    padding: 0 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    color: var(--van-gray-5, #c8c9cc);
    cursor: pointer;
    user-select: none;
    transition: color 0.2s ease;

    &:hover {
      color: var(--van-gray-7, #969799);
    }

    &:active {
      color: var(--van-gray-8, #646566);
    }
  }

  style descriptionArea {
    padding: 16px;
    text-align: center;
    color: var(--van-text-color-2, #646566);
    font-size: var(--van-font-size-md, 14px);
    line-height: var(--van-line-height-md, 1.5);
    border-bottom: 1px solid var(--van-border-color, #ebedf0);
  }

  style actionsList {
    flex: 1;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
  }

  style actionItem (disabled : Bool, loading : Bool) {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 14px 16px;
    background: var(--van-background-2, #fff);
    font-size: var(--van-font-size-lg, 16px);
    line-height: var(--van-line-height-lg, 1.6);
    color: var(--van-text-color, #323233);
    cursor: pointer;
    user-select: none;
    transition: background 0.2s ease;
    border-bottom: 1px solid var(--van-border-color, #ebedf0);

    if disabled {
      color: var(--van-text-color-3, #c8c9cc);
      cursor: not-allowed;
    }

    if !disabled && !loading {
      &:active {
        background: var(--van-active-color, #f2f3f5);
      }
    }
  }

  style actionIcon {
    font-size: 18px;
    margin-right: 8px;
  }

  style actionContent {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1;
  }

  style actionSubname {
    color: var(--van-text-color-2, #646566);
    font-size: var(--van-font-size-sm, 12px);
    line-height: var(--van-line-height-sm, 1.4);
    margin-top: 4px;
  }

  style cancelButton {
    padding: 14px 16px;
    background: var(--van-background, #fff);
    font-size: var(--van-font-size-lg, 16px);
    color: var(--van-gray-7, #969799);
    text-align: center;
    cursor: pointer;
    user-select: none;
    transition: background 0.2s ease;
    border-top: 8px solid var(--van-background, #f7f8fa);

    &:active {
      background: var(--van-active-color, #f2f3f5);
    }
  }

  style loadingSpinner {
    display: inline-block;
    width: 16px;
    height: 16px;
    border: 2px solid var(--van-border-color, #ebedf0);
    border-top-color: var(--van-primary-color, #1989fa);
    border-radius: 50%;
    animation: spin 0.8s linear infinite;
  }

  style customContent {
    padding: 16px;
    max-height: 60vh;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
  }

  /* Render overlay */
  fun renderOverlay : Html {
    if overlay && (visible || animating) {
      <div::overlay(visible, animating)
        onClick={handleOverlayClick}
        style={overlayStyle}
        class={overlayClass}
      />
    } else {
      Html.empty()
    }
  }

  /* Render header */
  fun renderHeader : Html {
    if String.isNotEmpty(title) {
      <div::header>
        {
          title
        }

        if closeable {
          <div::closeButton onClick={handleCloseClick}>
            {
              closeIcon
            }
          </div>
        } else {
          Html.empty()
        }
      </div>
    } else {
      Html.empty()
    }
  }

  /* Render description */
  fun renderDescription : Html {
    if String.isNotEmpty(description) {
      <div::descriptionArea>
        {
          description
        }
      </div>
    } else {
      Html.empty()
    }
  }

  /* Render actions list */
  fun renderActionsList : Html {
    if Array.isEmpty(children) {
      <div::actionsList>
        {
          Array.mapWithIndex(actions,
            (action : ActionSheetAction, index : Number) {
              <div::actionItem(action.disabled, action.loading)
                key={Number.toString(index)}
                onClick={
                  (e : Html.Event) { handleActionClick(action, index, e) }
                }
                style={
                  if String.isNotEmpty(action.color) {
                    "color: " + action.color + ";"
                  } else {
                    ""
                  }
                }
                class={action.className}
              >
                if String.isNotEmpty(action.icon) {
                  <div::actionIcon>
                    {
                      action.icon
                    }
                  </div>
                } else {
                  Html.empty()
                }

                if action.loading {
                  <div::loadingSpinner/>
                } else {
                  Html.empty()
                }

                <div::actionContent>
                  <div>
                    {
                      action.name
                    }
                  </div>

                  if String.isNotEmpty(action.subname) {
                    <div::actionSubname>
                      {
                        action.subname
                      }
                    </div>
                  } else {
                    Html.empty()
                  }
                </div>
              </div>
            })
        }
      </div>
    } else {
      <div::customContent>
        for child of children {
          child
        }
      </div>
    }
  }

  /* Render cancel button */
  fun renderCancelButton : Html {
    if String.isNotEmpty(cancelText) {
      <div::cancelButton onClick={handleCancelClick}>
        {
          cancelText
        }
      </div>
    } else {
      Html.empty()
    }
  }

  /* Render */
  fun render : Html {
    if !lazyRender || hasRendered {
      <>
        {
          renderOverlay()
        }

        if visible || animating {
          <div::container(visible, animating, round)>
            {
              renderHeader()
            }

            {
              renderDescription()
            }

            {
              renderActionsList()
            }

            {
              renderCancelButton()
            }
          </div>
        } else {
          Html.empty()
        }
      </>
    } else {
      Html.empty()
    }
  }
}
