/* ModalStore - Global state management for advanced Modal system */
store ModalStore {
  state modals : Array(ModalOptions) = []
  state currentModal : Maybe(ModalOptions) = Maybe.nothing()
  state isOpen : Bool = false
  state modalState : String = "normal"
  state inputValue : String = ""
  state timerProgress : Number = 0
  state modalId : Number = 0

  /* Callbacks */
  state onConfirm : Function(String, Promise(Void)) =
    (value : String) : Promise(Void) { Promise.resolve(void) }

  state onCancel : Function(Promise(Void)) =
    () : Promise(Void) { Promise.resolve(void) }

  state onClose : Function(Promise(Void)) =
    () : Promise(Void) { Promise.resolve(void) }

  /* Open modal with options */
  fun open (options : ModalOptions) : Promise(Void) {
    let updatedOptions =
      { options | zIndex: 1000 + Array.size(modals) * 10 }

    next {
      modals: Array.push(modals, options),
      currentModal: Maybe.just(updatedOptions),
      isOpen: true,
      modalState: "normal",
      inputValue: options.inputValue,
      modalId: modalId + 1
    }
  }

  /* Fire modal (SweetAlert2-style API) */
  fun fire (
    title : String,
    content : String,
    icon : String
  ) : Promise(ModalResult) {
    let options =
      { ModalDefaults.DEFAULT_OPTIONS |
        title: title,
        content: content,
        icon: icon
      }

    open(options)

    Promise.resolve({ isConfirmed: false, isDismissed: true, value: "" })
  }

  /* Fire with custom options */
  fun fireWithOptions (options : ModalOptions) : Promise(ModalResult) {
    open(options)

    Promise.resolve({ isConfirmed: false, isDismissed: true, value: "" })
  }

  /* Close current modal */
  fun close : Promise(Void) {
    let newModals =
      if Array.isEmpty(modals) {
        []
      } else {
        Array.deleteAt(modals, Array.size(modals) - 1)
      }

    let newCurrentModal =
      if Array.isEmpty(newModals) {
        Maybe.nothing()
      } else {
        Array.last(newModals)
      }

    onClose()

    next {
      modals: newModals,
      currentModal: newCurrentModal,
      isOpen: !Array.isEmpty(newModals),
      modalState: "normal",
      inputValue: "",
      timerProgress: 0
    }
  }

  /* Close all modals */
  fun closeAll : Promise(Void) {
    next {
      modals: [],
      currentModal: Maybe.nothing(),
      isOpen: false,
      modalState: "normal",
      inputValue: "",
      timerProgress: 0
    }
  }

  /* Handle confirm action */
  fun handleConfirm : Promise(Void) {
    onConfirm(inputValue)
    close()
  }

  /* Handle cancel action */
  fun handleCancel : Promise(Void) {
    onCancel()
    close()
  }

  /* Handle backdrop click */
  fun handleBackdropClick : Promise(Void) {
    currentModal
    |> Maybe.map(
      (options : ModalOptions) : Promise(Void) {
        if options.closeOnBackdrop {
          handleCancel()
        } else {
          Promise.resolve(void)
        }
      })
    |> Maybe.withDefault(Promise.resolve(void))
  }

  /* Handle escape key */
  fun handleEscapeKey : Promise(Void) {
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
  }

  /* Set modal state (minimize, maximize, etc.) */
  fun setModalState (state : String) : Promise(Void) {
    next { modalState: state }
  }

  /* Minimize modal */
  fun minimize : Promise(Void) {
    setModalState("minimized")
  }

  /* Maximize modal */
  fun maximize : Promise(Void) {
    setModalState("maximized")
  }

  /* Restore modal to normal */
  fun restore : Promise(Void) {
    setModalState("normal")
  }

  /* Toggle fullscreen */
  fun toggleFullscreen : Promise(Void) {
    if modalState == "fullscreen" {
      setModalState("normal")
    } else {
      setModalState("fullscreen")
    }
  }

  /* Update input value */
  fun updateInputValue (value : String) : Promise(Void) {
    next { inputValue: value }
  }

  /* Set callbacks */
  fun setOnConfirm (callback : Function(String, Promise(Void))) : Promise(Void) {
    next { onConfirm: callback }
  }

  fun setOnCancel (callback : Function(Promise(Void))) : Promise(Void) {
    next { onCancel: callback }
  }

  fun setOnClose (callback : Function(Promise(Void))) : Promise(Void) {
    next { onClose: callback }
  }

  /* Update timer progress */
  fun updateTimerProgress (progress : Number) : Promise(Void) {
    next { timerProgress: progress }
  }

  /* Utility: Show success modal */
  fun success (title : String, message : String) : Promise(ModalResult) {
    fire(title, message, "success")
  }

  /* Utility: Show error modal */
  fun error (title : String, message : String) : Promise(ModalResult) {
    fire(title, message, "error")
  }

  /* Utility: Show warning modal */
  fun warning (title : String, message : String) : Promise(ModalResult) {
    fire(title, message, "warning")
  }

  /* Utility: Show info modal */
  fun info (title : String, message : String) : Promise(ModalResult) {
    fire(title, message, "info")
  }

  /* Utility: Show question modal */
  fun question (title : String, message : String) : Promise(ModalResult) {
    fire(title, message, "question")
  }

  /* Utility: Show confirm dialog */
  fun confirm (
    title : String,
    message : String,
    confirmCallback : Function(String, Promise(Void)),
    cancelCallback : Function(Promise(Void))
  ) : Promise(Void) {
    let options =
      { ModalDefaults.DEFAULT_OPTIONS |
        title: title,
        content: message,
        icon: "question",
        showCancelButton: true
      }

    setOnConfirm(confirmCallback)
    setOnCancel(cancelCallback)
    open(options)
  }

  /* Utility: Show input modal */
  fun input (
    title : String,
    placeholder : String,
    inputType : String,
    confirmCallback : Function(String, Promise(Void))
  ) : Promise(Void) {
    let options =
      { ModalDefaults.DEFAULT_OPTIONS |
        title: title,
        input: inputType,
        inputPlaceholder: placeholder,
        showCancelButton: true
      }

    setOnConfirm(confirmCallback)
    open(options)
  }
}
