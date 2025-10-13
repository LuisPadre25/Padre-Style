/* ModalTypes - Type definitions for advanced Modal system */

/* Modal configuration record */
type ModalOptions {
  /* Content */
  title : String,

  content : String,
  htmlContent : Html,

  /* Appearance */
  position : String,

  size : String,
  animation : String,
  theme : String,
  icon : String,

  /* Behavior */
  draggable : Bool,

  resizable : Bool,
  minimizable : Bool,
  maximizable : Bool,
  closeOnEscape : Bool,
  closeOnBackdrop : Bool,

  /* Backdrop */
  backdrop : Bool,

  backdropBlur : Bool,
  backdropColor : String,

  /* Header */
  showHeader : Bool,

  showCloseButton : Bool,
  headerContent : Html,

  /* Footer */
  showFooter : Bool,

  showConfirmButton : Bool,
  showCancelButton : Bool,
  confirmButtonText : String,
  cancelButtonText : String,
  footerContent : Html,

  /* Timer & Progress */
  timer : Number,

  showProgressBar : Bool,
  pauseOnHover : Bool,

  /* Input (for form modals) */
  input : String,

  inputValue : String,
  inputPlaceholder : String,
  inputValidator : Function(String, Result(String, String)),

  /* Custom styles */
  customClass : String,

  width : String,
  height : String,
  zIndex : Number
}

/* Modal result when closed */
type ModalResult {
  isConfirmed : Bool,
  isDismissed : Bool,
  value : String
}

/* Default modal options module */
module ModalDefaults {
  const DEFAULT_OPTIONS =
    {
      title: "",
      content: "",
      htmlContent: Html.empty(),
      position: "center",
      size: "md",
      animation: "fade",
      theme: "default",
      icon: "none",
      draggable: false,
      resizable: false,
      minimizable: false,
      maximizable: false,
      closeOnEscape: true,
      closeOnBackdrop: true,
      backdrop: true,
      backdropBlur: false,
      backdropColor: "rgba(0, 0, 0, 0.5)",
      showHeader: true,
      showCloseButton: true,
      headerContent: Html.empty(),
      showFooter: true,
      showConfirmButton: true,
      showCancelButton: true,
      confirmButtonText: "Confirm",
      cancelButtonText: "Cancel",
      footerContent: Html.empty(),
      timer: 0,
      showProgressBar: false,
      pauseOnHover: false,
      input: "text",
      inputValue: "",
      inputPlaceholder: "",
      inputValidator:
        (value : String) : Result(String, String) { Result.ok(value) },
      customClass: "",
      width: "",
      height: "",
      zIndex: 1000
    }
}
