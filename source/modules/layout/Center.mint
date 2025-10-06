/* Center - Centers content perfectly
 * Features: Vertical and horizontal centering
 */

component Center {
  /* Content */
  property children : Array(Html) = []

  /* Sizing */
  property width : String = "100%"
  property height : String = "auto"
  property minHeight : String = "auto"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  /* Advanced */
  property inline : Bool = false

  style center (isInline : Bool) {
    if isInline {
      display: inline-flex;
    } else {
      display: flex;
    }

    justify-content: center;
    align-items: center;
    width: #{width};
    height: #{height};
    min-height: #{minHeight};
    padding: #{padding};
    margin: #{margin};
    background: #{background};
    border-radius: #{borderRadius};
    box-sizing: border-box;
  }

  fun render : Html {
    <div::center(inline)>
      for child of children {
        child
      }
    </div>
  }
}
