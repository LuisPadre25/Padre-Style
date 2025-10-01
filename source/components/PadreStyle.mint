/* Button Component */
component Button {
  property children : Array(Html) = []
  property onClick = (event : Html.Event) : Promise(Void) { Promise.never() }
  property variant : String = "primary"

  connect ThemeStore exposing { currentTheme }

  style button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-family: inherit;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform: translateY(0px);

    &:hover {
      transform: translateY(-3px);
    }

    &:active {
      transform: translateY(0px) scale(0.98);
      transition: all 0.1s ease;
    }

    &:focus {
      outline: 2px solid rgba(102, 126, 234, 0.6);
      outline-offset: 2px;
    }
  }

  fun getButtonStyles : String {
    case variant {
      "secondary" =>
        "
          background: #{ThemeHelpers.getGlassBg(currentTheme)};
          color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "

      "success" =>
        "
          background: #{ThemeHelpers.getSuccess(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "

      _ =>
        "
          background: #{ThemeHelpers.getAccent(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        "
    }
  }

  fun render : Html {
    <button::button style={getButtonStyles()} onClick={onClick}>
      for child of children {
        child
      }
    </button>
  }
}

/* Card Component */
component Card {
  property children : Array(Html) = []
  property padding : String = "2rem"
  property title : String = ""

  connect ThemeStore exposing { currentTheme }

  style card {
    border-radius: 12px;
    padding: #{padding};
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform: translateY(0px) scale(1);
    backdrop-filter: blur(10px);
    overflow: hidden;
    box-sizing: border-box;
    width: 100%;
    min-width: 0;

    &:hover {
      transform: translateY(-6px) scale(1.02);
    }

    > * {
      max-width: 100%;
      box-sizing: border-box;
    }
  }

  fun getCardStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun render : Html {
    <div::card style={getCardStyles()}>
      {
        if !String.isEmpty(title) {
          <h3
            style="
            margin: 0 0 1rem 0;
            font-size: 1.25rem;
            font-weight: 600;
            color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          "
          >title</h3>
        } else {
          <div/>
        }
      }

      for child of children {
        child
      }
    </div>
  }
}

/* Grid Component - Responsive by default */
component Grid {
  property children : Array(Html) = []
  property columns : Number = 3
  property rows : String = "auto"
  property gap : String = "1rem"
  property columnGap : String = ""
  property rowGap : String = ""
  property autoFit : Bool = false
  property minColumnWidth : String = "200px"
  property responsive : Bool = true

  connect ThemeStore exposing { currentTheme }

  style grid {
    display: grid;
    gap: #{gap};
    width: 100%;
  }

  fun getGridStyles : String {
    let cols =
      if autoFit {
        "grid-template-columns: repeat(auto-fit, minmax(#{minColumnWidth}, 1fr));"
      } else if responsive {
        // Responsive grid with media queries
        "
          grid-template-columns: repeat(#{Number.toString(columns)}, 1fr);

          @media (max-width: 768px) {
            grid-template-columns: repeat(#{if columns > 2 {
          "2"
        } else {
          Number.toString(columns)
        }}, 1fr);
          }

          @media (max-width: 480px) {
            grid-template-columns: 1fr;
          }
        "
      } else {
        "grid-template-columns: repeat(#{Number.toString(columns)}, 1fr);"
      }

    let colGap =
      if String.isEmpty(columnGap) {
        ""
      } else {
        "column-gap: #{columnGap};"
      }

    let rGap =
      if String.isEmpty(rowGap) {
        ""
      } else {
        "row-gap: #{rowGap};"
      }

    "#{cols} grid-template-rows: #{rows}; #{colGap} #{rGap}"
  }

  fun render : Html {
    <div::grid style={getGridStyles()}>
      for child of children {
        child
      }
    </div>
  }
}

/* Container Component */
component Container {
  property children : Array(Html) = []
  property maxWidth : String = "1200px"

  connect ThemeStore exposing { currentTheme }

  style container {
    max-width: #{maxWidth};
    margin: 0 auto;
    padding: 1rem;
    width: 100%;
    box-sizing: border-box;
  }

  fun render : Html {
    <div::container>
      for child of children {
        child
      }
    </div>
  }
}

/* Badge Component */
component Badge {
  property children : Array(Html) = []
  property variant : String = "default"

  connect ThemeStore exposing { currentTheme }

  style badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.35rem 0.75rem;
    font-size: 0.875rem;
    font-weight: 600;
    border-radius: 9999px;
    backdrop-filter: blur(10px);
  }

  fun getBadgeStyles : String {
    case variant {
      "primary" =>
        "
          background: #{ThemeHelpers.getAccent(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderAccent(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
        "

      "success" =>
        "
          background: #{ThemeHelpers.getSuccess(currentTheme)};
          color: #{ThemeHelpers.getTextInverse(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
        "

      _ =>
        "
          background: #{ThemeHelpers.getSurface(currentTheme)};
          color: #{ThemeHelpers.getTextPrimary(currentTheme)};
          border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
        "
    }
  }

  fun render : Html {
    <span::badge style={getBadgeStyles()}>
      for child of children {
        child
      }
    </span>
  }
}
