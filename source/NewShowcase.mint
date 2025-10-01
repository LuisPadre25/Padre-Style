component NewShowcase {
  state activeTab : String = "Layout"
  state modalOpen : Bool = false
  state selectedOption : String = ""
  state checkboxChecked : Bool = false
  state radioSelected : String = "option1"
  state inputValue : String = ""
  state currentPage : Number = 1
  state currentStep : Number = 0
  state activeNavItem : String = "Inicio"
  state rating : Number = 3
  state counterValue : Number = 5
  state accordionOpen : Bool = false
  state selectedTopNavItem : String = "Home"
  state selectedVerticalNavItem : String = "Dashboard"
  state selectedMenuDropdownItem : String = ""
  state selectedTabBarTab : String = "Overview"
  state breadcrumbClickedItem : String = ""
  state notificationCount : Number = 5

  state chatMessages : Array(String) =
    ["Hello!", "Hi there! How can I help?", "I need some info"]

  state searchQuery : String = ""
  state kpiProgress : Number = 75
  state currentProgressStep : Number = 2
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
  state passwordValue : String = ""
  state numberInputValue : Number = 5
  state sliderValue : Number = 50
  state searchValue : String = ""
  state dateValue : String = ""
  state timeValue : String = ""
  state dateTimeDate : String = ""
  state dateTimeTime : String = ""
  state colorValue : String = "#667eea"
  state radioGroupValue : String = "Option 1"
  state checkboxValue : Bool = false
  state toggleValue : Bool = false
  state selectValue : String = ""
  state rangeMinValue : Number = 20
  state rangeMaxValue : Number = 80
  state tagsValue : Array(String) = ["React", "Mint"]
  state autocompleteValue : String = ""
  state currencyValue : Number = 0
  state dateRangeStart : String = ""
  state dateRangeEnd : String = ""
  state phoneValue : String = ""
  state otpValue : String = ""

  connect ThemeStore exposing { currentTheme }

  style showcase {
    min-height: 100vh;
    padding: 2rem;
    max-width: 100%;
    overflow-x: hidden;
    box-sizing: border-box;

    & * {
      box-sizing: border-box;
    }

    & input,
    & textarea,
    & select {
      max-width: 100%;
    }
  }

  fun getShowcaseStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style header {
    text-align: center;
    margin-bottom: 3rem;
  }

  style title {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  fun getTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      text-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  style subtitle {
    font-size: 1.25rem;
    opacity: 0.9;
    margin-bottom: 2rem;
  }

  style section {
    margin-bottom: 4rem;
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

  style tabContent {
    margin-top: 2rem;
  }

  style demoGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 2.5rem;
    margin: 2rem 0;
    width: 100%;
    box-sizing: border-box;
  }

  style formGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 2rem;
    width: 100%;
    box-sizing: border-box;
    margin: 2rem 0;
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

  fun handleTabChange (tab : String) : Promise(Void) {
    next { activeTab: tab }
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

  fun handleModalOpen (event : Html.Event) : Promise(Void) {
    next { modalOpen: true }
  }

  fun handleModalClose (event : Html.Event) : Promise(Void) {
    next { modalOpen: false }
  }

  fun handleSelectChange (event : Html.Event) : Promise(Void) {
    next { selectedOption: "Nueva opción seleccionada" }
  }

  fun handleCheckboxChange (event : Html.Event) : Promise(Void) {
    next { checkboxChecked: !checkboxChecked }
  }

  fun handleRadioChange (event : Html.Event) : Promise(Void) {
    next { radioSelected: "option2" }
  }

  fun handleInputChange (event : Html.Event) : Promise(Void) {
    next { inputValue: "Texto actualizado" }
  }

  fun handlePageChange (page : Number) : Promise(Void) {
    next { currentPage: page }
  }

  fun handleStepChange (step : Number) : Promise(Void) {
    next { currentStep: step }
  }

  fun handleNavClick (item : String) : Promise(Void) {
    next { activeNavItem: item }
  }

  fun handleStepNext (event : Html.Event) : Promise(Void) {
    next { currentStep: (currentStep + 1) % 4 }
  }

  fun handlePagePrev (event : Html.Event) : Promise(Void) {
    next { currentPage: Math.max(1, currentPage - 1) }
  }

  fun handlePageNext (event : Html.Event) : Promise(Void) {
    next { currentPage: Math.min(10, currentPage + 1) }
  }

  fun handlePasswordChange (event : Html.Event) : Promise(Void) {
    next { passwordValue: Dom.getValue(event.target) }
  }

  fun handleNumberInputChange (newValue : Number) : Promise(Void) {
    next { numberInputValue: newValue }
  }

  fun handleSliderChange (newValue : Number) : Promise(Void) {
    next { sliderValue: newValue }
  }

  fun handleSearchChange (event : Html.Event) : Promise(Void) {
    next { searchValue: Dom.getValue(event.target) }
  }

  fun handleSearchSubmit (query : String) : Promise(Void) {
    next { searchValue: query }
  }

  fun handleDateChange (event : Html.Event) : Promise(Void) {
    next { dateValue: Dom.getValue(event.target) }
  }

  fun handleTimeChange (event : Html.Event) : Promise(Void) {
    next { timeValue: Dom.getValue(event.target) }
  }

  fun handleDateTimeDate (event : Html.Event) : Promise(Void) {
    next { dateTimeDate: Dom.getValue(event.target) }
  }

  fun handleDateTimeTime (event : Html.Event) : Promise(Void) {
    next { dateTimeTime: Dom.getValue(event.target) }
  }

  fun handleColorChange (newColor : String) : Promise(Void) {
    next { colorValue: newColor }
  }

  fun handleRadioGroupChange (value : String) : Promise(Void) {
    next { radioGroupValue: value }
  }

  fun handleCheckboxInputChange (checked : Bool) : Promise(Void) {
    next { checkboxValue: checked }
  }

  fun handleToggleChange (checked : Bool) : Promise(Void) {
    next { toggleValue: checked }
  }

  fun handleSelectChange2 (value : String) : Promise(Void) {
    next { selectValue: value }
  }

  fun handleRangeChange (minVal : Number, maxVal : Number) : Promise(Void) {
    next { rangeMinValue: minVal, rangeMaxValue: maxVal }
  }

  fun handleTagsChange (newTags : Array(String)) : Promise(Void) {
    next { tagsValue: newTags }
  }

  fun handleAutocompleteChange (value : String) : Promise(Void) {
    next { autocompleteValue: value }
  }

  fun handleAutocompleteSelect (selected : String) : Promise(Void) {
    next { autocompleteValue: selected }
  }

  fun handleCurrencyChange (value : Number) : Promise(Void) {
    next { currencyValue: value }
  }

  fun handleDateRangeStart (event : Html.Event) : Promise(Void) {
    next { dateRangeStart: Dom.getValue(event.target) }
  }

  fun handleDateRangeEnd (event : Html.Event) : Promise(Void) {
    next { dateRangeEnd: Dom.getValue(event.target) }
  }

  fun handlePhoneChange (value : String) : Promise(Void) {
    next { phoneValue: value }
  }

  fun handleOTPChange (value : String) : Promise(Void) {
    next { otpValue: value }
  }

  fun renderLayoutTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Layout Components"</h3>
      <p style="text-align: center; margin-bottom: 2rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
        "Componentes Flex y Grid para crear layouts modernos y responsivos"
      </p>

      <div::demoGrid>
        <Card title="🎯 Flex - Horizontal Center">
          <Flex justify="center" align="center" gap="1rem">
            <Badge variant="primary">"Badge 1"</Badge>
            <Badge variant="success">"Badge 2"</Badge>
            <Badge>"Badge 3"</Badge>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "justify='center' align='center'"
          </p>
        </Card>

        <Card title="📐 Flex - Space Between">
          <Flex justify="space-between" align="center" gap="0.5rem">
            <Button variant="primary">"Left"</Button>
            <Badge>"Center"</Badge>
            <Button variant="success">"Right"</Button>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "justify='space-between'"
          </p>
        </Card>

        <Card title="📊 Flex - Column">
          <Flex direction="column" gap="0.75rem">
            <Button>"Item 1"</Button>
            <Button variant="secondary">"Item 2"</Button>
            <Button variant="success">"Item 3"</Button>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "direction='column'"
          </p>
        </Card>

        <Card title="🔄 Flex - Wrap">
          <Flex wrap="wrap" justify="center" gap="0.75rem">
            <Badge variant="primary">"React"</Badge>
            <Badge variant="success">"Vue"</Badge>
            <Badge>"Angular"</Badge>
            <Badge variant="primary">"Svelte"</Badge>
            <Badge variant="success">"Mint"</Badge>
            <Badge>"Solid"</Badge>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "wrap='wrap'"
          </p>
        </Card>

        <Card title="📱 Grid - 2 Columns">
          <Grid columns={2} gap="1rem">
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
              "Column 1"
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
              "Column 2"
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "columns={2}"
          </p>
        </Card>

        <Card title="🎨 Grid - 3 Columns">
          <Grid columns={3} gap="0.75rem">
            <Badge variant="primary">"1"</Badge>
            <Badge variant="success">"2"</Badge>
            <Badge>"3"</Badge>
            <Badge>"4"</Badge>
            <Badge variant="primary">"5"</Badge>
            <Badge variant="success">"6"</Badge>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "columns={3}"
          </p>
        </Card>

        <Card title="🌟 Grid - Auto Fit">
          <Grid autoFit={true} minColumnWidth="100px" gap="1rem">
            <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 6px; text-align: center; color: white;">
              "A"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 6px; text-align: center; color: white;">
              "B"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 6px; text-align: center; color: white;">
              "C"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 6px; text-align: center; color: white;">
              "D"
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "autoFit={true} minColumnWidth='100px'"
          </p>
        </Card>

        <Card title="💎 Dashboard Layout">
          <Grid columns={2} gap="1rem" rowGap="1rem">
            <div style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px;">
              <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Total Users"</h4>
              <p style="font-size: 2rem; font-weight: 700; color: #667eea; margin: 0;">"1,234"</p>
            </div>
            <div style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px;">
              <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Revenue"</h4>
              <p style="font-size: 2rem; font-weight: 700; color: #43e97b; margin: 0;">"$45K"</p>
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "KPI Cards Layout"
          </p>
        </Card>

        <Card title="🎭 Flex - Space Around">
          <Flex justify="space-around" align="center" gap="0.5rem">
            <Badge variant="primary">"A"</Badge>
            <Badge variant="success">"B"</Badge>
            <Badge>"C"</Badge>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "justify='space-around'"
          </p>
        </Card>

        <Card title="🔥 Flex - Space Evenly">
          <Flex justify="space-evenly" align="center">
            <Button variant="primary">"Start"</Button>
            <Button>"Middle"</Button>
            <Button variant="success">"End"</Button>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "justify='space-evenly'"
          </p>
        </Card>

        <Card title="📋 Complex Layout">
          <Flex direction="column" gap="1rem">
            <Flex justify="space-between" align="center">
              <h4 style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Header"</h4>
              <Badge variant="success">"Active"</Badge>
            </Flex>
            <Grid columns={3} gap="0.5rem">
              <Badge>"Tag 1"</Badge>
              <Badge variant="primary">"Tag 2"</Badge>
              <Badge variant="success">"Tag 3"</Badge>
            </Grid>
            <Flex justify="flex-end" gap="0.5rem">
              <Button variant="secondary">"Cancel"</Button>
              <Button variant="success">"Save"</Button>
            </Flex>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Nested Flex + Grid"
          </p>
        </Card>

        <Card title="🌈 Responsive Grid">
          <Grid autoFit={true} minColumnWidth="80px" gap="0.75rem">
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); border-radius: 8px;"></div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Auto-fit responsive grid"
          </p>
        </Card>

        <Card title="💪 Flex Grow - flex: 1">
          <Flex gap="0.5rem">
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Items de igual tamaño"
          </p>
        </Card>

        <Card title="🎯 Flex Grow - flex: 1, 2, 1">
          <Flex gap="0.5rem">
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
            <FlexItem flex="2">
              <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 2"
              </div>
            </FlexItem>
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Centro ocupa doble espacio"
          </p>
        </Card>

        <Card title="📏 Flex Basis - Ancho fijo + flex">
          <Flex gap="0.5rem">
            <FlexItem basis="200px" grow="0" shrink="0">
              <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
                "200px fijo"
              </div>
            </FlexItem>
            <FlexItem flex="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
                "flex: 1"
              </div>
            </FlexItem>
            <FlexItem basis="150px" grow="0" shrink="0">
              <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
                "150px fijo"
              </div>
            </FlexItem>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Sidebar fijo + contenido flexible"
          </p>
        </Card>

        <Card title="🔢 Order - Reordenar items">
          <Flex gap="0.5rem">
            <FlexItem order="3">
              <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
                "Primero (order: 3)"
              </div>
            </FlexItem>
            <FlexItem order="1">
              <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
                "Segundo (order: 1)"
              </div>
            </FlexItem>
            <FlexItem order="2">
              <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
                "Tercero (order: 2)"
              </div>
            </FlexItem>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Se muestran: Segundo → Tercero → Primero"
          </p>
        </Card>

        <Card title="🎨 Align Self - Alineación individual">
          <div style="min-height: 150px;">
            <Flex align="flex-start" gap="0.5rem">
              <FlexItem>
                <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
                  "Normal"
                </div>
              </FlexItem>
              <FlexItem alignSelf="center">
                <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
                  "Center"
                </div>
              </FlexItem>
              <FlexItem alignSelf="flex-end">
                <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
                  "End"
                </div>
              </FlexItem>
            </Flex>
          </div>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "alignSelf anula align del padre"
          </p>
        </Card>

        <Card title="🚀 Dashboard Real con Flex">
          <Flex direction="column" gap="1rem">
            <Flex justify="space-between" align="center">
              <FlexItem flex="1">
                <h3 style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Dashboard"</h3>
              </FlexItem>
              <FlexItem>
                <Badge variant="success">"Live"</Badge>
              </FlexItem>
            </Flex>

            <Flex gap="1rem">
              <FlexItem flex="2">
                <div style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px;">
                  <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem;">"MAIN CONTENT"</h4>
                  <p style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"flex: 2 - Ocupa 2/3"</p>
                </div>
              </FlexItem>
              <FlexItem flex="1">
                <div style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px;">
                  <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 0.875rem;">"SIDEBAR"</h4>
                  <p style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"flex: 1 - Ocupa 1/3"</p>
                </div>
              </FlexItem>
            </Flex>

            <Flex gap="0.5rem">
              <FlexItem flex="1">
                <Button>"Cancel"</Button>
              </FlexItem>
              <FlexItem flex="1">
                <Button variant="success">"Save"</Button>
              </FlexItem>
            </Flex>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Layout completo con Flex anidado"
          </p>
        </Card>

        <Card title="📱 Responsive Layout - 70/30">
          <Flex gap="1rem" wrap="wrap">
            <FlexItem grow="1" shrink="1" basis="300px">
              <div style="padding: 1.5rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; color: white;">
                <h4 style="margin: 0 0 0.5rem 0;">"Contenido Principal"</h4>
                <p style="margin: 0; font-size: 0.875rem;">"basis: 300px, grow: 1"</p>
              </div>
            </FlexItem>
            <FlexItem grow="0" shrink="0" basis="200px">
              <div style="padding: 1.5rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; color: white;">
                <h4 style="margin: 0 0 0.5rem 0;">"Sidebar"</h4>
                <p style="margin: 0; font-size: 0.875rem;">"basis: 200px fijo"</p>
              </div>
            </FlexItem>
          </Flex>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "wrap='wrap' - Se apilan en móvil"
          </p>
        </Card>
      </div>

      <h3::sectionTitle style={getSectionTitleStyles() + "margin-top: 3rem;"}>"Grid Avanzado - Layouts Profesionales"</h3>
      <p style="text-align: center; margin-bottom: 2rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
        "Crea layouts complejos con Grid: auto-fit, diferentes gaps, y responsive por defecto"
      </p>
      <div style="text-align: center; margin-bottom: 2rem; padding: 1rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border-radius: 8px; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};">
        <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"📱 Todos los Grids son RESPONSIVE"</h4>
        <p style="margin: 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
          "Desktop: N columnas → Tablet: 2 columnas → Móvil: 1 columna"
        </p>
        <p style="margin: 0.5rem 0 0 0; font-size: 0.75rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
          "Usa responsive={false} para deshabilitar o autoFit={true} para magia total"
        </p>
      </div>

      <div::demoGrid>
        <Card title="🎯 Grid Básico - 4 Columnas">
          <Grid columns={4} gap="0.5rem">
            <div style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "1"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "2"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "3"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "4"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "5"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); border-radius: 6px; text-align: center; color: white; font-weight: 600;">
              "6"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); border-radius: 6px; text-align: center; color: #333; font-weight: 600;">
              "7"
            </div>
            <div style="padding: 1rem; background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%); border-radius: 6px; text-align: center; color: #333; font-weight: 600;">
              "8"
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "columns={4} gap='0.5rem'"
          </p>
        </Card>

        <Card title="📦 Grid - Product Cards">
          <Grid columns={3} gap="1rem">
            <div style="padding: 1rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px; text-align: center;">
              <div style="aspect-ratio: 1; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 6px; margin-bottom: 0.5rem;"></div>
              <p style="margin: 0; font-weight: 600; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Product 1"</p>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"$29.99"</p>
            </div>
            <div style="padding: 1rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px; text-align: center;">
              <div style="aspect-ratio: 1; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 6px; margin-bottom: 0.5rem;"></div>
              <p style="margin: 0; font-weight: 600; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Product 2"</p>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"$39.99"</p>
            </div>
            <div style="padding: 1rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)}; border-radius: 8px; text-align: center;">
              <div style="aspect-ratio: 1; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 6px; margin-bottom: 0.5rem;"></div>
              <p style="margin: 0; font-weight: 600; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"Product 3"</p>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"$49.99"</p>
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "E-commerce product grid"
          </p>
        </Card>

        <Card title="🎨 Auto-Fit - Responsive Magic">
          <Grid autoFit={true} minColumnWidth="120px" gap="1rem">
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;">
              <h4 style="margin: 0; font-size: 1.5rem;">"🎯"</h4>
              <p style="margin: 0.5rem 0 0 0; font-size: 0.875rem;">"Auto"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;">
              <h4 style="margin: 0; font-size: 1.5rem;">"📱"</h4>
              <p style="margin: 0.5rem 0 0 0; font-size: 0.875rem;">"Fit"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px; text-align: center; color: white;">
              <h4 style="margin: 0; font-size: 1.5rem;">"💻"</h4>
              <p style="margin: 0.5rem 0 0 0; font-size: 0.875rem;">"Grid"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 8px; text-align: center; color: white;">
              <h4 style="margin: 0; font-size: 1.5rem;">"🖥️"</h4>
              <p style="margin: 0.5rem 0 0 0; font-size: 0.875rem;">"Magic"</p>
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Se adapta automáticamente al espacio"
          </p>
        </Card>

        <Card title="📐 Different Gaps - columnGap & rowGap">
          <Grid columns={3} columnGap="2rem" rowGap="0.5rem">
            <Badge variant="primary">"A"</Badge>
            <Badge variant="success">"B"</Badge>
            <Badge>"C"</Badge>
            <Badge>"D"</Badge>
            <Badge variant="primary">"E"</Badge>
            <Badge variant="success">"F"</Badge>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "columnGap='2rem' rowGap='0.5rem'"
          </p>
        </Card>

        <Card title="🖼️ Image Gallery">
          <Grid autoFit={true} minColumnWidth="100px" gap="0.5rem">
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%); border-radius: 8px;"></div>
            <div style="aspect-ratio: 1; background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%); border-radius: 8px;"></div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Instagram-style gallery"
          </p>
        </Card>

        <Card title="💎 Dashboard Stats Grid">
          <Grid columns={2} gap="1rem">
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 12px; color: white;">
              <p style="margin: 0; font-size: 0.875rem; opacity: 0.9;">"Total Users"</p>
              <h3 style="margin: 0.5rem 0 0 0; font-size: 2.5rem; font-weight: 700;">"12.5K"</h3>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.75rem; opacity: 0.8;">"↗ +12% desde ayer"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 12px; color: white;">
              <p style="margin: 0; font-size: 0.875rem; opacity: 0.9;">"Revenue"</p>
              <h3 style="margin: 0.5rem 0 0 0; font-size: 2.5rem; font-weight: 700;">"$89K"</h3>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.75rem; opacity: 0.8;">"↗ +8% desde ayer"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 12px; color: white;">
              <p style="margin: 0; font-size: 0.875rem; opacity: 0.9;">"Orders"</p>
              <h3 style="margin: 0.5rem 0 0 0; font-size: 2.5rem; font-weight: 700;">"1,234"</h3>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.75rem; opacity: 0.8;">"↗ +23% desde ayer"</p>
            </div>
            <div style="padding: 1.5rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 12px; color: white;">
              <p style="margin: 0; font-size: 0.875rem; opacity: 0.9;">"Conversion"</p>
              <h3 style="margin: 0.5rem 0 0 0; font-size: 2.5rem; font-weight: 700;">"3.2%"</h3>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.75rem; opacity: 0.8;">"↘ -2% desde ayer"</p>
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Analytics dashboard with stats"
          </p>
        </Card>

        <Card title="🎯 Icon Grid - Features">
          <Grid autoFit={true} minColumnWidth="140px" gap="1.5rem">
            <div style="text-align: center;">
              <div style="width: 60px; height: 60px; margin: 0 auto 0.75rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.75rem;">
                "⚡"
              </div>
              <h4 style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)}; font-size: 1rem;">"Fast"</h4>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"Lightning speed"</p>
            </div>
            <div style="text-align: center;">
              <div style="width: 60px; height: 60px; margin: 0 auto 0.75rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.75rem;">
                "🔒"
              </div>
              <h4 style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)}; font-size: 1rem;">"Secure"</h4>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"Bank-level security"</p>
            </div>
            <div style="text-align: center;">
              <div style="width: 60px; height: 60px; margin: 0 auto 0.75rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.75rem;">
                "🎨"
              </div>
              <h4 style="margin: 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)}; font-size: 1rem;">"Beautiful"</h4>
              <p style="margin: 0.25rem 0 0 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">"Stunning design"</p>
            </div>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Feature grid with icons"
          </p>
        </Card>

        <Card title="🌈 Compact Grid - Tags">
          <Grid autoFit={true} minColumnWidth="80px" gap="0.5rem">
            <Badge variant="primary">"React"</Badge>
            <Badge variant="success">"Vue"</Badge>
            <Badge>"Angular"</Badge>
            <Badge variant="primary">"Svelte"</Badge>
            <Badge variant="success">"Mint"</Badge>
            <Badge>"Next.js"</Badge>
            <Badge variant="primary">"Nuxt"</Badge>
            <Badge variant="success">"Remix"</Badge>
            <Badge>"Astro"</Badge>
            <Badge variant="primary">"Qwik"</Badge>
            <Badge variant="success">"Solid"</Badge>
            <Badge>"Alpine"</Badge>
          </Grid>
          <p style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)}; text-align: center;">
            "Tag cloud responsive"
          </p>
        </Card>
      </div>
    </div>
  }

  fun renderDataTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>
        "Data Display Components"
      </h3>

      <div::demoGrid>
        <Card title="Calendar"><Calendar currentDate="2024-12-15"/></Card>

        <Card title="Loading States">
          <div
            style="display: flex; flex-direction: column; gap: 2rem; align-items: center;"
          >
            <Loading variant="spinner" size="md" text="Cargando..."/>
            <Loading variant="dots" size="md"/>
            <Loading variant="pulse" size="md"/>
          </div>
        </Card>

        <Card title="Alerts">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Alert variant="success" title="Éxito">
              "Operación completada exitosamente"
            </Alert>

            <Alert variant="warning" title="Advertencia">
              "Ten cuidado con esta acción"
            </Alert>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderFormsTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Form Components"</h3>

      <div::formGrid>
        <Card title="Input Fields">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Input placeholder="Ingrese su texto..." value={inputValue}/>
            <Input type="email" placeholder="email@ejemplo.com"/>
            <Input type="password" placeholder="Contraseña"/>
          </div>
        </Card>

        <Card title="Selections">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Checkbox
              label="Acepto términos y condiciones"
              checked={checkboxChecked}
            />

            <Radio label="Opción 1" checked={radioSelected == "option1"}/>
            <Radio label="Opción 2" checked={radioSelected == "option2"}/>
          </div>
        </Card>

        <Card title="Text Area">
          <Textarea placeholder="Escriba su mensaje aquí..." rows={4}/>
        </Card>

        <Card title="Password Input">
          <PasswordInput
            placeholder="Enter your password"
            value={passwordValue}
            onChange={handlePasswordChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >"Try clicking the eye icon!"</p>
        </Card>

        <Card title="Number Input">
          <NumberInput
            value={numberInputValue}
            min={0}
            max={10}
            step={1}
            onChange={handleNumberInputChange}
          />

          <p style="margin-top: 0.5rem; text-align: center;">
            "Value: "
            Number.toString(numberInputValue)
          </p>
        </Card>

        <Card title="Slider">
          <SliderInput
            value={sliderValue}
            min={0}
            max={100}
            step={5}
            showValue={true}
            onChange={handleSliderChange}
          />
        </Card>

        <Card title="Search Input">
          <SearchInputComponent
            placeholder="Search..."
            value={searchValue}
            onChange={handleSearchChange}
            onSearch={handleSearchSubmit}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Search: "
            searchValue
          </p>
        </Card>

        <Card title="File Upload"><FileUpload accept="image/*"/></Card>

        <Card title="Date Input">
          <DateInput
            value={dateValue}
            placeholder="Select date"
            onChange={handleDateChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(dateValue) {
                "None"
              } else {
                dateValue
              }
            }
          </p>
        </Card>

        <Card title="Time Input">
          <TimeInput
            value={timeValue}
            placeholder="Select time"
            onChange={handleTimeChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(timeValue) {
                "None"
              } else {
                timeValue
              }
            }
          </p>
        </Card>

        <Card title="Date & Time Input">
          <DateTimeInput
            dateValue={dateTimeDate}
            timeValue={dateTimeTime}
            onDateChange={handleDateTimeDate}
            onTimeChange={handleDateTimeTime}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            {
              if String.isEmpty(dateTimeDate) && String.isEmpty(dateTimeTime) {
                "No date/time selected"
              } else {
                "#{dateTimeDate} #{dateTimeTime}"
              }
            }
          </p>
        </Card>

        <Card title="Color Picker">
          <ColorPicker value={colorValue} onChange={handleColorChange}/>

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected color: "
            colorValue
          </p>
        </Card>

        <Card title="Radio Group">
          <RadioGroup
            options={["Option 1", "Option 2", "Option 3"]}
            selectedValue={radioGroupValue}
            name="demo-radio"
            onChange={handleRadioGroupChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "
            radioGroupValue
          </p>
        </Card>

        <Card title="Checkbox Input">
          <CheckboxInput
            label="Enable notifications"
            checked={checkboxValue}
            onChange={handleCheckboxInputChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Checked: "

            {
              if checkboxValue {
                "Yes"
              } else {
                "No"
              }
            }
          </p>
        </Card>

        <Card title="Toggle Switch">
          <ToggleSwitch
            label="Dark Mode"
            checked={toggleValue}
            onChange={handleToggleChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Status: "

            {
              if toggleValue {
                "ON"
              } else {
                "OFF"
              }
            }
          </p>
        </Card>

        <Card title="Select Dropdown">
          <SelectInput
            options={["JavaScript", "TypeScript", "Python", "Rust", "Go"]}
            value={selectValue}
            placeholder="Choose a language"
            onChange={handleSelectChange2}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(selectValue) {
                "None"
              } else {
                selectValue
              }
            }
          </p>
        </Card>

        <Card title="Range Input">
          <RangeInput
            minValue={rangeMinValue}
            maxValue={rangeMaxValue}
            min={0}
            max={100}
            step={5}
            onChange={handleRangeChange}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Range: "
            Number.toString(rangeMinValue)
            " - "
            Number.toString(rangeMaxValue)
          </p>
        </Card>

        <Card title="Tags Input">
          <TagsInput
            tags={tagsValue}
            placeholder="Add a tag..."
            onTagsChange={handleTagsChange}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Tags: "
            Number.toString(Array.size(tagsValue))
          </p>
        </Card>

        <Card title="Autocomplete Input">
          <AutocompleteInput
            value={autocompleteValue}
            suggestions={["JavaScript", "TypeScript", "Python", "Ruby", "Go", "Rust", "Java", "Kotlin", "Swift"]}
            placeholder="Type to search..."
            onChange={handleAutocompleteChange}
            onSelect={handleAutocompleteSelect}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Value: "
            {if (String.isEmpty(autocompleteValue)) { "None" } else { autocompleteValue }}
          </p>
        </Card>

        <Card title="Currency Input">
          <CurrencyInput
            value={currencyValue}
            currency="$"
            placeholder="0.00"
            onChange={handleCurrencyChange}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Amount: $"
            Number.toString(currencyValue)
          </p>
        </Card>

        <Card title="Date Range Picker">
          <DateRangePicker
            startDate={dateRangeStart}
            endDate={dateRangeEnd}
            onStartDateChange={handleDateRangeStart}
            onEndDateChange={handleDateRangeEnd}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            {
              if (String.isEmpty(dateRangeStart) && String.isEmpty(dateRangeEnd)) {
                "No range selected"
              } else {
                "#{dateRangeStart} to #{dateRangeEnd}"
              }
            }
          </p>
        </Card>

        <Card title="Phone Input">
          <PhoneInput
            value={phoneValue}
            countryCode="+1"
            placeholder="(555) 123-4567"
            onChange={handlePhoneChange}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Phone: "
            {if (String.isEmpty(phoneValue)) { "None" } else { phoneValue }}
          </p>
        </Card>

        <Card title="OTP Input">
          <OTPInput
            length={6}
            value={otpValue}
            onChange={handleOTPChange}/>
          <p style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;">
            "Code: "
            {if (String.isEmpty(otpValue)) { "None" } else { otpValue }}
          </p>
        </Card>
      </div>
    </div>
  }

  fun renderFeedbackTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Feedback & Interaction"</h3>

      <div::demoGrid>
        <Card title="Motion Effects">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Motion initial="hidden" animate="bounce" duration="1s">
              <Button>"Bounce Animation"</Button>
            </Motion>

            <Motion initial="hidden" animate="pulse" duration="2s">
              <Button variant="secondary">"Pulse Animation"</Button>
            </Motion>
          </div>
        </Card>

        <Card title="Advanced Gestures">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Elastic intensity={1.1}>
              <Button variant="success">"Elastic Effect"</Button>
            </Elastic>

            <Tilt intensity={15}><Button>"3D Tilt Effect"</Button></Tilt>
          </div>
        </Card>

        <Card title="Modal Demo">
          <div style="text-align: center;">
            <Button onClick={handleModalOpen}>"Abrir Modal"</Button>

            <Modal
              isOpen={modalOpen}
              title="Modal de Ejemplo"
              onClose={handleModalClose}
            >
              <p>"Este es el contenido del modal."</p>

              <div
                style="display: flex; gap: 1rem; justify-content: center; margin-top: 1rem;"
              ><Button onClick={handleModalClose}>"Cerrar"</Button></div>
            </Modal>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderNavigationTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Navigation & Layout"</h3>

      <div::demoGrid>
        <Card title="Tabs Demo">
          <div style="text-align: center;">
            <p>"Estas son las pestañas que estás usando ahora"</p>
            <Badge variant="primary">"Tab: #{activeTab}"</Badge>
          </div>
        </Card>

        <Card title="Progress">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="text-align: center;">
              <p>"Paso actual: #{Number.toString(currentStep + 1)}/4"</p>
              <Button onClick={handleStepNext}>"Siguiente Paso"</Button>
            </div>
          </div>
        </Card>

        <Card title="Page Navigation">
          <div style="text-align: center;">
            <p>"Página actual: #{Number.toString(currentPage)}/10"</p>

            <div
              style="display: flex; gap: 0.5rem; justify-content: center; margin-top: 1rem;"
            >
              <Button onClick={handlePagePrev}>"← Anterior"</Button>
              <Button onClick={handlePageNext}>"Siguiente →"</Button>
            </div>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderAdvancedTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Advanced Components"</h3>

      <div::demoGrid>
        <Card title="Dropdown Menu">
          <Dropdown trigger="Opciones avanzadas">
            <DropdownItem>"Configuración"</DropdownItem>
            <DropdownItem>"Ayuda"</DropdownItem>
            <DropdownItem>"Cerrar sesión"</DropdownItem>
          </Dropdown>
        </Card>

        <Card title="Progress Indicators">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Progress value={75} showLabel={true}/>
            <Progress value={45} variant="success" showLabel={true}/>
            <Progress value={25} variant="warning" showLabel={true}/>
          </div>
        </Card>

        <Card title="Accordion">
          <Accordion title="¿Qué es Padre Style?" defaultOpen={true}>
            "Una librería completa de componentes modernos para Mint con diseño glass-morphism y gradientes."
          </Accordion>
        </Card>

        <Card title="Tooltips">
          <div style="display: flex; gap: 1rem; justify-content: center;">
            <Tooltip content="Información adicional" placement="top">
              <Button variant="secondary">"Hover para tooltip"</Button>
            </Tooltip>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderMediaTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Media Components"</h3>

      <div::demoGrid>
        <Card title="Avatars">
          <div
            style="display: flex; gap: 1rem; align-items: center; justify-content: center;"
          >
            <Avatar size="small" fallback="JS"/>
            <Avatar size="medium" fallback="PD"/>
            <Avatar size="large" fallback="MT"/>
          </div>
        </Card>

        <Card title="Enhanced Images">
          <Image src="" alt="Demo image" width="100%" height="150px"/>
        </Card>

        <Card title="Icons">
          <div
            style="display: flex; gap: 1rem; justify-content: center; align-items: center;"
          >
            <Icon name="heart" size="large" color="#ef4444"/>
            <Icon name="star" size="large" color="#fbbf24"/>
            <Icon name="user" size="large" color="#667eea"/>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderDataVizTab : Html {
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

  fun renderUtilitiesTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Utility Components"</h3>

      <div::demoGrid>
        <Card title="Scroll Area">
          <ScrollArea height="150px">
            <div>
              <p>"Contenido scrolleable 1"</p>
              <p>"Contenido scrolleable 2"</p>
              <p>"Contenido scrolleable 3"</p>
              <p>"Contenido scrolleable 4"</p>
              <p>"Contenido scrolleable 5"</p>
              <p>"Contenido scrolleable 6"</p>
              <p>"Contenido scrolleable 7"</p>
              <p>"Contenido scrolleable 8"</p>
            </div>
          </ScrollArea>
        </Card>

        <Card title="Skeleton Loading">
          <div style="display: flex; flex-direction: column; gap: 0.75rem;">
            <Skeleton width="100%" height="1rem"/>
            <Skeleton width="80%" height="1rem"/>
            <Skeleton width="60%" height="1rem"/>
          </div>
        </Card>

        <Card title="Spacers">
          <div style="display: flex; align-items: center;">
            <Badge>"Item 1"</Badge>
            <Spacer size="lg" direction="horizontal"/>
            <Badge>"Item 2"</Badge>
            <Spacer size="xl" direction="horizontal"/>
            <Badge>"Item 3"</Badge>
          </div>
        </Card>
      </div>
    </div>
  }

  fun renderAdvancedFormsTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Advanced Forms"</h3>

      <div::formGrid>
        <Card title="Date Picker"><DatePicker placeholder="Seleccionar fecha"/></Card>

        <Card title="Range Slider">
          <Slider value={65} min={0} max={100} showValue={true}/>
        </Card>

        <Card title="Toggle Switch">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Switch checked={true} label="Notificaciones"/>
            <Switch checked={false} label="Modo oscuro" size="large"/>
          </div>
        </Card>

        <Card title="Color Picker">
          <div style="text-align: center;"><ColorPicker value="#667eea"/></div>
        </Card>
      </div>
    </div>
  }

  fun handleRatingChange (value : Number) : Promise(Void) {
    next { rating: value }
  }

  fun handleCounterChange (value : Number) : Promise(Void) {
    next { counterValue: value }
  }

  fun handleTopNavClick (item : String) : Promise(Void) {
    next { selectedTopNavItem: item }
  }

  fun handleVerticalNavClick (item : String) : Promise(Void) {
    next { selectedVerticalNavItem: item }
  }

  fun handleMenuDropdownSelect (item : String) : Promise(Void) {
    next { selectedMenuDropdownItem: item }
  }

  fun handleTabBarChange (tab : String) : Promise(Void) {
    next { selectedTabBarTab: tab }
  }

  fun handleBreadcrumbClick (item : String, index : Number) : Promise(Void) {
    next { breadcrumbClickedItem: item }
  }

  fun handleFooterLinkClick (link : String) : Promise(Void) {
    next { breadcrumbClickedItem: link }
  }

  fun handleNotificationClick (e : Html.Event) : Promise(Void) {
    next { notificationCount: 0 }
  }

  fun handleChatSend (message : String) : Promise(Void) {
    next { chatMessages: Array.push(chatMessages, message) }
  }

  fun handleSearch (query : String) : Promise(Void) {
    next { searchQuery: query }
  }

  fun renderDashboardTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Dashboard Components"</h3>

      <div::demoGrid>
        <StatCard
          title="Revenue"
          value="$45,231"
          icon="💰"
          trend="+12.5%"
          trendDirection="up"
          description="vs last month"
        />

        <StatCard
          title="Users"
          value="2,847"
          icon="👥"
          trend="+8.2%"
          trendDirection="up"
          description="active now"
        />

        <StatCard
          title="Orders"
          value="142"
          icon="📦"
          trend="-3.1%"
          trendDirection="down"
          description="today"
        />

        <Card title="Metrics">
          <MetricCard
            label="Storage"
            current={7.2}
            target={10}
            unit="GB"
            variant="warning"
          />
        </Card>

        <Card title="Live Status">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <LiveIndicator isLive={true} label="LIVE"/>
            <LiveIndicator isLive={false} label="OFFLINE" showPulse={false}/>
          </div>
        </Card>

        <Card title="Notifications">
          <div style="text-align: center;">
            <NotificationBell
              count={notificationCount}
              onClick={handleNotificationClick}
            />

            <p style="margin-top: 1rem;">"Click to clear"</p>
          </div>
        </Card>
      </div>

      <div style="margin-top: 2rem;">
        <Card title="Activity Feed">
          <ActivityFeed
            activities={
              [
                "User John Doe logged in",
                "New order #1234 received",
                "Payment processed successfully",
                "Product inventory updated",
                "System backup completed"
              ]
            }
          />
        </Card>
      </div>

      <div style="margin-top: 2rem;">
        <Card title="Data Table">
          <DataTable
            headers={["Name", "Email", "Status", "Role"]}
            rows={
              [
                ["John Doe", "john@example.com", "Active", "Admin"],
                ["Jane Smith", "jane@example.com", "Active", "User"],
                ["Bob Johnson", "bob@example.com", "Inactive", "User"]
              ]
            }
          />
        </Card>
      </div>
    </div>
  }

  fun renderChatTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Chat & Communication"</h3>

      <div::demoGrid>
        <Card title="Chat Bubbles">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <ChatBubble
              message="Hello! How are you?"
              sender="John"
              timestamp="2:30 PM"
              isOwn={false}
              avatar="J"
            />

            <ChatBubble
              message="I'm doing great, thanks!"
              sender="You"
              timestamp="2:31 PM"
              isOwn={true}
              avatar="Y"
            />
          </div>
        </Card>

        <Card title="Search Bar">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <SimpleSearchBar
              placeholder="Search anything..."
              size="small"
              onSearch={handleSearch}
            />

            <SimpleSearchBar
              placeholder="Medium size (default)"
              size="medium"
              onSearch={handleSearch}
            />

            <SimpleSearchBar
              placeholder="Large search bar"
              size="large"
              onSearch={handleSearch}
            />

            <p style="text-align: center; margin-top: 0.5rem;">
              "Query: #{searchQuery}"
            </p>
          </div>
        </Card>

        <Card title="Separator">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="display: flex; align-items: center; gap: 1rem;">
              <Badge>"Item 1"</Badge>
              <Separator orientation="vertical"/>
              <Badge>"Item 2"</Badge>
              <Separator orientation="vertical"/>
              <Badge>"Item 3"</Badge>
            </div>

            <Separator variant="default"/>
            <p>"Default separator"</p>
            <Separator variant="gradient"/>
            <p>"Gradient separator"</p>
            <Separator variant="dashed"/>
            <p>"Dashed separator"</p>
          </div>
        </Card>
      </div>

      <div
        style="margin-top: 2rem; max-width: 600px; margin-left: auto; margin-right: auto;"
      >
        <SimpleChatWindow
          title="Support Chat"
          messages={chatMessages}
          height="400px"
          onSend={handleChatSend}
        />
      </div>
    </div>
  }

  fun renderCodeTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Code Highlighting"</h3>

      <div style="text-align: center; margin-bottom: 2rem; padding: 1rem; background: #{ThemeHelpers.getElevated(currentTheme)}; border-radius: 8px; border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};">
        <h4 style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(currentTheme)};">"💻 Syntax Highlighting para todos los lenguajes"</h4>
        <p style="margin: 0; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(currentTheme)};">
          "Soporta Mint, JavaScript, TypeScript, Python, Go, Crystal, JSON, Bash, HTML, CSS, HTTP, HAML y Stimulus"
        </p>
      </div>

      <div::demoGrid>
        <Card title="Mint Lang">
          <CodeHighlight
            language="mint"
            title="Mint Component"
            code="component Counter {
  property initial : Number = 0
  state count : Number = initial

  fun increment : Promise(Void) {
    next { count: count + 1 }
  }

  fun render : Html {
    <div>
      <button onClick={increment}>
        \"Count: \#{Number.toString(count)}\"
      </button>
    </div>
  }
}"
          />
        </Card>

        <Card title="JavaScript">
          <CodeHighlight
            language="javascript"
            title="JavaScript ES6+"
            code="const fetchUser = async (id) => {
  try {
    const response = await fetch('/api/users/' + id);
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Error fetching user:', error);
    throw error;
  }
};

