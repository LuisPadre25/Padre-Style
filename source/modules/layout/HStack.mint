/* HStack - Horizontal stack (shortcut for Flex with row direction)
 * Features: Simplified horizontal layout
 */

component HStack {
  /* Content */
  property children : Array(Html) = []

  /* Layout properties */
  property spacing : String = "1rem"
  property align : String = "center"  // flex-start, center, flex-end, stretch, baseline
  property justify : String = "flex-start"  // flex-start, center, flex-end, space-between, space-around, space-evenly
  property wrap : String = "nowrap"

  /* Sizing */
  property width : String = "100%"
  property height : String = "auto"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  style hstack {
    display: flex;
    flex-direction: row;
    align-items: #{align};
    justify-content: #{justify};
    flex-wrap: #{wrap};
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
    <div::hstack>
      for child of children {
        child
      }
    </div>
  }
}
