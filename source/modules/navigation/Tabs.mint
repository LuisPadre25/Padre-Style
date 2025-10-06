/* Tabs - Professional mobile-first navigation component
 * Features: Swipe gestures, Sticky positioning, Auto-scroll, Lazy loading support
 */

component Tabs {
  /* Properties */
  property tabs : Array(TabItem) = []
  property active : String = ""
  property type : String = "line"
  property color : String = "#1989fa"
  property background : String = "#fff"
  property titleActiveColor : String = ""
  property titleInactiveColor : String = "#646566"
  property border : Bool = false
  property shrink : Bool = false
  property ellipsis : Bool = true
  property lineWidth : String = "40px"
  property lineHeight : String = "3px"
  property duration : Number = 300
  property animated : Bool = false
  property animationType : String = "fadeIn"
  property animationDuration : Number = 0.3

  /* Advanced Features */
  property sticky : Bool = false
  property stickyOffsetTop : Number = 0
  property swipeable : Bool = true
  property lazyRender : Bool = false
  property scrollable : Bool = true

  /* Events */
  property onChange : Function(TabChangeEvent, Promise(Void)) = (event : TabChangeEvent) : Promise(Void) { Promise.never() }
  property onClick : Function(TabClickEvent, Promise(Void)) = (event : TabClickEvent) : Promise(Void) { Promise.never() }
  property onDisabled : Function(TabClickEvent, Promise(Void)) = (event : TabClickEvent) : Promise(Void) { Promise.never() }
  property onSwipe : Function(String, Promise(Void)) = (direction : String) : Promise(Void) { Promise.never() }
  property onDirectionChange : Function(String, Promise(Void)) = (direction : String) : Promise(Void) { Promise.never() }

  /* State */
  state currentActive : String = ""
  state touchStartX : Number = 0
  state touchStartY : Number = 0
  state isSwiping : Bool = false
  state swipeOffset : Number = 0
  state changeDirection : String = "none"

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    next { currentActive: active }
  }

  fun componentDidUpdate : Promise(Void) {
    if currentActive != active {
      next { currentActive: active }
    } else {
      Promise.never()
    }
  }

  /* Scroll to active tab - Auto scroll with smooth behavior */
  fun scrollToActiveTab : Promise(Void) {
    `
    (() => {
      try {
        const activeIndex = #{getActiveIndex()};
        const navElement = document.querySelector('[role="tablist"]');
        const wrapElement = navElement?.parentElement;

        if (!wrapElement || !navElement) return;

        const tabs = navElement.children;
        const activeTab = tabs[activeIndex];

        if (activeTab) {
          const tabRect = activeTab.getBoundingClientRect();
          const wrapRect = wrapElement.getBoundingClientRect();

          // Check if tab is outside visible area
          if (tabRect.left < wrapRect.left || tabRect.right > wrapRect.right) {
            const scrollLeft = activeTab.offsetLeft - (wrapElement.offsetWidth / 2) + (activeTab.offsetWidth / 2);

            wrapElement.scrollTo({
              left: scrollLeft,
              behavior: 'smooth'
            });
          }
        }
      } catch (e) {
        console.warn('Scroll to tab error:', e);
      }
    })()
    `
  }

  /* Swipe Gesture Handlers */
  fun handleTouchStart (event : Html.Event) : Promise(Void) {
    if swipeable {
      `
      (() => {
        const touch = #{event}.touches[0];
        if (touch) {
          const startX = touch.clientX;
          const startY = touch.clientY;
          #{next { touchStartX: `startX`, touchStartY: `startY`, isSwiping: true }};
        }
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun handleTouchMove (event : Html.Event) : Promise(Void) {
    if swipeable && isSwiping {
      `
      (() => {
        const touch = #{event}.touches[0];
        if (touch) {
          const deltaX = touch.clientX - #{touchStartX};
          const deltaY = touch.clientY - #{touchStartY};

          // Only swipe horizontally if movement is more horizontal than vertical
          if (Math.abs(deltaX) > Math.abs(deltaY) && Math.abs(deltaX) > 10) {
            #{event}.preventDefault();
            #{next { swipeOffset: `deltaX` }};
          }
        }
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun handleTouchEnd (event : Html.Event) : Promise(Void) {
    if swipeable && isSwiping && Math.abs(swipeOffset) > 50 {
      if swipeOffset > 0 && getActiveIndex() > 0 {
        /* Swipe right - previous tab - content slides from left */
        next { changeDirection: "left" }
        onDirectionChange("left")
        handleSwipeChange(getActiveIndex() - 1)
        onSwipe("right")
        next { isSwiping: false, swipeOffset: 0 }
      } else if swipeOffset < 0 && getActiveIndex() < (getTabCount() - 1) {
        /* Swipe left - next tab - content slides from right */
        next { changeDirection: "right" }
        onDirectionChange("right")
        handleSwipeChange(getActiveIndex() + 1)
        onSwipe("left")
        next { isSwiping: false, swipeOffset: 0 }
      } else {
        next { isSwiping: false, swipeOffset: 0 }
      }
    } else if isSwiping {
      next { isSwiping: false, swipeOffset: 0 }
    } else {
      Promise.never()
    }
  }

  fun handleSwipeChange (index : Number) : Promise(Void) {
    tabs
    |> Array.at(index)
    |> Maybe.map(
      (tab : TabItem) : Promise(Void) {
        next { currentActive: tab.name }

        onChange(
          {
            name: tab.name,
            title: tab.title,
            index: index
          })
      })
    |> Maybe.withDefault(Promise.never())
  }

  /* Event Handlers */
  fun handleTabClick (tab : TabItem, index : Number, event : Html.Event) : Promise(Void) {
    if tab.disabled {
      onDisabled(
        {
          name: tab.name,
          title: tab.title,
          index: index,
          disabled: tab.disabled
        })
    } else {
      /* Detect direction based on index change */
      if index > getActiveIndex() {
        next { changeDirection: "right" }
        onDirectionChange("right")
      } else if index < getActiveIndex() {
        next { changeDirection: "left" }
        onDirectionChange("left")
      } else {
        next { changeDirection: "none" }
        onDirectionChange("none")
      }

      onClick(
        {
          name: tab.name,
          title: tab.title,
          index: index,
          disabled: tab.disabled
        })

      next { currentActive: tab.name }

      onChange(
        {
          name: tab.name,
          title: tab.title,
          index: index
        })
    }
  }

  /* Helper Functions */
  fun getActiveColor : String {
    if String.isEmpty(titleActiveColor) {
      color
    } else {
      titleActiveColor
    }
  }

  fun getTabCount : Number {
    Array.size(tabs)
  }

  fun getActiveIndex : Number {
    `
    (() => {
      const tabs = #{tabs};
      const currentActive = #{currentActive};
      const index = tabs.findIndex(tab => tab.name === currentActive);
      return index >= 0 ? index : 0;
    })()
    `
  }

  /* Get animation based on direction */
  fun getAnimation : String {
    case changeDirection {
      "left" => "slideInLeft"
      "right" => "slideInRight"
      => "fadeIn"
    }
  }

  /* Styles - Mobile First with Advanced Features */
  style container {
    position: relative;
    background: #{background};
    width: 100%;
    z-index: 99;

    if sticky {
      position: sticky;
      top: #{Number.toString(stickyOffsetTop)}px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    if border {
      &::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: #ebedf0;
        transform: scaleY(0.5);
      }
    }
  }

  style wrap {
    position: relative;
    display: flex;
    overflow-x: auto;
    overflow-y: hidden;
    -webkit-overflow-scrolling: touch;
    scroll-behavior: smooth;

    &::-webkit-scrollbar {
      display: none;
    }

    if type == "card" {
      margin: 0 12px;
      border-radius: 4px;
      background: #f7f8fa;

      @media (min-width: 768px) {
        margin: 0 16px;
      }
    }

    if isSwiping {
      cursor: grabbing;
      user-select: none;
    }
  }

  style nav {
    position: relative;
    display: flex;
    user-select: none;
    width: 100%;
    transition: transform 150ms ease-out;

    if !shrink {
      flex: 1;
    }

    if isSwiping && swipeOffset != 0 {
      transform: translateX(#{Number.toString(swipeOffset * 0.3)}px);
    }
  }

  style tab (active : Bool, disabled : Bool) {
    position: relative;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    padding: 0 4px;
    font-size: 13px;
    line-height: 40px;
    cursor: pointer;
    transition: all #{Number.toString(duration)}ms cubic-bezier(0.4, 0, 0.2, 1);
    min-width: 0;
    gap: 4px;

    @media (min-width: 641px) {
      padding: 0 8px;
      font-size: 14px;
      line-height: 42px;
      gap: 6px;
    }

    @media (min-width: 768px) {
      padding: 0 12px;
      font-size: 14px;
      line-height: 44px;
    }

    if shrink {
      flex: 0 0 auto;
    } else {
      flex: 1;
    }

    if active {
      color: #{getActiveColor()};
      font-weight: 500;
      transform: scale(1.02);
    } else {
      color: #{titleInactiveColor};
      font-weight: 400;
      transform: scale(1);
    }

    if disabled {
      color: #c8c9cc;
      cursor: not-allowed;
      opacity: 0.5;
    } else {
      &:hover {
        opacity: 0.85;
        background: rgba(0, 0, 0, 0.02);
        border-radius: 4px;
      }

      &:active {
        transform: scale(0.98);
      }
    }

    if type == "card" {
      border-right: 1px solid #ebedf0;

      &:last-child {
        border-right: none;
      }

      if active {
        background: #fff;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.06);
      }
    }

    if ellipsis {
      white-space: nowrap;
    }
  }

  style tabContent {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 4px;
    min-width: 0;

    @media (min-width: 641px) {
      gap: 6px;
    }
  }

  style tabIcon {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    flex-shrink: 0;

    @media (min-width: 768px) {
      font-size: 18px;
    }
  }

  style tabText {
    if ellipsis {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  }

  style line (index : Number, total : Number) {
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 1;
    background: #{color};
    border-radius: 3px;
    transition: all #{Number.toString(duration)}ms cubic-bezier(0.34, 1.56, 0.64, 1);
    height: #{lineHeight};
    box-shadow: 0 2px 4px rgba(#{color}, 0.3);

    if total > 0 {
      left: calc(#{Number.toString(index)} * #{Number.toString(100 / total)}%);
      width: calc(#{Number.toString(100 / total)}%);
    } else {
      width: #{lineWidth};
    }

    @media (min-width: 768px) {
      border-radius: 4px;
    }
  }

  /* Render */
  fun render : Html {
    <div::container>
      <div::wrap
        onTouchStart={handleTouchStart}
        onTouchMove={handleTouchMove}
        onTouchEnd={handleTouchEnd}>

        <div::nav role="tablist">
          for tab, index of tabs {
            <div::tab(tab.name == currentActive, tab.disabled)
              key={tab.name}
              role="tab"
              aria-selected={Bool.toString(tab.name == currentActive)}
              tabindex={
                if tab.name == currentActive {
                  "0"
                } else {
                  "-1"
                }
              }
              style={tab.titleStyle}
              onClick={(event : Html.Event) { handleTabClick(tab, index, event) }}>

              <div::tabContent>
                if !String.isEmpty(tab.icon) {
                  <span::tabIcon>{tab.icon}</span>
                } else {
                  <></>
                }

                <span::tabText>{tab.title}</span>

                if tab.dot {
                  <StatusDot status="error" size="small"/>
                } else if !String.isEmpty(tab.badge) {
                  <Badge
                    count={
                      Number.fromString(tab.badge)
                      |> Maybe.withDefault(0)
                    }
                    max={99}
                    showZero={false}
                    variant="error"
                    size="small"
                    standalone={true}
                    text={
                      Number.fromString(tab.badge)
                      |> Maybe.map(
                        (num : Number) : String {
                          if num > 99 {
                            "99+"
                          } else {
                            Number.toString(num)
                          }
                        })
                      |> Maybe.withDefault(tab.badge)
                    }/>
                } else {
                  <></>
                }
              </div>
            </div>
          }

          if type == "line" {
            <div::line(getActiveIndex(), getTabCount())/>
          } else {
            <></>
          }
        </div>
      </div>
    </div>
  }
}
