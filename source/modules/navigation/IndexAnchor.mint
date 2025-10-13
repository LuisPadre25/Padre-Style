/*
IndexAnchor - Professional anchor point for IndexBar sections
 * Features: Sticky positioning, Smooth animations, Custom content support
 * Mobile-first responsive design
*/
component IndexAnchor {
  /* Properties */
  property index : String = ""

  property children : Array(Html) = []
  property sticky : Bool = true
  property stickyOffsetTop : Number = 64
  property backgroundColor : String = ""
  property textColor : String = ""
  property activeColor : String = ""

  /* State */
  state isSticky : Bool = false

  /* Lifecycle */
  fun componentDidMount : Promise(Void) {
    setupStickyObserver()
    Promise.resolve(void)
  }

  fun componentWillUnmount : Promise(Void) {
    cleanupStickyObserver()
    Promise.resolve(void)
  }

  /* Setup sticky state observer */
  fun setupStickyObserver : Promise(Void) {
    if sticky {
      `
      (() => {
        const element = document.querySelector('[data-index-anchor="' + #{index} + '"]');
        if (!element) return;

        const observer = new IntersectionObserver(
          ([entry]) => {
            #{setStickyState}(entry.intersectionRatio < 1);
          },
          {
            threshold: [1],
            rootMargin: '-' + #{Number.toString(stickyOffsetTop)} + 'px 0px 0px 0px'
          }
        );

        observer.observe(element);
        element.__stickyObserver = observer;
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun cleanupStickyObserver : Promise(Void) {
    `
    (() => {
      const element = document.querySelector('[data-index-anchor="' + #{index} + '"]');
      if (element && element.__stickyObserver) {
        element.__stickyObserver.disconnect();
        delete element.__stickyObserver;
      }
    })()
    `

    Promise.resolve(void)
  }

  fun setStickyState (value : Bool) : Promise(Void) {
    next { isSticky: value }
  }

  /* Get dynamic styles */
  fun getDynamicStyles : String {
    let bg =
      if String.isEmpty(backgroundColor) {
        "var(--card-bg, #fff)"
      } else {
        backgroundColor
      }

    let color =
      if isSticky && String.isNotEmpty(activeColor) {
        activeColor
      } else if String.isNotEmpty(textColor) {
        textColor
      } else if isSticky {
        "var(--primary-color, #1989fa)"
      } else {
        "var(--text-color, #323233)"
      }

    "background: " + bg + "; color: " + color + ";"
  }

  /* Styles */
  style anchor (stickyEnabled : Bool, stickyActive : Bool) {
    padding: 0 16px;
    font-weight: 500;
    font-size: 14px;
    line-height: 32px;
    position: relative;

    z-index: #{if stickyActive {
      "10"
    } else {
      "1"
    }};

    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-sizing: border-box;
    display: block;
    width: 100%;

    @media (min-width: 768px) {
      padding: 0 20px;
      font-size: 15px;
      line-height: 36px;
    }

    @media (max-width: 480px) {
      padding: 0 12px;
      font-size: 13px;
      line-height: 28px;
    }

    if stickyEnabled {
      position: sticky;
      top: #{Number.toString(stickyOffsetTop)}px;
    }

    if stickyActive {
      border-bottom: 1px solid #ebedf0;
      box-shadow: 0 2px 8px var(--shadow-color, rgba(0, 0, 0, 0.08));
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);

      &::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 16px;
        right: 16px;
        height: 2px;
        background: linear-gradient(90deg, var(--primary-color, #1989fa) 0%, transparent 100%);
        animation: slideRight 0.3s ease;

        @media (min-width: 768px) {
          left: 20px;
          right: 20px;
        }

        @media (max-width: 480px) {
          left: 12px;
          right: 12px;
        }
      }
    }
  }

  /* Render */
  fun render : Html {
    if Array.isEmpty(children) {
      <div::anchor(sticky, isSticky)
        data-index={index}
        data-index-anchor={index}
        style={getDynamicStyles()}
        role="heading"
        aria-level="2"
      >
        {
          index
        }
      </div>
    } else {
      <div::anchor(sticky, isSticky)
        data-index={index}
        data-index-anchor={index}
        style={getDynamicStyles()}
        role="heading"
        aria-level="2"
      >
        for child of children {
          child
        }
      </div>
    }
  }
}
