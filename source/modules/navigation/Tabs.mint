/*
Tabs - Professional mobile-first navigation component
 * Features: Swipe gestures, Sticky positioning, Auto-scroll, Lazy loading support
*/
component Tabs {
  /* Properties */
  property tabs : Array(TabItem) = []

  property active : String = ""
  property type : String = "line"
  property color : String = ""
  property background : String = ""
  property titleActiveColor : String = ""
  property titleInactiveColor : String = ""
  property border : Bool = false
  property shrink : Bool = false
  property ellipsis : Bool = true
  property lineWidth : String = "40px"
  property lineHeight : String = "3px"
  property duration : Number = 300
  property animated : Bool = false
  property animationType : String = "fadeIn"
  property animationDuration : Number = 0.3

  /* Card & Layout Properties */
  property iconLayout : String = "horizontal"

  property cardSpacing : String = "normal"

  /* Advanced Features */
  property sticky : Bool = false

  property stickyOffsetTop : Number = 0
  property swipeable : Bool = true
  property lazyRender : Bool = false
  property scrollable : Bool = true

  /* Events */
  property onChange : Function(TabChangeEvent, Promise(Void)) =
    (event : TabChangeEvent) : Promise(Void) { Promise.never() }

  property onClick : Function(TabClickEvent, Promise(Void)) =
    (event : TabClickEvent) : Promise(Void) { Promise.never() }

  property onDisabled : Function(TabClickEvent, Promise(Void)) =
    (event : TabClickEvent) : Promise(Void) { Promise.never() }

  property onSwipe : Function(String, Promise(Void)) =
    (direction : String) : Promise(Void) { Promise.never() }

  property onDirectionChange : Function(String, Promise(Void)) =
    (direction : String) : Promise(Void) { Promise.never() }

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

        onChange({ name: tab.name, title: tab.title, index: index })
      })
    |> Maybe.withDefault(Promise.never())
  }

  /* Event Handlers */
  fun handleTabClick (
    tab : TabItem,
    index : Number,
    event : Html.Event
  ) : Promise(Void) {
    if tab.disabled {
      onDisabled(
        { name: tab.name, title: tab.title, index: index, disabled: tab.disabled })
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
        { name: tab.name, title: tab.title, index: index, disabled: tab.disabled })

      next { currentActive: tab.name }

      onChange({ name: tab.name, title: tab.title, index: index })
    }
  }

  /* Helper Functions */
  fun getActiveColor : String {
    if !String.isEmpty(titleActiveColor) {
      titleActiveColor
    } else if !String.isEmpty(color) {
      color
    } else {
      "var(--primary-color)"
    }
  }

  fun getInactiveColor : String {
    if !String.isEmpty(titleInactiveColor) {
      titleInactiveColor
    } else {
      "var(--text-color)"
    }
  }

  fun getBackground : String {
    if !String.isEmpty(background) {
      background
    } else {
      "var(--card-bg)"
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
    background: #{getBackground()};
    width: 100%;
    z-index: 99;

    if sticky {
      position: sticky;
      top: #{Number.toString(stickyOffsetTop)}px;
      box-shadow: 0 2px 8px var(--shadow-color);
    }

    if border {
      &::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: var(--border-color);
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

    /* Card basic */
    if type == "card" {
      margin: 0 12px;
      border-radius: 4px;
      background: var(--border-color);

      @media (min-width: 768px) {
        margin: 0 16px;
      }
    }

    /* Card Pill (iOS style) */
    if type == "card-pill" {
      margin: 0 12px;
      padding: 4px;
      border-radius: 50px;
      background: var(--border-color);

      @media (min-width: 768px) {
        margin: 0 16px;
        padding: 6px;
      }
    }

    /* Card Elevated (Material Design) */
    if type == "card-elevated" {
      margin: 0 12px;
      border-radius: 8px;
      background: var(--card-bg);
      box-shadow: 0 4px 12px var(--shadow-color);

      @media (min-width: 768px) {
        margin: 0 16px;
      }
    }

    /* Card Outlined */
    if type == "card-outlined" {
      margin: 0 12px;
      border-radius: 8px;
      background: transparent;
      border: 1px solid var(--border-color);

      @media (min-width: 768px) {
        margin: 0 16px;
      }
    }

    /* Segment (iOS Segmented Control) */
    if type == "segment" {
      margin: 0 12px;
      padding: 2px;
      border-radius: 10px;
      background: var(--border-color);

      @media (min-width: 768px) {
        margin: 0 16px;
        padding: 3px;
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

    flex-direction: #{if iconLayout == "vertical" {
      "column"
    } else {
      "row"
    }};

    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    padding: 0 4px;
    font-size: 13px;

    line-height: #{if iconLayout == "vertical" {
      "1.2"
    } else {
      "40px"
    }};

    cursor: pointer;
    transition: all #{Number.toString(duration)}ms cubic-bezier(0.4, 0, 0.2, 1);
    min-width: 0;

    gap: #{if iconLayout == "vertical" {
      "6px"
    } else {
      "4px"
    }};

    if iconLayout == "vertical" {
      padding: 8px 4px 12px 4px;

      @media (min-width: 641px) {
        padding: 10px 8px 14px 8px;
      }

      @media (min-width: 768px) {
        padding: 12px 12px 16px 12px;
      }
    }

    else {
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
      color: #{getInactiveColor()};
      font-weight: 400;
      transform: scale(1);
    }

    if disabled {
      color: #999;
      cursor: not-allowed;
      opacity: 0.5;
      filter: grayscale(1);
      pointer-events: none;
    }

    else {
      &:hover {
        opacity: 0.85;
        background: var(--border-color);
        border-radius: 4px;
      }

      &:active {
        transform: scale(0.98);
      }
    }

    /* Card basic */
    if type == "card" {
      border-right: 1px solid var(--border-color);

      &:last-child {
        border-right: none;
      }

      if active {
        background: var(--card-bg);
        border-radius: 4px;
        box-shadow: 0 2px 4px var(--shadow-color);
      }
    }

    /* Card Pill (iOS style) */
    if type == "card-pill" {
      border-radius: 50px;
      padding: 8px 16px;

      background: #{if active {
        "var(--card-bg)"
      } else {
        "transparent"
      }};

      box-shadow: #{if active {
        "0 2px 8px var(--shadow-color)"
      } else {
        "none"
      }};

      transform: #{if active {
        "scale(1)"
      } else {
        "scale(1)"
      }};

      &:hover {
        background: #{if active {
          "var(--card-bg)"
        } else {
          "rgba(0, 0, 0, 0.05)"
        }};

        border-radius: 50px;
      }
    }

    /* Card Elevated (Material Design) */
    if type == "card-elevated" {
      border-radius: 6px;
      margin: 0 4px;

      background: #{if active {
        getActiveColor()
      } else {
        "transparent"
      }};

      color: #{if active {
        "#fff"
      } else {
        getInactiveColor()
      }};

      box-shadow: #{if active {
        "0 6px 16px var(--shadow-color)"
      } else {
        "none"
      }};

      transform: #{if active {
        "translateY(-2px)"
      } else {
        "translateY(0)"
      }};

      &:hover {
        background: #{if active {
          getActiveColor()
        } else {
          "var(--border-color)"
        }};

        border-radius: 6px;
      }
    }

    /* Card Outlined */
    if type == "card-outlined" {
      border-radius: 6px;
      margin: 0 4px;

      border: 2px solid #{if active {
        getActiveColor()
      } else {
        "transparent"
      }};

      background: #{if active {
        "var(--card-bg)"
      } else {
        "transparent"
      }};

      box-shadow: #{if active {
        "0 2px 8px var(--shadow-color)"
      } else {
        "none"
      }};

      &:hover {
        border-color: #{if active {
          getActiveColor()
        } else {
          "var(--border-color)"
        }};

        border-radius: 6px;
      }
    }

    /* Segment (iOS Segmented Control) */
    if type == "segment" {
      border-radius: 8px;
      padding: 6px 12px;
      font-weight: 500;

      background: #{if active {
        "var(--card-bg)"
      } else {
        "transparent"
      }};

      box-shadow: #{if active {
        "0 3px 8px rgba(0, 0, 0, 0.12), 0 1px 3px rgba(0, 0, 0, 0.08)"
      } else {
        "none"
      }};

      transform: #{if active {
        "scale(1)"
      } else {
        "scale(1)"
      }};

      @media (min-width: 768px) {
        padding: 8px 16px;
      }

      &:hover {
        background: #{if active {
          "var(--card-bg)"
        } else {
          "rgba(0, 0, 0, 0.04)"
        }};

        border-radius: 8px;
      }
    }

    if ellipsis {
      white-space: nowrap;
    }
  }

  style tabContent {
    display: flex;

    flex-direction: #{if iconLayout == "vertical" {
      "column"
    } else {
      "row"
    }};

    align-items: center;
    justify-content: center;

    gap: #{if iconLayout == "vertical" {
      "4px"
    } else {
      "4px"
    }};

    min-width: 0;

    @media (min-width: 641px) {
      gap: #{if iconLayout == "vertical" {
        "6px"
      } else {
        "6px"
      }};
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
    background: #{getActiveColor()};
    border-radius: 3px;
    transition: all #{Number.toString(duration)}ms cubic-bezier(0.34, 1.56, 0.64, 1);
    height: #{lineHeight};
    box-shadow: 0 2px 4px var(--shadow-color);

    if total > 0 {
      left: calc(#{Number.toString(index)}* #{Number.toString(100 / total)}%);
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
        onTouchEnd={handleTouchEnd}
      >
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
              onClick={
                (event : Html.Event) { handleTabClick(tab, index, event) }
              }
            >
              <div::tabContent>
                if !String.isEmpty(tab.icon) {
                  <span::tabIcon>
                    {
                      tab.icon
                    }
                  </span>
                } else {
                  <></>
                }

                <span::tabText>
                  {
                    tab.title
                  }
                </span>

                if tab.dot {
                  <StatusDot
                    status={
                      if !String.isEmpty(tab.dotStatus) {
                        tab.dotStatus
                      } else {
                        "error"
                      }
                    }
                    size={
                      if !String.isEmpty(tab.dotSize) {
                        tab.dotSize
                      } else {
                        "small"
                      }
                    }
                    animation={
                      if !String.isEmpty(tab.dotAnimation) {
                        tab.dotAnimation
                      } else {
                        "none"
                      }
                    }
                  />
                } else if !String.isEmpty(tab.badge) {
                  <Badge
                    count={
                      Number.fromString(tab.badge)
                      |> Maybe.withDefault(0)
                    }
                    max={99}
                    showZero={false}
                    variant={
                      if !String.isEmpty(tab.badgeVariant) {
                        tab.badgeVariant
                      } else {
                        "error"
                      }
                    }
                    size={
                      if !String.isEmpty(tab.badgeSize) {
                        tab.badgeSize
                      } else {
                        "small"
                      }
                    }
                    color={tab.badgeColor}
                    standalone={true}
                    text={tab.badge}
                  />
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
