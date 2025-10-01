/* Utility Components */

/* Spacer Component - Flexible spacing */
component Spacer {
  property size : String = "md"
  property direction : String = "vertical"

  style spacer {
    flex-shrink: 0;
  }

  style vertical {
    width: 100%;
  }

  style horizontal {
    height: 100%;
  }

  style xs {
    height: 0.25rem;
    width: 0.25rem;
  }

  style sm {
    height: 0.5rem;
    width: 0.5rem;
  }

  style md {
    height: 1rem;
    width: 1rem;
  }

  style lg {
    height: 1.5rem;
    width: 1.5rem;
  }

  style xl {
    height: 2rem;
    width: 2rem;
  }

  style xxl {
    height: 3rem;
    width: 3rem;
  }

  fun render : Html {
    <div::spacer class="#{direction} #{size}"/>
  }
}

/* ScrollArea Component - Custom scrollable area */
component ScrollArea {
  property children : Array(Html) = []
  property height : String = "300px"
  property showScrollbar : Bool = true

  style scrollArea {
    height: #{height};
    overflow-y: auto;
    overflow-x: hidden;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    padding: 1rem;
  }

  style hidden {
    scrollbar-width: none;
    -ms-overflow-style: none;

    &::-webkit-scrollbar {
      display: none;
    }
  }

  style custom {
    scrollbar-width: thin;
    scrollbar-color: rgba(102, 126, 234, 0.5) transparent;

    &::-webkit-scrollbar {
      width: 6px;
    }

    &::-webkit-scrollbar-track {
      background: rgba(255, 255, 255, 0.1);
      border-radius: 3px;
    }

    &::-webkit-scrollbar-thumb {
      background: rgba(102, 126, 234, 0.5);
      border-radius: 3px;

      &:hover {
        background: rgba(102, 126, 234, 0.7);
      }
    }
  }

  fun render : Html {
    <div::scrollArea
      class={
        if showScrollbar {
          "custom"
        } else {
          "hidden"
        }
      }
    >
      for child of children {
        child
      }
    </div>
  }
}

/* Skeleton Component - Loading placeholder */
component Skeleton {
  property width : String = "100%"
  property height : String = "1rem"
  property variant : String = "rectangular"
  property animation : String = "pulse"

  style skeleton {
    background: linear-gradient(90deg, rgba(255, 255, 255, 0.1) 25%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.1) 75%);
    background-size: 200% 100%;
    width: #{width};
    height: #{height};
    border-radius: 4px;
  }

  style circular {
    border-radius: 50%;
  }

  style rounded {
    border-radius: 8px;
  }

  style pulse {
    animation: skeletonPulse 1.5s ease-in-out infinite;
  }

  style wave {
    animation: skeletonWave 1.5s linear infinite;
  }

  style keyframes {
    @keyframes skeletonPulse {
      0%, 100% {
        opacity: 0.4;
      }

      50% {
        opacity: 0.8;
      }
    }

    @keyframes skeletonWave {
      0% {
        background-position: -200% 0;
      }

      100% {
        background-position: 200% 0;
      }
    }
  }

  fun render : Html {
    <div::skeleton::keyframes class="#{variant} #{animation}"/>
  }
}

/* Portal Component - Render content outside normal tree */
component Portal {
  property children : Array(Html) = []
  property target : String = "body"

  state isActive : Bool = true

  style portal {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 9999;
    pointer-events: none;
  }

  style content {
    pointer-events: auto;
  }

  fun render : Html {
    if isActive {
      <div::portal>
        <div::content>
          for child of children {
            child
          }
        </div>
      </div>
    } else {
      <div/>
    }
  }
}

/* ClickOutside Component - Wrapper for outside click detection */
component ClickOutside {
  property children : Array(Html) = []

  property onClickOutside =
    (event : Html.Event) : Promise(Void) { Promise.never() }

  style wrapper {
    position: relative;
    display: contents;
  }

  fun handleDocumentClick (event : Html.Event) : Promise(Void) {
    onClickOutside(event)
  }

  fun handleWrapperClick (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    <div::wrapper onClick={handleWrapperClick}>
      for child of children {
        child
      }
    </div>
  }
}

