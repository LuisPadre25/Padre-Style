/* VStack - Vertical stack (alias for Stack)
 * Features: Simplified vertical layout
 */

component VStack {
  /* Content */
  property children : Array(Html) = []

  /* Layout properties */
  property spacing : String = "1rem"
  property align : String = "stretch"  // flex-start, center, flex-end, stretch
  property justify : String = "flex-start"  // flex-start, center, flex-end, space-between, space-around

  /* Sizing */
  property width : String = "100%"
  property height : String = "auto"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  style vstack {
    display: flex;
    flex-direction: column;
    align-items: #{align};
    justify-content: #{justify};
    gap: #{spacing};
    width: #{width};
    height: #{height};
    padding: #{padding};
    margin: #{margin};
    background: #{background};
    border-radius: #{borderRadius};
    box-sizing: border-box;
  }

  fun render : Html {
    <div::vstack>
      for child of children {
        child
      }
    </div>
  }
}
