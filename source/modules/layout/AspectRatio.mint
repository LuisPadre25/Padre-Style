/* AspectRatio - Maintains aspect ratio
 * Features: 16:9, 4:3, 1:1, or custom ratios
 */

component AspectRatio {
  /* Content */
  property children : Array(Html) = []

  /* Aspect ratio as width/height (e.g., 16/9 = 1.777) */
  property ratio : Number = 1

  /* Sizing */
  property width : String = "100%"
  property maxWidth : String = "none"

  /* Styling */
  property background : String = "transparent"
  property borderRadius : String = "0"

  style aspectRatio {
    position: relative;
    width: #{width};
    max-width: #{maxWidth};
    background: #{background};
    border-radius: #{borderRadius};
    overflow: hidden;

    &::before {
      content: "";
      display: block;
      padding-bottom: #{Number.toString(100 / ratio)}%;
    }
  }

  style content {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
  }

  fun render : Html {
    <div::aspectRatio>
      <div::content>
        for child of children {
          child
        }
      </div>
    </div>
  }
}
