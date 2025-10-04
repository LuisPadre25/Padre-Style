/* Progress Indicator Component - Zent Design Style */

component ProgressIndicator {
  property steps : Array(String) = ["Step 1", "Step 2", "Step 3", "Step 4"]
  property currentStep : Number = 1
  property variant : String = "horizontal"
  property showPercentage : Bool = false
  property stepStatuses : Array(StepStatus) = []

  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    overflow-x: auto;

    @media (max-width: 768px) {
      padding: 0.75rem;
    }
  }

  style stepsContainer {
    display: flex;
    align-items: flex-start;
    position: relative;
    flex-direction: row;
    min-width: min-content;

    @media (max-width: 640px) {
      gap: clamp(0.5rem, 2vw, 0.75rem);
    }
  }

  style verticalContainer {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    width: 100%;
  }

  style stepItem {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    flex: 1;
  }

  style verticalStepItem {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    width: 100%;
    position: relative;
  }

  style stepCircle {
    width: clamp(28px, 6vw, 40px);
    height: clamp(28px, 6vw, 40px);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: clamp(0.75rem, 2vw, 1rem);
    font-weight: 600;
    transition: all 0.3s ease;
    z-index: 2;
    position: relative;

    @media (max-width: 640px) {
      width: 28px;
      height: 28px;
      font-size: 0.75rem;
    }
  }

  style stepContent {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: clamp(0.5rem, 1.5vw, 0.75rem);
    text-align: center;
    width: 100%;
  }

  style verticalStepContent {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-left: clamp(0.75rem, 2vw, 1rem);
    text-align: left;
    flex: 1;
  }

  style stepTitle {
    font-size: clamp(0.75rem, 2vw, 1rem);
    font-weight: 600;
    margin-bottom: 0.25rem;
    word-break: break-word;

    @media (max-width: 640px) {
      font-size: 0.75rem;
    }
  }

  style stepTail {
    position: absolute;
    top: clamp(14px, 3vw, 20px);
    left: calc(50% + clamp(18px, 4.5vw, 26px));
    right: calc(-50% + clamp(18px, 4.5vw, 26px));
    height: 2px;
    z-index: 1;

    @media (max-width: 640px) {
      top: 14px;
      left: calc(50% + 18px);
      right: calc(-50% + 18px);
    }
  }

  style verticalStepTail {
    position: absolute;
    left: clamp(14px, 3vw, 20px);
    top: 50px;
    width: 2px;
    height: 1.3rem;

    @media (max-width: 640px) {
      left: 14px;
    }
  }

  style verticalStepWrapper {
    position: relative;
    flex-shrink: 0;
    margin-bottom: 2.8rem;

    @media (max-width: 640px) {
      margin-bottom: 2.8rem;
    }
  }

  style percentageText {
    font-size: clamp(0.75rem, 1.5vw, 0.875rem);
    font-weight: 600;
    margin-top: 1rem;
    text-align: center;
  }

  fun getStepStatus (index : Number) : String {
    Array.find(stepStatuses,
      (status : StepStatus) { status.index == index })
    |> Maybe.map((status : StepStatus) { status.status })
    |> Maybe.withDefault("")
  }

  fun getStepCircleStyles (index : Number) : String {
    let customStatus = getStepStatus(index)
    let isCompleted = index < currentStep
    let isCurrent = index == currentStep
    let isUpcoming = index > currentStep

    if customStatus == "error" {
      "
        background: #f56565;
        color: white;
        border: 2px solid #f56565;
        box-shadow: 0 2px 8px rgba(245, 101, 101, 0.3);
      "
    } else {
      if customStatus == "warning" {
        "
          background: #ed8936;
          color: white;
          border: 2px solid #ed8936;
          box-shadow: 0 2px 8px rgba(237, 137, 54, 0.3);
        "
      } else {
        if customStatus == "finish" || isCompleted {
          "
            background: #{ThemeHelpers.getAccent(currentTheme)};
            color: white;
            border: 2px solid #{ThemeHelpers.getAccent(currentTheme)};
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
          "
        } else {
          if customStatus == "process" || isCurrent {
            "
              background: #{ThemeHelpers.getSurface(currentTheme)};
              color: #{ThemeHelpers.getAccent(currentTheme)};
              border: 2px solid #{ThemeHelpers.getAccent(currentTheme)};
              box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
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
    }
  }

  fun getStepTitleStyles (index : Number) : String {
    if index <= currentStep {
      "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
    } else {
      "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun getTailPercentage (index : Number) : Number {
    /*
      Cada paso tiene su propia "tail" (línea conectora)
      - Si el paso está completado (index < currentStep), tail al 100%
      - Si es el paso actual (index == currentStep), tail al 0%
      - Si es futuro (index > currentStep), tail al 0%
    */
    if index < currentStep {
      100
    } else {
      0
    }
  }

  fun getPercentage : Number {
    let totalSteps = Array.size(steps)
    if totalSteps > 0 {
      (currentStep / totalSteps) * 100
    } else {
      0
    }
  }

  fun renderStepIcon (index : Number) : String {
    let customStatus = getStepStatus(index)

    if customStatus == "error" {
      "✗"
    } else {
      if customStatus == "warning" {
        "⚠"
      } else {
        if customStatus == "finish" {
          "✓"
        } else {
          Number.toString(index + 1)
        }
      }
    }
  }

  fun renderStepContent (stepLabel : String, index : Number, isVertical : Bool) : Html {
    <div
      class={
        if isVertical {
          "verticalStepContent"
        } else {
          "stepContent"
        }
      }
    >
      <div::stepTitle style={getStepTitleStyles(index)}>stepLabel</div>
    </div>
  }

  fun renderHorizontalSteps : Html {
    <div::stepsContainer>
      {
        Array.mapWithIndex(steps,
          (stepLabel : String, index : Number) {
            let isLastStep = index == (Array.size(steps) - 1)

            <div::stepItem>
              <div::stepCircle style={getStepCircleStyles(index)}>
                renderStepIcon(index)
              </div>

              renderStepContent(stepLabel, index, false)

              if !isLastStep {
                <div::stepTail>
                  <ProgressBar
                    percentage={getTailPercentage(index)}
                    height="2px"
                    color={ThemeHelpers.getAccent(currentTheme)}
                    backgroundColor={ThemeHelpers.getBorderPrimary(currentTheme)}
                  />
                </div>
              } else {
                <></>
              }
            </div>
          })
      }
    </div>
  }

  fun renderVerticalSteps : Html {
    <div::stepsContainer style="flex-direction: column;">
      {
        Array.mapWithIndex(steps,
          (stepLabel : String, index : Number) {
            let isLastStep = index == (Array.size(steps) - 1)

            <div::stepItem style="flex-direction: row; width: 100%; margin-bottom: 0;">
              <div::verticalStepWrapper>
                <div::stepCircle style={getStepCircleStyles(index)}>
                  renderStepIcon(index)
                </div>

                if !isLastStep {
                  <div::verticalStepTail>
                    <ProgressBar
                      percentage={getTailPercentage(index)}
                      height="100%"
                      color={ThemeHelpers.getAccent(currentTheme)}
                      backgroundColor={ThemeHelpers.getBorderPrimary(currentTheme)}
                    />
                  </div>
                } else {
                  <></>
                }
              </div>

              renderStepContent(stepLabel, index, true)
            </div>
          })
      }
    </div>
  }

  fun render : Html {
    <div::container>
      {
        if variant == "vertical" {
          renderVerticalSteps()
        } else {
          renderHorizontalSteps()
        }
      }

      {
        if showPercentage {
          <div::percentageText style="color: #{ThemeHelpers.getAccent(currentTheme)};">
            Number.toString(getPercentage())
            <> "% Complete"</>
          </div>
        } else {
          <></>
        }
      }
    </div>
  }
}