/* ResizeDetector Component - Responsive resize detection */
component ResizeDetector {
  property children : Array(Html) = []

  property onResize =
    (width : Number, height : Number) : Promise(Void) { Promise.never() }

  state width : Number = 0
  state height : Number = 0

  style container {
    position: relative;
    width: 100%;
    height: 100%;
  }

  fun handleResize (event : Html.Event) : Promise(Void) {
    onResize(width, height)
  }

  fun render : Html {
    <div::container>
      for child of children {
        child
      }
    </div>
  }
}

/* InfiniteScroll Component - Infinite scrolling container */
component InfiniteScroll {
  property children : Array(Html) = []
  property hasMore : Bool = true
  property loading : Bool = false
  property onLoadMore = () : Promise(Void) { Promise.never() }

  style container {
    width: 100%;
    height: 100%;
    overflow-y: auto;
  }

  style content {
    min-height: 100%;
  }

  style loading {
    display: flex;
    justify-content: center;
    padding: 2rem;
    color: rgba(255, 255, 255, 0.7);
  }

  style sentinel {
    height: 1px;
    width: 100%;
  }

  fun handleScroll (event : Html.Event) : Promise(Void) {
    if hasMore && !loading {
      onLoadMore()
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div::container onScroll={handleScroll}>
      <div::content>
        for child of children {
          child
        }

        {
          if loading {
            <div::loading>"Cargando más contenido..."</div>
          } else if hasMore {
            <div::sentinel/>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}

/* VirtualList Component - Virtualized list for performance */
component VirtualList {
  property items : Array(String) = []
  property itemHeight : Number = 50
  property containerHeight : Number = 300

  property renderItem =
    (item : String, index : Number) : Html {
      <div>
        {
          item
        }
      </div>
    }

  state scrollTop : Number = 0

  style container {
    height: #{Number.toString(containerHeight)}px;
    overflow-y: auto;
    position: relative;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.1);
  }

  style viewport {
    position: relative;
  }

  style item {
    position: absolute;
    width: 100%;
    left: 0;
    padding: 0.75rem 1rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    color: white;
  }

  fun getTotalHeight : Number {
    Array.size(items) * itemHeight
  }

  fun getVisibleRange : Array(Number) {
    let startIndex =
      Math.floor(scrollTop / itemHeight)

    let endIndex =
      Math.min(Array.size(items) - 1,
        startIndex + Math.ceil(containerHeight / itemHeight) + 1)

    [startIndex, endIndex]
  }

  fun handleScroll (event : Html.Event) : Promise(Void) {
    next { scrollTop: 0 }
  }

  fun render : Html {
    let range =
      getVisibleRange()

    let startIndex =
      Array.at(range, 0)
      |> Maybe.withDefault(0)

    let endIndex =
      Array.at(range, 1)
      |> Maybe.withDefault(0)

    <div::container onScroll={handleScroll}>
      <div::viewport style="height: #{Number.toString(getTotalHeight())}px;">
        {
          for index of Array.range(startIndex, endIndex) {
            let item =
              Array.at(items, index)
              |> Maybe.withDefault("")

            let top =
              index * itemHeight

            <div::item
              style="top: #{Number.toString(top)}px; height: #{Number.toString(
                itemHeight)}px;"
            >renderItem(item, index)</div>
          }
        }
      </div>
    </div>
  }
}

/* FocusTrap Component - Trap focus within component */
component FocusTrap {
  property children : Array(Html) = []
  property active : Bool = true

  style trap {
    position: relative;
  }

  fun handleKeyDown (event : Html.Event) : Promise(Void) {
    /* Focus trap logic would go here in pure Mint */
    /* For now, just return without doing anything */
    Promise.never()
  }

  fun render : Html {
    if active {
      <div::trap onKeyDown={handleKeyDown}>
        for child of children {
          child
        }
      </div>
    } else {
      <div>
        for child of children {
          child
        }
      </div>
    }
  }
}
