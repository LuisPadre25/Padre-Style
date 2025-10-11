/* Flex - Smart Flexbox Layout Component */
component Flex {
  /* Core Layout - Lo básico que todos usan */
  property direction : String = "row"

  property justify : String = "flex-start"
  property align : String = "stretch"
  property gap : String = "0"
  property wrap : Bool = false
  property children : Array(Html) = []

  /* Size - Solo lo esencial */
  property flex : String = ""

  property width : String = ""
  property height : String = ""
  property padding : String = ""
  property margin : String = ""

  /* Overflow - Auto-manejo inteligente */
  property overflow : String = ""

  /* Visual - Para cards y sections */
  property background : String = ""

  property borderRadius : String = ""

  /* Styles */
  style container {
    display: flex;
    flex-direction: #{direction};
    justify-content: #{justify};
    align-items: #{align};
    gap: #{gap};

    flex-wrap: #{if wrap {
      "wrap"
    } else {
      "nowrap"
    }};

    /* Box-sizing automático - CRÍTICO */
    box-sizing: border-box;

    /* Width inteligente */
    if String.isNotEmpty(width) {
      width: #{width};
    } else {
      if String.isNotEmpty(flex) {
        width: auto;
      } else {
        width: 100%;
      }
    }

    /* Height */
    if String.isNotEmpty(height) {
      height: #{height};
    }

    /* Flex */
    if String.isNotEmpty(flex) {
      flex: #{flex};
    }

    /* Spacing */
    if String.isNotEmpty(padding) {
      padding: #{padding};
    }

    if String.isNotEmpty(margin) {
      margin: #{margin};
    }

    /* Overflow */
    if String.isNotEmpty(overflow) {
      overflow: #{overflow};
    }

    /* Visual */
    if String.isNotEmpty(background) {
      background: #{background};
    }

    if String.isNotEmpty(borderRadius) {
      border-radius: #{borderRadius};
    }
  }

  fun render : Html {
    <div::container>
      for child of children {
        child
      }
    </div>
  }
}
