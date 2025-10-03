/* ChartsDocsPage - Documentación de Charts y Visualizaciones */
component ChartsDocsPage {
  connect ThemeStore exposing { currentTheme }

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style pageDescription {
    font-size: 1.125rem;
    opacity: 0.8;
    margin-bottom: 3rem;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 700;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentCard {
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    border: 1px solid;
  }

  fun getComponentCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
  }

  style componentDescription {
    opacity: 0.8;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin: 1.5rem 0;
    min-height: 300px;
  }

  fun getExampleContainerStyles : String {
    "background: #{ThemeHelpers.getBackground(currentTheme)};"
  }

  style codeBlock {
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    overflow-x: auto;
    font-family: 'Fira Code', monospace;
    font-size: 0.875rem;
    line-height: 1.6;
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: 0.5rem;
  }

  fun getBadgeStyles : String {
    "background: #{ThemeHelpers.getAccent(currentTheme)}; color: white;"
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Charts & Data Visualization"</h1>

      <p::pageDescription>
        "Professional data visualization components with SVG rendering, animations,
        and full theme support. Perfect for dashboards and analytics."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"LineChart"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "LineChart"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Smooth line charts with multiple series, grid, and tooltips."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <LineChart
              data={[10, 25, 15, 40, 30, 55, 45]}
              height="300px"
              color={ThemeHelpers.getAccent(currentTheme)}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<LineChart
  data={[10, 25, 15, 40, 30, 55, 45]}
  height=\"300px\"
  color={ThemeHelpers.getAccent(currentTheme)}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"BarChart"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "BarChart"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Vertical and horizontal bar charts with animations."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <BarChart
              data={[30, 45, 25, 60, 55]}
              labels={["Mon", "Tue", "Wed", "Thu", "Fri"]}
              height="300px"
              color={ThemeHelpers.getAccent(currentTheme)}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<BarChart
  data={[30, 45, 25, 60, 55]}
  labels={[\"Mon\", \"Tue\", \"Wed\", \"Thu\", \"Fri\"]}
  height=\"300px\"
  color={ThemeHelpers.getAccent(currentTheme)}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"AreaChart"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "AreaChart"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Area charts with gradient fills and smooth animations."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <AreaChart
              data={[20, 35, 25, 50, 40, 65, 55]}
              height="300px"
              color={ThemeHelpers.getAccent(currentTheme)}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<AreaChart
  data={[20, 35, 25, 50, 40, 65, 55]}
  height=\"300px\"
  color={ThemeHelpers.getAccent(currentTheme)}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"DonutChart"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "DonutChart"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Donut charts for proportional data with legends."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DonutChart
              value={75}
              max={100}
              size={300}
              label="Progress"
              color={ThemeHelpers.getAccent(currentTheme)}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<DonutChart
  value={75}
  max={100}
  size={300}
  label=\"Progress\"
  color={ThemeHelpers.getAccent(currentTheme)}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"RadarChart"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "RadarChart"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Radar/spider charts for multi-variable data comparison."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <RadarChart
              data={[65, 75, 80, 70, 85, 90]}
              labels={["Speed", "Quality", "Design", "UX", "Performance", "Support"]}
              size={350}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<RadarChart
  data={[65, 75, 80, 70, 85, 90]}
  labels={[\"Speed\", \"Quality\", \"Design\"]}
  size={350}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"HeatMap"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "HeatMap"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Heatmaps for visualizing matrix data with color gradients."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <HeatMap
              data={[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]}
              rows={3}
              cols={4}
              cellSize={60}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<HeatMap
  data={[10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]}
  rows={3}
  cols={4}
  cellSize={60}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"PercentageRing"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "PercentageRing"
            <span::badge style={getBadgeStyles()}>"Chart"</span>
          </h3>

          <p::componentDescription>
            "Circular progress indicator for percentages and metrics."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Flex gap="2rem" justify="center">
              <PercentageRing percentage={75} size={150} label="Progress"/>
              <PercentageRing percentage={60} size={150} label="Completion"/>
              <PercentageRing percentage={90} size={150} label="Quality"/>
            </Flex>
          </div>

          <CodeHighlight
            language="mint"
            code="<PercentageRing
  percentage={75}
  size={150}
  label=\"Progress\"
/>"
          />
        </div>
      </div>
    </div>
  }
}
