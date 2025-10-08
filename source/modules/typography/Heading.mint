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
    font-size: #{getFontSize()};
    line-height: #{getLineHeight()};
    font-weight: #{weight};
    color: #{getColor()};
    text-align: #{align};
    margin: #{margin};
    font-family: #{getFontFamily()};
  }

  fun render : Html {
    case level {
      "1" =>
        <h1::heading>
          for child of children {
            child
          }
        </h1>

      "2" =>
        <h2::heading>
          for child of children {
            child
          }
        </h2>

      "3" =>
        <h3::heading>
          for child of children {
            child
          }
        </h3>

      "4" =>
        <h4::heading>
          for child of children {
            child
          }
        </h4>

      "5" =>
        <h5::heading>
          for child of children {
            child
          }
        </h5>

      "6" =>
        <h6::heading>
          for child of children {
            child
          }
        </h6>

      =>
        <h1::heading>
          for child of children {
            child
          }
        </h1>
    }
  }
}
