/* Funnel Chart Component */
component FunnelChart {
  property data : Array(Number) = [100, 80, 60, 40, 20]

  property labels : Array(String) =
    ["Stage 1", "Stage 2", "Stage 3", "Stage 4", "Stage 5"]

  property colors : Array(String) =
    ["#667eea", "#764ba2", "#f093fb", "#4facfe", "#00f2fe"]

  property height : String = "300px"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: hidden;
  }

  style funnel {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }

  style stage {
    display: flex;
    align-items: center;
    gap: clamp(0.5rem, 2vw, 1rem);
    transition: all 0.3s ease;
  }

  style bar {
    border-radius: 8px;
    padding: clamp(0.5rem, 1.5vw, 0.75rem) clamp(0.75rem, 2vw, 1rem);
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  }

  style stageLabel {
    font-size: clamp(0.75rem, 1.5vw, 0.875rem);
    font-weight: 600;
    color: white;
  }

  style stageValue {
    font-size: 1rem;
    font-weight: 700;
    color: white;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      height: #{height};
    "
  }

  fun getBarStyles (value : Number, index : Number) : String {
    let maxValue =
      100

    let widthPercent =
      (value / maxValue) * 100

    let color =
      if index < Array.size(colors) {
        Array.at(colors, index)
        |> Maybe.withDefault("#667eea")
      } else {
        "#667eea"
      }

    let animationDelay =
      Number.toString(index * 0.1)

    "
      width: #{Number.toString(widthPercent)}%;
      background: #{color};
      box-shadow: 0 4px 12px #{color}66;
      transition-delay: #{animationDelay}s;
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::funnel>
        {
          Array.mapWithIndex(data,
            (value : Number, index : Number) {
              <div::stage>
                <div::bar style={getBarStyles(value, index)}>
                  <span::stageLabel>
                    {
                      if index < Array.size(labels) {
                        Array.at(labels, index)
                        |> Maybe.withDefault("")
                      } else {
                        ""
                      }
                    }
                  </span>

                  <span::stageValue>Number.toString(value)</span>
                </div>
              </div>
            })
        }
      </div>
    </div>
  }
}
