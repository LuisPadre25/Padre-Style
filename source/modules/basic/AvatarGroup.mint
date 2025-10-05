/* AvatarGroup - Display a group of avatars with overlap */

component AvatarGroup {
  property avatars : Array(String) = []
  property size : String = "md"
  property max : Number = 5
  property spacing : String = "normal"
  property shape : String = "circle"
  property bordered : Bool = true

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
      total - Number.toInteger(max)

    "+" + Number.toString(remaining)
  }

  fun hasMoreAvatars : Bool {
    Array.size(avatars) > Number.toInteger(max)
  }

  fun getVisibleAvatars : Array(String) {
    avatars
    |> Array.slice(0, Number.toInteger(max))
  }

  fun getZIndex (index : Number) : String {
    let maxInt =
      Number.toInteger(max)

    let indexInt =
      Number.toInteger(index)

    Number.toString(maxInt - indexInt)
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

    &:first-child {
      margin-left: 0;
    }
  }

  style countAvatar {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-weight: 600;
    font-size: 13px;
    border: 2px solid #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  fun render : Html {
    <div::container>
      if hasMoreAvatars() {
        <div::avatarWrapper style={"z-index: 0;"}>
          <div::countAvatar>
            {getRemainingCount()}
          </div>
        </div>
      }

      for avatar, index of getVisibleAvatars() {
        <div::avatarWrapper style={"z-index: " + getZIndex(index) + ";"}>
          <Avatar
            src={avatar}
            size={size}
            shape={shape}
            border={bordered}
            borderColor="#fff"
            borderWidth="2px"/>
        </div>
      }
    </div>
  }
}
