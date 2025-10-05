/* Tabs - Mobile-first tabs navigation component */

component Tabs {
  connect ViewModeStore exposing { viewMode }

  /* Properties */
  property tabs : Array(TabItem) = []
  property active : String = ""
  property type : String = "line"
  property color : String = "#1989fa"
  property background : String = "#fff"
  property duration : Number = 300
  property lineWidth : String = "40px"
  property lineHeight : String = "3px"
  property animated : Bool = false
  property border : Bool = false
  property sticky : Bool = false
  property swipeable : Bool = false
  property scrollspy : Bool = false
  property offsetTop : Number = 0
  property swipeThreshold : Number = 5
  property titleActiveColor : String = ""
  property titleInactiveColor : String = "#646566"
  property ellipsis : Bool = true
  property shrink : Bool = false

  /* Events */
  property onChange : Function(TabChangeEvent, Promise(Void)) = (event : TabChangeEvent) : Promise(Void) { Promise.never() }
  property onClick : Function(TabClickEvent, Promise(Void)) = (event : TabClickEvent) : Promise(Void) { Promise.never() }
  property onScroll : Function(TabScrollEvent, Promise(Void)) = (event : TabScrollEvent) : Promise(Void) { Promise.never() }
  property onDisabled : Function(TabClickEvent, Promise(Void)) = (event : TabClickEvent) : Promise(Void) { Promise.never() }
  property beforeChange : Function(String, Bool) = (name : String) : Bool { true }

  /* State */
  state currentActive : String = ""
  state lineOffset : Number = 0
  state lineStyle : String = ""
  state isFixed : Bool = false
  state touchStartX : Number = 0
  state touchStartY : Number = 0
  state contentOffset : Number = 0

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    `
    (() => {
      #{next { currentActive: active }}
      #{setupStickyListener()}
      #{updateLinePosition()}
    })()
    `
    Promise.never()
  }

  fun componentDidUpdate : Promise(Void) {
    `
    (() => {
      if (#{currentActive} !== #{active}) {
        console.log('Tabs: Updating from', #{currentActive}, 'to', #{active});
        #{next { currentActive: active }}
        setTimeout(() => {
          console.log('Tabs: Calling updateLinePosition');
          #{updateLinePosition()}
        }, 150);
      }
    })()
    `
    Promise.never()
  }

  /* Methods */
  fun getActiveIndex : Number {
    `
    (() => {
      const index = #{tabs}.findIndex(tab => tab.name === #{currentActive});
      return index >= 0 ? index : 0;
    })()
    `
  }

  fun getLineStyle : String {
    `
    (() => {
      const tabs = #{tabs};
      const currentActive = #{currentActive};
      const lineWidth = #{lineWidth};
      const lineHeight = #{lineHeight};
      const shrink = #{shrink};

      const index = tabs.findIndex(tab => tab.name === currentActive);
      if (index < 0) return "";

      // Get the nav element and tab elements
      const navElement = document.querySelector('[role="tablist"]');
      if (!navElement) return "";

      const tabElements = navElement.querySelectorAll('[role="tab"]');
      if (index >= tabElements.length) return "";

      const currentTab = tabElements[index];
      if (!currentTab) return "";

      const tabRect = currentTab.getBoundingClientRect();
      const navRect = navElement.getBoundingClientRect();

      // Calculate position relative to nav container
      const left = tabRect.left - navRect.left + navElement.scrollLeft;

      // Calculate the line width
      const lineWidthPx = parseInt(lineWidth) || 40;

      // Center the line under the tab
      const tabCenter = left + (tabRect.width / 2);
      const lineLeft = tabCenter - (lineWidthPx / 2);

      return "transform: translateX(" + lineLeft + "px); width: " + lineWidth + "; height: " + lineHeight + ";";
    })()
    `
  }

  fun updateLinePosition : Promise(Void) {
    `
    (() => {
      setTimeout(() => {
        const tabs = #{tabs};
        const currentActive = #{currentActive};
        const lineWidth = #{lineWidth};
        const lineHeight = #{lineHeight};
        const shrink = #{shrink};

        console.log('updateLinePosition: currentActive =', currentActive);

        const index = tabs.findIndex(tab => tab.name === currentActive);
        console.log('updateLinePosition: index =', index);
        if (index < 0) {
          console.log('updateLinePosition: index < 0, returning');
          return;
        }

        const navElement = document.querySelector('[role="tablist"]');
        console.log('updateLinePosition: navElement =', navElement);
        if (!navElement) {
          console.log('updateLinePosition: no navElement found');
          return;
        }

        const tabElements = navElement.querySelectorAll('[role="tab"]');
        console.log('updateLinePosition: tabElements =', tabElements);
        if (index >= tabElements.length) {
          console.log('updateLinePosition: index >= tabElements.length');
          return;
        }

        const currentTab = tabElements[index];
        if (!currentTab) {
          console.log('updateLinePosition: no currentTab');
          return;
        }

        const tabRect = currentTab.getBoundingClientRect();
        const navRect = navElement.getBoundingClientRect();

        // Calculate position relative to nav container
        const left = tabRect.left - navRect.left + navElement.scrollLeft;

        // Calculate the line width
        const lineWidthPx = parseInt(lineWidth) || 40;

        // Center the line under the tab
        const tabCenter = left + (tabRect.width / 2);
        const lineLeft = tabCenter - (lineWidthPx / 2);

        const newStyle = "transform: translateX(" + lineLeft + "px); width: " + lineWidth + "; height: " + lineHeight + ";";
        console.log('updateLinePosition: newStyle =', newStyle);
        #{next { lineStyle: `newStyle` }}

        // Auto-scroll to center active tab in shrink mode
        if (shrink) {
          const scrollLeft = navElement.scrollLeft;
          const tabCenter = tabRect.left - navRect.left + scrollLeft + (tabRect.width / 2);
          const navCenter = navRect.width / 2;
          const targetScroll = tabCenter - navCenter;

          navElement.scrollTo({
            left: targetScroll,
            behavior: 'smooth'
          });
        }
      }, 50);
    })()
    `
    Promise.never()
  }

  fun setupStickyListener : Promise(Void) {
    `
    (() => {
      const sticky = #{sticky};
      if (!sticky) return;

      const offsetTop = #{offsetTop};

      const handleScroll = () => {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        const shouldBeFixed = scrollTop >= offsetTop;

        if (#{isFixed} !== shouldBeFixed) {
          #{next { isFixed: `shouldBeFixed` }}
          #{onScroll({
            scrollTop: `scrollTop`,
            isFixed: `shouldBeFixed`
          })}
        }
      };

      window.addEventListener('scroll', handleScroll, { passive: true });
    })()
    `
    Promise.never()
  }

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
      onClick(
        {
          name: tab.name,
          title: tab.title,
          index: index,
          disabled: tab.disabled
        })

      next { currentActive: tab.name }

      updateLinePosition()

      onChange(
        {
          name: tab.name,
          title: tab.title,
          index: index
        })
    }
  }

  fun updateContentOffset (index : Number) : Promise(Void) {
    next { contentOffset: -index * 100 }
  }

  fun handleTouchStart (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const swipeable = #{swipeable};
      if (!swipeable) return;

      const touch = #{event}.touches[0];
      if (touch) {
        #{next { touchStartX: `touch.clientX`, touchStartY: `touch.clientY` }}
      }
    })()
    `
    Promise.never()
  }

  fun handleTouchMove (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const swipeable = #{swipeable};
      if (!swipeable) return;

      const touch = #{event}.touches[0];
      if (!touch) return;

      const deltaX = touch.clientX - #{touchStartX};
      const deltaY = touch.clientY - #{touchStartY};

      // If swiping vertically, don't interfere
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      // Prevent default scroll when swiping horizontally
      #{event}.preventDefault();
    })()
    `
    Promise.never()
  }

  fun handleTouchEnd (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const swipeable = #{swipeable};
      if (!swipeable) return;

      const touch = #{event}.changedTouches[0];
      if (!touch) return;

      const deltaX = touch.clientX - #{touchStartX};
      const deltaY = touch.clientY - #{touchStartY};

      // Only process horizontal swipes
      if (Math.abs(deltaY) > Math.abs(deltaX)) return;

      const threshold = #{swipeThreshold} || 5;
      const tabs = #{tabs};
      const currentIndex = tabs.findIndex(tab => tab.name === #{currentActive});

      if (Math.abs(deltaX) > threshold) {
        if (deltaX > 0 && currentIndex > 0) {
          // Swipe right - go to previous tab
          const prevTab = tabs[currentIndex - 1];
          if (!prevTab.disabled) {
            #{handleTabClick(
              `prevTab`,
              `currentIndex - 1`,
              event
            )}
          }
        } else if (deltaX < 0 && currentIndex < tabs.length - 1) {
          // Swipe left - go to next tab
          const nextTab = tabs[currentIndex + 1];
          if (!nextTab.disabled) {
            #{handleTabClick(
              `nextTab`,
              `currentIndex + 1`,
              event
            )}
          }
        }
      }
    })()
    `
    Promise.never()
  }

  /* Styles */
  style container {
    position: relative;
    background: #{background};

    if border {
      &::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: var(--mint-border-color, #ebedf0);
        transform: scaleY(0.5);
      }
    }
  }

  style containerSticky {
    position: fixed;
    top: #{Number.toString(offsetTop)}px;
    left: 0;
    right: 0;
    z-index: 99;
  }

  style wrap {
    position: relative;
    display: flex;
    overflow-x: auto;
    overflow-y: hidden;
    -webkit-overflow-scrolling: touch;

    &::-webkit-scrollbar {
      display: none;
    }

    if type == "card" {
      margin: 0 16px;
      border-radius: 2px;
      background: var(--mint-background, #f7f8fa);
    }

    if shrink {
      flex-wrap: nowrap;
    } else {
      flex: 1;
    }
  }

  style nav {
    position: relative;
    display: flex;
    user-select: none;
    width: 100%;

    if !shrink {
      flex: 1;
    }
  }

  style tab (active : Bool, disabled : Bool) {
    position: relative;
    display: flex;
    flex: 1;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    padding: 0 12px;
    font-size: 14px;
    line-height: 44px;
    cursor: pointer;
    transition: all #{Number.toString(duration)}ms;

    if active {
      color: #{
        if String.isEmpty(titleActiveColor) {
          color
        } else {
          titleActiveColor
        }
      };
      font-weight: 500;
    } else {
      color: #{titleInactiveColor};
      font-weight: 400;
    }

    if disabled {
      color: var(--mint-text-color-3, #c8c9cc);
      cursor: not-allowed;
    }

    if shrink {
      flex: 0 0 auto;
      padding: 0 12px;
    }

    if type == "card" {
      border-right: 1px solid var(--mint-border-color, #ebedf0);

      &:last-child {
        border-right: none;
      }

      if active {
        background: #fff;
        border-radius: 2px;
      }
    }

    if ellipsis {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }

  style tabTitle {
    position: relative;
    display: flex;
    align-items: center;
    gap: 4px;
  }

  style tabIcon {
    display: inline-flex;
    align-items: center;
    margin-right: 4px;
    font-size: 16px;
  }

  style tabDot {
    position: absolute;
    top: 8px;
    right: -8px;
    width: 8px;
    height: 8px;
    background: var(--mint-danger-color, #ee0a24);
    border-radius: 50%;
    border: 2px solid #fff;
  }

  style tabBadge {
    position: absolute;
    top: 4px;
    right: -12px;
    min-width: 16px;
    height: 16px;
    padding: 0 3px;
    background: var(--mint-danger-color, #ee0a24);
    color: #fff;
    font-size: 10px;
    font-weight: 500;
    line-height: 16px;
    text-align: center;
    border-radius: 8px;
    white-space: nowrap;
  }

  style line {
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 1;
    width: 40px;
    height: 3px;
    background: #{color};
    border-radius: 3px;
    transition: all #{Number.toString(duration)}ms;
  }

  style content {
    position: relative;
    width: 100%;

    if animated {
      overflow: hidden;
    }
  }

  style contentWrapper {
    display: flex;
    transition: transform #{Number.toString(duration)}ms;
    transform: translateX(#{Number.toString(contentOffset)}%);
  }

  style contentPane {
    flex-shrink: 0;
    width: 100%;
  }

  /* Render */
  fun render : Html {
    <div>
      <div::container
        class={
          if sticky && isFixed {
            "containerSticky"
          } else {
            ""
          }
        }>

        <div::wrap>
          <div::nav
            role="tablist"
            onTouchStart={handleTouchStart}
            onTouchMove={handleTouchMove}
            onTouchEnd={handleTouchEnd}>

            for tab, index of tabs {
              <div::tab(tab.name == currentActive, tab.disabled)
                key={tab.name}
                role="tab"
                style={tab.titleStyle}
                onClick={(event : Html.Event) { handleTabClick(tab, index, event) }}>

                <span::tabTitle>
                  if !String.isEmpty(tab.icon) {
                    <span::tabIcon>{tab.icon}</span>
                  }

                  {tab.title}

                  if tab.dot {
                    <span::tabDot/>
                  }

                  if !String.isEmpty(tab.badge) {
                    <span::tabBadge>{tab.badge}</span>
                  }
                </span>
              </div>
            }

            if type == "line" {
              <div::line style={lineStyle}/>
            }
          </div>
        </div>
      </div>

      if animated {
        <div::content>
          <div::contentWrapper>
            for tab, index of tabs {
              <div::contentPane key={tab.name}>
                if !String.isEmpty(tab.content) {
                  <div>{tab.content}</div>
                }
              </div>
            }
          </div>
        </div>
      }

    </div>
  }
}
