/* Chip - Professional tag/chip component
 * Features: Variants, Sizes, Icons, Closable, Avatars, Animations
 * Mobile-first responsive design
 */

component Chip {
  /* Properties */
  property label : String = ""
  property variant : String = "default"
  property size : String = "md"
  property closable : Bool = false
  property disabled : Bool = false
  property icon : String = ""
  property avatar : String = ""
  property clickable : Bool = false

  /* Colors */
  property color : String = ""
  property textColor : String = ""
  property borderColor : String = ""

  /* Animations */
  property animated : Bool = false
  property animation : String = "scaleIn"
  property animationDuration : Number = 0.3

  /* Events */
  property onClick : Function(ChipClickEvent, Promise(Void)) = (event : ChipClickEvent) : Promise(Void) { Promise.never() }
  property onClose : Function(ChipCloseEvent, Promise(Void)) = (event : ChipCloseEvent) : Promise(Void) { Promise.never() }

  /* Handle click */
  fun handleClick (event : Html.Event) : Promise(Void) {
    if !disabled && clickable {
      onClick({
        label: label,
        variant: variant
      })
    } else {
      Promise.never()
    }
  }

  /* Handle close */
  fun handleClose (event : Html.Event) : Promise(Void) {
    `
    (() => {
      #{event}.stopPropagation();
    })()
    `

    if !disabled {
      onClose({
        label: label,
        variant: variant
      })
    } else {
      Promise.never()
    }
  }

  /* Get size styles */
  fun getSizeStyles : String {
    let sizeStyle =
      case size {
        "sm" => "padding: 4px 8px; font-size: 12px; gap: 4px;"
        "md" => "padding: 6px 12px; font-size: 14px; gap: 6px;"
        "lg" => "padding: 8px 16px; font-size: 16px; gap: 8px;"
        => "padding: 6px 12px; font-size: 14px; gap: 6px;"
      }

    let cursorStyle =
      if clickable && !disabled {
        " cursor: pointer;"
      } else if disabled {
        " cursor: not-allowed;"
      } else {
        " cursor: default;"
      }

    sizeStyle + cursorStyle
  }

  /* Get variant colors */
  fun getVariantColors : String {
    if String.isNotEmpty(color) {
      "background: " + color + "; color: " + textColor + "; border-color: " + borderColor + ";"
    } else {
      case variant {
        "primary" => "background: #1989fa; color: #fff; border-color: #1989fa;"
        "success" => "background: #10b981; color: #fff; border-color: #10b981;"
        "warning" => "background: #f59e0b; color: #fff; border-color: #f59e0b;"
        "error" => "background: #ef4444; color: #fff; border-color: #ef4444;"
        "info" => "background: #3b82f6; color: #fff; border-color: #3b82f6;"
        "default" => "background: #f3f4f6; color: #374151; border-color: #d1d5db;"
        => "background: #f3f4f6; color: #374151; border-color: #d1d5db;"
      }
    }
  }

  /* Get avatar size */
  fun getAvatarSize : String {
    case size {
      "sm" => "16px"
      "md" => "20px"
      "lg" => "24px"
      => "20px"
    }
  }

  /* Get icon size */
  fun getIconSize : String {
    case size {
      "sm" => "14px"
      "md" => "16px"
      "lg" => "18px"
      => "16px"
    }
  }

  /* Styles */
  style chip (clickableState : Bool, disabledState : Bool) {
    display: inline-flex;
    align-items: center;
    border-radius: 9999px;
    font-weight: 500;
    user-select: none;
    border: 1px solid transparent;
    transition: all 0.2s ease;

    if clickableState && !disabledState {
      cursor: pointer;

      &:hover {
        opacity: 0.9;
        transform: translateY(-1px);
      }

      &:active {
        transform: translateY(0);
      }
    }

    if disabledState {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  style avatarImg {
    width: #{getAvatarSize()};
    height: #{getAvatarSize()};
    border-radius: 50%;
    object-fit: cover;
  }

  style iconWrapper {
    display: flex;
    align-items: center;
    font-size: #{getIconSize()};
  }

  style closeButton {
    display: flex;
    align-items: center;
    justify-content: center;
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
    color: inherit;
    opacity: 0.7;
    transition: opacity 0.2s ease;
    font-size: #{getIconSize()};

    &:hover {
      opacity: 1;
    }
  }

  /* Render */
  fun renderChipContent : Html {
    <div::chip(clickable, disabled)
      style={getSizeStyles() + getVariantColors()}
      onClick={handleClick}>

      if String.isNotEmpty(avatar) {
        <img::avatarImg src={avatar} alt={label}/>
      }

      if String.isNotEmpty(icon) {
        <div::iconWrapper>{icon}</div>
      }

      <span>{label}</span>

      if closable && !disabled {
        <button::closeButton onClick={handleClose}>
          "×"
        </button>
      }
    </div>
  }

  fun render : Html {
    if animated {
      <EnterExit
        animation={animation}
        duration={animationDuration}
        content={renderChipContent()}/>
    } else {
      renderChipContent()
    }
  }
}
