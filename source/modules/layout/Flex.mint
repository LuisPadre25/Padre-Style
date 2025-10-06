/* Flex - Modern flexbox layout component
 * Features: Full flexbox control, gap spacing, responsive options
 */

component Flex {
  /* Content */
  property children : Array(Html) = []

  /* Flexbox properties */
  property direction : String = "row"  // row, column, row-reverse, column-reverse
  property justify : String = "flex-start"  // flex-start, center, flex-end, space-between, space-around, space-evenly
  property align : String = "stretch"  // flex-start, center, flex-end, stretch, baseline
  property wrap : String = "nowrap"  // nowrap, wrap, wrap-reverse
  property gap : String = "1rem"

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

  /* Advanced */
  property inline : Bool = false

  style flex (isInline : Bool) {
    if isInline {
      display: inline-flex;
    } else {
      display: flex;
    }

    flex-direction: #{direction};
    justify-content: #{justify};
    align-items: #{align};
    flex-wrap: #{wrap};
    gap: #{gap};
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
    <div::flex(inline)>
      for child of children {
        child
      }
    </div>
  }
}
