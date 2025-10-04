/* Feedback Components */

/* Alert Component - Notifications and alerts */
component Alert {
  property children : Array(Html) = []
  property variant : String = "info"
  property title : String = ""
  property closable : Bool = false
  property onClose = (event : Html.Event) : Promise(Void) { Promise.never() }

  state isVisible : Bool = true

  style alert {
    padding: 1rem 1.25rem;
    border-radius: 8px;
    border-left: 4px solid;
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    position: relative;
    animation: slideIn 0.3s ease-out;
  }

  style info {
    background: rgba(59, 130, 246, 0.1);
    border-color: #3b82f6;
    color: #1e40af;
  }

  style success {
    background: rgba(16, 185, 129, 0.1);
    border-color: #10b981;
    color: #065f46;
  }

  style warning {
    background: rgba(245, 158, 11, 0.1);
    border-color: #f59e0b;
    color: #92400e;
  }

  style error {
    background: rgba(239, 68, 68, 0.1);
    border-color: #ef4444;
    color: #991b1b;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 0.5rem;
  }

  style title {
    font-weight: 600;
    font-size: 1rem;
    margin: 0;
  }

  style closeButton {
    background: none;
    border: none;
    font-size: 1.25rem;
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.2s ease;
    color: inherit;
    padding: 0;
    margin-left: 1rem;

    &:hover {
      opacity: 1;
    }
  }

  style content {
    line-height: 1.5;
  }

  style keyframes {
    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  fun handleClose (event : Html.Event) : Promise(Void) {
    next { isVisible: false }
  }

  fun render : Html {
    if isVisible {
      <div::alert::keyframes class={variant}>
        <div::header>
          <div>
            {
              if !String.isEmpty(title) {
                <h4::title>title</h4>
              } else {
                <div/>
              }
            }
          </div>

          {
            if closable {
              <button::closeButton onClick={handleClose}>"×"</button>
            } else {
              <div/>
            }
          }
        </div>

        <div::content>
          for child of children {
            child
          }
        </div>
      </div>
    } else {
      <div/>
    }
  }
}

/* Modal Component */
component Modal {
  property children : Array(Html) = []
  property isOpen : Bool = false
  property title : String = ""
  property size : String = "md"
  property onClose = (event : Html.Event) : Promise(Void) { Promise.never() }

  style overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(4px);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    animation: fadeIn 0.3s ease-out;
  }

  style modal {
    background: rgba(255, 255, 255, 0.98);
    border-radius: 12px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    max-height: 90vh;
    overflow-y: auto;
    animation: scaleIn 0.3s ease-out;
  }

  style small {
    width: 90%;
    max-width: 400px;
  }

  style medium {
    width: 90%;
    max-width: 600px;
  }

  style large {
    width: 90%;
    max-width: 900px;
  }

  style header {
    padding: 1.5rem 1.5rem 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    margin-bottom: 1.5rem;
  }

  style title {
    font-size: 1.25rem;
    font-weight: 600;
    color: #374151;
    margin: 0;
  }

  style closeButton {
    background: none;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.2s ease;
    color: #6b7280;
    padding: 0;

    &:hover {
      opacity: 1;
    }
  }

  style body {
    padding: 0 1.5rem 1.5rem;
    color: #374151;
  }

  style keyframes {
    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }

    @keyframes scaleIn {
      from {
        opacity: 0;
        transform: scale(0.95);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  }

  fun handleOverlayClick (event : Html.Event) : Promise(Void) {
    onClose(event)
  }

  fun handleModalClick (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    if isOpen {
      <div::overlay::keyframes onClick={handleOverlayClick}>
        <div::modal class={size} onClick={handleModalClick}>
          {
            if !String.isEmpty(title) {
              <div::header>
                <h2::title>title</h2>
                <button::closeButton onClick={onClose}>"×"</button>
              </div>
            } else {
              <div/>
            }
          }

          <div::body>
            for child of children {
              child
            }
          </div>
        </div>
      </div>
    } else {
      <div/>
    }
  }
}

/* Loading Component - Spinner and progress indicators */
component Loading {
  property size : String = "md"
  property variant : String = "spinner"
  property text : String = ""

  style wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.75rem;
  }

  style spinner {
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-top: 3px solid #667eea;
    border-radius: 50%;
    animation: spin 1s linear infinite;
  }

  style small {
    width: 1.5rem;
    height: 1.5rem;
  }

  style medium {
    width: 2.5rem;
    height: 2.5rem;
  }

  style large {
    width: 4rem;
    height: 4rem;
  }

  style dots {
    display: flex;
    gap: 0.25rem;
  }

  style dot {
    width: 0.5rem;
    height: 0.5rem;
    background: #667eea;
    border-radius: 50%;
    animation: bounce 1.4s infinite ease-in-out;
  }

  style dot1 {
    animation-delay: -0.32s;
  }

  style dot2 {
    animation-delay: -0.16s;
  }

  style pulse {
    width: 2rem;
    height: 2rem;
    background: #667eea;
    border-radius: 50%;
    animation: pulse 1.5s infinite ease-in-out;
  }

  style text {
    color: rgba(255, 255, 255, 0.8);
    font-size: 0.875rem;
    text-align: center;
  }

  style keyframes {
    @keyframes spin {
      0% {
        transform: rotate(0deg);
      }

      100% {
        transform: rotate(360deg);
      }
    }

    @keyframes bounce {
      0%, 80%, 100% {
        transform: scale(0);
      }

      40% {
        transform: scale(1);
      }
    }

    @keyframes pulse {
      0% {
        transform: scale(0);
        opacity: 1;
      }

      100% {
        transform: scale(1);
        opacity: 0;
      }
    }
  }

  fun render : Html {
    <div::wrapper::keyframes>
      {
        if variant == "dots" {
          <div::dots>
            <div::dot::dot1/>
            <div::dot::dot2/>
            <div::dot/>
          </div>
        } else if variant == "pulse" {
          <div::pulse class={size}/>
        } else {
          <div::spinner class={size}/>
        }
      }

      {
        if !String.isEmpty(text) {
          <div::text>text</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* Toast Component - Temporary notifications */
component Toast {
  property message : String = ""
  property variant : String = "info"
  property duration : Number = 3000
  property position : String = "top-right"

  state isVisible : Bool = true

  style toast {
    position: fixed;
    padding: 1rem 1.25rem;
    border-radius: 8px;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.2);
    z-index: 1000;
    animation: slideInToast 0.3s ease-out;
    max-width: 400px;
    font-weight: 500;
  }

  style topRight {
    top: 1rem;
    right: 1rem;
  }

  style topLeft {
    top: 1rem;
    left: 1rem;
  }

  style bottomRight {
    bottom: 1rem;
    right: 1rem;
  }

  style bottomLeft {
    bottom: 1rem;
    left: 1rem;
  }

  style info {
    background: rgba(59, 130, 246, 0.9);
    color: white;
  }

  style success {
    background: rgba(16, 185, 129, 0.9);
    color: white;
  }

  style warning {
    background: rgba(245, 158, 11, 0.9);
    color: white;
  }

  style error {
    background: rgba(239, 68, 68, 0.9);
    color: white;
  }

  style keyframes {
    @keyframes slideInToast {
      from {
        opacity: 0;
        transform: translateX(100%);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }
  }

  fun componentDidMount : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    if isVisible {
      <div::toast::keyframes class="#{variant} #{position}">message</div>
    } else {
      <div/>
    }
  }
}
