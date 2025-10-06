/* Grid - CSS Grid layout component
 * Features: Powerful grid system with template columns/rows
 */

component Grid {
  /* Content */
  property children : Array(Html) = []

  /* Grid properties */
  property columns : String = "1fr"  // e.g., "1fr 1fr 1fr" or "repeat(3, 1fr)"
  property rows : String = "auto"  // e.g., "auto" or "100px 200px"
  property gap : String = "1rem"
  property columnGap : String = ""
  property rowGap : String = ""

  /* Sizing */
  property width : String = "100%"
  property height : String = "auto"
  property minHeight : String = "auto"
  property maxWidth : String = "none"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  /* Alignment */
  property alignItems : String = "stretch"
  property justifyItems : String = "stretch"
  property alignContent : String = "stretch"
  property justifyContent : String = "stretch"

  /* Advanced */
  property autoFlow : String = "row"  // row, column, dense, row dense, column dense
  property autoColumns : String = "auto"
  property autoRows : String = "auto"

  style grid {
    display: grid;
    grid-template-columns: #{columns};
    grid-template-rows: #{rows};
    grid-auto-flow: #{autoFlow};
    grid-auto-columns: #{autoColumns};
    grid-auto-rows: #{autoRows};
    align-items: #{alignItems};
    justify-items: #{justifyItems};
    align-content: #{alignContent};
    justify-content: #{justifyContent};
    width: #{width};
    height: #{height};
    min-height: #{minHeight};
    max-width: #{maxWidth};
    padding: #{padding};
    margin: #{margin};
    background: #{background};
    border-radius: #{borderRadius};
    box-sizing: border-box;
  }

  fun getGapStyles : String {
    if String.isNotEmpty(columnGap) || String.isNotEmpty(rowGap) {
      let cGap =
        if String.isEmpty(columnGap) {
          gap
        } else {
          columnGap
        }

      let rGap =
        if String.isEmpty(rowGap) {
          gap
        } else {
          rowGap
        }

      "column-gap: " + cGap + "; row-gap: " + rGap + ";"
    } else {
      "gap: " + gap + ";"
    }
  }

  fun render : Html {
    <div::grid style={getGapStyles()}>
      for child of children {
        child
      }
    </div>
  }
}
