/* Stack - Vertical layout with consistent spacing
 * Features: Vertical stacking with gap, alignment options
 */

component Stack {
  /* Content */
  property children : Array(Html) = []

  /* Stack properties */
  property spacing : String = "1rem"
  property align : String = "stretch"  // flex-start, center, flex-end, stretch
  property justify : String = "flex-start"  // flex-start, center, flex-end, space-between, space-around

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

  style stack {
    display: flex;
    flex-direction: column;
    align-items: #{align};
    justify-content: #{justify};
    gap: #{spacing};
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

  fun render : Html {
    <div::stack>
      for child of children {
        child
      }
    </div>
  }
}
