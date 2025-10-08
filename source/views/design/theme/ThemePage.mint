component ThemePage {
  style container {
    width: 100%;
    padding: 20px;
  }

  style header {
    margin-bottom: 32px;
  }

  style title {
    font-size: 32px;
    font-weight: 600;
    margin: 0 0 12px;
    color: var(--heading-color, #1a1a1a);
    transition: color 0.3s ease;
  }

  style subtitle {
    font-size: 16px;
    color: var(--text-color, #666);
    margin: 0;
    line-height: 1.6;
    transition: color 0.3s ease;
  }

  fun render : Html {
    <div::container>
      <div::header>
        <Heading level="1" margin="0 0 24px">"Theme Customizer"</Heading>

        <Text size="lg" margin="0 0 40px">
          "Customize your application theme with colors, radius, and presets. "
          "Changes apply in real-time to preview your theme."
        </Text>
      </div>

      <ThemeCustomizer/>
    </div>
  }
}
