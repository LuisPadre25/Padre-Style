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
    font-size: #{getFontSize()};
    line-height: #{lineHeight};
    font-weight: #{weight};
    color: #{getColor()};
    text-align: #{align};
    margin: #{margin};
    font-family: #{getFontFamily()};
  }

  fun render : Html {
    <p::text>
      for child of children {
        child
      }
    </p>
  }
}