// Usage
const user = await fetchUser(123);"
          />
        </Card>

        <Card title="TypeScript">
          <CodeHighlight
            language="typescript"
            title="TypeScript Interface"
            code="interface User {
  id: number;
  name: string;
  email: string;
  role: 'admin' | 'user';
}

class UserService {
  private users: User[] = [];

  async getUser(id: number): Promise<User | null> {
    return this.users.find(u => u.id === id) ?? null;
  }

  addUser(user: User): void {
    this.users.push(user);
  }
}"
          />
        </Card>

        <Card title="Python">
          <CodeHighlight
            language="python"
            title="Python Function"
            code="def fibonacci(n: int) -> list[int]:
    \"\"\"Generate Fibonacci sequence up to n terms.\"\"\"
    if n <= 0:
        return []
    elif n == 1:
        return [0]

    sequence = [0, 1]
    for i in range(2, n):
        sequence.append(sequence[i-1] + sequence[i-2])

    return sequence

# Usage
result = fibonacci(10)
print('Fibonacci:', result)"
          />
        </Card>

        <Card title="Go">
          <CodeHighlight
            language="go"
            title="Go Struct & Method"
            code="package main

import \"fmt\"

type Person struct {
    Name string
    Age  int
}

func (p *Person) Greet() string {
    return fmt.Sprintf(\"Hello, I'm %s and I'm %d years old\", p.Name, p.Age)
}

func main() {
    person := Person{Name: \"John\", Age: 30}
    fmt.Println(person.Greet())
}"
          />
        </Card>

        <Card title="Crystal">
          <CodeHighlight
            language="crystal"
            title="Crystal Class"
            code="class User
  property name : String
  property email : String

  def initialize(@name, @email)
  end

  def greet
    \"Hello, \" + @name + \"!\"
  end
end

user = User.new(\"Alice\", \"alice@example.com\")
puts user.greet"
          />
        </Card>

        <Card title="JSON">
          <CodeHighlight
            language="json"
            title="JSON Data"
            code="{
  \"name\": \"Padre Style\",
  \"version\": \"1.0.0\",
  \"description\": \"Modern UI component library for Mint\",
  \"keywords\": [\"mint\", \"ui\", \"components\"],
  \"author\": {
    \"name\": \"Jose\",
    \"email\": \"jose@example.com\"
  },
  \"license\": \"MIT\",
  \"dependencies\": {
    \"mint\": \"^0.19.0\"
  },
  \"features\": {
    \"responsive\": true,
    \"themeable\": true,
    \"accessible\": true
  }
}"
          />
        </Card>

        <Card title="Bash/cURL">
          <CodeHighlight
            language="bash"
            title="API Request"
            code="#!/bin/bash

