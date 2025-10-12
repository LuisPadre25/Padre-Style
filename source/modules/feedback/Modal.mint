/* Modal - Advanced modal component superior to SweetAlert2, Vant UI, Ant Design */
component Modal {
  connect ModalStore exposing {
    isOpen,
    currentModal,
    modalState,
    inputValue,
    timerProgress,
    modalId,
    handleConfirm,
    handleCancel,
    handleBackdropClick,
    minimize,
    maximize,
    restore,
    toggleFullscreen,
    updateInputValue,
    updateTimerProgress,
    close
  }

  state isDragging : Bool = false
  state dragOffset : Tuple(Number, Number) = {0, 0}
  state position : Tuple(Number, Number) = {0, 0}
  state validationError : String = ""
  state timerTicks : Number = 0
  state timerPaused : Bool = false
  state timerDuration : Number = 0

  /* Resizable state */
  state isResizing : Bool = false

  state resizeDirection : String = ""
  state resizeStart : Tuple(Number, Number) = {0, 0}
  state modalSize : Tuple(Number, Number) = {600, 400}
  state lastModalId : Number = 0

  /* Use Provider.Tick for timer updates */
  use Provider.Tick { ticks: () { handleTimerTick() } }

  /* Handle input change */
  fun handleInputChange (event : Html.Event) : Promise(Void) {
    event.target
    |> Dom.getValue
    |> updateInputValue
  }

  /* Handle keyboard events */
  fun handleKeyDown (event : Html.Event) : Promise(Void) {
    if event.key == "Escape" {
      currentModal
      |> Maybe.map(
        (options : ModalOptions) : Promise(Void) {
          if options.closeOnEscape {
            handleCancel()
          } else {
            Promise.resolve(void)
          }
        })
      |> Maybe.withDefault(Promise.resolve(void))
    } else {
      Promise.resolve(void)
    }
  }

  /* Handle confirm with validation */
  fun handleConfirmWithValidation : Promise(Void) {
    handleConfirm()
  }

  /* Timer management functions */
  fun handleTimerTick : Promise(Void) {
    currentModal
    |> Maybe.map(
      (options : ModalOptions) : Promise(Void) {
        if options.timer > 0 {
          if timerDuration == 0 {
            startTimer(options.timer)
          } else if !timerPaused {
            let newTicks =
              timerTicks + 1000

            let progress =
              Math.min(newTicks / timerDuration * 100, 100)

            if progress >= 100 {
              resetTimer()
              close()
            } else {
              next { timerTicks: newTicks }
              updateTimerProgress(progress)
            }
          } else {
            Promise.resolve(void)
          }
        } else {
          Promise.resolve(void)
        }
      })
    |> Maybe.withDefault(Promise.resolve(void))
  }

  fun startTimer (duration : Number) : Promise(Void) {
    next { timerTicks: 0, timerPaused: false, timerDuration: duration }
  }

  fun pauseTimer : Promise(Void) {
    if !timerPaused {
      next { timerPaused: true }
    } else {
      Promise.resolve(void)
    }
  }

  fun resumeTimer : Promise(Void) {
    if timerPaused {
      next { timerPaused: false }
    } else {
      Promise.resolve(void)
    }
  }

  fun resetTimer : Promise(Void) {
    next { timerTicks: 0, timerPaused: false, timerDuration: 0 }
  }

  /* Draggable functions */
  fun startDrag (event : Html.Event) : Promise(Void) {
    let x =
      event.clientX

    let y =
      event.clientY

    next { isDragging: true, dragOffset: {x, y} }
  }

  fun handleDrag (event : Html.Event) : Promise(Void) {
    if isDragging {
      let x =
        event.clientX

      let y =
        event.clientY

      case dragOffset {
        {offsetX, offsetY} =>
          case position {
            {currentX, currentY} =>
              next {
                position: {currentX + (x - offsetX), currentY + (y - offsetY)},
                dragOffset: {x, y}
              }
          }
      }
    } else {
      Promise.resolve(void)
    }
  }

  fun stopDrag (event : Html.Event) : Promise(Void) {
    next { isDragging: false }
  }

  /* Resizable functions */
  fun startResize (direction : String, event : Html.Event) : Promise(Void) {
    currentModal
    |> Maybe.map(
      (options : ModalOptions) : Promise(Void) {
        let x =
          event.clientX

        let y =
          event.clientY

        let isNewModal =
          lastModalId != modalId

        let initialSize =
          if isNewModal {
            getInitialModalSize(options)
          } else {
            modalSize
          }

        next {
          isResizing: true,
          resizeDirection: direction,
          resizeStart: {x, y},
          modalSize: initialSize,
          lastModalId: modalId
        }
      })
    |> Maybe.withDefault(Promise.resolve(void))
  }

  fun handleResize (event : Html.Event) : Promise(Void) {
    if isResizing {
      let x =
        event.clientX

      let y =
        event.clientY

      let deltaX =
        case resizeStart {
          {startX, startY} => x - startX
        }

      let deltaY =
        case resizeStart {
          {startX, startY} => y - startY
        }

      let newSize =
        case modalSize {
          {width, height} =>
            if resizeDirection == "se" {
              {Math.max(300, width + deltaX), Math.max(200, height + deltaY)}
            } else if resizeDirection == "sw" {
              {Math.max(300, width - deltaX), Math.max(200, height + deltaY)}
            } else if resizeDirection == "ne" {
              {Math.max(300, width + deltaX), Math.max(200, height - deltaY)}
            } else if resizeDirection == "nw" {
              {Math.max(300, width - deltaX), Math.max(200, height - deltaY)}
            } else if resizeDirection == "e" {
              {Math.max(300, width + deltaX), height}
            } else if resizeDirection == "w" {
              {Math.max(300, width - deltaX), height}
            } else if resizeDirection == "n" {
              {width, Math.max(200, height - deltaY)}
            } else if resizeDirection == "s" {
              {width, Math.max(200, height + deltaY)}
            } else {
              {width, height}
            }
        }

      next { modalSize: newSize, resizeStart: {x, y} }
    } else {
      Promise.resolve(void)
    }
  }

  fun stopResize (event : Html.Event) : Promise(Void) {
    next { isResizing: false, resizeDirection: "" }
  }

  /*
  ======================
     BACKDROP STYLES
     ======================
  */
  style backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: 999;
    display: flex;
    animation: backdropFadeIn 0.3s ease;

    @keyframes backdropFadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }
  }

  style backdropCenter {
    align-items: center;
    justify-content: center;
  }

  style backdropTop {
    align-items: flex-start;
    justify-content: center;
    padding-top: 20px;
  }

  style backdropBottom {
    align-items: flex-end;
    justify-content: center;
    padding-bottom: 20px;
  }

  style backdropLeft {
    align-items: center;
    justify-content: flex-start;
    padding-left: 20px;
  }

  style backdropRight {
    align-items: center;
    justify-content: flex-end;
    padding-right: 20px;
  }

  style backdropFull {
    align-items: center;
    justify-content: center;
  }

  style backdropClickable {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: auto;
  }

  style backdropDefault {
    background: rgba(0, 0, 0, 0.5);
  }

  style backdropBlur {
    background: rgba(0, 0, 0, 0.3);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
  }

  /*
  ======================
     MODAL CONTAINER STYLES
     ======================
  */
  style modal {
    background: white;
    border-radius: 16px;
    box-shadow: 0 12px 48px rgba(0, 0, 0, 0.3);
    max-height: 90vh;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    z-index: 1000;
    pointer-events: auto;

    @media (max-width: 768px) {
      max-height: 95vh;
      border-radius: 12px;
      margin: 0 12px;
    }

    @media (max-width: 480px) {
      max-height: 98vh;
      border-radius: 8px;
      margin: 0 8px;
    }
  }

  /* Size variations */
  style sizeXs {
    width: 300px;
    max-width: 90vw;
  }

  style sizeSm {
    width: 400px;
    max-width: 90vw;
  }

  style sizeMd {
    width: 600px;
    max-width: 90vw;
  }

  style sizeLg {
    width: 800px;
    max-width: 90vw;
  }

  style sizeXl {
    width: 1000px;
    max-width: 95vw;
  }

  /* Position variations (animations only) */
  style positionCenter {
    animation: fadeZoomIn 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);

    @keyframes fadeZoomIn {
      from {
        opacity: 0;
        transform: scale(0.7);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  }

  style positionTop {
    animation: slideInDown 0.3s ease;

    @keyframes slideInDown {
      from {
        opacity: 0;
        transform: translateY(-50px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  style positionBottom {
    animation: slideInUp 0.3s ease;

    @keyframes slideInUp {
      from {
        opacity: 0;
        transform: translateY(50px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  style positionLeft {
    animation: slideInLeft 0.3s ease;

    @keyframes slideInLeft {
      from {
        opacity: 0;
        transform: translateX(-50px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }

  style positionRight {
    animation: slideInRight 0.3s ease;

    @keyframes slideInRight {
      from {
        opacity: 0;
        transform: translateX(50px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }

  style positionFull {
    width: 100vw;
    height: 100vh;
    max-width: 100vw;
    max-height: 100vh;
    border-radius: 0;
  }

  /* Theme variations */
  style themeCard {
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
    border: 1px solid rgba(255, 255, 255, 0.1);
  }

  style themeGlass {
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
  }

  style themeGradient {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;

    h2 {
      color: white;
    }

    p {
      color: rgba(255, 255, 255, 0.9);
    }
  }

  style themeNeon {
    background: #0a0e27;
    color: #00ff88;
    border: 2px solid #00ff88;

    box-shadow: 0 0 20px rgba(0, 255, 136, 0.3),
                0 0 40px rgba(0, 255, 136, 0.2),
                inset 0 0 20px rgba(0, 255, 136, 0.1);

    h2 {
      color: #00ff88;
      text-shadow: 0 0 10px rgba(0, 255, 136, 0.5);
    }
  }

  style themeDark {
    background: #1e1e1e;
    color: #e0e0e0;

    h2 {
      color: #ffffff;
    }
  }

  /* Modal state variations */
  style stateMinimized {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 300px !important;
    height: 60px;
    max-height: 60px;
    animation: minimizeAnimation 0.3s ease;

    @keyframes minimizeAnimation {
      from {
        transform: scale(1);
      }

      to {
        transform: scale(0.8);
      }
    }
  }

  style stateMaximized {
    width: 95vw !important;
    height: 95vh;
    max-width: 95vw !important;
    max-height: 95vh;
    animation: maximizeAnimation 0.3s ease;

    @keyframes maximizeAnimation {
      from {
        transform: scale(0.9);
      }

      to {
        transform: scale(1);
      }
    }
  }

  style stateFullscreen {
    width: 100vw !important;
    height: 100vh;
    max-width: 100vw !important;
    max-height: 100vh;
    border-radius: 0 !important;
  }

  /*
  ======================
     HEADER STYLES
     ======================
  */
  style header {
    padding: 24px;
    border-bottom: 1px solid #ebedf0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-shrink: 0;
    cursor: move;
    user-select: none;

    @media (max-width: 768px) {
      padding: 16px;
    }
  }

  style headerContent {
    flex: 1;
    display: flex;
    align-items: center;
    gap: 12px;
  }

  style title {
    font-size: 20px;
    font-weight: 600;
    color: #323233;
    margin: 0;
    line-height: 1.4;

    @media (max-width: 768px) {
      font-size: 18px;
    }
  }

  style headerActions {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  style iconButton {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    border: none;
    background: transparent;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s;
    font-size: 16px;
    color: #646566;

    &:hover {
      background: #f2f3f5;
      color: #323233;
    }

    &:active {
      transform: scale(0.9);
    }
  }

  style closeButton {
    color: #969799;

    &:hover {
      color: #ee0a24;
      background: #fff1f0;
    }
  }

  /*
  ======================
     ICON STYLES (SweetAlert2-style)
     ======================
  */
  style iconContainer {
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 20px auto;
  }

  style icon {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 40px;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1);

    @keyframes iconPop {
      0% {
        transform: scale(0);
        opacity: 0;
      }

      50% {
        transform: scale(1.1);
      }

      100% {
        transform: scale(1);
        opacity: 1;
      }
    }

    @media (max-width: 480px) {
      width: 60px;
      height: 60px;
      font-size: 32px;
    }
  }

  style iconSuccess {
    background: #e6f7f0;
    color: #07c160;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), successPulse 1.5s ease infinite;

    @keyframes successPulse {
      0%, 100% {
        box-shadow: 0 0 0 0 rgba(7, 193, 96, 0.4);
      }

      50% {
        box-shadow: 0 0 0 10px rgba(7, 193, 96, 0);
      }
    }
  }

  style iconError {
    background: #fff1f0;
    color: #ee0a24;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), errorShake 0.5s ease 0.3s;

    @keyframes errorShake {
      0%, 100% {
        transform: translateX(0);
      }

      25% {
        transform: translateX(-10px);
      }

      75% {
        transform: translateX(10px);
      }
    }
  }

  style iconWarning {
    background: #fff7e6;
    color: #ff976a;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), warningPulse 1s ease infinite;

    @keyframes warningPulse {
      0%, 100% {
        transform: scale(1);
      }

      50% {
        transform: scale(1.05);
      }
    }
  }

  style iconInfo {
    background: #e6f2ff;
    color: #1989fa;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), infoBounce 1s ease infinite;

    @keyframes infoBounce {
      0%, 100% {
        transform: translateY(0);
      }

      50% {
        transform: translateY(-5px);
      }
    }
  }

  style iconQuestion {
    background: #f3e8ff;
    color: #9c27b0;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), questionRotate 2s linear infinite;

    @keyframes questionRotate {
      0% {
        transform: rotate(0deg);
      }

      25% {
        transform: rotate(-5deg);
      }

      75% {
        transform: rotate(5deg);
      }

      100% {
        transform: rotate(0deg);
      }
    }
  }

  style iconLoading {
    background: #f2f3f5;
    color: #323233;
    animation: iconPop 0.5s cubic-bezier(0.34, 1.56, 0.64, 1), loadingSpin 1s linear infinite;

    @keyframes loadingSpin {
      from {
        transform: rotate(0deg);
      }

      to {
        transform: rotate(360deg);
      }
    }
  }

  /*
  ======================
     BODY STYLES
     ======================
  */
  style body {
    padding: 24px;
    overflow-y: auto;
    flex: 1;

    @media (max-width: 768px) {
      padding: 16px;
    }

    &::-webkit-scrollbar {
      width: 6px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(0, 0, 0, 0.2);
      border-radius: 3px;
    }

    &::-webkit-scrollbar-track {
      background: transparent;
    }
  }

  style content {
    font-size: 15px;
    line-height: 1.6;
    color: #646566;
    margin: 0;
    text-align: center;
    word-wrap: break-word;

    @media (max-width: 768px) {
      font-size: 14px;
    }
  }

  /* Input styles */
  style inputContainer {
    margin-top: 20px;
  }

  style input {
    width: 100%;
    padding: 12px 16px;
    font-size: 15px;
    border: 1px solid #dcdee0;
    border-radius: 8px;
    outline: none;
    transition: all 0.2s;
    box-sizing: border-box;

    &:focus {
      border-color: #1989fa;
      box-shadow: 0 0 0 2px rgba(25, 137, 250, 0.1);
    }

    @media (max-width: 768px) {
      font-size: 16px;
      padding: 10px 12px;
    }
  }

  style textarea {
    min-height: 100px;
    resize: vertical;
    font-family: inherit;
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-size: 15px;

    input[type="checkbox"] {
      width: 20px;
      height: 20px;
      cursor: pointer;
    }
  }

  style radioLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
    font-size: 15px;
    margin-bottom: 8px;

    input[type="radio"] {
      width: 18px;
      height: 18px;
      cursor: pointer;
    }
  }

  style rangeValue {
    text-align: center;
    margin-top: 8px;
    font-size: 14px;
    color: #1989fa;
    font-weight: 500;
  }

  style validationError {
    color: #ee0a24;
    font-size: 13px;
    margin-top: 8px;
    display: flex;
    align-items: center;
    gap: 4px;

    &::before {
      content: "⚠";
      font-size: 14px;
    }
  }

  /*
  ======================
     FOOTER STYLES
     ======================
  */
  style footer {
    padding: 16px 24px;
    border-top: 1px solid #ebedf0;
    display: flex;
    gap: 12px;
    flex-shrink: 0;

    @media (max-width: 768px) {
      padding: 12px 16px;
      flex-direction: column-reverse;
    }
  }

  style button {
    flex: 1;
    padding: 12px 24px;
    font-size: 15px;
    font-weight: 500;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    transition: all 0.2s;
    outline: none;

    &:active {
      transform: scale(0.98);
    }

    @media (max-width: 768px) {
      padding: 10px 20px;
      font-size: 14px;
    }
  }

  style buttonCancel {
    background: #f7f8fa;
    color: #646566;

    &:hover {
      background: #ebedf0;
    }
  }

  style buttonConfirm {
    background: linear-gradient(135deg, #1989fa 0%, #0c6edb 100%);
    color: white;
    box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);

    &:hover {
      box-shadow: 0 6px 16px rgba(25, 137, 250, 0.4);
      transform: translateY(-1px);
    }

    &:active {
      transform: translateY(0) scale(0.98);
    }
  }

  /* Progress bar for timer */
  style progressBar {
    position: absolute;
    bottom: 0;
    left: 0;
    height: 4px;
    background: linear-gradient(90deg, #1989fa 0%, #07c160 100%);
    transition: width 0.1s linear;
    border-radius: 0 0 0 16px;
  }

  /*
  ======================
     RESIZE HANDLE STYLES
     ======================
  */
  style resizeHandle {
    position: absolute;
    z-index: 10;
  }

  style resizeHandleN {
    top: 0;
    left: 0;
    width: 100%;
    height: 8px;
    cursor: n-resize;
  }

  style resizeHandleS {
    bottom: 0;
    left: 0;
    width: 100%;
    height: 8px;
    cursor: s-resize;
  }

  style resizeHandleE {
    top: 0;
    right: 0;
    width: 8px;
    height: 100%;
    cursor: e-resize;
  }

  style resizeHandleW {
    top: 0;
    left: 0;
    width: 8px;
    height: 100%;
    cursor: w-resize;
  }

  style resizeHandleNE {
    top: 0;
    right: 0;
    width: 16px;
    height: 16px;
    cursor: ne-resize;
  }

  style resizeHandleNW {
    top: 0;
    left: 0;
    width: 16px;
    height: 16px;
    cursor: nw-resize;
  }

  style resizeHandleSE {
    bottom: 0;
    right: 0;
    width: 16px;
    height: 16px;
    cursor: se-resize;
  }

  style resizeHandleSW {
    bottom: 0;
    left: 0;
    width: 16px;
    height: 16px;
    cursor: sw-resize;
  }

  /*
  ======================
     HELPER FUNCTIONS
     ======================
  */
  fun getBackdropClass (options : ModalOptions) : String {
    if options.backdropBlur {
      "backdropBlur"
    } else {
      "backdropDefault"
    }
  }

  fun getBackdropPositionClass (options : ModalOptions) : String {
    case options.position {
      "center" => "backdropCenter"
      "top" => "backdropTop"
      "bottom" => "backdropBottom"
      "left" => "backdropLeft"
      "right" => "backdropRight"
      "full" => "backdropFull"
      _ => "backdropCenter"
    }
  }

  fun getInitialModalSize (options : ModalOptions) : Tuple(Number, Number) {
    case options.size {
      "xs" => {300, 300}
      "sm" => {400, 400}
      "md" => {600, 400}
      "lg" => {800, 600}
      "xl" => {1000, 600}
      _ => {600, 400}
    }
  }

  fun getCurrentModalSize (options : ModalOptions) : Tuple(Number, Number) {
    if options.resizable {
      modalSize
    } else {
      getInitialModalSize(options)
    }
  }

  fun getCustomStyles (options : ModalOptions) : String {
    let isNewModal =
      lastModalId != modalId

    let currentSize =
      if isNewModal || !options.resizable {
        getInitialModalSize(options)
      } else {
        modalSize
      }

    let widthStyle =
      case currentSize {
        {width, height} =>
          if options.resizable {
            "width: " + Number.toString(width) + "px; "
          } else if String.isNotEmpty(options.width) {
            "width: " + options.width + "; max-width: " + options.width + "; "
          } else {
            ""
          }
      }

    let heightStyle =
      case currentSize {
        {width, height} =>
          if options.resizable {
            "height: " + Number.toString(height) + "px; "
          } else if String.isNotEmpty(options.height) {
            "height: " + options.height + "; "
          } else {
            ""
          }
      }

    let positionStyle =
      case position {
        {posX, posY} =>
          if options.draggable && (posX != 0 || posY != 0) {
            "margin-left: " + Number.toString(posX) + "px; " + "margin-top: " + Number.toString(
              posY) + "px; "
          } else {
            ""
          }
      }

    widthStyle + heightStyle + positionStyle
  }

  fun getSizeClass (options : ModalOptions) : String {
    if options.resizable {
      ""
    } else {
      case options.size {
        "xs" => "sizeXs"
        "sm" => "sizeSm"
        "md" => "sizeMd"
        "lg" => "sizeLg"
        "xl" => "sizeXl"
        "auto" => ""
        _ => "sizeMd"
      }
    }
  }

  fun getPositionClass (options : ModalOptions) : String {
    case options.position {
      "center" => "positionCenter"
      "top" => "positionTop"
      "bottom" => "positionBottom"
      "left" => "positionLeft"
      "right" => "positionRight"
      "full" => "positionFull"
      _ => "positionCenter"
    }
  }

  fun getThemeClass (options : ModalOptions) : String {
    case options.theme {
      "card" => "themeCard"
      "glass" => "themeGlass"
      "gradient" => "themeGradient"
      "neon" => "themeNeon"
      "dark" => "themeDark"
      _ => ""
    }
  }

  fun getStateClass : String {
    case modalState {
      "minimized" => "stateMinimized"
      "maximized" => "stateMaximized"
      "fullscreen" => "stateFullscreen"
      _ => ""
    }
  }

  fun getIconClass (icon : String) : String {
    case icon {
      "success" => "iconSuccess"
      "error" => "iconError"
      "warning" => "iconWarning"
      "info" => "iconInfo"
      "question" => "iconQuestion"
      "loading" => "iconLoading"
      "none" => ""
      _ => ""
    }
  }

  fun getIconSymbol (icon : String) : String {
    case icon {
      "success" => "✓"
      "error" => "✗"
      "warning" => "⚠"
      "info" => "ℹ"
      "question" => "?"
      "loading" => "⌛"
      "none" => ""
      _ => ""
    }
  }

  fun renderIcon (options : ModalOptions) : Html {
    if options.icon != "none" {
      <div::iconContainer>
        <div class={getIconClass(options.icon)}>
          {
            getIconSymbol(options.icon)
          }
        </div>
      </div>
    } else {
      <></>
    }
  }

  fun renderInput (options : ModalOptions) : Html {
    <div::inputContainer>
      <>
        if options.input == "textarea" {
          <textarea::input::textarea
            placeholder={options.inputPlaceholder}
            value={inputValue}
            onInput={handleInputChange}
          />
        } else if options.input == "select" {
          <select::input value={inputValue} onChange={handleInputChange}>
            <option value="">"-- Select --"</option>
          </select>
        } else if options.input == "checkbox" {
          <label::checkboxLabel>
            <input
              type="checkbox"
              checked={inputValue == "true"}
              onChange={handleInputChange}
            />

            <span>
              {
                options.inputPlaceholder
              }
            </span>
          </label>
        } else if options.input == "radio" {
          <div>
            <label::radioLabel>
              <input
                type="radio"
                name="modalRadio"
                value="option1"
                onChange={handleInputChange}
              />

              <span>"Option 1"</span>
            </label>
          </div>
        } else if options.input == "range" {
          <div>
            <input::input
              type="range"
              min="0"
              max="100"
              value={inputValue}
              onInput={handleInputChange}
            />

            <div::rangeValue>
              {
                inputValue
              }
            </div>
          </div>
        } else {
          <input::input
            type={options.input}
            placeholder={options.inputPlaceholder}
            value={inputValue}
            onInput={handleInputChange}
          />
        }

        if String.isNotEmpty(validationError) {
          <div::validationError>
            {
              validationError
            }
          </div>
        }
      </>
    </div>
  }

  fun renderResizeHandles (options : ModalOptions) : Html {
    if options.resizable {
      <>
        <div::resizeHandle::resizeHandleN
          onMouseDown={(e : Html.Event) : Promise(Void) { startResize("n", e) }}
        />

        <div::resizeHandle::resizeHandleS
          onMouseDown={(e : Html.Event) : Promise(Void) { startResize("s", e) }}
        />

        <div::resizeHandle::resizeHandleE
          onMouseDown={(e : Html.Event) : Promise(Void) { startResize("e", e) }}
        />

        <div::resizeHandle::resizeHandleW
          onMouseDown={(e : Html.Event) : Promise(Void) { startResize("w", e) }}
        />

        <div::resizeHandle::resizeHandleNE
          onMouseDown={
            (e : Html.Event) : Promise(Void) { startResize("ne", e) }
          }
        />

        <div::resizeHandle::resizeHandleNW
          onMouseDown={
            (e : Html.Event) : Promise(Void) { startResize("nw", e) }
          }
        />

        <div::resizeHandle::resizeHandleSE
          onMouseDown={
            (e : Html.Event) : Promise(Void) { startResize("se", e) }
          }
        />

        <div::resizeHandle::resizeHandleSW
          onMouseDown={
            (e : Html.Event) : Promise(Void) { startResize("sw", e) }
          }
        />
      </>
    } else {
      <></>
    }
  }

  fun render : Html {
    if isOpen {
      currentModal
      |> Maybe.map(
        (options : ModalOptions) : Html {
          <div::backdrop
            class={
              getBackdropClass(options) + " " + getBackdropPositionClass(
                options)
            }
            style={
              if options.draggable && isDragging {
                "pointer-events: auto;"
              } else {
                ""
              }
            }
            onKeyDown={handleKeyDown}
            onMouseMove={
              (event : Html.Event) : Promise(Void) {
                if options.draggable && isDragging {
                  handleDrag(event)
                } else if options.resizable && isResizing {
                  handleResize(event)
                } else {
                  Promise.resolve(void)
                }
              }
            }
            onMouseUp={
              (event : Html.Event) : Promise(Void) {
                if options.draggable && isDragging {
                  stopDrag(event)
                } else if options.resizable && isResizing {
                  stopResize(event)
                } else {
                  Promise.resolve(void)
                }
              }
            }
            tabindex="0"
          >
            <div::backdropClickable
              class={getBackdropClass(options)}
              style={"background: " + options.backdropColor + ";"}
              onClick={handleBackdropClick}
            />

            <div::modal
              class={
                getSizeClass(options) + " " + getPositionClass(options) + " " + getThemeClass(
                  options) + " " + getStateClass() + " " + options.customClass
              }
              style={getCustomStyles(options)}
              onMouseEnter={
                (event : Html.Event) : Promise(Void) {
                  if options.pauseOnHover && options.timer > 0 {
                    pauseTimer()
                  } else {
                    Promise.resolve(void)
                  }
                }
              }
              onMouseLeave={
                (event : Html.Event) : Promise(Void) {
                  if options.pauseOnHover && options.timer > 0 {
                    resumeTimer()
                  } else {
                    Promise.resolve(void)
                  }
                }
              }
            >
              <>
                if options.showHeader {
                  <div::header
                    onMouseDown={
                      (event : Html.Event) : Promise(Void) {
                        if options.draggable {
                          startDrag(event)
                        } else {
                          Promise.resolve(void)
                        }
                      }
                    }
                  >
                    <div::headerContent>
                      if String.isNotEmpty(options.title) {
                        <h2::title>
                          {
                            options.title
                          }
                        </h2>
                      }
                    </div>

                    <div::headerActions>
                      if options.minimizable {
                        <button::iconButton
                          onClick={
                            (e : Html.Event) : Promise(Void) { minimize() }
                          }
                        >"−"</button>
                      }

                      if options.maximizable {
                        <button::iconButton
                          onClick={
                            (e : Html.Event) : Promise(Void) {
                              if modalState == "maximized" {
                                restore()
                              } else {
                                maximize()
                              }
                            }
                          }
                        >
                          if modalState == "maximized" {
                            "⊡"
                          } else {
                            "□"
                          }
                        </button>
                      }

                      if options.showCloseButton {
                        <button::iconButton::closeButton onClick={handleCancel}>
                          "×"
                        </button>
                      }
                    </div>
                  </div>
                }

                <div::body>
                  <>
                    {
                      renderIcon(options)
                    }

                    if String.isNotEmpty(options.content) {
                      <p::content>
                        {
                          options.content
                        }
                      </p>
                    }

                    if options.htmlContent != Html.empty() {
                      options.htmlContent
                    }

                    if options.input != "text" || String.isNotEmpty(
                      options.inputPlaceholder) {
                      renderInput(options)
                    }
                  </>
                </div>

                if options.showFooter {
                  <div::footer>
                    <>
                      if options.showCancelButton {
                        <button::button::buttonCancel onClick={handleCancel}>
                          {
                            options.cancelButtonText
                          }
                        </button>
                      }

                      if options.showConfirmButton {
                        <button::button::buttonConfirm
                          onClick={handleConfirmWithValidation}
                        >
                          {
                            options.confirmButtonText
                          }
                        </button>
                      }

                      if options.footerContent != Html.empty() {
                        options.footerContent
                      }
                    </>
                  </div>
                }

                if options.showProgressBar && options.timer > 0 {
                  <div::progressBar
                    style={"width: " + Number.toString(timerProgress) + "%;"}
                  />
                }
              </>

              {
                renderResizeHandles(options)
              }
            </div>
          </div>
        })
      |> Maybe.withDefault(<></>)
    } else {
      <></>
    }
  }
}
