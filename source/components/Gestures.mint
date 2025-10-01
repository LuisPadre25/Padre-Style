/* Advanced Gesture Components */

/* Spring Component - Physics-based animations */
component Spring {
  property children : Array(Html) = []
  property from : Number = 0
  property to : Number = 1
  property tension : Number = 120
  property friction : Number = 14
  property precision : Number = 0.01

  state currentValue : Number = 0
  state velocity : Number = 0
  state isAnimating : Bool = false

  style spring {
    transform: scale(#{currentValue});
    transition: transform 0.1s ease-out;
  }

  fun componentDidMount : Promise(Void) {
    startSpringAnimation()
  }

  fun startSpringAnimation : Promise(Void) {
    next { isAnimating: true }
    animateSpring()
  }

  fun animateSpring : Promise(Void) {
    if isAnimating {
      let force =
        -tension * (currentValue - to)

      let damping =
        -friction * velocity

      let acceleration =
        force + damping

      let newVelocity =
        velocity + acceleration * 0.016

      let newValue =
        currentValue + newVelocity * 0.016

      next { velocity: newVelocity }
      next { currentValue: newValue }

      if Math.abs(newValue - to) < precision && Math.abs(newVelocity) < precision {
        next { currentValue: to }
        next { isAnimating: false }
      } else {
        Promise.never()
      }
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div::spring>
      for child of children {
        child
      }
    </div>
  }
}

/* Magnetic Component - Attracts cursor */
component Magnetic {
  property children : Array(Html) = []
  property strength : Number = 0.3
  property distance : Number = 100

  state magnetX : Number = 0
  state magnetY : Number = 0
  state isHovered : Bool = false

  style magnetic {
    transform: translate(#{magnetX}px, #{magnetY}px);

    transition: transform #{if isHovered {
      "0.1s"
    } else {
      "0.4s"
    }}ease-out;
  }

  fun handleMouseMove (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun handleMouseEnter (event : Html.Event) : Promise(Void) {
    next { isHovered: true }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    next { isHovered: false, magnetX: 0, magnetY: 0 }
  }

  fun render : Html {
    <div::magnetic
      onMouseMove={handleMouseMove}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      for child of children {
        child
      }
    </div>
  }
}

/* Elastic Component - Bouncy interactions */
component Elastic {
  property children : Array(Html) = []
  property intensity : Number = 1.2
  property duration : String = "0.4s"

  state isActive : Bool = false

  style elastic {
    transform: scale(#{if isActive {
      intensity
    } else {
      1
    }});

    transition: transform #{duration}cubic-bezier(0.68, -0.55, 0.265, 1.55);
  }

  fun handleMouseDown (event : Html.Event) : Promise(Void) {
    next { isActive: true }
  }

  fun handleMouseUp (event : Html.Event) : Promise(Void) {
    next { isActive: false }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    next { isActive: false }
  }

  fun render : Html {
    <div::elastic
      onMouseDown={handleMouseDown}
      onMouseUp={handleMouseUp}
      onMouseLeave={handleMouseLeave}
    >
      for child of children {
        child
      }
    </div>
  }
}

/* Ripple Effect Component */
component Ripple {
  property children : Array(Html) = []
  property color : String = "rgba(255, 255, 255, 0.5)"
  property duration : Number = 600

  state ripples : Array(Number) = []

  style rippleContainer {
    position: relative;
    overflow: hidden;
    border-radius: inherit;
  }

  style rippleEffect {
    position: absolute;
    border-radius: 50%;
    background: #{color};
    pointer-events: none;
    animation: rippleAnimation #{duration}ms ease-out forwards;

    @keyframes rippleAnimation {
      0% {
        transform: scale(0);
        opacity: 1;
      }

      100% {
        transform: scale(2);
        opacity: 0;
      }
    }
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    let timestamp =
      0

    next { ripples: Array.push(ripples, timestamp) }
    Promise.never()
  }

  fun removeRipple (timestamp : Number) : Promise(Void) {
    next {
      ripples: Array.reject(ripples, (r : Number) : Bool { r == timestamp })
    }
  }

  fun render : Html {
    <div::rippleContainer onClick={handleClick}>
      for child of children {
        child
      }

      for ripple of ripples {
        <div::rippleEffect/>
      }
    </div>
  }
}

/* Tilt Component - 3D tilt effect */
component Tilt {
  property children : Array(Html) = []
  property intensity : Number = 10
  property perspective : Number = 1000

  state rotateX : Number = 0
  state rotateY : Number = 0
  state isHovered : Bool = false

  style tilt {
    transform-style: preserve-3d;
    perspective: #{perspective}px;
    transition: transform 0.2s ease-out;
    transform: rotateX(#{rotateX}deg) rotateY(#{rotateY}deg);
  }

  fun handleMouseMove (event : Html.Event) : Promise(Void) {
    if isHovered {
      next { rotateX: 0 - intensity / 2 }
      next { rotateY: intensity / 2 }
    } else {
      Promise.never()
    }
  }

  fun handleMouseEnter (event : Html.Event) : Promise(Void) {
    next { isHovered: true }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    next { isHovered: false }
    next { rotateX: 0 }
    next { rotateY: 0 }
  }

  fun render : Html {
    <div::tilt
      onMouseMove={handleMouseMove}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      for child of children {
        child
      }
    </div>
  }
}
