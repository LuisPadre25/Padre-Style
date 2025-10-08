module DialogDefaults {
  const DEFAULT_OPTIONS =
    {
      title: "",
      message: "",
      messageAlign: "center",
      theme: "default",
      confirmButtonText: "Confirm",
      cancelButtonText: "Cancel",
      showCancelButton: true,
      closeOnClickOverlay: true
    }

  const DEFAULT_CALLBACK = () : Promise(Void) { Promise.resolve(void) }
}
