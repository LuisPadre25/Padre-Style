/*
CircleProgress - Professional circular progress with Canvas
 * Mobile-first responsive design
*/
component CircleProgress {
  /* Properties */
  property percentage : Number = 0

  property size : String = "default"
  property customSize : Number = 0
  property strokeWidth : Number = 0
  property showValue : Bool = true
  property format : String = "percentage"
  property text : String = ""
  property label : String = ""
  property variant : String = "primary"
  property color : String = ""
  property trailColor : String = ""
  property strokeLinecap : String = "round"
  property animated : Bool = true
  property duration : Number = 0.8
  property glow : Bool = false
  property gradient : Bool = false
  property status : String = ""

  /* State for animation */
  state displayedPercentage : Number = 0

  state targetPercentage : Number = 0

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    if animated {
      next { targetPercentage: percentage }
      animateToPercentage()
    } else {
      next { displayedPercentage: percentage, targetPercentage: percentage }
    }
  }

  fun componentDidUpdate : Promise(Void) {
    if targetPercentage != percentage {
      if animated {
        next { targetPercentage: percentage }
        animateToPercentage()
      } else {
        next { displayedPercentage: percentage, targetPercentage: percentage }
      }
    } else {
      Promise.never()
    }
  }

  /* Animate percentage change */
  fun animateToPercentage : Promise(Void) {
    `
    (() => {
      const startValue = #{displayedPercentage};
      const endValue = #{targetPercentage};
      const duration = #{duration} * 1000;
      const startTime = performance.now();

      const animate = (currentTime) => {
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);

        // Easing function (ease-out cubic)
        const easeProgress = 1 - Math.pow(1 - progress, 3);

        const currentValue = startValue + (endValue - startValue) * easeProgress;

        #{next { displayedPercentage: `currentValue` }};

        if (progress < 1) {
          requestAnimationFrame(animate);
        }
      };

      requestAnimationFrame(animate);
    })()
    `
  }

  /* Get size */
  fun getSize : Number {
    if customSize > 0 {
      customSize
    } else {
      case size {
        "small" => 100
        "large" => 180
        => 140
      }
    }
  }

  /* Get stroke */
  fun getStroke : Number {
    if strokeWidth > 0 {
      strokeWidth
    } else {
      case size {
        "small" => 6
        "large" => 10
        => 8
      }
    }
  }

  /* Get color */
  fun getColor : String {
    if String.isNotEmpty(color) {
      color
    } else {
      case variant {
        "success" => "#52c41a"
        "warning" => "#faad14"
        "error" => "#ff4d4f"
        "info" => "#1890ff"
        => "#1890ff"
      }
    }
  }

  /* Get trail */
  fun getTrail : String {
    if String.isNotEmpty(trailColor) {
      trailColor
    } else {
      "#f0f0f0"
    }
  }

  /* Get text */
  fun getText : String {
    if format == "custom" && String.isNotEmpty(text) {
      text
    } else if format == "fraction" {
      Number.toString(Math.round(displayedPercentage)) + "/100"
    } else {
      Number.toString(Math.round(displayedPercentage)) + "%"
    }
  }

  /* Get icon */
  fun getIcon : String {
    case status {
      "success" => "✓"
      "error" => "✕"
      "warning" => "!"
      => ""
    }
  }

  /* Generate canvas */
  get canvasUrl : String {
    `
    (() => {
      try {
        const size = #{getSize()};
        const stroke = #{getStroke()};
        const percentage = Math.min(100, Math.max(0, #{displayedPercentage}));
        const progressColor = #{getColor()};
        const trailColor = #{getTrail()};

        const canvas = document.createElement('canvas');
        canvas.width = size;
        canvas.height = size;
        const ctx = canvas.getContext('2d');

        const centerX = size / 2;
        const centerY = size / 2;
        const radius = (size - stroke) / 2;
        const startAngle = -Math.PI / 2;
        const endAngle = startAngle + (2 * Math.PI * (percentage / 100));

        // Background circle
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
        ctx.strokeStyle = trailColor;
        ctx.lineWidth = stroke;
        ctx.stroke();

        // Progress arc
        ctx.beginPath();
        ctx.arc(centerX, centerY, radius, startAngle, endAngle);
        ctx.strokeStyle = progressColor;
        ctx.lineWidth = stroke;
        ctx.lineCap = #{strokeLinecap};
        ctx.stroke();

        return canvas.toDataURL();
      } catch (e) {
        console.error('CircleProgress error:', e);
        return '';
      }
    })()
    `
  }

  /* Styles */
  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
  }

  style imageWrapper {
    position: relative;
    display: inline-block;

    if glow {
      filter: drop-shadow(0 0 8px #{getColor()}40);
    }
  }

  style image {
    display: block;
    width: 80px;
    height: 80px;

    @media (min-width: 768px) {
      width: #{if size == "small" {
        "100px"
      } else if size == "large" {
        "180px"
      } else {
        "140px"
      }};

      height: #{if size == "small" {
        "100px"
      } else if size == "large" {
        "180px"
      } else {
        "140px"
      }};
    }

    if size == "small" {
      width: 80px;
      height: 80px;
    } else if size == "large" {
      width: 160px;
      height: 160px;
    } else {
      width: 120px;
      height: 120px;
    }
  }

  style overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    pointer-events: none;
  }

  style valueText {
    font-size: 16px;
    font-weight: 600;
    color: #323233;

    @media (min-width: 768px) {
      font-size: 20px;
    }

    if size == "small" {
      font-size: 14px;

      @media (min-width: 768px) {
        font-size: 16px;
      }
    }

    else if size == "large" {
      font-size: 20px;

      @media (min-width: 768px) {
        font-size: 28px;
      }
    }
  }

  style icon {
    font-size: 24px;

    @media (min-width: 768px) {
      font-size: 32px;
    }

    if size == "small" {
      font-size: 20px;
    }

    else if size == "large" {
      font-size: 32px;

      @media (min-width: 768px) {
        font-size: 40px;
      }
    }
  }

  style labelText {
    font-size: 13px;
    font-weight: 500;
    color: #646566;
    text-align: center;
    max-width: 150px;

    @media (min-width: 768px) {
      font-size: 14px;
      max-width: 180px;
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <div::imageWrapper>
        <img::image src={canvasUrl} alt="Progress"/>

        <div::overlay>
          if String.isNotEmpty(getIcon()) {
            <div::icon>
              {
                getIcon()
              }
            </div>
          } else if showValue {
            <div::valueText>
              {
                getText()
              }
            </div>
          } else {
            <></>
          }
        </div>
      </div>

      if String.isNotEmpty(label) {
        <div::labelText>
          {
            label
          }
        </div>
      } else {
        <></>
      }
    </div>
  }
}
