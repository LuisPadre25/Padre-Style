/* Data Visualization Components */

/* Chart Component - Simple bar and line charts */
component Chart {
  property data : Array(Number) = []
  property labels : Array(String) = []
  property type : String = "bar"
  property height : String = "200px"
  property color : String = "#667eea"
  property showValues : Bool = false

  connect ThemeStore exposing { currentTheme }

  style chart {
    width: 100%;
    height: #{height};
    border-radius: 12px;
    padding: 1.5rem;
    backdrop-filter: blur(10px);
  }

  fun getChartStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  style barChartContainer {
    display: flex;
    flex-direction: column;
    height: 100%;
    gap: 0.5rem;
  }

  style barChart {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
    flex: 1;
    gap: 0.5rem;
  }

  style barWrapper {
    flex: 1;
    display: flex;
    flex-direction: column-reverse;
    align-items: center;
    gap: 0.25rem;
    height: 100%;
  }

  style bar {
    width: 100%;
    background: linear-gradient(to top, #{color}, #{color}aa);
    border-radius: 4px 4px 0 0;
    min-height: 4px;
    transition: all 0.3s ease;
    position: relative;
    display: flex;
    align-items: flex-start;
    justify-content: center;

    &:hover {
      transform: scaleY(1.05);
      filter: brightness(1.1);
    }
  }

  style barValue {
    font-size: 0.75rem;
    font-weight: 700;
    margin-top: 0.25rem;
    color: white;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
  }

  style barLabel {
    font-size: 0.7rem;
    font-weight: 500;
    text-align: center;
    margin-top: 0.25rem;
  }

  fun getBarValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getBarLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  style lineChart {
    position: relative;
    height: 100%;
    border-radius: 8px;
    overflow: hidden;
  }

  fun getLineChartStyles : String {
    "
      background: #{ThemeHelpers.getGlassBg(currentTheme)};
    "
  }

  style line {
    position: absolute;
    width: 100%;
    height: 100%;
  }

  fun getMaxValue : Number {
    if Array.size(data) == 0 {
      100
    } else {
      Array.reduce(data, 0,
        (acc : Number, value : Number) : Number {
          if value > acc {
            value
          } else {
            acc
          }
        })
    }
  }

  fun getBarHeight (value : Number) : String {
    let maxValue =
      getMaxValue()

    if maxValue > 0 {
      let percentage =
        (value / maxValue) * 100

      "#{Number.toString(percentage)}%"
    } else {
      "0%"
    }
  }

  fun render : Html {
    <div::chart style={getChartStyles()}>
      {
        if type == "line" {
          <div::lineChart style={getLineChartStyles()}>
            <svg::line width="100%" height="100%" viewBox="0 0 100 100">
              <polyline
                fill="none"
                stroke={color}
                stroke-width="2"
                points="10,80 30,40 50,60 70,20 90,50"
              />
            </svg>
          </div>
        } else {
          <div::barChartContainer>
            <div::barChart>
              {
                Array.mapWithIndex(data,
                  (value : Number, index : Number) {
                    <div::barWrapper>
                      <div::bar
                        style="height: #{getBarHeight(value)}"
                        title="#{Number.toString(value)}"
                      >
                        {
                          if showValues {
                            <span::barValue>
                              {
                                Number.toString(value)
                              }
                            </span>
                          } else {
                            <span/>
                          }
                        }
                      </div>
                    </div>
                  })
              }
            </div>

            {
              if Array.size(labels) > 0 {
                <div
                  style="display: flex; justify-content: space-between; gap: 0.5rem;"
                >
                  {
                    Array.map(labels,
                      (label : String) {
                        <div
                          style="flex: 1; display: flex; justify-content: center;"
                        >
                          <span::barLabel style={getBarLabelStyles()}>
                            {
                              label
                            }
                          </span>
                        </div>
                      })
                  }
                </div>
              } else {
                <div/>
              }
            }
          </div>
        }
      }
    </div>
  }
}

/* Stats Component - Key metrics display */
component Stats {
  property title : String = ""
  property value : String = ""
  property subtitle : String = ""
  property trend : String = ""
  property trendDirection : String = "up"
  property icon : String = ""

  connect ThemeStore exposing { currentTheme }

  style stats {
    border-radius: 12px;
    padding: 1.5rem;
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-4px);
    }
  }

  fun getStatsStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1rem;
  }

  style title {
    font-size: 0.875rem;
    font-weight: 500;
    margin: 0;
  }

  fun getTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  style iconContainer {
    width: 2.5rem;
    height: 2.5rem;
    border-radius: 8px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.25rem;
  }

  style value {
    font-size: 2rem;
    font-weight: 700;
    margin: 0 0 0.5rem 0;
    line-height: 1;
  }

  fun getValueStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  style subtitle {
    font-size: 0.875rem;
    margin: 0;
  }

  fun getSubtitleStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  style trend {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    font-size: 0.875rem;
    font-weight: 500;
  }

  style trendUp {
    color: #10b981;
  }

  style trendDown {
    color: #ef4444;
  }

  style trendNeutral {
    color: #6b7280;
  }

  fun getTrendClass : String {
    case trendDirection {
      "up" => "trendUp"
      "down" => "trendDown"
      _ => "trendNeutral"
    }
  }

  fun getTrendIcon : String {
    case trendDirection {
      "up" => "↗"
      "down" => "↘"
      _ => "→"
    }
  }

  fun render : Html {
    <div::stats style={getStatsStyles()}>
      <div::header>
        <h3::title style={getTitleStyles()}>
          {
            title
          }
        </h3>

        {
          if !String.isEmpty(icon) {
            <div::iconContainer>
              {
                icon
              }
            </div>
          } else {
            <div/>
          }
        }
      </div>

      <p::value style={getValueStyles()}>
        {
          value
        }
      </p>

      <div::footer>
        <p::subtitle style={getSubtitleStyles()}>
          {
            subtitle
          }
        </p>

        {
          if !String.isEmpty(trend) {
            <div::trend class={getTrendClass()}>
              <span>
                {
                  getTrendIcon()
                }
              </span>

              <span>
                {
                  trend
                }
              </span>
            </div>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}

/* ProgressRing Component - Circular progress indicator */
component ProgressRing {
  property value : Number = 0
  property max : Number = 100
  property size : String = "md"
  property strokeWidth : Number = 4
  property color : String = "#667eea"

  connect ThemeStore exposing { currentTheme }

  style ring {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    position: relative;
  }

  style small {
    width: 4rem;
    height: 4rem;
  }

  style medium {
    width: 6rem;
    height: 6rem;
  }

  style large {
    width: 8rem;
    height: 8rem;
  }

  style svg {
    transform: rotate(-90deg);
  }

  style backgroundCircle {
    fill: none;
    stroke: rgba(255, 255, 255, 0.2);
  }

  style progressCircle {
    fill: none;
    stroke: #{color};
    transition: stroke-dashoffset 0.5s ease;
  }

  style label {
    position: absolute;
    font-weight: 600;
    color: white;
    font-size: 0.875rem;
  }

  fun getRadius : Number {
    case size {
      "small" => 28
      "large" => 56
      _ => 42
    }
  }

  fun getCircumference : Number {
    2 * 3.14159 * getRadius()
  }

  fun getProgress : Number {
    Math.min(100, Math.max(0, (value / max) * 100))
  }

  fun getStrokeDashoffset : Number {
    let circumference =
      getCircumference()

    let progress =
      getProgress()

    circumference - (progress / 100) * circumference
  }

  fun getSvgSize : Number {
    case size {
      "small" => 64
      "large" => 128
      _ => 96
    }
  }

  fun render : Html {
    <div::ring class={size}>
      <svg::svg
        width={Number.toString(getSvgSize())}
        height={Number.toString(getSvgSize())}
        viewBox="0 0 #{Number.toString(getSvgSize())} #{Number.toString(
          getSvgSize())}"
      >
        <circle::backgroundCircle
          cx={Number.toString(getSvgSize() / 2)}
          cy={Number.toString(getSvgSize() / 2)}
          r={Number.toString(getRadius())}
          stroke-width={Number.toString(strokeWidth)}
        />

        <circle::progressCircle
          cx={Number.toString(getSvgSize() / 2)}
          cy={Number.toString(getSvgSize() / 2)}
          r={Number.toString(getRadius())}
          stroke-width={Number.toString(strokeWidth)}
          stroke-dasharray={Number.toString(getCircumference())}
          stroke-dashoffset={Number.toString(getStrokeDashoffset())}
        />
      </svg>

      <div::label>
        {
          "#{Number.toString(Math.floor(getProgress()))}%"
        }
      </div>
    </div>
  }
}

