/* Dialog - Mobile-first modal dialog component */
component Dialog {
  connect DialogStore exposing {
    isOpen,
    options,
    handleConfirm,
    handleCancel,
    handleOverlayClick
  }

  /* Prevent click propagation on content */
  fun stopPropagation (event : Html.Event) : Promise(Void) {
    `#{event}.stopPropagation()`
    Promise.resolve(void)
  }

  /* Overlay styles */
  style overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    padding: 16px;
    animation: fadeIn 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    overflow: auto;

    @keyframes fadeIn {
      from {
        opacity: 0;
      }

      to {
        opacity: 1;
      }
    }

    @keyframes fadeInScale {
      from {
        opacity: 0;
        transform: scale(0.9);
      }

      to {
        opacity: 1;
        transform: scale(1);
      }
    }
  }

  /* Dialog container - Mobile first: 320px base */
  style dialog {
    background: white;
    border-radius: 16px;
    width: 100%;
    max-width: 320px;
    overflow: hidden;
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.3);
    animation: fadeInScale 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
    position: relative;
    z-index: 1001;

    @media (min-width: 768px) {
      max-width: 420px;
    }
  }

  /* Header */
  style header {
    padding: 24px 24px 16px;
    text-align: center;
  }

  style title {
    font-size: 18px;
    font-weight: 600;
    color: #323233;
    margin: 0;
    line-height: 1.4;

    @media (min-width: 768px) {
      font-size: 20px;
    }
  }

  /* Content */
  style content {
    padding: 0 24px 24px;
  }

  style message {
    font-size: 14px;
    line-height: 1.6;
    color: #646566;
    margin: 0;
    word-wrap: break-word;

    @media (min-width: 768px) {
      font-size: 15px;
    }
  }

  style messageLeft {
    text-align: left;
  }

  style messageCenter {
    text-align: center;
  }

  style messageRight {
    text-align: right;
  }

  /* Footer - Default theme (stacked buttons) */
  style footer {
    display: flex;
    flex-direction: column;
    gap: 0;
    border-top: 1px solid #ebedf0;
  }

  /* Footer - Round button theme (horizontal) */
  style footerRound {
    display: flex;
    flex-direction: row;
    gap: 12px;
    padding: 16px 24px 24px;
  }

  /* Buttons - Default theme */
  style button {
    flex: 1;
    padding: 16px;
    border: none;
    background: transparent;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.2s;
    border-top: 1px solid #ebedf0;

    &:first-child {
      border-top: none;
    }

    &:active {
      background: #f2f3f5;
    }
  }

  style buttonCancel {
    color: #646566;
  }

  style buttonConfirm {
    color: #1989fa;
  }

  /* Buttons - Round theme */
  style buttonRound {
    flex: 1;
    padding: 12px 24px;
    border: none;
    border-radius: 24px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s;
  }

  style buttonCancelRound {
    background: #f7f8fa;
    color: #323233;

    &:hover {
      background: #ebedf0;
    }

    &:active {
      transform: scale(0.95);
    }
  }

  style buttonConfirmRound {
    background: linear-gradient(135deg, #1989fa 0%, #0c6edb 100%);
    color: white;
    box-shadow: 0 4px 12px rgba(25, 137, 250, 0.3);

    &:hover {
      box-shadow: 0 6px 16px rgba(25, 137, 250, 0.4);
    }

    &:active {
      transform: scale(0.95);
    }
  }

  /* Get message alignment class */
  fun getMessageAlignClass : String {
    if options.messageAlign == "left" {
      "messageLeft"
    } else if options.messageAlign == "right" {
      "messageRight"
    } else {
      "messageCenter"
    }
  }

  /* Render footer based on theme */
  fun renderFooter : Html {
    if options.theme == "round" {
      <div::footerRound>
        <>
          if options.showCancelButton {
            <button::buttonRound::buttonCancelRound onClick={handleCancel}>
              {
                options.cancelButtonText
              }
            </button>
          }

          <button::buttonRound::buttonConfirmRound onClick={handleConfirm}>
            {
              options.confirmButtonText
            }
          </button>
        </>
      </div>
    } else {
      <div::footer>
        <>
          if options.showCancelButton {
            <button::button::buttonCancel onClick={handleCancel}>
              {
                options.cancelButtonText
              }
            </button>
          }

          <button::button::buttonConfirm onClick={handleConfirm}>
            {
              options.confirmButtonText
            }
          </button>
        </>
      </div>
    }
  }

  fun render : Html {
    if isOpen {
      <div::overlay onClick={handleOverlayClick}>
        <div::dialog onClick={stopPropagation}>
          <>
            if String.isNotEmpty(options.title) {
              <div::header>
                <h3::title>
                  {
                    options.title
                  }
                </h3>
              </div>
            }

            <div::content>
              <p class={getMessageAlignClass()}>
                {
                  options.message
                }
              </p>
            </div>

            {
              renderFooter()
            }
          </>
        </div>
      </div>
    } else {
      <></>
    }
  }
}
