/* TabsSwipeContent - Swipeable content container for tabs */

component TabsSwipeContent {
  /* Properties */
  property tabs : Array(TabItem) = []
  property activeTab : String = ""
  property children : Array(Html) = []

  /* State */
  state touchStartX : Number = 0
  state touchStartY : Number = 0
  state currentOffset : Number = 0
  state isSwiping : Bool = false
  state transition : Bool = true

  /* Get active index */
  fun getActiveIndex : Number {
    `
    (() => {
      const tabs = #{tabs};
      const activeTab = #{activeTab};
      const index = tabs.findIndex(tab => tab.name === activeTab);
      return index >= 0 ? index : 0;
    })()
    `
  }

  /* Swipe handlers */
  fun handleTouchStart (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const touch = #{event}.touches[0];
      if (touch) {
        #{next {
          touchStartX: `touch.clientX`,
          touchStartY: `touch.clientY`,
          isSwiping: true,
          transition: false
        }};
      }
    })()
    `
  }

  fun handleTouchMove (event : Html.Event) : Promise(Void) {
    if isSwiping {
      `
      (() => {
        const touch = #{event}.touches[0];
        if (touch) {
          const deltaX = touch.clientX - #{touchStartX};
          const deltaY = touch.clientY - #{touchStartY};

          // Only swipe horizontally if movement is more horizontal than vertical
          if (Math.abs(deltaX) > Math.abs(deltaY) && Math.abs(deltaX) > 5) {
            #{event}.preventDefault();
            #{next { currentOffset: `deltaX` }};
          }
        }
      })()
      `
    } else {
      Promise.never()
    }
  }

  fun handleTouchEnd (event : Html.Event) : Promise(Void) {
    next { isSwiping: false, transition: true, currentOffset: 0 }
  }

  /* Styles */
  style container {
    position: relative;
    width: 100%;
    overflow: hidden;
    touch-action: pan-y;
  }

  style wrapper {
    display: flex;
    width: 100%;
    transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    will-change: transform;

    if !transition {
      transition: none;
    }
  }

  style slide {
    flex: 0 0 100%;
    width: 100%;
    min-width: 100%;
  }

  /* Calculate transform */
  fun getTransform : String {
    `
    (() => {
      const activeIndex = #{getActiveIndex()};
      const currentOffset = #{currentOffset};
      const containerWidth = window.innerWidth || 375;

      const baseOffset = -1 * activeIndex * 100;
      const swipeOffset = (currentOffset / containerWidth) * 100;

      return 'translateX(' + (baseOffset + swipeOffset) + '%)';
    })()
    `
  }

  /* Render */
  fun render : Html {
    <div::container
      onTouchStart={handleTouchStart}
      onTouchMove={handleTouchMove}
      onTouchEnd={handleTouchEnd}>

      <div::wrapper style={"transform: " + getTransform()}>
        for child of children {
          <div::slide>
            {child}
          </div>
        }
      </div>
    </div>
  }
}
