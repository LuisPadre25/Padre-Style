component ChartsShowcase {
  state chartShowValues : Bool = true
  state chartShowPoints : Bool = true
  state chartShowArea : Bool = true
  state areaChartGradient : Bool = true
  state areaChartShowGrid : Bool = true
  state areaChartShowPoints : Bool = true
  state areaChartShowValues : Bool = false
  state radarChartShowGrid : Bool = true
  state radarChartShowFill : Bool = true
  state radarChartShowValues : Bool = true
  state radarChartShowPoints : Bool = true
  state kpiProgress : Number = 75
  state currentProgressStep : Number = 2

  connect ThemeStore exposing { currentTheme }

  style tabContent {
    margin-top: 2rem;
  }

  style sectionTitle {
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 2rem;
    text-align: center;
  }

  fun getSectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style demoGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 2.5rem;
    margin: 2rem 0;
    width: 100%;
    box-sizing: border-box;
  }

  style chartControls {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-bottom: 1rem;
    padding: 0.75rem;
    border-radius: 8px;
  }

  fun getChartControlsStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun toggleChartShowValues (event : Html.Event) : Promise(Void) {
    next { chartShowValues: !chartShowValues }
  }

  fun toggleChartShowPoints (event : Html.Event) : Promise(Void) {
    next { chartShowPoints: !chartShowPoints }
  }

  fun toggleChartShowArea (event : Html.Event) : Promise(Void) {
    next { chartShowArea: !chartShowArea }
  }

  fun toggleAreaChartGradient (event : Html.Event) : Promise(Void) {
    next { areaChartGradient: !areaChartGradient }
  }

  fun toggleAreaChartShowGrid (event : Html.Event) : Promise(Void) {
    next { areaChartShowGrid: !areaChartShowGrid }
  }

  fun toggleAreaChartShowPoints (event : Html.Event) : Promise(Void) {
    next { areaChartShowPoints: !areaChartShowPoints }
  }

  fun toggleAreaChartShowValues (event : Html.Event) : Promise(Void) {
    next { areaChartShowValues: !areaChartShowValues }
  }

  fun toggleRadarChartShowGrid (event : Html.Event) : Promise(Void) {
    next { radarChartShowGrid: !radarChartShowGrid }
  }

  fun toggleRadarChartShowFill (event : Html.Event) : Promise(Void) {
    next { radarChartShowFill: !radarChartShowFill }
  }

  fun toggleRadarChartShowValues (event : Html.Event) : Promise(Void) {
    next { radarChartShowValues: !radarChartShowValues }
  }

  fun toggleRadarChartShowPoints (event : Html.Event) : Promise(Void) {
    next { radarChartShowPoints: !radarChartShowPoints }
  }

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>
        "Data Visualization - 25+ Components"
      </h3>

      <h4
        style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin: 2rem 0 1rem 0; font-size: 1.25rem; font-weight: 600;"
      >"📊 Basic Charts"</h4>

      <div::demoGrid>
        <Card title="Bar Chart">
          <Chart
            data={[65, 85, 70, 90, 75]}
            labels={["Jan", "Feb", "Mar", "Apr", "May"]}
            type="bar"
            height="200px"
            showValues={true}
          />
        </Card>

        <Card title="Line Chart">
          <div::chartControls style={getChartControlsStyles()}>
            <Button onClick={toggleChartShowPoints} variant="secondary">
              {
                if chartShowPoints {
                  "Hide Points"
                } else {
                  "Show Points"
                }
              }
            </Button>

            <Button onClick={toggleChartShowValues} variant="secondary">
              {
                if chartShowValues {
                  "Hide Values"
                } else {
                  "Show Values"
                }
              }
            </Button>

            <Button onClick={toggleChartShowArea} variant="secondary">
              {
                if chartShowArea {
                  "Hide Area"
                } else {
                  "Show Area"
                }
              }
            </Button>
          </div>

          <LineChart
            data={[30, 50, 45, 70, 60, 85]}
            labels={["Q1", "Q2", "Q3", "Q4", "Q5", "Q6"]}
            height="200px"
            showPoints={chartShowPoints}
            showValues={chartShowValues}
            showArea={chartShowArea}
          />
        </Card>

        <Card title="Area Chart">
          <div::chartControls style={getChartControlsStyles()}>
            <Button onClick={toggleAreaChartGradient} variant="secondary">
              {
                if areaChartGradient {
                  "Solid Fill"
                } else {
                  "Gradient"
                }
              }
            </Button>

            <Button onClick={toggleAreaChartShowGrid} variant="secondary">
              {
                if areaChartShowGrid {
                  "Hide Grid"
                } else {
                  "Show Grid"
                }
              }
            </Button>

            <Button onClick={toggleAreaChartShowPoints} variant="secondary">
              {
                if areaChartShowPoints {
                  "Hide Points"
                } else {
                  "Show Points"
                }
              }
            </Button>

            <Button onClick={toggleAreaChartShowValues} variant="secondary">
              {
                if areaChartShowValues {
                  "Hide Values"
                } else {
                  "Show Values"
                }
              }
            </Button>
          </div>

          <AreaChart
            data={[40, 60, 55, 75, 85, 70]}
            labels={["Jan", "Feb", "Mar", "Apr", "May", "Jun"]}
            height="200px"
            gradient={areaChartGradient}
            showGrid={areaChartShowGrid}
            showPoints={areaChartShowPoints}
            showValues={areaChartShowValues}
          />
        </Card>

        <Card title="Donut Chart">
          <div style="text-align: center;">
            <DonutChart
              value={75}
              max={100}
              size={140}
              label="Completed"
              showPercentage={true}
            />
          </div>
        </Card>

        <Card title="Radar Chart - Team Performance">
          <div::chartControls style={getChartControlsStyles()}>
            <Button onClick={toggleRadarChartShowGrid} variant="secondary">
              {
                if radarChartShowGrid {
                  "Hide Grid"
                } else {
                  "Show Grid"
                }
              }
            </Button>

            <Button onClick={toggleRadarChartShowFill} variant="secondary">
              {
                if radarChartShowFill {
                  "Hide Fill"
                } else {
                  "Show Fill"
                }
              }
            </Button>

            <Button onClick={toggleRadarChartShowPoints} variant="secondary">
              {
                if radarChartShowPoints {
                  "Hide Points"
                } else {
                  "Show Points"
                }
              }
            </Button>

            <Button onClick={toggleRadarChartShowValues} variant="secondary">
              {
                if radarChartShowValues {
                  "Hide Values"
                } else {
                  "Show Values"
                }
              }
            </Button>
          </div>

          <div style="display: flex; justify-content: center;">
            <RadarChart
              data={[80, 90, 70, 85, 75]}
              data2={[65, 95, 85, 70, 90]}
              labels={["Speed", "Quality", "Cost", "Time", "Risk"]}
              dataset1Name="Team A"
              dataset2Name="Team B"
              size={280}
              showGrid={radarChartShowGrid}
              showFill={radarChartShowFill}
              showPoints={radarChartShowPoints}
              showValues={radarChartShowValues}
              showAxisLines={true}
            />
          </div>
        </Card>

        <Card title="Radar Chart - Product Comparison">
          <div style="display: flex; justify-content: center;">
            <RadarChart
              data={[95, 70, 60, 85, 90, 75]}
              data2={[70, 90, 85, 70, 65, 80]}
              labels={
                [
                  "Performance",
                  "Battery",
                  "Price",
                  "Camera",
                  "Design",
                  "Screen"
                ]
              }
              dataset1Name="Premium Model"
              dataset2Name="Standard Model"
              color="#9f7aea"
              color2="#48bb78"
              size={280}
              showGrid={true}
              showFill={true}
              showPoints={true}
              showValues={true}
              showAxisLines={true}
            />
          </div>
        </Card>

        <Card title="Stacked Bar Chart">
          <StackedBarChart
            data1={[40, 50, 45, 55]}
            data2={[30, 35, 40, 25]}
            labels={["Q1", "Q2", "Q3", "Q4"]}
            height="200px"
          />
        </Card>
      </div>

      <h4
        style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin: 2rem 0 1rem 0; font-size: 1.25rem; font-weight: 600;"
      >"🎯 Advanced Charts"</h4>

      <div::demoGrid>
        <Card title="Funnel Chart">
          <FunnelChart
            data={[100, 75, 50, 30, 15]}
            labels={["Visitors", "Signups", "Active", "Paying", "Advocates"]}
            height="280px"
          />
        </Card>

        <Card title="Bullet Chart">
          <BulletChart
            label="Sales Performance"
            value={75}
            target={90}
            ranges={[50, 75, 100]}
            height="80px"
          />
        </Card>

        <Card title="Heat Map">
          <div style="text-align: center;">
            <HeatMap
              data={[20, 40, 60, 35, 55, 75, 85, 65, 95]}
              rows={3}
              cols={3}
              cellSize={50}
            />
          </div>
        </Card>

        <Card title="Mini Charts">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="display: flex; align-items: center; gap: 1rem;">
              <span
                style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem; font-weight: 600;"
              >"Line:"</span>

              <MiniChart
                data={[30, 50, 40, 70, 60, 80]}
                type="line"
                width="120px"
                height="40px"
              />
            </div>

            <div style="display: flex; align-items: center; gap: 1rem;">
              <span
                style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem; font-weight: 600;"
              >"Bars:"</span>

              <MiniChart
                data={[40, 60, 50, 80, 70]}
                type="bar"
                width="120px"
                height="40px"
              />
            </div>
          </div>
        </Card>
      </div>

      <h4
        style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin: 2rem 0 1rem 0; font-size: 1.25rem; font-weight: 600;"
      >"💎 KPIs & Metrics"</h4>

      <div::demoGrid>
        <KPICard
          title="Monthly Revenue"
          value="45.2"
          target="50"
          unit="K"
          progress={kpiProgress}
          trend="+15.3%"
          trendDirection="up"
        />

        <MetricDisplay
          label="Active Users"
          value="2,847"
          change="+12.5%"
          changeType="positive"
          icon="👥"
          size="medium"
        />

        <ComparisonCard
          title="Sales Comparison"
          currentValue="$125K"
          previousValue="$98K"
          currentLabel="This Month"
          previousLabel="Last Month"
        />

        <TrendIndicator
          value="$45.2K"
          change="+18.5%"
          trend="up"
          label="Revenue"
          size="medium"
        />

        <ScoreCard
          score={85}
          maxScore={100}
          title="Performance Score"
          grade="A"
          color="#10b981"
        />

        <DataPoint
          value="234"
          label="New Users"
          sublabel="This week"
          icon="🎯"
          variant="success"
        />
      </div>

      <h4
        style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin: 2rem 0 1rem 0; font-size: 1.25rem; font-weight: 600;"
      >"📈 Progress & Indicators"</h4>

      <div::demoGrid>
        <Card title="Percentage Rings">
          <div
            style="display: flex; justify-content: space-around; align-items: center; flex-wrap: wrap; gap: 1rem;"
          >
            <PercentageRing
              percentage={75}
              size={80}
              label="Tasks"
              color="#667eea"
            />

            <PercentageRing
              percentage={60}
              size={80}
              label="Progress"
              color="#10b981"
            />

            <PercentageRing
              percentage={90}
              size={80}
              label="Quality"
              color="#f59e0b"
            />
          </div>
        </Card>

        <Card title="Number Counter">
          <div style="text-align: center;">
            <NumberCounter
              value={12847}
              label="Total Sales"
              prefix="$"
              size="large"
              color="#667eea"
            />
          </div>
        </Card>

        <Card title="Progress Ring (Existing)">
          <div style="text-align: center;">
            <ProgressRing value={68} max={100} size="large"/>
          </div>
        </Card>

        <Card title="Gauge (Existing)">
          <div style="text-align: center;">
            <Gauge value={75} min={0} max={100} label="Performance"/>
          </div>
        </Card>
      </div>

      <div style="margin-top: 2rem;">
        <Card title="Progress Indicator">
          <ProgressIndicator
            steps={["Planning", "Development", "Testing", "Deployment"]}
            currentStep={currentProgressStep}
            variant="horizontal"
          />
        </Card>
      </div>

      <h4
        style="color: #{ThemeHelpers.getTextPrimary(currentTheme)}; margin: 2rem 0 1rem 0; font-size: 1.25rem; font-weight: 600;"
      >"📊 Original DataViz Components"</h4>

      <div::demoGrid>
        <Card title="Stats Component">
          <Stats
            title="Active Users"
            value="2,847"
            subtitle="Last 30 days"
            trend="+12.5%"
            trendDirection="up"
            icon="👥"
          />
        </Card>

        <Card title="Chart Component">
          <Chart
            data={[10, 25, 15, 35, 20, 30]}
            labels={["Jan", "Feb", "Mar", "Apr", "May", "Jun"]}
            type="bar"
          />
        </Card>

        <Card title="Sparkline">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div>
              <p
                style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem; margin-bottom: 0.5rem;"
              >"Revenue Trend"</p>

              <Sparkline
                data={[30, 45, 40, 60, 55, 75, 70, 85]}
                color="#667eea"
                height="50px"
              />
            </div>

            <div>
              <p
                style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem; margin-bottom: 0.5rem;"
              >"User Growth"</p>

              <Sparkline
                data={[20, 35, 30, 50, 65, 60, 80, 90]}
                color="#10b981"
                height="50px"
              />
            </div>
          </div>
        </Card>
      </div>
    </div>
  }
}
