/* Flex - Flexbox Layout Component */

component Flex {
  /* Properties */
  property direction : String = "row"
  property justify : String = "flex-start"
  property align : String = "stretch"
  property gap : String = "0"
  property wrap : Bool = false
  property children : Array(Html) = []

  /* Styles */
  style container {
    display: flex;
    flex-direction: #{direction};
    justify-content: #{justify};
    align-items: #{align};
    gap: #{gap};
    flex-wrap: #{if wrap { "wrap" } else { "nowrap" }};
    width: 100%;
  }

  fun render : Html {
    <div::container>
      for child of children {
        child
      }
    </div>
  }
}
