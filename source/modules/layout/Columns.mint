/* Columns - Flexbox container for Column components */

component Columns {
  /* Properties */
  property children : Array(Html) = []
  property gap : String = "0.75rem"
  property multiline : Bool = false
  property vAlign : String = "stretch"
  property hAlign : String = "flex-start"
  property centered : Bool = false
  property direction : String = "horizontal"

  /* Get align-items value */
  fun getAlignItems : String {
    case vAlign {
      "top" => "flex-start"
      "center" => "center"
      "bottom" => "flex-end"
      "stretch" => "stretch"
      "baseline" => "baseline"
      => "stretch"
    }
  }

  /* Get justify-content value */
  fun getJustifyContent : String {
    if centered {
      "center"
    } else {
      case hAlign {
        "left" => "flex-start"
        "center" => "center"
        "right" => "flex-end"
        "space-between" => "space-between"
        "space-around" => "space-around"
        "space-evenly" => "space-evenly"
        => "flex-start"
      }
    }
  }

  /* Get flex-direction value */
  fun getFlexDirection : String {
    case direction {
      "vertical" => "column"
      "horizontal" => "row"
      => "row"
    }
  }

  /* Styles */
  style columns {
    display: flex;
    flex-direction: #{getFlexDirection()};
    flex-wrap: #{if multiline { "wrap" } else { "nowrap" }};
    gap: #{gap};
    align-items: #{getAlignItems()};
    justify-content: #{getJustifyContent()};
    width: 100%;
    box-sizing: border-box;
  }

  fun render : Html {
    <div::columns>
      for child of children {
        child
      }
    </div>
  }
}
