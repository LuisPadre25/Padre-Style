/* FlexItem - Child item with flex properties
 * Features: Flex grow/shrink/basis, order, align-self
 */

component FlexItem {
  /* Content */
  property children : Array(Html) = []

  /* Flex properties */
  property flex : String = "0 1 auto"
  property grow : String = ""
  property shrink : String = ""
  property basis : String = ""
  property order : String = ""
  property alignSelf : String = ""  // auto, flex-start, center, flex-end, stretch, baseline

  /* Sizing */
  property width : String = "auto"
  property height : String = "auto"
  property minWidth : String = "auto"
  property maxWidth : String = "none"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  style item {
    box-sizing: border-box;
  }

  fun getFlexStyles : String {
    let flexValue =
      if !String.isEmpty(grow) || !String.isEmpty(shrink) || !String.isEmpty(basis) {
        let g =
          if String.isEmpty(grow) {
            "0"
          } else {
            grow
          }

        let s =
          if String.isEmpty(shrink) {
            "1"
          } else {
            shrink
          }

        let b =
          if String.isEmpty(basis) {
            "auto"
          } else {
            basis
          }

        "flex: " + g + " " + s + " " + b + ";"
      } else {
        "flex: " + flex + ";"
      }

    let orderStyle =
      if String.isEmpty(order) {
        ""
      } else {
        " order: " + order + ";"
      }

    let alignStyle =
      if String.isEmpty(alignSelf) {
        ""
      } else {
        " align-self: " + alignSelf + ";"
      }

    let sizeStyles =
      " width: " + width + ";" +
      " height: " + height + ";" +
      " min-width: " + minWidth + ";" +
      " max-width: " + maxWidth + ";"

    let spacingStyles =
      " padding: " + padding + ";" +
      " margin: " + margin + ";"

    let styleProps =
      " background: " + background + ";" +
      " border-radius: " + borderRadius + ";"

    flexValue + orderStyle + alignStyle + sizeStyles + spacingStyles + styleProps
  }

  fun render : Html {
    <div::item style={getFlexStyles()}>
      for child of children {
        child
      }
    </div>
  }
}
