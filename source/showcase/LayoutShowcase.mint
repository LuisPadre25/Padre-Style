component LayoutShowcase {
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

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Layout Components"</h3>

      <p
        style="text-align: center; margin-bottom: 2rem; color: #{ThemeHelpers.getTextSecondary(
          currentTheme)};"
      >"Componentes Flex y Grid para crear layouts modernos y responsivos"</p>

      <div::demoGrid>
        <Card title="🎯 Flex - Horizontal Center">
          <Flex justify="center" align="center" gap="1rem">
            <Badge variant="primary">"Badge 1"</Badge>
            <Badge variant="success">"Badge 2"</Badge>
            <Badge>"Badge 3"</Badge>
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"justify='center' align='center'"</p>
        </Card>

        <Card title="📐 Flex - Space Between">
          <Flex justify="space-between" align="center" gap="0.5rem">
            <Button variant="primary">"Left"</Button>
            <Badge>"Center"</Badge>
            <Button variant="success">"Right"</Button>
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"justify='space-between'"</p>
        </Card>

        <Card title="📊 Flex - Column">
          <Flex direction="column" gap="0.75rem">
            <Button>"Item 1"</Button>
            <Button variant="secondary">"Item 2"</Button>
            <Button variant="success">"Item 3"</Button>
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"direction='column'"</p>
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

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"wrap='wrap'"</p>
        </Card>

        <Card title="📱 Grid - 2 Columns">
          <Grid columns={2} gap="1rem">
            <div
              style="padding: 1.5rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px; text-align: center; color: white;"
            >"Column 1"</div>

            <div
              style="padding: 1.5rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px; text-align: center; color: white;"
            >"Column 2"</div>
          </Grid>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"columns={2}"</p>
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

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"columns={3}"</p>
        </Card>

        <Card title="🌟 Grid - Auto Fit">
          <Grid autoFit={true} minColumnWidth="100px" gap="1rem">
            <div
              style="padding: 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 6px; text-align: center; color: white;"
            >"A"</div>

            <div
              style="padding: 1rem; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 6px; text-align: center; color: white;"
            >"B"</div>

            <div
              style="padding: 1rem; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 6px; text-align: center; color: white;"
            >"C"</div>

            <div
              style="padding: 1rem; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 6px; text-align: center; color: white;"
            >"D"</div>
          </Grid>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"autoFit={true} minColumnWidth='100px'"</p>
        </Card>

        <Card title="💎 Dashboard Layout">
          <Grid columns={2} gap="1rem" rowGap="1rem">
            <div
              style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(
                currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(
                currentTheme)}; border-radius: 8px;"
            >
              <h4
                style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(
                  currentTheme)};"
              >"Total Users"</h4>

              <p
                style="font-size: 2rem; font-weight: 700; color: #667eea; margin: 0;"
              >"1,234"</p>
            </div>

            <div
              style="padding: 1.5rem; background: #{ThemeHelpers.getElevated(
                currentTheme)}; border: 2px solid #{ThemeHelpers.getBorderPrimary(
                currentTheme)}; border-radius: 8px;"
            >
              <h4
                style="margin: 0 0 0.5rem 0; color: #{ThemeHelpers.getTextPrimary(
                  currentTheme)};"
              >"Revenue"</h4>

              <p
                style="font-size: 2rem; font-weight: 700; color: #43e97b; margin: 0;"
              >"$45K"</p>
            </div>
          </Grid>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"KPI Cards Layout"</p>
        </Card>

        <Card title="🎭 Flex - Space Around">
          <Flex justify="space-around" align="center" gap="0.5rem">
            <Badge variant="primary">"A"</Badge>
            <Badge variant="success">"B"</Badge>
            <Badge>"C"</Badge>
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"justify='space-around'"</p>
        </Card>

        <Card title="🔥 Flex - Space Evenly">
          <Flex justify="space-evenly" align="center">
            <Button variant="primary">"Start"</Button>
            <Button>"Middle"</Button>
            <Button variant="success">"End"</Button>
          </Flex>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"justify='space-evenly'"</p>
        </Card>

        <Card title="📋 Complex Layout">
          <Flex direction="column" gap="1rem">
            <Flex justify="space-between" align="center">
              <h4
                style="margin: 0; color: #{ThemeHelpers.getTextPrimary(
                  currentTheme)};"
              >"Header"</h4>

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

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"Nested Flex + Grid"</p>
        </Card>

        <Card title="🌈 Responsive Grid">
          <Grid autoFit={true} minColumnWidth="80px" gap="0.75rem">
            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border-radius: 8px;"
            />

            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); border-radius: 8px;"
            />

            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); border-radius: 8px;"
            />

            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); border-radius: 8px;"
            />

            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #fa709a 0%, #fee140 100%); border-radius: 8px;"
            />

            <div
              style="aspect-ratio: 1; background: linear-gradient(135deg, #30cfd0 0%, #330867 100%); border-radius: 8px;"
            />
          </Grid>

          <p
            style="margin-top: 1rem; font-size: 0.875rem; color: #{ThemeHelpers.getTextSecondary(
              currentTheme)}; text-align: center;"
          >"Auto-fit responsive grid"</p>
        </Card>
      </div>
    </div>
  }
}