# Fetch user data from API
curl -X GET https://api.example.com/users/123 \\
  -H \"Authorization: Bearer TOKEN\" \\
  -H \"Content-Type: application/json\" \\
  --silent | jq '.data'

# Upload file
curl -X POST https://api.example.com/upload \\
  -F \"file=@document.pdf\" \\
  -F \"name=My Document\""
          />
        </Card>

        <Card title="HTML">
          <CodeHighlight
            language="html"
            title="HTML5 Structure"
            code="<!DOCTYPE html>
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>Padre Style</title>
  <link rel=\"stylesheet\" href=\"styles.css\">
</head>
<body>
  <header>
    <h1>Welcome to Padre Style</h1>
    <nav>
      <a href=\"#home\">Home</a>
      <a href=\"#about\">About</a>
    </nav>
  </header>
  <main>
    <p>Modern UI components for Mint Lang</p>
  </main>
</body>
</html>"
          />
        </Card>

        <Card title="CSS">
          <CodeHighlight
            language="css"
            title="CSS Styles"
            code=".button {
  display: inline-flex;
  align-items: center;
  padding: 0.75rem 1.5rem;
  background: linear-gradient(135deg, #667eea, #764ba2);
  color: white;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.button:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 16px rgba(102, 126, 234, 0.3);
}

