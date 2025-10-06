/* Spacer - Takes up available space in flex layouts
 * Features: Flex spacer for pushing elements apart
 */

component Spacer {
  /* Sizing - optional fixed size */
  property size : String = ""

  style spacer {
    flex: 1;
  }

  fun render : Html {
    if String.isEmpty(size) {
      <div::spacer/>
    } else {
      <div style={"width: " + size + "; height: " + size + ";"}/>
    }
  }
}
