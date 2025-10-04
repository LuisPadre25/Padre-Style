component ToastPro {
  property id : String = ""
  property message : String = ""
  property type : String = "info"
  property duration : Number = 4000
  property hasProgress : Bool = true
  property actionLabel : String = ""

  property actionCallback : Function(Promise(Void)) =
    () : Promise(Void) { Promise.resolve(void) }

  property avatar : String = ""
  property customIcon : String = ""

  property onClose : Function(String, Promise(Void)) =
    (id : String) : Promise(Void) { Promise.resolve(void) }

  state isVisible : Bool = false
  state isExiting : Bool = false

  fun componentDidMount : Promise(Void) {
    next { isVisible: true }

    if duration > 0 {
      startExitDelayed()
      Promise.resolve(void)
    } else {
      Promise.resolve(void)
    }
  }

  fun startExitDelayed : Promise(Void) {
    await Timer.timeout(duration)
    startExit()
  }

  fun startExit : Promise(Void) {
    next { isExiting: true }
    await Timer.timeout(300)
    onClose(id)
  }

  fun handleAction : Promise(Void) {
    actionCallback()
    next { isExiting: true }
    await Timer.timeout(300)
    onClose(id)
  }

  fun getIcon : String {
    if customIcon != "" {
      customIcon
    } else {
      case type {
        "success" => "✓"
        "error" => "✕"
        "warning" => "⚠"
        => "ℹ"
      }
    }
  }

  fun getColor : String {
    case type {
      "success" => "#10b981"
      "error" => "#ef4444"
      "warning" => "#f59e0b"
      => "#3b82f6"
    }
  }


  style toast {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.25rem 1.5rem;
    border-radius: 16px;
    box-shadow:
      0 4px 6px -1px rgba(0, 0, 0, 0.15),
      0 10px 15px -3px rgba(0, 0, 0, 0.15),
      0 20px 25px -5px rgba(0, 0, 0, 0.1);
    min-width: 360px;
    max-width: 520px;
    margin-bottom: 1rem;
    position: relative;
    overflow: hidden;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
  }

  style exiting {
    opacity: 0;
    transform: translateX(120px) scale(0.9);
    transition: all 0.35s cubic-bezier(0.4, 0, 1, 1);
  }

  style iconWrapper {
    font-size: 1.5rem;
    font-weight: 700;
    width: 44px;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    flex-shrink: 0;
    background: rgba(255, 255, 255, 0.25);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  }

  style messageContent {
    flex: 1;
    font-size: 1rem;
    font-weight: 500;
    line-height: 1.6;
    color: white;
    letter-spacing: 0.01em;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  }

  style actionButton {
    padding: 0.625rem 1.25rem;
    border-radius: 8px;
    border: none;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 0.9rem;
    background: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);

    &:hover {
      transform: translateY(-1px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style closeButton {
    background: rgba(255, 255, 255, 0.25);
    border: none;
    color: white;
    width: 32px;
    height: 32px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.25rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    flex-shrink: 0;

    &:hover {
      background: rgba(255, 255, 255, 0.35);
      transform: rotate(90deg);
    }

    &:active {
      transform: rotate(90deg) scale(0.95);
    }
  }

  style progressBarContainer {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: rgba(0, 0, 0, 0.15);
    overflow: hidden;
  }

  style progressBar {
    height: 100%;
    width: 100%;
    transform-origin: left;
    background: rgba(255, 255, 255, 0.4);
    box-shadow: 0 -1px 3px rgba(0, 0, 0, 0.15);

    @keyframes shrink {
      from {
        transform: scaleX(1);
      }

      to {
        transform: scaleX(0);
      }
    }
  }

  fun render : Html {
    <div::toast
      style={"background: " + getColor() + ";"}
      class={
        if isExiting {
          "exiting"
        } else {
          ""
        }
      }
    >
      <div::iconWrapper>
        {
          getIcon()
        }
      </div>

      <div::messageContent>
        {
          message
        }
      </div>

      if actionLabel != "" {
        <button::actionButton
          style={"color: " + getColor() + ";"}
          onClick={() { handleAction() }}
        >
          {
            actionLabel
          }
        </button>
      } else {
        <></>
      }

      <button::closeButton onClick={() { startExit() }}>"×"</button>

      if hasProgress && duration > 0 {
        <div::progressBarContainer>
          <div::progressBar
            style={
              "animation: shrink #{duration}ms linear;"
            }
          />
        </div>
      } else {
        <></>
      }
    </div>
  }
}
