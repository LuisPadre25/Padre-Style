/*
IndexBar - Professional alphabetical index navigation for long lists
 * Based on Vant UI IndexBar with enhanced features
 * Features: Touch gestures, Sticky anchors, Smooth scrolling, Custom indexes, Events
 * Mobile-first responsive design with advanced UX
*/
component IndexBar {
  /* Properties */
  property indexList : Array(String) =
    [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ]

  property sticky : Bool = true
  property stickyOffsetTop : Number = 0
  property highlightColor : String = "#1989fa"
  property zIndex : Number = 1
  property children : Array(Html) = []

  /* Advanced Features */
  property showHint : Bool = true

  property hintColor : String = ""
  property hintBackground : String = ""
  property sidebarPosition : String = "right"

  // "right" | "left"
  property sidebarOffset : Number = 0

  property indexFontSize : Number = 10
  property hintFontSize : Number = 24
  property animationDuration : Number = 300

  /* Events */
  property onSelect : Function(IndexBarSelectEvent, Promise(Void)) =
    (event : IndexBarSelectEvent) : Promise(Void) { Promise.never() }

  property onChange : Function(IndexBarChangeEvent, Promise(Void)) =
    (event : IndexBarChangeEvent) : Promise(Void) { Promise.never() }

  /* State */
  state activeIndex : String = ""

  state previousIndex : String = ""
  state touching : Bool = false
  state hintVisible : Bool = false
  state scrolling : Bool = false

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    setupIntersectionObserver()
    setupScrollListener()
    Promise.resolve(void)
  }

  fun componentWillUnmount : Promise(Void) {
    cleanupObservers()
    Promise.resolve(void)
  }

  /* Setup Intersection Observer for active index tracking */
  fun setupIntersectionObserver : Promise(Void) {
    `
    (() => {
      const observer = new IntersectionObserver((entries) => {
        // Only update if not manually scrolling
        if (!#{scrolling}) {
          entries.forEach(entry => {
            if (entry.isIntersecting && entry.intersectionRatio > 0.5) {
              const index = entry.target.dataset.indexAnchor;
              if (index && index !== '' && index !== #{activeIndex}) {
                const prevIndex = #{activeIndex};
                #{setActiveIndexWithPrevious}(index, prevIndex);
              }
            }
          });
        }
      }, {
        rootMargin: '-10% 0px -80% 0px',
        threshold: [0, 0.25, 0.5, 0.75, 1.0]
      });

      // Observe all anchors
      const anchors = document.querySelectorAll('[data-index-anchor]');
      anchors.forEach(anchor => observer.observe(anchor));

      // Store observer for cleanup
      window.__indexBarObserver = observer;
    })()
    `

    Promise.resolve(void)
  }

  /* Setup scroll listener */
  fun setupScrollListener : Promise(Void) {
    `
    (() => {
      let scrollTimeout;
      const handleScroll = () => {
        #{setScrolling}(true);
        clearTimeout(scrollTimeout);
        scrollTimeout = setTimeout(() => {
          #{setScrolling}(false);
        }, 150);
      };

      window.addEventListener('scroll', handleScroll, { passive: true });
      window.__indexBarScrollHandler = handleScroll;
    })()
    `

    Promise.resolve(void)
  }

  /* Cleanup observers and listeners */
  fun cleanupObservers : Promise(Void) {
    `
    (() => {
      if (window.__indexBarObserver) {
        window.__indexBarObserver.disconnect();
        delete window.__indexBarObserver;
      }
      if (window.__indexBarScrollHandler) {
        window.removeEventListener('scroll', window.__indexBarScrollHandler);
        delete window.__indexBarScrollHandler;
      }
    })()
    `

    Promise.resolve(void)
  }

  /* State setters */
  fun setActiveIndexWithPrevious (
    newIndex : String,
    prevIndex : String
  ) : Promise(Void) {
    next { activeIndex: newIndex, previousIndex: prevIndex }
    onChange({ index: newIndex, previousIndex: prevIndex })
  }

  fun setScrolling (value : Bool) : Promise(Void) {
    next { scrolling: value }
  }

  /* Event Handlers */
  fun handleIndexClick (index : String, event : Html.Event) : Promise(Void) {
    `#{event}.preventDefault()`
    next { activeIndex: index, scrolling: true }

    scrollToIndex(index)

    `
    setTimeout(() => {
      #{setScrolling}(false);
    }, #{Number.toString(animationDuration + 100)})
    `

    onSelect({ index: index, timestamp: `Date.now()` })
  }

  fun handleTouchStart (index : String, event : Html.Event) : Promise(Void) {
    next {
      touching: true,
      hintVisible: showHint,
      activeIndex: index,
      scrolling: true
    }

    scrollToIndex(index)
    onSelect({ index: index, timestamp: `Date.now()` })
    vibrate()
  }

  fun handleTouchMove (event : Html.Event) : Promise(Void) {
    if touching {
      `
      (() => {
        #{event}.preventDefault();
        const touch = #{event}.touches[0];
        const target = document.elementFromPoint(touch.clientX, touch.clientY);

        if (target && target.dataset.indexItem) {
          const dataIndex = target.dataset.indexItem;
          if (dataIndex !== '' && dataIndex !== #{activeIndex}) {
            #{setTouchActiveIndex}(dataIndex);
            #{scrollToIndex}(dataIndex);
            #{triggerSelect}(dataIndex);
            #{vibrate}();
          }
        }
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun handleTouchEnd (event : Html.Event) : Promise(Void) {
    next { touching: false }

    `
    setTimeout(() => {
      #{setHintVisible}(false);
      #{setScrolling}(false);
    }, 300)
    `

    Promise.resolve(void)
  }

  fun setTouchActiveIndex (index : String) : Promise(Void) {
    next { activeIndex: index }
  }

  fun setHintVisible (value : Bool) : Promise(Void) {
    next { hintVisible: value }
  }

  /* Scroll to specific index */
  fun scrollToIndex (index : String) : Promise(Void) {
    `
    (() => {
      const anchor = document.querySelector('[data-index-anchor="' + #{index} + '"]');
      if (anchor) {
        const offsetTop = #{Number.toString(stickyOffsetTop)};
        const top = anchor.getBoundingClientRect().top + window.pageYOffset - offsetTop;

        window.scrollTo({
          top: top,
          behavior: 'smooth'
        });
      }
    })()
    `

    Promise.resolve(void)
  }

  /* Trigger select event */
  fun triggerSelect (index : String) : Promise(Void) {
    onSelect({ index: index, timestamp: `Date.now()` })
  }

  /* Haptic feedback */
  fun vibrate : Promise(Void) {
    `
    (() => {
      if (window.navigator && window.navigator.vibrate) {
        window.navigator.vibrate(10);
      }
    })()
    `

    Promise.resolve(void)
  }

  /* Get hint styles */
  fun getHintStyles : String {
    let bgColor =
      if String.isEmpty(hintBackground) {
        "rgba(0, 0, 0, 0.7)"
      } else {
        hintBackground
      }

    let textColor =
      if String.isEmpty(hintColor) {
        "#fff"
      } else {
        hintColor
      }

    "background: " + bgColor + "; color: " + textColor + "; font-size: " + Number.toString(
      hintFontSize) + "px;"
  }

  /* Styles */
  style container {
    position: relative;
    user-select: none;
    width: 100%;
    box-sizing: border-box;
  }

  style sidebar {
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
    z-index: #{Number.toString(zIndex + 1)};
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 8px 4px;
    background: transparent;
    pointer-events: all;
    transition: opacity 0.3s ease;

    if sidebarPosition == "right" {
      right: #{Number.toString(sidebarOffset)}px;
    }

    if sidebarPosition == "left" {
      left: #{Number.toString(sidebarOffset)}px;
    }

    @media (min-width: 768px) {
      padding: 12px 6px;
    }

    @media (max-width: 480px) {
      padding: 6px 2px;
    }
  }

  style indexItem (active : Bool) {
    padding: 3px 6px;
    font-size: #{Number.toString(indexFontSize)}px;
    line-height: 1.4;
    text-align: center;
    color: #646566;
    cursor: pointer;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);

    font-weight: #{if active {
      "600"
    } else {
      "500"
    }};

    user-select: none;
    -webkit-tap-highlight-color: transparent;
    position: relative;
    border-radius: 4px;
    min-width: 20px;
    display: flex;
    align-items: center;
    justify-content: center;

    @media (min-width: 768px) {
      padding: 4px 8px;
      min-width: 24px;
    }

    @media (max-width: 480px) {
      padding: 2px 4px;
      min-width: 18px;
      font-size: #{Number.toString(indexFontSize - 1)}px;
    }

    &:active {
      background: rgba(0, 0, 0, 0.05);
      transform: scale(1.15);
    }

    if active {
      color: #{highlightColor};
      background: #{highlightColor}15;
      transform: scale(1.25);
      box-shadow: 0 2px 8px #{highlightColor}30;

      @media (min-width: 768px) {
        transform: scale(1.35);
      }

      &::before {
        content: "";
        position: absolute;
        left: -2px;
        top: 50%;
        transform: translateY(-50%);
        width: 3px;
        height: 70%;
        background: #{highlightColor};
        border-radius: 2px;
        animation: slideIn 0.2s ease;
      }
    }

    if touching && active {
      background: #{highlightColor}25;
    }
  }

  style hint {
    position: absolute;
    top: 50%;
    left: 50%;

    transform: translate(-50%, -50%) scale(#{if hintVisible {
      "1"
    } else {
      "0"
    }});

    width: 64px;
    height: 64px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    pointer-events: none;
    font-weight: 700;
    letter-spacing: 0.5px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4);
    transition: transform 0.2s cubic-bezier(0.34, 1.56, 0.64, 1), opacity 0.2s ease;

    opacity: #{if hintVisible {
      "1"
    } else {
      "0"
    }};

    @media (min-width: 768px) {
      width: 80px;
      height: 80px;
      border-radius: 20px;
    }

    @media (max-width: 480px) {
      width: 56px;
      height: 56px;
      border-radius: 14px;
    }
  }

  style content {
    position: relative;
    width: 100%;
    box-sizing: border-box;
  }

  /* Render sidebar */
  fun renderSidebar : Html {
    <div::sidebar
      onTouchEnd={handleTouchEnd}
      role="navigation"
      aria-label="Index navigation"
    >
      for index of indexList {
        <div::indexItem(index == activeIndex)
          data-index-item={index}
          onClick={(e : Html.Event) { handleIndexClick(index, e) }}
          onTouchStart={(e : Html.Event) { handleTouchStart(index, e) }}
          onTouchMove={handleTouchMove}
          role="button"
          aria-label={"Navigate to " + index}
          tabindex="0"
        >
          {
            index
          }
        </div>
      }
    </div>
  }

  /* Render hint */
  fun renderHint : Html {
    <div::hint style={getHintStyles()}>
      {
        activeIndex
      }
    </div>
  }

  /* Render */
  fun render : Html {
    <div::container>
      <div::content>
        for child of children {
          child
        }
      </div>

      {
        renderSidebar()
      }

      if showHint {
        renderHint()
      } else {
        Html.empty()
      }
    </div>
  }
}
