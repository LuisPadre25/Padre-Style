/* AvatarGroup - Display a group of avatars with overlap */

component AvatarGroup {
  property avatars : Array(String) = []
  property useInitials : Bool = false
  property size : String = "md"
  property max : Number = 5
  property spacing : String = "normal"
  property shape : String = "circle"
  property bordered : Bool = true
  property ring : Bool = false
  property ringColor : String = "#1989fa"
  property ringWidth : String = "2px"
  property showStatus : Bool = false
  property status : String = "online"
  property showBadge : Bool = false
  property animated : Bool = false
  property animation : String = "scaleIn"

  fun getOverlapOffset : String {
    case (spacing) {
      "tight" => "-8px"
      "normal" => "-12px"
      "loose" => "-16px"
      => "-12px"
    }
  }

  fun getRemainingCount : String {
    let total =
      Array.size(avatars)

    let remaining =
      total - max

    "+" + Number.toString(remaining)
  }

  fun hasMoreAvatars : Bool {
    Array.size(avatars) > max
  }

  fun getVisibleAvatars : Array(String) {
    avatars
    |> Array.slice(0, max)
  }

  fun getZIndex (index : Number) : String {
    Number.toString(max - index)
  }

  style container {
    display: inline-flex;
    align-items: center;
    flex-direction: row-reverse;
  }

  style avatarWrapper {
    position: relative;
    transition: transform 0.2s ease;
    margin-left: #{getOverlapOffset()};

    &:hover {
      transform: translateY(-4px);
      z-index: 100;
    }

    &:last-child {
      margin-left: 0;
    }
  }

  fun render : Html {
    <div::container>
      if hasMoreAvatars() {
        <div::avatarWrapper style={"z-index: " + Number.toString(max + 1) + ";"}>
          <Avatar
            text={getRemainingCount()}
            size={size}
            shape={shape}
            border={bordered}
            borderColor="#fff"
            borderWidth="2px"
            ring={ring}
            ringColor={ringColor}
            ringWidth={ringWidth}
            showStatus={showStatus}
            status={status}
            badge={
              if showBadge {
                "∞"
              } else {
                ""
              }
            }
            animated={animated}
            animation={animation}
            bgColor="#667eea"
            textColor="#fff"/>
        </div>
      }

      for avatar, index of getVisibleAvatars() {
        <div::avatarWrapper style={"z-index: " + getZIndex(index) + ";"}>
          if useInitials {
            <Avatar
              text={avatar}
              size={size}
              shape={shape}
              border={bordered}
              borderColor="#fff"
              borderWidth="2px"
              ring={ring}
              ringColor={ringColor}
              ringWidth={ringWidth}
              showStatus={showStatus}
              status={status}
              badge={
                if showBadge {
                  Number.toString(index + 1)
                } else {
                  ""
                }
              }
              animated={animated}
              animation={animation}
              bgColor="#1989fa"/>
          } else {
            <Avatar
              src={avatar}
              size={size}
              shape={shape}
              border={bordered}
              borderColor="#fff"
              borderWidth="2px"
              ring={ring}
              ringColor={ringColor}
              ringWidth={ringWidth}
              showStatus={showStatus}
              status={status}
              badge={
                if showBadge {
                  Number.toString(index + 1)
                } else {
                  ""
                }
              }
              animated={animated}
              animation={animation}/>
          }
        </div>
      }
    </div>
  }
}
