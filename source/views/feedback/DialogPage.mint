/* DialogPage - Interactive showcase for Dialog component */

component DialogPage {
  connect DialogStore exposing { showCustomDialog, showConfirmDialog, showAlert }

  state resultMessage : String = ""

  /* Example 1: Basic Alert */
  fun showBasicAlert : Promise(Void) {
    showAlert(
      "Alert",
      "This is a basic alert dialog",
      () : Promise(Void) {
        next { resultMessage: "✅ Alert confirmed" }
      })
  }

  /* Example 2: Confirmation Dialog */
  fun showConfirmation : Promise(Void) {
    showConfirmDialog(
      "Confirm Action",
      "Are you sure you want to delete this item?",
      () : Promise(Void) {
        next { resultMessage: "✅ Delete confirmed" }
      },
      () : Promise(Void) {
        next { resultMessage: "❌ Delete cancelled" }
      })
  }

  /* Example 3: Round Button Theme */
  fun showRoundTheme : Promise(Void) {
    showCustomDialog(
      "Round Buttons",
      "This dialog uses the round button theme",
      "round",
      "center",
      "Accept",
      "Decline",
      true,
      true,
      () : Promise(Void) {
        next { resultMessage: "✅ Accepted" }
      },
      () : Promise(Void) {
        next { resultMessage: "❌ Declined" }
      })
  }

  /* Example 4: Left Aligned Message */
  fun showLeftAlign : Promise(Void) {
    showCustomDialog(
      "Terms and Conditions",
      "By clicking confirm, you agree to our terms of service and privacy policy. This is a longer message to demonstrate left alignment.",
      "default",
      "left",
      "I Agree",
      "Cancel",
      true,
      true,
      () : Promise(Void) {
        next { resultMessage: "✅ Terms accepted" }
      },
      () : Promise(Void) {
        next { resultMessage: "❌ Terms rejected" }
      })
  }

  /* Example 5: Before Close Hook */
  fun showWithValidation : Promise(Void) {
    showCustomDialog(
      "Confirm Exit",
      "You have unsaved changes. Are you sure you want to exit?",
      "round",
      "center",
      "Exit Anyway",
      "Stay",
      true,
      false,
      () : Promise(Void) {
        next { resultMessage: "✅ Exited without saving" }
      },
      () : Promise(Void) {
        next { resultMessage: "✅ Stayed on page" }
      })
  }

  /* Example 6: No Overlay Close */
  fun showNoOverlayClose : Promise(Void) {
    showCustomDialog(
      "Important",
      "This dialog cannot be closed by clicking the overlay. You must choose an action.",
      "default",
      "center",
      "Understood",
      "Cancel",
      true,
      false,
      () : Promise(Void) {
        next { resultMessage: "✅ Understood" }
      },
      () : Promise(Void) {
        next { resultMessage: "❌ Cancelled" }
      })
  }

  /* Get code examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Alert",
        description: "Simple alert with OK button",
        snippet: { language: "mint", code: "DialogStore.showAlert(\n  \"Alert\",\n  \"This is a basic alert\",\n  () : Promise(Void) {\n    Debug.log(\"Alert confirmed\")\n  }\n)" },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Confirmation Dialog",
        description: "Ask user to confirm action",
        snippet: { language: "mint", code: "DialogStore.showConfirmDialog(\n  \"Delete Item\",\n  \"Are you sure?\",\n  () : Promise(Void) { /* Confirmed */ },\n  () : Promise(Void) { /* Cancelled */ }\n)" },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Custom Theme",
        description: "Use round button theme",
        snippet: { language: "mint", code: "DialogStore.showCustomDialog(\n  \"Custom\",\n  \"Round buttons\",\n  \"round\",\n  \"center\",\n  \"Accept\",\n  \"Decline\",\n  true,\n  true,\n  confirmCallback,\n  cancelCallback\n)" },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Left Aligned Message",
        description: "For longer text content",
        snippet: { language: "mint", code: "DialogStore.showCustomDialog(\n  \"Terms\",\n  \"Long text here...\",\n  \"default\",\n  \"left\",\n  \"I Agree\",\n  \"Cancel\",\n  true,\n  true,\n  confirmCallback,\n  cancelCallback\n)" },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "No Overlay Close",
        description: "Force button interaction",
        snippet: { language: "mint", code: "DialogStore.showCustomDialog(\n  \"Important\",\n  \"Must choose action\",\n  \"default\",\n  \"center\",\n  \"OK\",\n  \"Cancel\",\n  true,\n  false,\n  confirmCallback,\n  cancelCallback\n)" },
        previewContent: Html.empty(),
        showReplay: false
      }
    ]
  }

  style exampleButton {
    padding: 12px 24px;
    background: linear-gradient(135deg, #1989fa 0%, #0c6edb 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);
    width: 100%;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 16px rgba(25, 137, 250, 0.4);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style examplesGrid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 16px;
    width: 100%;
    max-width: 900px;
    margin-bottom: 24px;

    @media (max-width: 768px) {
      grid-template-columns: 1fr;
    }
  }

  style exampleCard {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  style exampleTitle {
    font-size: 16px;
    font-weight: 600;
    color: #323233;
    margin: 0;
  }

  style exampleDescription {
    font-size: 14px;
    color: #646566;
    margin: 0;
    line-height: 1.5;
  }

  style resultBox {
    background: #f7f8fa;
    padding: 16px;
    border-radius: 8px;
    border-left: 4px solid #1989fa;
    margin-top: 16px;
    font-size: 14px;
    color: #323233;
    min-height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  fun render : Html {
    <ComponentShowcase
      title="Dialog"
      description="Mobile-first modal dialog component inspired by SweetAlert2 and Vant. Supports themes, custom alignment, and async callbacks."
      previewContent={
        <>
          <Dialog/>

          <div::examplesGrid>
            <div::exampleCard>
              <h4::exampleTitle>"Basic Alert"</h4>
              <p::exampleDescription>"Simple alert dialog with OK button"</p>
              <button::exampleButton onClick={showBasicAlert}>
                "Show Alert"
              </button>
            </div>

            <div::exampleCard>
              <h4::exampleTitle>"Confirmation"</h4>
              <p::exampleDescription>"Confirm/Cancel dialog for dangerous actions"</p>
              <button::exampleButton onClick={showConfirmation}>
                "Show Confirmation"
              </button>
            </div>

            <div::exampleCard>
              <h4::exampleTitle>"Round Theme"</h4>
              <p::exampleDescription>"Modern round button style"</p>
              <button::exampleButton onClick={showRoundTheme}>
                "Show Round Theme"
              </button>
            </div>

            <div::exampleCard>
              <h4::exampleTitle>"Left Aligned"</h4>
              <p::exampleDescription>"Left-aligned text for longer content"</p>
              <button::exampleButton onClick={showLeftAlign}>
                "Show Left Align"
              </button>
            </div>

            <div::exampleCard>
              <h4::exampleTitle>"Validation Hook"</h4>
              <p::exampleDescription>"Dialog with beforeClose validation"</p>
              <button::exampleButton onClick={showWithValidation}>
                "Show Validation"
              </button>
            </div>

            <div::exampleCard>
              <h4::exampleTitle>"No Overlay Close"</h4>
              <p::exampleDescription>"Requires explicit button click"</p>
              <button::exampleButton onClick={showNoOverlayClose}>
                "Show No Overlay"
              </button>
            </div>
          </div>
        </>
      }
      controlsContent={
        if String.isNotEmpty(resultMessage) {
          <div::resultBox>
            {resultMessage}
          </div>
        } else {
          Html.empty()
        }
      }
      codeExamples={getCodeExamples()}/>
  }
}
