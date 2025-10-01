// This is the component which gets rendered on the screen
component Main {
  connect ThemeStore exposing { currentTheme }

  // Styles for the root element.
  style root {
    background: var(--color-primary, linear-gradient(135deg, #667eea 0%, #764ba2 100%));
    box-sizing: border-box;
    min-height: 100vh;
    padding: 100px;
    display: grid;
    width: 100vw;
    font-family: Noto Sans, sans;
    color: var(--text-primary, white);
    transition: all 0.3s ease;

    @media (max-width: 600px) {
      padding: 10px;
    }

    /* Syntax highlighting tokens - VS Code Dark+ theme */
    .token-keyword {
      color: #569cd6;
      font-weight: 600;
    }

    .token-type {
      color: #4ec9b0;
      font-weight: 600;
    }

    .token-string {
      color: #ce9178;
    }

    .token-number {
      color: #b5cea8;
    }

    .token-boolean {
      color: #569cd6;
      font-weight: 600;
    }

    .token-comment {
      color: #6a9955;
      font-style: italic;
    }

    .token-function {
      color: #dcdcaa;
    }

    .token-property {
      color: #9cdcfe;
    }

    .token-operator {
      color: #d4d4d4;
    }

    .token-punctuation {
      color: #d4d4d4;
    }

    .token-decorator {
      color: #dcdcaa;
    }

    .token-symbol {
      color: #4fc1ff;
    }

    .token-variable {
      color: #9cdcfe;
    }
  }

  // Styles for the content.
  style content {
    justify-content: center;
    flex-direction: column;
    align-items: center;
    display: flex;

    @media (max-width: 600px) {
      background: var(--surface, rgba(255, 255, 255, 0.5));
      backdrop-filter: blur(3px);

      justify-content: space-between;
      padding: 20px;
    }
  }

  // Styles for the footer.
  style footer {
    border-top: 3px double var(--border-primary, rgba(255,255,255,0.2));
    padding-top: 30px;
    margin-top: 30px;
    max-width: 72ch;
    width: 100%;
    text-align: center;
    font-size: 20px;
    color: var(--text-primary, white);

    small {
      margin-top: 5px;
      font-size: 14px;
      display: block;
      opacity: 0.8;
      color: var(--text-secondary, rgba(255, 255, 255, 0.8));
    }
  }

  fun handleThemeToggle (mode : String) : Promise(Void) {
    ThemeStore.setTheme(mode)
  }

  // Renders the component.
  fun render : Html {
    <DynamicThemeProvider>
      <div::root
        style="
          background: #{ThemeHelpers.getBackgroundPrimary(currentTheme)};
          color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        "
      >
        <DynamicThemeToggle/>

        <div::content>
          <Showcase/>

          <div::footer>
            <div>"Padre Style"</div>
            <small>"2024"</small>
          </div>
        </div>
      </div>
    </DynamicThemeProvider>
  }
}
