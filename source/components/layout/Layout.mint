/* Advanced Layout Components */

/* Flex Component - Modern flexbox layout */
component Flex {
  property children : Array(Html) = []
  property direction : String = "row"
  property justify : String = "flex-start"
  property align : String = "stretch"
  property wrap : String = "nowrap"
  property gap : String = "1rem"

  style flex {
    display: flex;
    flex-direction: #{direction};
    justify-content: #{justify};
    align-items: #{align};
    flex-wrap: #{wrap};
    gap: #{gap};
    width: 100%;
  }

  fun render : Html {
    <div::flex>
      for child of children {
        child
      }
    </div>
  }
}

/* FlexItem Component - Child item with flex properties */
component FlexItem {
  property children : Array(Html) = []
  property flex : String = "0 1 auto"
  property grow : String = ""
  property shrink : String = ""
  property basis : String = ""
  property order : String = ""
  property alignSelf : String = ""

  style item {
    box-sizing: border-box;
  }

  fun getFlexStyles : String {
    let flexValue =
      if !String.isEmpty(grow) || !String.isEmpty(shrink) || !String.isEmpty(
        basis) {
        let g =
          if String.isEmpty(grow) {
            "0"
          } else {
            grow
          }

        let s =
          if String.isEmpty(shrink) {
            "1"
          } else {
            shrink
          }

        let b =
          if String.isEmpty(basis) {
            "auto"
          } else {
            basis
          }

        "flex: #{g} #{s} #{b};"
      } else {
        "flex: #{flex};"
      }

    let orderStyle =
      if String.isEmpty(order) {
        ""
      } else {
        "order: #{order};"
      }

    let alignStyle =
      if String.isEmpty(alignSelf) {
        ""
      } else {
        "align-self: #{alignSelf};"
      }

    "#{flexValue} #{orderStyle} #{alignStyle}"
  }

  fun render : Html {
    <div::item style={getFlexStyles()}>
      for child of children {
        child
      }
    </div>
  }
}

/* Stack Component - Vertical layout with consistent spacing */
component Stack {
  property children : Array(Html) = []
  property spacing : String = "1rem"
  property align : String = "stretch"

  style stack {
    display: flex;
    flex-direction: column;
    align-items: #{align};
    gap: #{spacing};
  }

  fun render : Html {
    <div::stack>
      for child of children {
        child
      }
    </div>
  }
}

/* Center Component - Centers content perfectly */
component Center {
  property children : Array(Html) = []
  property minHeight : String = "auto"

  style center {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: #{minHeight};
  }

  fun render : Html {
    <div::center>
      for child of children {
        child
      }
    </div>
  }
}

/* FlexSpacer Component - Takes up available space */
component FlexSpacer {
  style spacer {
    flex: 1;
  }

  fun render : Html {
    <div::spacer/>
  }
}

/* Box Component - Layout primitive with padding, margin, etc */
component Box {
  property children : Array(Html) = []
  property padding : String = "0"
  property margin : String = "0"
  property background : String = "transparent"
  property borderRadius : String = "0"
  property width : String = "auto"
  property height : String = "auto"
  property maxWidth : String = "none"

  style box {
    padding: #{padding};
    margin: #{margin};
    background: #{background};
    border-radius: #{borderRadius};
    width: #{width};
    height: #{height};
    max-width: #{maxWidth};
    box-sizing: border-box;
  }

  fun render : Html {
    <div::box>
      for child of children {
        child
      }
    </div>
  }
}

/* AspectRatio Component - Maintains aspect ratio */
component AspectRatio {
  property children : Array(Html) = []
  property ratio : Number = 1

  style aspectRatio {
    position: relative;
    width: 100%;

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