/* Gauge Component - Speedometer-style gauge */
component Gauge {
  property value : Number = 0
  property min : Number = 0
  property max : Number = 100
  property label : String = ""
  property color : String = "#667eea"

  connect ThemeStore exposing { currentTheme }

  style gauge {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    padding: 1.5rem;
    border-radius: 12px;
    backdrop-filter: blur(10px);
  }

  fun getGaugeStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style svg {
    filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.1));
  }

  style arc {
    fill: none;
    stroke-width: 8;
    stroke-linecap: round;
  }

  style background {
    stroke: rgba(255, 255, 255, 0.2);
  }

  style progress {
    stroke: #{color};
    transition: stroke-dashoffset 0.8s ease;
  }

  style needle {
    stroke: white;
    stroke-width: 2;
    fill: white;
    transform-origin: 50px 50px;
    transition: transform 0.8s ease;
  }

  style center {
    fill: #{color};
  }

  style valueLabel {
    text-align: center;
  }

  fun getValueLabelStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style value {
    font-size: 1.5rem;
    font-weight: 700;
    margin: 0;
  }

  style label {
    font-size: 0.875rem;
    opacity: 0.8;
    margin: 0;
  }

  fun getProgress : Number {
    Math.min(max, Math.max(min, value))
  }

  fun getProgressPercentage : Number {
    ((getProgress() - min) / (max - min)) * 100
  }

  fun getArcLength : Number {
    3.14159 * 40
  }

  fun getStrokeDashoffset : Number {
    let arcLength =
      getArcLength()

    let progress =
      getProgressPercentage()

    arcLength - (progress / 100) * arcLength
  }

  fun getNeedleRotation : Number {
    let progress =
      getProgressPercentage()

    (progress / 100) * 180 - 90
  }

  fun render : Html {
    <div::gauge style={getGaugeStyles()}>
      <svg::svg width="100" height="60" viewBox="0 0 100 60">
        <path::arc::background
          d="M 10 50 A 40 40 0 0 1 90 50"
          stroke-dasharray={Number.toString(getArcLength())}
          stroke-dashoffset="0"
        />

        <path::arc::progress
          d="M 10 50 A 40 40 0 0 1 90 50"
          stroke-dasharray={Number.toString(getArcLength())}
          stroke-dashoffset={Number.toString(getStrokeDashoffset())}
        />

        <line::needle
          x1="50"
          y1="50"
          x2="50"
          y2="25"
          style="transform: rotate(#{Number.toString(getNeedleRotation())}deg)"
        />

        <circle::center cx="50" cy="50" r="3"/>
      </svg>

      <div::valueLabel style={getValueLabelStyles()}>
        <p::value>
          {
            Number.toString(getProgress())
          }
        </p>

        {
          if !String.isEmpty(label) {
            <p::label>
              {
                label
              }
            </p>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}

/* Sparkline Component - Mini line chart */
component Sparkline {
  property data : Array(Number) = []
  property color : String = "#667eea"
  property height : String = "40px"
  property width : String = "100%"

  connect ThemeStore exposing { currentTheme }

  style sparkline {
    width: #{width};
    height: #{height};
    border-radius: 6px;
    overflow: hidden;
  }

  fun getSparklineStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style svg {
    width: 100%;
    height: 100%;
  }

  style line {
    fill: none;
    stroke: #{color};
    stroke-width: 2;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  style area {
    fill: url(#gradient);
    opacity: 0.3;
  }

  fun getMinValue : Number {
    0
  }

  fun getMaxValue : Number {
    100
  }

  fun getDataPoints : String {
    let dataLength =
      Array.size(data)

    let minValue =
      getMinValue()

    let maxValue =
      getMaxValue()

    let range =
      maxValue - minValue

    if dataLength == 0 || range == 0 {
      "0,20 100,20"
    } else {
      let points =
        Array.mapWithIndex(data,
          (value : Number, index : Number) {
            let x =
              (index / (dataLength - 1)) * 100

            let y =
              40 - ((value - minValue) / range) * 20

            "#{Number.toString(x)},#{Number.toString(y)}"
          })

      String.join(points, " ")
    }
  }

  fun render : Html {
    <div::sparkline style={getSparklineStyles()}>
      <svg::svg viewBox="0 0 100 40" preserveAspectRatio="none">
        <defs>
          <linearGradient id="gradient" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" style="stop-color:#{color};stop-opacity:0.4"/>
            <stop offset="100%" style="stop-color:#{color};stop-opacity:0"/>
          </linearGradient>
        </defs>

        <polyline::area
          points="0,40 #{getDataPoints()} 100,40"
          fill="url(#gradient)"
        />

        <polyline::line points={getDataPoints()}/>
      </svg>
    </div>
  }
}