@media (max-width: 768px) {
  .button {
    padding: 0.5rem 1rem;
    font-size: 0.875rem;
  }
}"
          />
        </Card>

        <Card title="HTTP Request">
          <CodeHighlight
            language="http"
            title="HTTP Request/Response"
            code="POST /api/users HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9

{
  \"name\": \"John Doe\",
  \"email\": \"john@example.com\",
  \"role\": \"admin\"
}"
          />
        </Card>

        <Card title="Sin números de línea">
          <CodeHighlight
            language="mint"
            title="Mint - No Line Numbers"
            showLineNumbers={false}
            code="fun greet (name : String) : String {
  \"Hello, \" + name + \"!\"
}

greet(\"World\")"
          />
        </Card>

        <Card title="Sin botón de copiar">
          <CodeHighlight
            language="javascript"
            title="JavaScript - No Copy Button"
            showCopyButton={false}
            code="const greeting = 'Hello, World!';
console.log(greeting);"
          />
        </Card>

        <Card title="Con altura máxima">
          <CodeHighlight
            language="python"
            title="Python - Max Height 200px"
            maxHeight="200px"
            code="# Long code example with scroll
def process_data(items):
    result = []
    for item in items:
        if item.is_valid():
            processed = item.process()
            result.append(processed)
    return result

def filter_data(data, condition):
    return [d for d in data if condition(d)]

def transform_data(data, transformer):
    return map(transformer, data)

def aggregate_data(data, aggregator):
    return reduce(aggregator, data)

# More functions...
def validate_email(email):
    import re
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None"
          />
        </Card>

        <Card title="HAML">
          <CodeHighlight
            language="haml"
            title="HAML Template"
            code="!!! 5
%html{lang: 'en'}
  %head
    %title My HAML Page
    %meta{charset: 'utf-8'}
  %body
    -# This is a comment
    .container
      %h1#main-title Hello World
      %p.description
        Welcome to HAML syntax

      - users.each do |user|
        .user-card
          %h3= user.name
          %p.email= user.email
          %span.status{class: user.active? ? 'active' : 'inactive'}
            = user.status"
          />
        </Card>

        <Card title="Stimulus JS">
          <CodeHighlight
            language="stimulus"
            title="Stimulus Controller"
            code="import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['input', 'output', 'counter']
  static values = {
    maxLength: Number,
    url: String
  }
  static classes = ['active', 'loading']

  connect() {
    console.log('Controller connected')
    this.initializeCounter()
  }

  async handleSubmit(event) {
    event.preventDefault()
    const response = await fetch(this.urlValue, {
      method: 'POST',
      body: new FormData(event.target)
    })
    const data = await response.json()
    this.outputTarget.textContent = data.message
  }
}"
          />
        </Card>
      </div>
    </div>
  }

  fun renderNewComponentsTab : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"New Components"</h3>

      <div::demoGrid>
        <Card title="Tags">
          <div style="display: flex; gap: 0.5rem; flex-wrap: wrap;">
            <Tag label="Default Tag"/>
            <Tag label="Primary" variant="primary"/>
            <Tag label="Success" variant="success"/>
            <Tag label="Warning" variant="warning"/>
            <Tag label="Error" variant="error"/>
            <Tag label="Removable" variant="primary" removable={true}/>
          </div>
        </Card>

        <Card title="Status Indicators">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <div style="display: flex; align-items: center; gap: 0.5rem;">
              <StatusDot status="success"/>
              <span>"Online"</span>
            </div>

            <div style="display: flex; align-items: center; gap: 0.5rem;">
              <StatusDot status="warning"/>
              <span>"Warning"</span>
            </div>

            <div style="display: flex; align-items: center; gap: 0.5rem;">
              <StatusDot status="error"/>
              <span>"Error"</span>
            </div>

            <div style="display: flex; align-items: center; gap: 0.5rem;">
              <StatusDot status="info" pulse={true}/>
              <span>"Processing..."</span>
            </div>
          </div>
        </Card>

        <Card title="Rating">
          <div style="text-align: center;">
            <SimpleRating value={rating} max={5} onChange={handleRatingChange}/>
            <p style="margin-top: 1rem;">"Rating: #{Number.toString(rating)}/5"</p>
          </div>
        </Card>

        <Card title="Counter">
          <div style="text-align: center;">
            <Counter
              value={counterValue}
              min={0}
              max={10}
              step={1}
              onChange={handleCounterChange}
            />
          </div>
        </Card>

        <Card title="Chips">
          <div style="display: flex; gap: 0.5rem; flex-wrap: wrap;">
            <Chip label="React"/>
            <Chip label="Vue" variant="primary"/>
            <Chip label="Angular" variant="success"/>
            <Chip label="Svelte" closable={true}/>
          </div>
        </Card>

        <Card title="Info Box">
          <InfoBox title="Total Sales" value="$45,231" icon="💰" trend="up"/>
        </Card>

        <Card title="Price Tag">
          <div style="text-align: center;">
            <PriceTag price="299" currency="$" size="large" discount="399"/>
          </div>
        </Card>

        <Card title="Accordion">
          <SimpleAccordion title="Click to expand">
            <p>
              "This is the accordion content. It can contain any HTML elements."
            </p>

            <Button>"Action Button"</Button>
          </SimpleAccordion>
        </Card>

        <Card title="Timeline">
          <Timeline
            items={
              [
                "Project started",
                "First milestone completed",
                "Beta release",
                "Final release"
              ]
            }
          />
        </Card>

        <Card title="Top Navigation">
          <TopNav
            brand="MyBrand"
            items={["Home", "About", "Services", "Contact"]}
            activeItem={selectedTopNavItem}
            onItemClick={handleTopNavClick}
          />

          <p style="text-align: center; margin-top: 1rem;">
            "Selected: #{selectedTopNavItem}"
          </p>
        </Card>

        <Card title="Vertical Navigation">
          <div style="display: flex; gap: 1rem;">
            <VerticalNav
              items={["Dashboard", "Profile", "Settings", "Logout"]}
              activeItem={selectedVerticalNavItem}
              onItemClick={handleVerticalNavClick}
            />

            <div
              style="flex: 1; display: flex; align-items: center; justify-content: center;"
            ><p>"Selected: #{selectedVerticalNavItem}"</p></div>
          </div>
        </Card>

        <Card title="Menu Dropdown">
          <div style="text-align: center;">
            <MenuDropdown
              label="Options"
              items={["Edit", "Delete", "Share", "Archive"]}
              onSelect={handleMenuDropdownSelect}
            />

            <p style="margin-top: 1rem;">"Selected: #{selectedMenuDropdownItem}"</p>
          </div>
        </Card>

        <Card title="Breadcrumbs">
          <Breadcrumbs
            items={["Home", "Products", "Electronics", "Laptops"]}
            separator="/"
            onItemClick={handleBreadcrumbClick}
          />

          <p style="text-align: center; margin-top: 1rem;">
            "Clicked: #{breadcrumbClickedItem}"
          </p>
        </Card>

        <Card title="Tab Bar">
          <div
            style="display: flex; flex-direction: column; gap: 1rem; align-items: center;"
          >
            <TabBar
              tabs={["Overview", "Analytics", "Reports", "Settings"]}
              activeTab={selectedTabBarTab}
              onTabChange={handleTabBarChange}
            />

            <p>"Active: #{selectedTabBarTab}"</p>
          </div>
        </Card>

        <Card title="Footer">
          <Footer
            brandName="Padre Style"
            copyright="© 2024 Padre Style. All rights reserved."
            links={["About", "Documentation", "GitHub", "Contact"]}
            onLinkClick={handleFooterLinkClick}
          />
        </Card>
      </div>
    </div>
  }

  fun renderTabContent : Html {
    case activeTab {
      "Layout" => renderLayoutTab()
      "Data" => renderDataTab()
      "Forms" => renderFormsTab()
      "Feedback" => renderFeedbackTab()
      "Navigation" => renderNavigationTab()
      "Advanced" => renderAdvancedTab()
      "Media" => renderMediaTab()
      "DataViz" => renderDataVizTab()
      "Utilities" => renderUtilitiesTab()
      "AdvancedForms" => renderAdvancedFormsTab()
      "NewComponents" => renderNewComponentsTab()
      "Dashboard" => renderDashboardTab()
      "Chat" => renderChatTab()
      "Code" => renderCodeTab()
      _ => <div>"Selecciona una pestaña"</div>
    }
  }

  fun render : Html {
    <div::showcase style={getShowcaseStyles()}>
      <div::header>
        <Motion initial="hidden" animate="fadeIn" duration="1s">
          <h1::title style={getTitleStyles()}>"Padre Style Components"</h1>

          <p::subtitle
            style="color: #{ThemeHelpers.getTextSecondary(currentTheme)}; font-size: 1.25rem; opacity: 0.9; margin-bottom: 2rem;"
          >"Librería completa de componentes modernos para Mint"</p>
        </Motion>
      </div>

      <div::section>
        <Tabs
          tabs={
            [
              "Layout",
              "Data",
              "Forms",
              "Feedback",
              "Navigation",
              "Advanced",
              "Media",
              "DataViz",
              "Utilities",
              "AdvancedForms",
              "NewComponents",
              "Dashboard",
              "Chat",
              "Code"
            ]
          }
          activeTab={activeTab}
          onTabChange={handleTabChange}
        />

        renderTabContent()
      </div>
    </div>
  }
}
