/* Caption - Typography component for small text and captions */

component Caption {
  /* Properties */
  property children : Array(Html) = []
  property color : String = ""
  property weight : String = "400"
  property align : String = "left"
  property margin : String = "0"
  property fontFamily : String = ""

  /* Get color - defaults to muted text */
  fun getColor : String {
    if String.isEmpty(color) {
      "var(--sidebar-text)"
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
  style caption {
    font-size: 12px;
    line-height: 1.5;
    font-weight: #{weight};
    color: #{getColor()};
    text-align: #{align};
    margin: #{margin};
    font-family: #{getFontFamily()};
  }

  fun render : Html {
    <p::caption>
      for child of children {
        child
      }
    </p>
  }
}
