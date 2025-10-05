component Avatar {
  property src : String = ""
  property alt : String = "avatar"
  property text : String = ""
  property icon : String = ""

  property size : String = "md"
  property customSize : String = ""
  property shape : String = "circle"
  property color : String = ""
  property bgColor : String = "#1989fa"
  property textColor : String = "#fff"

  property border : Bool = false
  property borderColor : String = "#fff"
  property borderWidth : String = "2px"
  property ring : Bool = false
  property ringColor : String = "#1989fa"
  property ringWidth : String = "2px"

  property badge : String = ""
  property badgePosition : String = "topRight"
  property badgeVariant : String = "error"

  property showStatus : Bool = false
  property status : String = "online"

  property fit : String = "cover"
  property lazy : Bool = false
  property draggable : Bool = false

  property animated : Bool = false
  property animation : String = "scaleIn"
  property animationDuration : Number = 0.4
  property animationEasing : String = "ease-out"
  property animationDelay : Number = 0

  property onClick : Function(AvatarClickEvent, Promise(Void)) = (event : AvatarClickEvent) : Promise(Void) { Promise.never() }
  property onError : Function(AvatarErrorEvent, Promise(Void)) = (event : AvatarErrorEvent) : Promise(Void) { Promise.never() }

  state imageLoaded : Bool = false
  state imageError : Bool = false
  state displayInitials : String = ""

  fun componentDidMount : Promise(Void) {
    next { displayInitials: getInitials(text, alt) }
  }

  fun getInitials (text : String, alt : String) : String {
    ""
  }

  fun handleImageLoad (event : Html.Event) : Promise(Void) {
    next { imageLoaded: true, imageError: false }
  }

  fun handleImageError (event : Html.Event) : Promise(Void) {
    next { imageError: true, imageLoaded: false }
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    onClick({
      alt: alt,
      src: src
    })
  }

  fun getSizeValue : String {
    if (String.isEmpty(customSize)) {
      case (size) {
        "xs" => "24px"
        "sm" => "32px"
        "md" => "40px"
        "lg" => "48px"
        "xl" => "64px"
        "xxl" => "80px"
        "xxxl" => "96px"
        => "40px"
      }
    } else {
      customSize
    }
  }

  fun getFontSize : String {
    if (String.isEmpty(customSize)) {
      case (size) {
        "xs" => "10px"
        "sm" => "13px"
        "md" => "16px"
        "lg" => "19px"
        "xl" => "26px"
        "xxl" => "32px"
        "xxxl" => "38px"
        => "16px"
      }
    } else {
      customSize
    }
  }

  fun getBorderRadius : String {
    case (shape) {
      "circle" => "50%"
      "rounded" => "8px"
      => "0"
    }
  }

  fun getBackgroundColor : String {
    if (String.isEmpty(color)) {
      bgColor
    } else {
      color
    }
  }

  fun shouldShowImage : Bool {
    !String.isEmpty(src) && !imageError
  }

  fun shouldShowInitials : Bool {
    !shouldShowImage() && String.isEmpty(icon) && !String.isEmpty(displayInitials)
  }

  fun shouldShowIcon : Bool {
    !shouldShowImage() && !String.isEmpty(icon)
  }

  fun shouldShowPlaceholder : Bool {
    !shouldShowImage() && String.isEmpty(icon) && String.isEmpty(displayInitials)
  }

  fun getStatusColor : String {
    case (status) {
      "online" => "#10b981"
      "offline" => "#6b7280"
      "away" => "#f59e0b"
      "busy" => "#ef4444"
      => "#10b981"
    }
  }

  fun getStatusSize : String {
    case (size) {
      "xs" => "8px"
      "sm" => "10px"
      "md" => "12px"
      "lg" => "14px"
      "xl" => "18px"
      "xxl" => "22px"
      "xxxl" => "26px"
      => "12px"
    }
  }

  fun getBadgeCount : Number {
    case Number.fromString(badge) {
      Just(num) => num
      Nothing => 0
    }
  }

  fun shouldShowBadge : Bool {
    !String.isEmpty(badge)
  }


  style container {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    overflow: hidden;
    user-select: none;
    vertical-align: middle;

    width: #{getSizeValue()};
    height: #{getSizeValue()};
    min-width: #{getSizeValue()};
    min-height: #{getSizeValue()};

    border-radius: #{getBorderRadius()};

    background-color: #{getBackgroundColor()};
    color: #{textColor};

    if border {
      border: #{borderWidth} solid #{borderColor};
    }

    if ring {
      box-shadow: 0 0 0 #{ringWidth} #{ringColor};
    }

    cursor: pointer;

    transition: all 0.3s ease;

    &:hover {
      transform: scale(1.05);
    }

    &:active {
      transform: scale(0.95);
    }

    @media (max-width: 640px) {
      min-width: max(#{getSizeValue()}, 44px);
      min-height: max(#{getSizeValue()}, 44px);
    }

    @media (min-width: 641px) and (max-width: 1024px) {
      transform-origin: center;
    }

    @media (min-width: 1025px) {
      &:hover {
        transform: scale(1.08);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      }
    }
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: #{fit};
    border-radius: #{getBorderRadius()};

    if !draggable {
      pointer-events: none;
      -webkit-user-drag: none;
    }
  }

  style initials {
    font-size: #{getFontSize()};
    font-weight: 600;
    line-height: 1;
    text-transform: uppercase;
    letter-spacing: 0.5px;

    user-select: none;
    -webkit-user-select: none;

    display: flex;
    align-items: center;
    justify-content: center;
  }

  style icon {
    font-size: #{getFontSize()};
    display: flex;
    align-items: center;
    justify-content: center;

    user-select: none;
  }

  style statusIndicator {
    position: absolute;
    bottom: 2%;
    right: 2%;
    width: #{getStatusSize()};
    height: #{getStatusSize()};
    background: #{getStatusColor()};
    border-radius: 50%;
    border: 2.5px solid #fff;
    box-sizing: border-box;
    z-index: 10;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  style placeholder {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    color: rgba(255, 255, 255, 0.7);
  }

  style placeholderSvg {
    width: 60%;
    height: 60%;
  }

  fun renderAvatarContent : Html {
    <div::container onClick={handleClick}>
      if shouldShowImage() {
        <img::image
          src={src}
          alt={alt}
          loading={
            if lazy {
              "lazy"
            } else {
              "eager"
            }
          }
          draggable={
            if draggable {
              "true"
            } else {
              "false"
            }
          }
          onLoad={handleImageLoad}
          onError={handleImageError}/>
      }

      if shouldShowInitials() {
        <div::initials>
          {displayInitials}
        </div>
      }

      if shouldShowIcon() {
        <div::icon>
          {icon}
        </div>
      }

      if shouldShowPlaceholder() {
        <div::placeholder>
          <svg::placeholderSvg
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round">

            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
            <circle cx="12" cy="7" r="4"/>
          </svg>
        </div>
      }

      if showStatus {
        <div::statusIndicator/>
      }
    </div>
  }

  fun renderAvatar : Html {
    if shouldShowBadge() {
      <Badge count={getBadgeCount()} position={badgePosition} variant={badgeVariant}>
        {renderAvatarContent()}
      </Badge>
    } else {
      renderAvatarContent()
    }
  }

  fun render : Html {
    if animated {
      <EnterExit
        animation={animation}
        duration={animationDuration}
        easing={animationEasing}
        delay={animationDelay}
        content={renderAvatar()}/>
    } else {
      renderAvatar()
    }
  }
}
