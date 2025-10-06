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
    if String.isEmpty(text) {
      if String.isEmpty(alt) {
        ""
      } else {
        `
        (() => {
          const words = #{alt}.trim().split(/\\s+/);
          if (words.length >= 2) {
            return words[0][0] + words[1][0];
          } else if (words.length === 1 && words[0].length > 0) {
            return words[0].substring(0, 2);
          }
          return '';
        })()
        `
      }
    } else {
      `
      (() => {
        const words = #{text}.trim().split(/\\s+/);
        if (words.length >= 2) {
          return words[0][0] + words[1][0];
        } else if (words.length === 1 && words[0].length > 0) {
          return words[0].substring(0, 2);
        }
        return '';
      })()
      `
    }
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

  fun getStatusDotSize : String {
    case (size) {
      "xs" => "small"
      "sm" => "small"
      "md" => "default"
      "lg" => "large"
      "xl" => "large"
      "xxl" => "large"
      "xxxl" => "large"
      => "default"
    }
  }

  fun getStatusScale : String {
    case (size) {
      "xs" => "1"
      "sm" => "1"
      "md" => "1"
      "lg" => "1.2"
      "xl" => "1.5"
      "xxl" => "2"
      "xxxl" => "2.5"
      => "1"
    }
  }

  fun getStatusOffset : String {
    /* El status va DENTRO para todos los shapes */
    case (size) {
      "xs" => "0px"
      "sm" => "1px"
      "md" => "2px"
      "lg" => "3px"
      "xl" => "4px"
      "xxl" => "5px"
      "xxxl" => "6px"
      => "2px"
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


  style avatarWrapper {
    position: relative;
    display: inline-flex;
    /* Importante: NO overflow hidden aquí para que el status sea visible */
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

    /* Mobile: Avatares más pequeños para pantallas móviles */
    @media (max-width: 640px) {
      min-width: max(#{getSizeValue()}, 44px);
      min-height: max(#{getSizeValue()}, 44px);

      if (size == "xl" || size == "xxl" || size == "xxxl") {
        width: 48px;
        height: 48px;
        min-width: 48px;
        min-height: 48px;
      }
    }

    /* Tablet: Tamaño intermedio */
    @media (min-width: 641px) and (max-width: 1024px) {
      transform-origin: center;

      if (size == "xxl" || size == "xxxl") {
        width: 64px;
        height: 64px;
        min-width: 64px;
        min-height: 64px;
      }
    }

    /* Desktop: Tamaño completo */
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

  style statusWrapper {
    position: absolute;
    bottom: #{getStatusOffset()};
    right: #{getStatusOffset()};
    z-index: 10;

    /* Asegurar que siempre sea visible */
    display: flex;
    align-items: center;
    justify-content: center;

    /* Escalar el status para avatares grandes */
    transform: scale(#{getStatusScale()});
    /* El status crece desde el centro para todos los shapes */
    transform-origin: center;

    /* Sombra para mayor visibilidad */
    filter: drop-shadow(0 0 3px rgba(0, 0, 0, 0.3));

    /* Asegurar que esté completamente visible sobre el avatar */
    pointer-events: auto;
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
    <div::avatarWrapper>
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
      </div>

      if showStatus {
        <div::statusWrapper>
          <StatusDot status={status} size={getStatusDotSize()} bordered={true}/>
        </div>
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
