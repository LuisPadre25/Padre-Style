/* LayoutDocsPage - Documentación de componentes de Layout */
component LayoutDocsPage {
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
    min-height: 150px;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style codeBlock {
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    overflow-x: auto;
    font-family: 'Fira Code', 'Courier New', monospace;
    font-size: 0.875rem;
    line-height: 1.6;
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style propsTable {
    width: 100%;
    border-collapse: collapse;
    margin: 1.5rem 0;
  }

  style tableHeader {
    text-align: left;
    padding: 0.75rem;
    border-bottom: 2px solid;
    font-weight: 700;
    font-size: 0.875rem;
  }

  fun getTableHeaderStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style tableCell {
    padding: 0.75rem;
    border-bottom: 1px solid;
    font-size: 0.875rem;
  }

  fun getTableCellStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
  }

  fun getBadgeStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
    "
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Layout Components"</h1>

      <p::pageDescription>
        "Layout components help you structure your application with flexible,
        responsive containers. All components support theming and are fully responsive."
      </p>

      // Flex Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Flex"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Flex"
            <span::badge style={getBadgeStyles()}>"Layout"</span>
          </h3>

          <p::componentDescription>
            "Flexbox container for flexible layouts. Supports all flexbox properties
            and provides responsive design out of the box."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Flex
              direction="row"
              justify="space-between"
              align="center"
              gap="1rem"
            >
              <DynamicCard title="Card 1">"Content 1"</DynamicCard>
              <DynamicCard title="Card 2">"Content 2"</DynamicCard>
              <DynamicCard title="Card 3">"Content 3"</DynamicCard>
            </Flex>
          </div>

          <CodeHighlight
            language="mint"
            code="<Flex
  direction=\"row\"
  justify=\"space-between\"
  align=\"center\"
  gap=\"1rem\"
>
  <DynamicCard title=\"Card 1\">\"Content 1\"</DynamicCard>
  <DynamicCard title=\"Card 2\">\"Content 2\"</DynamicCard>
  <DynamicCard title=\"Card 3\">\"Content 3\"</DynamicCard>
</Flex>"
          />

          <h4>"Props"</h4>

          <table::propsTable>
            <thead>
              <tr>
                <th::tableHeader style={getTableHeaderStyles()}>"Prop"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Type"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Default"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Description"</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td::tableCell style={getTableCellStyles()}>"direction"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"row"</td>
                <td::tableCell style={getTableCellStyles()}>"Flex direction: row, column"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"justify"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"flex-start"</td>
                <td::tableCell style={getTableCellStyles()}>"Justify content alignment"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"align"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"stretch"</td>
                <td::tableCell style={getTableCellStyles()}>"Align items"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"gap"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"0"</td>
                <td::tableCell style={getTableCellStyles()}>"Gap between items"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"wrap"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"nowrap"</td>
                <td::tableCell style={getTableCellStyles()}>"Flex wrap behavior"</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      // Stack Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Stack"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Stack"
            <span::badge style={getBadgeStyles()}>"Layout"</span>
          </h3>

          <p::componentDescription>
            "Vertical or horizontal stack with consistent spacing. Perfect for
            stacking elements with uniform gaps."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Stack spacing="1rem">
              <DynamicButton variant="primary">"Button 1"</DynamicButton>
              <DynamicButton variant="secondary">"Button 2"</DynamicButton>
              <DynamicButton variant="success">"Button 3"</DynamicButton>
            </Stack>
          </div>

          <CodeHighlight
            language="mint"
            code="<Stack spacing=\"1rem\">
  <DynamicButton variant=\"primary\">\"Button 1\"</DynamicButton>
  <DynamicButton variant=\"secondary\">\"Button 2\"</DynamicButton>
  <DynamicButton variant=\"success\">\"Button 3\"</DynamicButton>
</Stack>"
          />

          <h4>"Props"</h4>

          <table::propsTable>
            <thead>
              <tr>
                <th::tableHeader style={getTableHeaderStyles()}>"Prop"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Type"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Default"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Description"</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td::tableCell style={getTableCellStyles()}>"spacing"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"1rem"</td>
                <td::tableCell style={getTableCellStyles()}>"Space between items (vertical gap)"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"align"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"stretch"</td>
                <td::tableCell style={getTableCellStyles()}>"Align items (stretch, center, flex-start)"</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      // Grid Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Grid"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Grid"
            <span::badge style={getBadgeStyles()}>"Layout"</span>
          </h3>

          <p::componentDescription>
            "CSS Grid container with responsive columns. Automatically adapts to
            screen size with auto-fill and minmax."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Grid columns={3} gap="1rem" minColumnWidth="200px">
              <DynamicCard title="Item 1">"Grid item"</DynamicCard>
              <DynamicCard title="Item 2">"Grid item"</DynamicCard>
              <DynamicCard title="Item 3">"Grid item"</DynamicCard>
              <DynamicCard title="Item 4">"Grid item"</DynamicCard>
              <DynamicCard title="Item 5">"Grid item"</DynamicCard>
              <DynamicCard title="Item 6">"Grid item"</DynamicCard>
            </Grid>
          </div>

          <CodeHighlight
            language="mint"
            code="<Grid columns={3} gap=\"1rem\" minColumnWidth=\"200px\">
  <DynamicCard title=\"Item 1\">\"Grid item\"</DynamicCard>
  <DynamicCard title=\"Item 2\">\"Grid item\"</DynamicCard>
  <DynamicCard title=\"Item 3\">\"Grid item\"</DynamicCard>
</Grid>"
          />

          <h4>"Props"</h4>

          <table::propsTable>
            <thead>
              <tr>
                <th::tableHeader style={getTableHeaderStyles()}>"Prop"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Type"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Default"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Description"</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td::tableCell style={getTableCellStyles()}>"columns"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"3"</td>
                <td::tableCell style={getTableCellStyles()}>"Number of columns"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"gap"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"1rem"</td>
                <td::tableCell style={getTableCellStyles()}>"Gap between items"</td>
              </tr>

              <tr>
                <td::tableCell style={getTableCellStyles()}>"minColumnWidth"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"200px"</td>
                <td::tableCell style={getTableCellStyles()}>"Minimum column width"</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      // Container Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Container"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Container"
            <span::badge style={getBadgeStyles()}>"Layout"</span>
          </h3>

          <p::componentDescription>
            "Centered container with max-width. Perfect for creating centered layouts
            with consistent padding."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Container maxWidth="800px">
              <h3>"Centered Content"</h3>

              <p>
                "This content is centered and has a maximum width of 800px.
                The container automatically centers itself and adds padding."
              </p>
            </Container>
          </div>

          <CodeHighlight
            language="mint"
            code="<Container maxWidth=\"800px\">
  <h3>\"Centered Content\"</h3>
  <p>\"Your content here\"</p>
</Container>"
          />

          <h4>"Props"</h4>

          <table::propsTable>
            <thead>
              <tr>
                <th::tableHeader style={getTableHeaderStyles()}>"Prop"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Type"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Default"</th>
                <th::tableHeader style={getTableHeaderStyles()}>"Description"</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <td::tableCell style={getTableCellStyles()}>"maxWidth"</td>
                <td::tableCell style={getTableCellStyles()}>"String"</td>
                <td::tableCell style={getTableCellStyles()}>"1200px"</td>
                <td::tableCell style={getTableCellStyles()}>"Maximum container width"</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      // Box Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Box"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Box"
            <span::badge style={getBadgeStyles()}>"Layout"</span>
          </h3>

          <p::componentDescription>
            "Generic container with padding, margin, and background customization.
            The most flexible layout primitive."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Box
              padding="2rem"
              margin="1rem"
              borderRadius="12px"
              background={ThemeHelpers.getSurface(currentTheme)}
            >
              <h4>"Box Content"</h4>

              <p>"Customizable container with full control over spacing and appearance."</p>
            </Box>
          </div>

          <CodeHighlight
            language="mint"
            code="<Box
  padding=\"2rem\"
  margin=\"1rem\"
  borderRadius=\"12px\"
  background={ThemeHelpers.getSurface(currentTheme)}
>
  <h4>\"Box Content\"</h4>
  <p>\"Content here\"</p>
</Box>"
          />
        </div>
      </div>
    </div>
  }
}
