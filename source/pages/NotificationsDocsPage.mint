/* NotificationsDocsPage - Documentación de componentes de Notificaciones */
component NotificationsDocsPage {
  connect ThemeStore exposing { currentTheme }

  state liveStatus : Bool = true

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
    align-items: center;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun toggleLiveStatus : Promise(Void) {
    next { liveStatus: !liveStatus }
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Notifications"</h1>

      <p::pageDescription>
        "Componentes para mostrar notificaciones, indicadores de estado y retroalimentación visual."
      </p>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Status Indicators"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"StatusDot"</h3>

          <p::componentDescription>
            "Indicador de estado con color y animación opcional."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <StatusDot status="success" size="medium"/>
            <StatusDot status="warning" size="medium"/>
            <StatusDot status="error" size="medium"/>
            <StatusDot status="info" size="medium"/>
            <StatusDot status="success" size="medium" pulse={true}/>
          </div>

          <CodeHighlight
            language="mint"
            code="<StatusDot status=\"success\"/>
<StatusDot status=\"warning\"/>
<StatusDot status=\"error\"/>
<StatusDot status=\"info\"/>
<StatusDot status=\"success\" pulse={true}/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"LiveIndicator"</h3>

          <p::componentDescription>
            "Indicador animado para mostrar estado en vivo."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <LiveIndicator isLive={liveStatus}/>
            <DynamicButton
              onClick={(e : Html.Event) { toggleLiveStatus() }}
              variant="secondary"
            >
              if liveStatus {
                "Stop Live"
              } else {
                "Go Live"
              }
            </DynamicButton>
          </div>

          <CodeHighlight
            language="mint"
            code="<LiveIndicator isLive={true}/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"TrendIndicator"</h3>

          <p::componentDescription>
            "Indicador de tendencia con flecha y porcentaje."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <TrendIndicator value="$1,234" change="+12.5%" trend="up"/>
            <TrendIndicator value="$987" change="-8.3%" trend="down"/>
            <TrendIndicator value="$500" change="0%" trend="neutral"/>
          </div>

          <CodeHighlight
            language="mint"
            code="<TrendIndicator value=\"$1,234\" change=\"+12.5%\" trend=\"up\"/>
<TrendIndicator value=\"$987\" change=\"-8.3%\" trend=\"down\"/>
<TrendIndicator value=\"$500\" change=\"0%\" trend=\"neutral\"/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ProgressIndicator"</h3>

          <p::componentDescription>
            "Indicador de progreso por pasos, estilo Zent Design. Soporta modo horizontal y vertical."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <div style="width: 100%; margin-bottom: 2rem;">
              <h4>"Horizontal Progress - Step 1 (Index 0)"</h4>
              <ProgressIndicator
                steps={["Account", "Payment", "Review", "Complete"]}
                currentStep={0}
                variant="horizontal"
              />
            </div>

            <div style="width: 100%; margin-bottom: 2rem;">
              <h4>"Horizontal Progress - Step 2 (Index 1)"</h4>
              <ProgressIndicator
                steps={["Account", "Payment", "Review", "Complete"]}
                currentStep={1}
                variant="horizontal"
              />
            </div>

            <div style="width: 100%; margin-bottom: 2rem;">
              <h4>"With Percentage - Step 3 (Index 2)"</h4>
              <ProgressIndicator
                steps={["Start", "Process", "Finish"]}
                currentStep={2}
                variant="horizontal"
                showPercentage={true}
              />
            </div>

            <div style="width: 100%;">
              <h4>"Vertical Progress"</h4>
              <ProgressIndicator
                steps={["Create Account", "Verify Email", "Complete Profile", "Start Using"]}
                currentStep={2}
                variant="vertical"
              />
            </div>

            <div style="width: 100%; margin-top: 2rem;">
              <h4>"With Custom Status (Error State)"</h4>
              <ProgressIndicator
                steps={["Upload", "Process", "Verify", "Complete"]}
                currentStep={1}
                variant="horizontal"
                stepStatuses={[
                  {
                    index: 1,
                    status: "error"
                  }
                ]}
              />
            </div>

            <div style="width: 100%; margin-top: 2rem;">
              <h4>"With Custom Status (Warning & Error)"</h4>
              <ProgressIndicator
                steps={["Step 1", "Step 2", "Step 3", "Step 4"]}
                currentStep={2}
                variant="horizontal"
                stepStatuses={[
                  {
                    index: 1,
                    status: "warning"
                  },
                  {
                    index: 3,
                    status: "error"
                  }
                ]}
              />
            </div>

            <div style="width: 100%; margin-top: 2rem;">
              <h4>"With Custom Status (Finish with Checkmark)"</h4>
              <ProgressIndicator
                steps={["Upload", "Validate", "Process", "Complete"]}
                currentStep={2}
                variant="horizontal"
                stepStatuses={[
                  {
                    index: 0,
                    status: "finish"
                  }
                ]}
              />
            </div>
          </div>

          <CodeHighlight
            language="mint"
            code="// Horizontal
<ProgressIndicator
  steps={[\"Account\", \"Payment\", \"Review\", \"Complete\"]}
  currentStep={1}
  variant=\"horizontal\"
/>

// With Percentage
<ProgressIndicator
  steps={[\"Start\", \"Process\", \"Finish\"]}
  currentStep={2}
  showPercentage={true}
/>

// Vertical
<ProgressIndicator
  steps={[\"Step 1\", \"Step 2\", \"Step 3\"]}
  currentStep={1}
  variant=\"vertical\"
/>

// With Custom Status (Error)
<ProgressIndicator
  steps={[\"Upload\", \"Process\", \"Verify\", \"Complete\"]}
  currentStep={1}
  stepStatuses={[
    { index: 1, status: \"error\" }
  ]}
/>

// With Custom Status (Warning & Error)
<ProgressIndicator
  steps={[\"Step 1\", \"Step 2\", \"Step 3\", \"Step 4\"]}
  currentStep={2}
  stepStatuses={[
    { index: 1, status: \"warning\" },
    { index: 3, status: \"error\" }
  ]}
/>

// With Custom Status (Finish with Checkmark ✓)
<ProgressIndicator
  steps={[\"Upload\", \"Validate\", \"Process\", \"Complete\"]}
  currentStep={2}
  stepStatuses={[
    { index: 0, status: \"finish\" }
  ]}
/>"
          />
        </div>
      </div>

      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>
          "Notifications"
        </h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"NotificationBell"</h3>

          <p::componentDescription>
            "Campana de notificaciones con contador de mensajes no leídos."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <NotificationBell count={0}/>
            <NotificationBell count={3}/>
            <NotificationBell count={99}/>
          </div>

          <CodeHighlight
            language="mint"
            code="<NotificationBell count={3}/>"
          />
        </div>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>"ActivityFeed"</h3>

          <p::componentDescription>
            "Feed de actividades recientes con timeline."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ActivityFeed
              activities={[
                "User John Doe logged in",
                "New order #1234 received",
                "Payment processed successfully",
                "Product ABC updated",
                "New user registered: jane@example.com"
              ]}
              maxHeight="300px"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ActivityFeed
  activities={[
    \"User John Doe logged in\",
    \"New order #1234 received\",
    \"Payment processed successfully\"
  ]}
  maxHeight=\"300px\"
/>"
          />
        </div>
      </div>
    </div>
  }
}
