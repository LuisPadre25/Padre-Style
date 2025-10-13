/* Text - Typography component for body text */
component Text {
  /* Properties */
  property children : Array(Html) = []

  property size : String = "base"
  property color : String = ""
  property weight : String = "400"
  property align : String = "left"
  property lineHeight : String = "1.6"
  property margin : String = "0"
  property fontFamily : String = ""

  /* Get font size */
  fun getFontSize : String {
    case size {
      "xs" => "12px"
      "sm" => "14px"
      "base" => "16px"
      "lg" => "18px"
      "xl" => "20px"
      => "16px"
    }
  }

  /* Get color */
  fun getColor : String {
    if String.isEmpty(color) {
      "var(--text-color)"
    } else {
      color
    }
  }

  /* Get font family */
  fun getFontFamily : String {
    if String.isEmpty(fontFamily) {
      "var(--font-body)"
    } else {
      fontFamily
    }
  }

  /* Styles */
  style text {
    /* Size variants */
    &.size-xs {
      font-size: 12px;
    }

    &.size-sm {
      font-size: 14px;
    }

    &.size-base {
      font-size: 16px;
    }

    &.size-lg {
      font-size: 18px;
    }

    &.size-xl {
      font-size: 20px;
    }

    /* Weight variants */
    &.weight-300 {
      font-weight: 300;
    }

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
    <p::text
      class={"size-" + size + " weight-" + weight + " align-" + align}
      style={
        (if String.isNotEmpty(color) {
          "color: " + color + ";"
        } else {
          "color: var(--text-color);"
        }) + (if lineHeight != "1.6" {
          " line-height: " + lineHeight + ";"
        } else {
          ""
        }) + (if margin != "0" {
          " margin: " + margin + ";"
        } else {
          ""
        }) + (if String.isNotEmpty(fontFamily) {
          " font-family: " + fontFamily + ";"
        } else {
          " font-family: var(--font-body);"
        })
      }
    >
      for child of children {
        child
      }
    </p>
  }
}
