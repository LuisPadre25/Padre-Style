/* Transition Components - Advanced transitions and gestures */

/* Stagger Component - For sequenced animations */
component Stagger {
  property children : Array(Html) = []
  property staggerDelay : Number = 0.1
  property initial : String = "hidden"
  property animate : String = "visible"

  state itemsAnimated : Number = 0

  style staggerContainer {
    display: contents;
  }

  fun componentDidMount : Promise(Void) {
    next { itemsAnimated: Array.size(children) }
  }

  fun animateItems (index : Number) : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    <div::staggerContainer>
      {
        let indexedChildren =
          Array.mapWithIndex(children,
            (child : Html, index : Number) : Html {
              <Motion
                initial={initial}
                animate={
                  if index < itemsAnimated {
                    animate
                  } else {
                    initial
                  }
                }
                delay="0s"
                duration="0.5s"
              >child</Motion>
            })

        for child of indexedChildren {
          child
        }
      }
    </div>
  }
}

/* Page Transition Component */
component PageTransition {
  property children : Array(Html) = []
  property isVisible : Bool = true
  property transition : String = "fade"
  property duration : String = "0.5s"

  style pageContainer {
    width: 100%;
    height: 100%;
  }

  fun render : Html {
    <div::pageContainer>
      <Motion
        initial="hidden"
        animate={
          if isVisible {
            "visible"
          } else {
            "hidden"
          }
        }
        duration={duration}
      >
        for child of children {
          child
        }
      </Motion>
    </div>
  }
}

/* Parallax Component */
component Parallax {
  property children : Array(Html) = []
  property offset : Number = 50
  property speed : Number = 0.5

  state scrollY : Number = 0

  style parallax {
    transform: translateY(#{scrollY * speed}px);
    will-change: transform;
  }

  fun render : Html {
    <div::parallax>
      for child of children {
        child
      }
    </div>
  }
}

/* Draggable Component */
component Draggable {
  property children : Array(Html) = []
  property dragConstraints : String = "none"

  property onDragStart = (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  property onDragEnd = (event : Html.Event) : Promise(Void) { Promise.never() }

  state isDragging : Bool = false
  state dragX : Number = 0
  state dragY : Number = 0

  style draggable {
    cursor: #{if isDragging {
      "grabbing"
    } else {
      "grab"
    }};

    transform: translate(#{dragX}px, #{dragY}px);

    transition: #{if isDragging {
      "none"
    } else {
      "transform 0.3s ease"
    }};

    user-select: none;
  }

  fun handleMouseDown (event : Html.Event) : Promise(Void) {
    next { isDragging: true }
    onDragStart(event)
  }

  fun handleMouseUp (event : Html.Event) : Promise(Void) {
    next { isDragging: false }
    onDragEnd(event)
  }

  fun render : Html {
    <div::draggable onMouseDown={handleMouseDown} onMouseUp={handleMouseUp}>
      for child of children {
        child
      }
    </div>
  }
}

/* Reveal Component - Animate when in view */
component Reveal {
  property children : Array(Html) = []
  property threshold : Number = 0.1
  property animation : String = "slideUp"
  property duration : String = "0.6s"
  property delay : String = "0s"

  state isInView : Bool = false

  style reveal {
    opacity: #{if isInView {
      "1"
    } else {
      "0"
    }};

    transition: opacity #{duration}ease #{delay};
  }

  fun componentDidMount : Promise(Void) {
    next { isInView: true }
  }

  fun render : Html {
    <div::reveal>
      <Motion
        initial="hidden"
        animate={
          if isInView {
            animation
          } else {
            "hidden"
          }
        }
        duration={duration}
        delay={delay}
      >
        for child of children {
          child
        }
      </Motion>
    </div>
  }
}

/* Morphing Component */
component Morph {
  property children : Array(Html) = []
  property morphState : String = "initial"
  property duration : String = "0.8s"

  style morph {
    transition: all #{duration}cubic-bezier(0.4, 0, 0.2, 1);
  }

  style initial {
    border-radius: 6px;
    transform: scale(1);
  }

  style morphed {
    border-radius: 50%;
    transform: scale(1.2) rotate(45deg);
  }

  fun getMorphClass : String {
    case morphState {
      "morphed" => "morphed"
      _ => "initial"
    }
  }

  fun render : Html {
    <div::morph class={getMorphClass()}>
      for child of children {
        child
      }
    </div>
  }
}
