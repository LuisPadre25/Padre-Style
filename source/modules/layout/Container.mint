/* Container - Responsive container with max-width
 * Features: Centered container with responsive breakpoints
 */

component Container {
  /* Content */
  property children : Array(Html) = []

  /* Size variants */
  property size : String = "lg"  // sm, md, lg, xl, full
  property fluid : Bool = false

  /* Centering */
  property centerContent : Bool = false

  /* Spacing */
  property padding : String = "0 1rem"
  property margin : String = "0 auto"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  fun getMaxWidth : String {
    if fluid {
      "100%"
    } else {
      case size {
        "sm" => "640px"
        "md" => "768px"
        "lg" => "1024px"
        "xl" => "1280px"
        "2xl" => "1536px"
        "full" => "100%"
        => "1024px"
      }
    }
  }

  style container (centered : Bool) {
    width: 100%;
    max-width: #{getMaxWidth()};
    margin: #{margin};
    padding: #{padding};
    background: #{background};
    border-radius: #{borderRadius};
    box-sizing: border-box;

    if centered {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
  }

  fun render : Html {
    <div::container(centerContent)>
      for child of children {
        child
      }
    </div>
  }
}
