/* GridItem - Grid child with placement control
 * Features: Column/row span, placement, alignment
 */

component GridItem {
  /* Content */
  property children : Array(Html) = []

  /* Grid placement */
  property colSpan : String = "auto"  // e.g., "2" or "span 2"
  property rowSpan : String = "auto"  // e.g., "2" or "span 2"
  property colStart : String = "auto"
  property colEnd : String = "auto"
  property rowStart : String = "auto"
  property rowEnd : String = "auto"
  property area : String = ""  // grid-area name

  /* Alignment */
  property alignSelf : String = "auto"
  property justifySelf : String = "auto"

  /* Sizing */
  property width : String = "auto"
  property height : String = "auto"
  property minWidth : String = "auto"
  property minHeight : String = "auto"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  style item {
    box-sizing: border-box;
  }

  fun getGridStyles : String {
    let colStyles =
      if String.isNotEmpty(colStart) && String.isNotEmpty(colEnd) {
        "grid-column: " + colStart + " / " + colEnd + ";"
      } else if String.isNotEmpty(colSpan) && colSpan != "auto" {
        if String.contains(colSpan, "span") {
          "grid-column: " + colSpan + ";"
        } else {
          "grid-column: span " + colSpan + ";"
        }
      } else {
        ""
      }

    let rowStyles =
      if String.isNotEmpty(rowStart) && String.isNotEmpty(rowEnd) {
        " grid-row: " + rowStart + " / " + rowEnd + ";"
      } else if String.isNotEmpty(rowSpan) && rowSpan != "auto" {
        if String.contains(rowSpan, "span") {
          " grid-row: " + rowSpan + ";"
        } else {
          " grid-row: span " + rowSpan + ";"
        }
      } else {
        ""
      }

    let areaStyle =
      if String.isNotEmpty(area) {
        " grid-area: " + area + ";"
      } else {
        ""
      }

    let alignStyles =
      " align-self: " + alignSelf + ";" +
      " justify-self: " + justifySelf + ";"

    let sizeStyles =
      " width: " + width + ";" +
      " height: " + height + ";" +
      " min-width: " + minWidth + ";" +
      " min-height: " + minHeight + ";"

    let spacingStyles =
      " padding: " + padding + ";" +
      " margin: " + margin + ";"

    let styleProps =
      " background: " + background + ";" +
      " border-radius: " + borderRadius + ";"

    colStyles + rowStyles + areaStyle + alignStyles + sizeStyles + spacingStyles + styleProps
  }

  fun render : Html {
    <div::item style={getGridStyles()}>
      for child of children {
        child
      }
    </div>
  }
}
