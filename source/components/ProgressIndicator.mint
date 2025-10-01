/* Progress Indicator Component */
component ProgressIndicator {
  property steps : Array(String) = ["Step 1", "Step 2", "Step 3", "Step 4"]
  property currentStep : Number = 1
  property variant : String = "horizontal"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: auto;
  }

  style horizontalSteps {
    display: flex;
    align-items: center;
    gap: clamp(0.25rem, 1vw, 0.5rem);
    flex-wrap: wrap;
  }

  style verticalSteps {
    display: flex;
    flex-direction: column;
    gap: clamp(0.25rem, 1vw, 0.5rem);
  }

  style step {
    display: flex;
    align-items: center;
    gap: clamp(0.5rem, 1.5vw, 0.75rem);
    flex: 1;
    min-width: 0;
  }

  style stepNumber {
    width: clamp(32px, 6vw, 36px);
    height: clamp(32px, 6vw, 36px);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 700;
    flex-shrink: 0;
    transition: all 0.3s ease;
  }

  style stepLabel {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 600;
    flex: 1;
    min-width: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  style connector {
    flex: 1;
    height: 3px;
    border-radius: 10px;
    transition: all 0.4s ease;
    min-width: clamp(20px, 5vw, 40px);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getStepNumberStyles (index : Number) : String {
    if index < currentStep {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        color: #{ThemeHelpers.getTextInverse(currentTheme)};
        box-shadow: 0 2px 8px rgba(102, 126, 234, 0.4);
      "
    } else {
      if index == currentStep {
        "
          background: #{ThemeHelpers.getAccent(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          box-shadow: 0 4px 12px rgba(102, 126, 234, 0.5);
          transform: scale(1.1);
        "
      } else {
        "
          background: #{ThemeHelpers.getSurface(currentTheme)};
          color: #{ThemeHelpers.getTextSecondary(currentTheme)};
          border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
        "
      }
    }
  }

  fun getStepLabelStyles (index : Number) : String {
    if index <= currentStep {
      "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
    } else {
      "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun getConnectorStyles (index : Number) : String {
    if index < currentStep {
      "background: #{ThemeHelpers.getAccent(currentTheme)};"
    } else {
      "background: #{ThemeHelpers.getSurface(currentTheme)};"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div
        class={
          if variant == "vertical" {
            "verticalSteps"
          } else {
            "horizontalSteps"
          }
        }
      >
        {
          Array.mapWithIndex(steps,
            (stepLabel : String, index : Number) {
              <>
                <div::step>
                  <div::stepNumber style={getStepNumberStyles(index)}>
                    Number.toString(index + 1)
                  </div>

                  <div::stepLabel style={getStepLabelStyles(index)}>stepLabel</div>
                </div>

                {
                  if index < (Array.size(steps) - 1) && variant == "horizontal" {
                    <div::connector style={getConnectorStyles(index)}/>
                  } else {
                    <div/>
                  }
                }
              </>
            })
        }
      </div>
    </div>
  }
}
