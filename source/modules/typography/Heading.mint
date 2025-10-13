/* Heading - Typography component for headings */
component Heading {
  /* Properties */
  property children : Array(Html) = []

  property level : String = "1"
  property color : String = ""
  property weight : String = "600"
  property align : String = "left"
  property margin : String = "0 0 16px 0"
  property fontFamily : String = ""

  /* Get font size based on level */
  fun getFontSize : String {
    case level {
      "1" => "34px"
      "2" => "28px"
      "3" => "24px"
      "4" => "20px"
      "5" => "18px"
      "6" => "16px"
      => "34px"
    }
  }

  /* Get line height based on level */
  fun getLineHeight : String {
    case level {
      "1" => "1.3"
      "2" => "1.35"
      "3" => "1.4"
      "4" => "1.5"
      "5" => "1.5"
      "6" => "1.5"
      => "1.3"
    }
  }

  /* Get color */
  fun getColor : String {
    if String.isEmpty(color) {
      "var(--heading-color)"
    } else {
      color
    }
  }

  /* Get font family */
  fun getFontFamily : String {
    if String.isEmpty(fontFamily) {
      "var(--font-heading)"
    } else {
      fontFamily
    }
  }

  /* Styles */
  style heading {
    /* Level-based sizes and line heights */
    &.level-1 {
      font-size: 34px;
      line-height: 1.3;
    }

    &.level-2 {
      font-size: 28px;
      line-height: 1.35;
    }

    &.level-3 {
      font-size: 24px;
      line-height: 1.4;
    }

    &.level-4 {
      font-size: 20px;
      line-height: 1.5;
    }

    &.level-5 {
      font-size: 18px;
      line-height: 1.5;
    }

    &.level-6 {
      font-size: 16px;
      line-height: 1.5;
    }

    /* Weight variants */
    &.weight-400 {
      font-weight: 400;
    }

    &.weight-500 {
      font-weight: 500;
    }

    &.weight-600 {
      font-weight: 600;
    }

    &.weight-700 {
      font-weight: 700;
    }

    &.weight-800 {
      font-weight: 800;
    }

    /* Align variants */
    &.align-left {
      text-align: left;
    }

    &.align-center {
      text-align: center;
    }

    &.align-right {
      text-align: right;
    }

    &.align-justify {
      text-align: justify;
    }
  }

  fun render : Html {
    let classes =
      "level-" + level + " weight-" + weight + " align-" + align

    let styles =
      (if String.isNotEmpty(color) {
        "color: " + color + ";"
      } else {
        "color: var(--heading-color);"
      }) + (if margin != "0 0 16px 0" {
        " margin: " + margin + ";"
      } else {
        ""
      }) + (if String.isNotEmpty(fontFamily) {
        " font-family: " + fontFamily + ";"
      } else {
        " font-family: var(--font-heading);"
      })

    case level {
      "1" =>
        <h1::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h1>

      "2" =>
        <h2::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h2>

      "3" =>
        <h3::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h3>

      "4" =>
        <h4::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h4>

      "5" =>
        <h5::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h5>

      "6" =>
        <h6::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h6>

      =>
        <h1::heading class={classes} style={styles}>
          for child of children {
            child
          }
        </h1>
    }
  }
}
