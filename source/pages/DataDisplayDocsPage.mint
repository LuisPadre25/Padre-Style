/* DataDisplayDocsPage - Documentación de Data Display */
component DataDisplayDocsPage {
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
    border: 1px dashed;
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Data Display"</h1>

      <p::pageDescription>
        "Componentes para mostrar datos, métricas, tarjetas y tablas."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Cards"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"DynamicCard"</h3>

          <p::componentDescription>
            "Tarjeta flexible con header, body y footer. Adaptable al tema actual."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DynamicCard>
              <div>
                <h3>"Card Title"</h3>
                <p>"This is a dynamic card that adapts to the current theme."</p>
              </div>
            </DynamicCard>
          </div>

          <CodeHighlight
            language="mint"
            code="<DynamicCard>
  <div>
    <h3>\"Card Title\"</h3>
    <p>\"Card content here\"</p>
  </div>
</DynamicCard>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"KPICard"</h3>

          <p::componentDescription>
            "Tarjeta para mostrar indicadores clave de rendimiento (KPI)."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <KPICard
              title="Revenue"
              value="$45,231"
              target="$50,000"
              trend="+20.1%"
              trendDirection="up"
              progress={90}
            />
            <KPICard
              title="Users"
              value="1,234"
              target="1,500"
              trend="-5.4%"
              trendDirection="down"
              progress={82}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<KPICard
  title=\"Revenue\"
  value=\"$45,231\"
  target=\"$50,000\"
  trend=\"+20.1%\"
  trendDirection=\"up\"
  progress={90}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"MetricCard"</h3>

          <p::componentDescription>
            "Tarjeta para mostrar métricas con iconos y valores."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <MetricCard
              label="Total Sales"
              current={12345}
              target={15000}
              unit="USD"
              variant="success"
            />
            <MetricCard
              label="Active Users"
              current={1234}
              target={2000}
              unit="users"
              variant="primary"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<MetricCard
  label=\"Total Sales\"
  current={12345}
  target={15000}
  unit=\"USD\"
  variant=\"success\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"StatCard"</h3>

          <p::componentDescription>
            "Tarjeta de estadísticas con valores y porcentajes."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <StatCard
              title="Conversion Rate"
              value="3.24%"
              trend="+0.5%"
              trendDirection="up"
              icon="📈"
            />
            <StatCard
              title="Bounce Rate"
              value="42%"
              trend="-2.1%"
              trendDirection="down"
              icon="📉"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<StatCard
  title=\"Conversion Rate\"
  value=\"3.24%\"
  trend=\"+0.5%\"
  trendDirection=\"up\"
  icon=\"📈\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ScoreCard"</h3>

          <p::componentDescription>
            "Tarjeta para mostrar puntuaciones y calificaciones."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ScoreCard
              title="Performance Score"
              score={85}
              maxScore={100}
            />
            <ScoreCard
              title="Customer Satisfaction"
              score={92}
              maxScore={100}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ScoreCard
  title=\"Performance Score\"
  score={85}
  maxScore={100}
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ComparisonCard"</h3>

          <p::componentDescription>
            "Tarjeta para comparar dos valores o métricas."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ComparisonCard
              title="This Month vs Last Month"
              currentValue="$12,345"
              previousValue="$10,234"
              currentLabel="Current"
              previousLabel="Previous"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ComparisonCard
  title=\"This Month vs Last Month\"
  currentValue=\"$12,345\"
  previousValue=\"$10,234\"
  currentLabel=\"Current\"
  previousLabel=\"Previous\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"InfoBox"</h3>

          <p::componentDescription>
            "Caja de información con icono y texto."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <InfoBox
              title="Pro Tip"
              value="Use keyboard shortcuts to navigate faster!"
              icon="💡"
              trend="up"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<InfoBox
  title=\"Pro Tip\"
  value=\"Use keyboard shortcuts!\"
  icon=\"💡\"
  trend=\"up\"
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Data Display"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"MetricDisplay"</h3>

          <p::componentDescription>
            "Componente para mostrar métricas de forma visual."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <MetricDisplay
              label="Total Revenue"
              value="$123,456"
              change="Last 30 days"
              changeType="positive"
              icon="💰"
              size="medium"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<MetricDisplay
  label=\"Total Revenue\"
  value=\"$123,456\"
  change=\"Last 30 days\"
  changeType=\"positive\"
  icon=\"💰\"
  size=\"medium\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"DataPoint"</h3>

          <p::componentDescription>
            "Punto de dato individual con etiqueta y valor."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DataPoint
              label="Temperature"
              value="23°C"
            />
            <DataPoint
              label="Humidity"
              value="65%"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<DataPoint
  label=\"Temperature\"
  value=\"23°C\"
/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"UserProfile"</h3>

          <p::componentDescription>
            "Tarjeta de perfil de usuario con avatar y datos."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <UserProfile
              name="John Doe"
              email="john@example.com"
              avatar="https://i.pravatar.cc/150?img=1"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<UserProfile
  name=\"John Doe\"
  email=\"john@example.com\"
  avatar=\"https://i.pravatar.cc/150?img=1\"
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Tables"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Table"</h3>

          <p::componentDescription>
            "Tabla básica para mostrar datos tabulares."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Table/>
          </div>

          <CodeHighlight
            language="mint"
            code="<Table/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"DataTable"</h3>

          <p::componentDescription>
            "Tabla avanzada con ordenamiento, filtrado y paginación."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DataTable/>
          </div>

          <CodeHighlight
            language="mint"
            code="<DataTable/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"Chart"</h3>

          <p::componentDescription>
            "Componente para visualización de datos con gráficos de barras y líneas."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Chart
              data={[30, 60, 45, 80, 50, 70]}
              labels={["Jan", "Feb", "Mar", "Apr", "May", "Jun"]}
              type="bar"
              height="200px"
              color="#667eea"
              showValues={true}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<Chart
  data={[30, 60, 45, 80, 50, 70]}
  labels={[\"Jan\", \"Feb\", \"Mar\", \"Apr\", \"May\", \"Jun\"]}
  type=\"bar\"
  height=\"200px\"
  color=\"#667eea\"
  showValues={true}
/>"
          />
        </div>
      </div>
    </div>
  }
}
