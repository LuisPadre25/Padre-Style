/* Box - Layout primitive with full styling control
 * Features: Padding, margin, sizing, background, borders, shadows
 */

component Box {
  /* Content */
  property children : Array(Html) = []

  /* Sizing */
  property width : String = "auto"
  property height : String = "auto"
  property minWidth : String = "auto"
  property minHeight : String = "auto"
  property maxWidth : String = "none"
  property maxHeight : String = "none"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Background */
  property background : String = "transparent"
  property bgColor : String = ""
  property bgImage : String = ""

  /* Borders */
  property border : String = "none"
  property borderRadius : String = "0"
  property borderColor : String = "transparent"
  property borderWidth : String = "0"

  /* Shadows */
  property boxShadow : String = "none"

  /* Display */
  property display : String = "block"
  property overflow : String = "visible"
  property position : String = "relative"

  /* Advanced */
  property cursor : String = "default"
  property opacity : String = "1"
  property transform : String = "none"
  property transition : String = "none"

  style box {
    box-sizing: border-box;
  }

  fun getBoxStyles : String {
    let bg =
      if String.isNotEmpty(bgColor) {
        " background-color: " + bgColor + ";"
      } else if String.isNotEmpty(bgImage) {
        " background-image: " + bgImage + ";"
      } else if String.isNotEmpty(background) {
        " background: " + background + ";"
      } else {
        ""
      }

    let borderStyles =
      if String.isNotEmpty(borderWidth) && borderWidth != "0" {
        " border: " + borderWidth + " solid " + borderColor + ";"
      } else if String.isNotEmpty(border) && border != "none" {
        " border: " + border + ";"
      } else {
        ""
      }

    "width: " + width + ";" +
    " height: " + height + ";" +
    " min-width: " + minWidth + ";" +
    " min-height: " + minHeight + ";" +
    " max-width: " + maxWidth + ";" +
    " max-height: " + maxHeight + ";" +
    " padding: " + padding + ";" +
    " margin: " + margin + ";" +
    bg +
    " border-radius: " + borderRadius + ";" +
    borderStyles +
    " box-shadow: " + boxShadow + ";" +
    " display: " + display + ";" +
    " overflow: " + overflow + ";" +
    " position: " + position + ";" +
    " cursor: " + cursor + ";" +
    " opacity: " + opacity + ";" +
    " transform: " + transform + ";" +
    " transition: " + transition + ";"
  }

  fun render : Html {
    <div::box style={getBoxStyles()}>
      for child of children {
        child
      }
    </div>
  }
}
