// This is the component which gets rendered on the screen
component Main {
  connect ThemeStore exposing { currentTheme }

  // Styles for the root element.
  style root {
    box-sizing: border-box;
    min-height: 100vh;
    width: 100vw;
    font-family: Noto Sans, sans;
    transition: all 0.3s ease;
    overflow-x: hidden;

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

  style themeToggleContainer {
    position: fixed;
    top: 1rem;
    right: 1rem;
    z-index: 10000;
  }

  // Renders the component.
  fun render : Html {
    <DynamicThemeProvider>
      <div::root
        style="
          background: #{ThemeHelpers.getBackground(currentTheme)};
          color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        "
      >
        <div::themeToggleContainer>
          <DynamicThemeToggle/>
        </div>

        <DocsPage/>
      </div>
    </DynamicThemeProvider>
  }
}
