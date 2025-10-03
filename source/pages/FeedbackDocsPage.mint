/* FeedbackDocsPage - Documentación de Feedback */
component FeedbackDocsPage {
  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style section {
    margin-bottom: 3rem;
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Feedback Components"</h1>
      <p>"User feedback components: alerts, toasts, modals, tooltips, spinners."</p>

      <div::section>
        <h2>"Alert - Alert Messages"</h2>
        <p>"Contextual alerts with variants: info, success, warning, error."</p>
      </div>

      <div::section>
        <h2>"Toast - Toast Notifications"</h2>
        <p>"Temporary notifications with auto-dismiss and positioning."</p>
      </div>

      <div::section>
        <h2>"Modal - Modal Dialogs"</h2>
        <p>"Overlay modals with backdrop and animations."</p>
      </div>

      <div::section>
        <h2>"Tooltip - Tooltips"</h2>
        <p>"Contextual tooltips with positioning."</p>
      </div>

      <div::section>
        <h2>"Spinner - Loading Indicators"</h2>
        <p>"Loading spinners and progress indicators."</p>
      </div>
    </div>
  }
}
