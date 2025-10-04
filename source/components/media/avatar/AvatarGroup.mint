/* AvatarGroup Component
 * Displays a group of avatars with overlap
 * Shows count indicator for extra avatars
 */

component AvatarGroup {
  // Array of avatar URLs
  property avatars : Array(String) = []

  // Size of avatars
  property size : String = "md"

  // Maximum avatars to show
  property max : Number = 5

  // Spacing between avatars (overlap)
  property spacing : String = "tight"  // tight, normal, loose

  connect ThemeStore exposing { currentTheme }

  // Get overlap offset based on spacing
  fun getOverlapOffset : String {
    case spacing {
      "tight" => "-8px"
      "normal" => "-12px"
      "loose" => "-16px"
      => "-12px"
    }
  }

  // Get remaining count as string
  fun getRemainingCount : String {
    `
    (() => {
      const total = #{Array.size(avatars)};
      const max = #{max};
      const remaining = total - max;
      return "+" + remaining;
    })()
    `
  }

  // Check if we have more avatars
  fun hasMoreAvatars : Bool {
    `#{Array.size(avatars)} > #{max}`
  }

  style container {
    display: inline-flex;
    align-items: center;
    flex-direction: row-reverse;
  }

  style avatarWrapper {
    position: relative;
    transition: transform 0.2s ease;
    margin-left: -12px;
  }

  fun getAvatarWrapperStyles (index : Number) : String {
    `
    (() => {
      const offset = #{getOverlapOffset()};
      const zIndex = #{max} - #{index};
      return "margin-left: " + offset + "; z-index: " + zIndex + ";";
    })()
    `
  }

  fun renderAvatars : Html {
    `
    (() => {
      const avatars = #{avatars};
      const max = #{max};
      const visibleAvatars = avatars.slice(0, max);

      return visibleAvatars.map((avatar, index) => {
        const wrapper = document.createElement('div');
        wrapper.style.cssText = #{getAvatarWrapperStyles(0)}.replace(/z-index: \\d+/, 'z-index: ' + (max - index));
        wrapper.style.position = 'relative';
        wrapper.style.transition = 'transform 0.2s ease';
        wrapper.style.marginLeft = #{getOverlapOffset()};
        return wrapper;
      });
    })()
    `
  }

  fun render : Html {
    <div::container>
      if hasMoreAvatars() {
        <div::avatarWrapper style={getAvatarWrapperStyles(max)}>
          <Avatar
            initials={getRemainingCount()}
            size={size}
            shape="circle"
            bordered={true}
            bgColor={ThemeHelpers.getAccent(currentTheme)}
          />
        </div>
      } else {
        <span/>
      }

      if Array.size(avatars) > 0 {
        <>
          if Array.size(avatars) > 0 {
            <div::avatarWrapper style={getAvatarWrapperStyles(0)}>
              <Avatar
                src={`#{avatars}[0]`}
                size={size}
                shape="circle"
                bordered={true}
              />
            </div>
          } else {
            <span/>
          }

          if Array.size(avatars) > 1 {
            <div::avatarWrapper style={getAvatarWrapperStyles(1)}>
              <Avatar
                src={`#{avatars}[1]`}
                size={size}
                shape="circle"
                bordered={true}
              />
            </div>
          } else {
            <span/>
          }

          if Array.size(avatars) > 2 {
            <div::avatarWrapper style={getAvatarWrapperStyles(2)}>
              <Avatar
                src={`#{avatars}[2]`}
                size={size}
                shape="circle"
                bordered={true}
              />
            </div>
          } else {
            <span/>
          }

          if Array.size(avatars) > 3 {
            <div::avatarWrapper style={getAvatarWrapperStyles(3)}>
              <Avatar
                src={`#{avatars}[3]`}
                size={size}
                shape="circle"
                bordered={true}
              />
            </div>
          } else {
            <span/>
          }

          if Array.size(avatars) > 4 {
            <div::avatarWrapper style={getAvatarWrapperStyles(4)}>
              <Avatar
                src={`#{avatars}[4]`}
                size={size}
                shape="circle"
                bordered={true}
              />
            </div>
          } else {
            <span/>
          }
        </>
      } else {
        <span/>
      }
    </div>
  }
}
