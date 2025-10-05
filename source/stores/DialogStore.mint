/* DialogStore - Global state management for Dialog system */

store DialogStore {
  state isOpen : Bool = false
  state options : DialogOptions = DialogDefaults.DEFAULT_OPTIONS
  state onConfirm : Function(Promise(Void)) = DialogDefaults.DEFAULT_CALLBACK
  state onCancel : Function(Promise(Void)) = DialogDefaults.DEFAULT_CALLBACK

  /* Utility: Show confirmation dialog */
  fun showConfirmDialog (
    title : String,
    message : String,
    confirmCallback : Function(Promise(Void)),
    cancelCallback : Function(Promise(Void))
  ) : Promise(Void) {
    next {
      options:
        {
          title: title,
          message: message,
          messageAlign: "center",
          theme: "default",
          confirmButtonText: "Confirm",
          cancelButtonText: "Cancel",
          showCancelButton: true,
          closeOnClickOverlay: true
        },
      onConfirm: confirmCallback,
      onCancel: cancelCallback,
      isOpen: true
    }
  }

  /* Utility: Show alert dialog (no cancel button) */
  fun showAlert (
    title : String,
    message : String,
    confirmCallback : Function(Promise(Void))
  ) : Promise(Void) {
    next {
      options:
        {
          title: title,
          message: message,
          messageAlign: "center",
          theme: "default",
          confirmButtonText: "OK",
          cancelButtonText: "Cancel",
          showCancelButton: false,
          closeOnClickOverlay: true
        },
      onConfirm: confirmCallback,
      onCancel: () : Promise(Void) { Promise.resolve(void) },
      isOpen: true
    }
  }

  /* Utility: Show dialog with custom options */
  fun showCustomDialog (
    title : String,
    message : String,
    theme : String,
    messageAlign : String,
    confirmText : String,
    cancelText : String,
    showCancel : Bool,
    closeOnOverlay : Bool,
    confirmCallback : Function(Promise(Void)),
    cancelCallback : Function(Promise(Void))
  ) : Promise(Void) {
    next {
      options:
        {
          title: title,
          message: message,
          messageAlign: messageAlign,
          theme: theme,
          confirmButtonText: confirmText,
          cancelButtonText: cancelText,
          showCancelButton: showCancel,
          closeOnClickOverlay: closeOnOverlay
        },
      onConfirm: confirmCallback,
      onCancel: cancelCallback,
      isOpen: true
    }
  }

  /* Close dialog */
  fun closeDialog : Promise(Void) {
    next { isOpen: false }
  }

  /* Handle confirm action */
  fun handleConfirm : Promise(Void) {
    next { isOpen: false }
    onConfirm()
  }

  /* Handle cancel action */
  fun handleCancel : Promise(Void) {
    next { isOpen: false }
    onCancel()
  }

  /* Handle overlay click */
  fun handleOverlayClick : Promise(Void) {
    if options.closeOnClickOverlay {
      handleCancel()
    } else {
      Promise.resolve(void)
    }
  }
}
