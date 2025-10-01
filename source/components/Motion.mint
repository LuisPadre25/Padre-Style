/* Motion Component - Advanced animations inspired by Framer Motion */
component Motion {
  property children : Array(Html) = []
  property initial : String = "hidden"
  property animate : String = "visible"
  property exit : String = "hidden"
  property duration : String = "0.5s"
  property delay : String = "0s"
  property easing : String = "cubic-bezier(0.4, 0, 0.2, 1)"
  property whileHover : String = ""
  property whileTap : String = ""
  property whileInView : Bool = false
  property dragConstraints : String = ""
  property scale : Number = 1
  property x : Number = 0
  property y : Number = 0
  property opacity : Number = 1
  property rotate : Number = 0

  state currentAnimation : String = initial
  state isHovered : Bool = false
  state isPressed : Bool = false
  state isVisible : Bool = false
  state hasAnimated : Bool = false

  /* Base motion styles */
  style motion {
    transition: all #{duration}#{easing}#{delay};
    transform-origin: center;
    will-change: transform, opacity;
    box-sizing: border-box;
  }

  /* Preset animations */
  style hidden {
    opacity: 0;
    transform: translateY(20px) scale(0.95);
  }

  style visible {
    opacity: 1;
    transform: translateY(0px) scale(1);
  }

  style fadeIn {
    opacity: 1;
    transform: scale(1);
  }

  style fadeOut {
    opacity: 0;
    transform: scale(0.9);
  }

  style slideUp {
    opacity: 1;
    transform: translateY(0px);
  }

  style slideDown {
    opacity: 1;
    transform: translateY(0px);
  }

  style slideLeft {
    opacity: 1;
    transform: translateX(0px);
  }

  style slideRight {
    opacity: 1;
    transform: translateX(0px);
  }

  style scaleIn {
    opacity: 1;
    transform: scale(1);
  }

  style scaleOut {
    opacity: 1;
    transform: scale(1.05);
  }

  style bounce {
    animation: bounceIn #{duration}#{easing}#{delay}forwards;
  }

  style pulse {
    animation: pulse 2s infinite;
  }

  style shake {
    animation: shake 0.5s ease-in-out;
  }

  style flip {
    animation: flip #{duration}#{easing}#{delay}forwards;
  }

  style rotate360 {
    animation: rotate360 #{duration}linear #{delay}forwards;
  }

  /* Hover states */
  style hoverScale {
    &:hover {
      transform: scale(1.05);
    }
  }

  style hoverLift {
    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    }
  }

  style hoverGlow {
    &:hover {
      box-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
    }
  }

  /* Tap states */
  style tapScale {
    &:active {
      transform: scale(0.95);
    }
  }

  style tapShrink {
    &:active {
      transform: scale(0.9);
    }
  }

  /* Advanced animations with keyframes */
  style keyframes {
    @keyframes bounceIn {
      0% {
        opacity: 0;
        transform: scale(0.3) translateY(-100px);
      }

      50% {
        opacity: 1;
        transform: scale(1.05) translateY(0px);
      }

      70% {
        transform: scale(0.9);
      }

      100% {
        opacity: 1;
        transform: scale(1);
      }
    }

    @keyframes pulse {
      0%, 100% {
        transform: scale(1);
      }

      50% {
        transform: scale(1.05);
      }
    }

    @keyframes shake {
      0%, 100% {
        transform: translateX(0);
      }

      10%, 30%, 50%, 70%, 90% {
        transform: translateX(-10px);
      }

      20%, 40%, 60%, 80% {
        transform: translateX(10px);
      }
    }

    @keyframes flip {
      0% {
        transform: perspective(400px) rotateY(0);
      }

      40% {
        transform: perspective(400px) rotateY(-15deg);
      }

      50% {
        transform: perspective(400px) rotateY(-15deg);
      }

      80% {
        transform: perspective(400px) rotateY(0);
      }

      100% {
        transform: perspective(400px) rotateY(0);
      }
    }

    @keyframes rotate360 {
      from {
        transform: rotate(0deg);
      }

      to {
        transform: rotate(360deg);
      }
    }

    @keyframes slideInFromLeft {
      from {
        opacity: 0;
        transform: translateX(-100px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    @keyframes slideInFromRight {
      from {
        opacity: 0;
        transform: translateX(100px);
      }

      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    @keyframes slideInFromTop {
      from {
        opacity: 0;
        transform: translateY(-100px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes slideInFromBottom {
      from {
        opacity: 0;
        transform: translateY(100px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  }

  /* Component lifecycle */
  fun componentDidMount : Promise(Void) {
    next { isVisible: true, currentAnimation: animate, hasAnimated: true }
  }

  /* Event handlers */
  fun handleMouseEnter (event : Html.Event) : Promise(Void) {
    next { isHovered: true }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    next { isHovered: false }
  }

  fun handleMouseDown (event : Html.Event) : Promise(Void) {
    next { isPressed: true }
  }

  fun handleMouseUp (event : Html.Event) : Promise(Void) {
    next { isPressed: false }
  }

  /* Get animation class based on state */
  fun getAnimationClass : String {
    if isPressed && !String.isEmpty(whileTap) {
      case whileTap {
        "scale" => "tapScale"
        "shrink" => "tapShrink"
        _ => ""
      }
    } else if isHovered && !String.isEmpty(whileHover) {
      case whileHover {
        "scale" => "hoverScale"
        "lift" => "hoverLift"
        "glow" => "hoverGlow"
        _ => ""
      }
    } else {
      case currentAnimation {
        "hidden" => "hidden"
        "visible" => "visible"
        "fadeIn" => "fadeIn"
        "fadeOut" => "fadeOut"
        "slideUp" => "slideUp"
        "slideDown" => "slideDown"
        "slideLeft" => "slideLeft"
        "slideRight" => "slideRight"
        "scaleIn" => "scaleIn"
        "scaleOut" => "scaleOut"
        "bounce" => "bounce"
        "pulse" => "pulse"
        "shake" => "shake"
        "flip" => "flip"
        "rotate360" => "rotate360"
        _ => "visible"
      }
    }
  }

  fun render : Html {
    if isVisible {
      <div::motion::keyframes
        class={getAnimationClass()}
        onMouseEnter={handleMouseEnter}
        onMouseLeave={handleMouseLeave}
        onMouseDown={handleMouseDown}
        onMouseUp={handleMouseUp}
        style="transform: translate(#{x}px, #{y}px) scale(#{scale}) rotate(#{rotate}deg); opacity: #{opacity};"
      >
        for child of children {
          child
        }
      </div>
    } else {
      <div/>
    }
  }
}
