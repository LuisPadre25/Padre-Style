/* ImageComponents - Advanced Image Components */

/* AdvancedLightbox - Lightbox mejorado con navegación, swipe, keyboard y lazy loading */
component AdvancedLightbox {
  property images : Array(String) = []
  property alts : Array(String) = []
  property startIndex : Number = 0
  property isOpen : Bool = false

  property onClose : Function(Html.Event, Promise(Void)) =
    (event : Html.Event) { Promise.resolve(void) }

  property enableKeyboard : Bool = true
  property enableSwipe : Bool = true
  property showCounter : Bool = true

  state currentIndex : Number = 0
  state scale : Number = 1
  state rotation : Number = 0
  state touchStartX : Number = 0
  state touchEndX : Number = 0
  state isTransitioning : Bool = false
  state loadedImages : Array(Bool) = []

  connect ThemeStore exposing { currentTheme }

  fun componentDidMount : Promise(Void) {
    if enableKeyboard {
      `(() => {
        const h = (e) => {
          if (!#{isOpen}) return;
          switch(e.key) {
            case 'Escape': this.handleEscapeKey(); break;
            case 'ArrowLeft': this.handlePreviousKeyboard(); break;
            case 'ArrowRight': this.handleNextKeyboard(); break;
          }
        };
        document.addEventListener('keydown', h);
        window._lightboxKeyHandler = h;
      })()`
    } else {
      `void 0`
    }

    Promise.resolve(void)
  }

  fun componentWillUnmount : Promise(Void) {
    `(() => {
      if (window._lightboxKeyHandler) {
        document.removeEventListener('keydown', window._lightboxKeyHandler);
        delete window._lightboxKeyHandler;
      }
    })()`

    Promise.resolve(void)
  }

  style overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.97);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    backdrop-filter: blur(20px);
    animation: fadeIn 0.3s ease;
  }

  style hidden {
    display: none;
  }

  style imageContainer {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    touch-action: pan-y pinch-zoom;
  }

  style image {
    max-width: 90vw;
    max-height: 90vh;
    object-fit: contain;
    transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.3s ease;
    user-select: none;
  }

  style imageLoading {
    opacity: 0.3;
    filter: blur(20px);
    transform: scale(0.95);
  }

  style imageLoaded {
    opacity: 1;
    filter: blur(0);
    transform: scale(1);
  }

  style navButton {
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
    width: 4rem;
    height: 4rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    font-size: 2rem;
    backdrop-filter: blur(20px);
    transition: all 0.3s ease;
    z-index: 10000;
    display: flex;
    align-items: center;
    justify-content: center;

    &:hover {
      transform: translateY(-50%) scale(1.1);
    }

    &:active {
      transform: translateY(-50%) scale(0.95);
    }
  }

  fun getNavButtonStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style navLeft {
    left: 2rem;
  }

  style navRight {
    right: 2rem;
  }

  style closeButton {
    position: fixed;
    top: 2rem;
    right: 2rem;
    width: 3.5rem;
    height: 3.5rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    font-size: 1.75rem;
    backdrop-filter: blur(20px);
    transition: all 0.3s ease;
    z-index: 10001;

    &:hover {
      transform: scale(1.1) rotate(90deg);
    }
  }

  fun getCloseButtonStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style counter {
    position: fixed;
    top: 2rem;
    left: 50%;
    transform: translateX(-50%);
    backdrop-filter: blur(20px);
    padding: 0.75rem 1.5rem;
    border-radius: 50px;
    font-weight: 600;
    font-size: 0.875rem;
    z-index: 10001;
  }

  fun getCounterStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style controls {
    position: fixed;
    bottom: 2rem;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 0.75rem;
    backdrop-filter: blur(20px);
    padding: 1rem 1.5rem;
    border-radius: 50px;
    z-index: 10001;
  }

  fun getControlsStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style controlButton {
    width: 2.5rem;
    height: 2.5rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    font-size: 1.125rem;
    transition: all 0.2s ease;

    &:hover {
      transform: scale(1.1);
    }
  }

  fun getControlButtonStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun handlePrevious (event : Html.Event) : Promise(Void) {
    if currentIndex > 0 && !isTransitioning {
      next {
        currentIndex: currentIndex - 1,
        scale: 1,
        rotation: 0,
        isTransitioning: true
      }

      `setTimeout(() => this.resetTransition(), 300)`
      Promise.resolve(void)
    } else {
      Promise.resolve(void)
    }
  }

  fun resetTransition : Promise(Void) {
    next { isTransitioning: false }
  }

  fun handleNext (event : Html.Event) : Promise(Void) {
    let maxIndex =
      Array.size(images) - 1

    if currentIndex < maxIndex && !isTransitioning {
      next {
        currentIndex: currentIndex + 1,
        scale: 1,
        rotation: 0,
        isTransitioning: true
      }

      `setTimeout(() => this.resetTransition(), 300)`
      Promise.resolve(void)
    } else {
      Promise.resolve(void)
    }
  }

  fun handlePreviousKeyboard : Promise(Void) {
    if currentIndex > 0 {
      next { currentIndex: currentIndex - 1, scale: 1, rotation: 0 }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleNextKeyboard : Promise(Void) {
    let maxIndex =
      Array.size(images) - 1

    if currentIndex < maxIndex {
      next { currentIndex: currentIndex + 1, scale: 1, rotation: 0 }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleEscapeKey : Promise(Void) {
    `new Event('click')`
    |> onClose
  }

  fun handleTouchStart (event : Html.Event) : Promise(Void) {
    if enableSwipe {
      let x =
        `#{event}.touches[0].clientX` as Number

      next { touchStartX: x }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleTouchEnd (event : Html.Event) : Promise(Void) {
    if enableSwipe {
      let x =
        `#{event}.changedTouches[0].clientX` as Number

      next { touchEndX: x }

      let diff =
        touchStartX - x

      if diff > 50 {
        handleNext(event)
      } else if diff < -50 {
        handlePrevious(event)
      } else {
        Promise.resolve(void)
      }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleZoomIn (event : Html.Event) : Promise(Void) {
    if scale < 3 {
      next { scale: scale + 0.5 }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleZoomOut (event : Html.Event) : Promise(Void) {
    if scale > 0.5 {
      next { scale: scale - 0.5 }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleRotate (event : Html.Event) : Promise(Void) {
    next { rotation: rotation + 90 }
  }

  fun handleReset (event : Html.Event) : Promise(Void) {
    next { scale: 1, rotation: 0 }
  }

  fun handleDownload (event : Html.Event) : Promise(Void) {
    let currentImage =
      Array.at(images, currentIndex)
      |> Maybe.withDefault("")

    `(() => {
      const l = document.createElement('a');
      l.href = #{currentImage};
      l.download = 'image_' + Date.now() + '.jpg';
      document.body.appendChild(l);
      l.click();
      document.body.removeChild(l);
    })()`

    Promise.resolve(void)
  }

  fun getImageTransform : String {
    "transform: scale(#{Number.toString(scale)}) rotate(#{Number.toString(
      rotation)}deg);"
  }

  fun getCurrentImage : String {
    Array.at(images, currentIndex)
    |> Maybe.withDefault("")
  }

  fun getCurrentAlt : String {
    Array.at(alts, currentIndex)
    |> Maybe.withDefault("Image")
  }

  fun getCounterText : String {
    "#{Number.toString(currentIndex + 1)} / #{Number.toString(
      Array.size(images))}"
  }

  fun stopPropagation (event : Html.Event) : Promise(Void) {
    `#{event}.stopPropagation()`
    Promise.resolve(void)
  }

  fun render : Html {
    if isOpen {
      <div::overlay onClick={onClose}>
        <button::closeButton style={getCloseButtonStyles()} onClick={onClose}>
          "✕"
        </button>

        {
          if showCounter && Array.size(images) > 1 {
            <div::counter style={getCounterStyles()}>
              {
                getCounterText()
              }
            </div>
          } else {
            <div/>
          }
        }

        {
          if Array.size(images) > 1 && currentIndex > 0 {
            <button::navButton::navLeft
              style={getNavButtonStyles()}
              onClick={handlePrevious}
            >"‹"</button>
          } else {
            <div/>
          }
        }

        {
          if Array.size(images) > 1 && currentIndex < Array.size(images) - 1 {
            <button::navButton::navRight
              style={getNavButtonStyles()}
              onClick={handleNext}
            >"›"</button>
          } else {
            <div/>
          }
        }

        <div::imageContainer
          onClick={stopPropagation}
          onTouchStart={handleTouchStart}
          onTouchEnd={handleTouchEnd}
        >
          <img::image
            src={getCurrentImage()}
            alt={getCurrentAlt()}
            style={getImageTransform()}
          />
        </div>

        <div::controls style={getControlsStyles()} onClick={stopPropagation}>
          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleZoomOut}
            title="Alejar"
          >"−"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleZoomIn}
            title="Acercar"
          >"+"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleRotate}
            title="Rotar"
          >"↻"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleReset}
            title="Resetear"
          >"⟲"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleDownload}
            title="Descargar"
          >"⬇"</button>
        </div>
      </div>
    } else {
      <div::hidden/>
    }
  }
}

/* LazyImage - Imagen con lazy loading y placeholder blur (LQIP) */
component LazyImage {
  property src : String = ""
  property placeholder : String = ""
  property alt : String = ""
  property width : String = "100%"
  property height : String = "auto"
  property objectFit : String = "cover"
  property borderRadius : String = "8px"

  property onClick : Function(Html.Event, Promise(Void)) =
    (event : Html.Event) { Promise.resolve(void) }

  state isLoaded : Bool = false
  state isInView : Bool = false
  state hasError : Bool = false

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    overflow: hidden;
    border-radius: #{borderRadius};
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }

  style placeholder {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: #{objectFit};
    filter: blur(20px);
    transform: scale(1.1);
    transition: opacity 0.5s ease;
  }

  style placeholderHidden {
    opacity: 0;
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: #{objectFit};
    opacity: 0;
    transform: scale(1.05);
    transition: opacity 0.6s ease, transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
  }

  style imageLoaded {
    opacity: 1;
    transform: scale(1);
  }

  style skeleton {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    background: linear-gradient(
                90deg,
                rgba(255, 255, 255, 0.05) 0%,
                rgba(255, 255, 255, 0.15) 50%,
                rgba(255, 255, 255, 0.05) 100%
                );

    background-size: 200% 100%;
    animation: shimmer 2s infinite;
  }

  style errorContainer {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
  }

  fun getErrorContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  style errorIcon {
    font-size: 2rem;
    opacity: 0.5;
  }

  style errorText {
    font-size: 0.75rem;
    opacity: 0.7;
  }

  fun handleLoad (event : Html.Event) : Promise(Void) {
    next { isLoaded: true }
  }

  fun handleError (event : Html.Event) : Promise(Void) {
    next { hasError: true }
  }

  fun componentDidMount : Promise(Void) {
    next { isInView: true }
  }

  fun render : Html {
    <div::container onClick={onClick} data-lazy-image="true">
      {
        if hasError {
          <div::errorContainer style={getErrorContainerStyles()}>
            <div::errorIcon>"🖼️"</div>
            <div::errorText>"Error al cargar imagen"</div>
          </div>
        } else if !isInView {
          <div::skeleton/>
        } else {
          <>
            {
              if placeholder != "" {
                <img::placeholder
                  class={
                    if isLoaded {
                      "placeholderHidden"
                    } else {
                      ""
                    }
                  }
                  src={placeholder}
                  alt={alt}
                />
              } else {
                <div::skeleton/>
              }
            }

            <img::image
              class={
                if isLoaded {
                  "imageLoaded"
                } else {
                  ""
                }
              }
              src={src}
              alt={alt}
              onLoad={handleLoad}
              onError={handleError}
              loading="lazy"
            />
          </>
        }
      }
    </div>
  }
}

/* ImageComponents - Advanced Image Components */

/* ImageCarousel - Carrusel de imágenes con navegación y autoplay */
component ImageCarousel {
  property images : Array(String) = []
  property alts : Array(String) = []
  property autoPlay : Bool = false
  property interval : Number = 3000
  property showThumbnails : Bool = true
  property enableZoom : Bool = true

  state currentIndex : Number = 0
  state isZoomed : Bool = false
  state isPaused : Bool = false

  connect ThemeStore exposing { currentTheme }

  style carousel {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    border-radius: 16px;
    padding: 1.5rem;
    backdrop-filter: blur(10px);
    position: relative;
  }

  fun getCarouselStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style mainContainer {
    position: relative;
    width: 100%;
    height: 500px;
    border-radius: 12px;
    overflow: hidden;
  }

  style mainImage {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
    cursor: zoom-in;
  }

  style zoomed {
    transform: scale(2);
    cursor: zoom-out;
  }

  style navButton {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
    backdrop-filter: blur(10px);
    transition: all 0.2s ease;
    z-index: 10;

    &:hover {
      transform: translateY(-50%) scale(1.1);
    }
  }

  fun getNavButtonStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style prevButton {
    left: 1rem;
  }

  style nextButton {
    right: 1rem;
  }

  style indicators {
    display: flex;
    justify-content: center;
    gap: 0.5rem;
    position: absolute;
    bottom: 1rem;
    left: 50%;
    transform: translateX(-50%);
    z-index: 10;
  }

  style indicator {
    width: 10px;
    height: 10px;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);

    &:hover {
      transform: scale(1.2);
    }
  }

  fun getIndicatorStyles (active : Bool) : String {
    if active {
      "
        background: #{ThemeHelpers.getAccent(currentTheme)};
        width: 24px;
        border-radius: 5px;
      "
    } else {
      "
        background: #{ThemeHelpers.getTextSecondary(currentTheme)};
        opacity: 0.5;
      "
    }
  }

  style thumbnails {
    display: flex;
    gap: 0.75rem;
    overflow-x: auto;
    padding: 0.5rem 0;
    scrollbar-width: thin;
  }

  style thumbnail {
    width: 100px;
    height: 100px;
    border-radius: 8px;
    overflow: hidden;
    cursor: pointer;
    transition: all 0.3s ease;
    border: 3px solid transparent;
    flex-shrink: 0;

    &:hover {
      transform: translateY(-4px);
    }
  }

  fun getThumbnailStyles (active : Bool) : String {
    if active {
      "
        border-color: #{ThemeHelpers.getAccent(currentTheme)};
        box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
        transform: translateY(-4px);
      "
    } else {
      "
        border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
        opacity: 0.7;
      "
    }
  }

  style thumbnailImage {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  style playPauseButton {
    position: absolute;
    top: 1rem;
    right: 1rem;
    width: 2.5rem;
    height: 2.5rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    backdrop-filter: blur(10px);
    z-index: 10;
    font-size: 1rem;
    transition: all 0.2s ease;

    &:hover {
      transform: scale(1.1);
    }
  }

  fun goToNext (event : Html.Event) : Promise(Void) {
    let newIndex =
      if currentIndex >= Array.size(images) - 1 {
        0
      } else {
        currentIndex + 1
      }

    next { currentIndex: newIndex, isZoomed: false }
  }

  fun goToPrev (event : Html.Event) : Promise(Void) {
    let newIndex =
      if currentIndex <= 0 {
        Array.size(images) - 1
      } else {
        currentIndex - 1
      }

    next { currentIndex: newIndex, isZoomed: false }
  }

  fun goToIndex (index : Number, event : Html.Event) : Promise(Void) {
    next { currentIndex: index, isZoomed: false }
  }

  fun toggleZoom (event : Html.Event) : Promise(Void) {
    if enableZoom {
      next { isZoomed: !isZoomed }
    } else {
      Promise.resolve(void)
    }
  }

  fun togglePlayPause (event : Html.Event) : Promise(Void) {
    next { isPaused: !isPaused }
  }

  fun getCurrentImage : String {
    Array.at(images, currentIndex)
    |> Maybe.withDefault("")
  }

  fun getCurrentAlt : String {
    Array.at(alts, currentIndex)
    |> Maybe.withDefault("Carousel image")
  }

  fun render : Html {
    if Array.isEmpty(images) {
      <div>"No hay imágenes para mostrar"</div>
    } else {
      <div::carousel style={getCarouselStyles()}>
        <div::mainContainer>
          <img::mainImage
            class={
              if isZoomed {
                "zoomed"
              } else {
                ""
              }
            }
            src={getCurrentImage()}
            alt={getCurrentAlt()}
            onClick={toggleZoom}
          />

          <button::navButton::prevButton
            style={getNavButtonStyles()}
            onClick={goToPrev}
          >"‹"</button>

          <button::navButton::nextButton
            style={getNavButtonStyles()}
            onClick={goToNext}
          >"›"</button>

          <div::indicators>
            {
              Array.mapWithIndex(images,
                (image : String, index : Number) {
                  <button::indicator
                    style={getIndicatorStyles(currentIndex == index)}
                    onClick={(event : Html.Event) { goToIndex(index, event) }}
                  />
                })
            }
          </div>

          {
            if autoPlay {
              <button::playPauseButton
                style={getNavButtonStyles()}
                onClick={togglePlayPause}
              >
                {
                  if isPaused {
                    "▶"
                  } else {
                    "⏸"
                  }
                }
              </button>
            } else {
              <div/>
            }
          }
        </div>

        {
          if showThumbnails && Array.size(images) > 1 {
            <div::thumbnails>
              {
                Array.mapWithIndex(images,
                  (image : String, index : Number) {
                    <div::thumbnail
                      style={getThumbnailStyles(currentIndex == index)}
                      onClick={(event : Html.Event) { goToIndex(index, event) }}
                    ><img::thumbnailImage src={image} alt="Thumbnail"/></div>
                  })
              }
            </div>
          } else {
            <div/>
          }
        }
      </div>
    }
  }
}

/* ImageZoom - Componente de imagen con zoom avanzado */
component ImageZoom {
  property src : String = ""
  property alt : String = ""
  property width : String = "100%"
  property height : String = "600px"
  property zoomLevel : Number = 2

  state isZoomed : Bool = false
  state zoomX : Number = 50
  state zoomY : Number = 50

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 12px;
    overflow: hidden;
    cursor: zoom-in;
    backdrop-filter: blur(10px);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: contain;
    transition: transform 0.3s ease;
    transform-origin: center;
  }

  style zoomedImage {
    cursor: zoom-out;
  }

  style zoomIndicator {
    position: absolute;
    top: 1rem;
    right: 1rem;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    backdrop-filter: blur(10px);
    font-size: 0.875rem;
    font-weight: 600;
    pointer-events: none;
  }

  fun getZoomIndicatorStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    next { isZoomed: !isZoomed }
  }

  fun handleMouseMove (event : Html.Event) : Promise(Void) {
    if isZoomed {
      let x = `(() => {
        const r = #{event}.target.getBoundingClientRect();
        return ((#{event}.clientX - r.left) / r.width) * 100;
      })()` as Number

      let y = `(() => {
        const r = #{event}.target.getBoundingClientRect();
        return ((#{event}.clientY - r.top) / r.height) * 100;
      })()` as Number

      next { zoomX: x, zoomY: y }
    } else {
      Promise.resolve(void)
    }
  }

  fun getTransformStyle : String {
    if isZoomed {
      "transform: scale(#{Number.toString(zoomLevel)}); transform-origin: #{Number.toString(
        zoomX)}% #{Number.toString(zoomY)}%;"
    } else {
      ""
    }
  }

  fun render : Html {
    <div::container
      style={getContainerStyles()}
      onClick={handleClick}
      onMouseMove={handleMouseMove}
    >
      <img::image
        class={
          if isZoomed {
            "zoomedImage"
          } else {
            ""
          }
        }
        style={getTransformStyle()}
        src={src}
        alt={alt}
      />

      {
        if isZoomed {
          <div::zoomIndicator style={getZoomIndicatorStyles()}>
            "🔍 #{Number.toString(zoomLevel)}x"
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* ImageLightbox - Modal para ver imágenes en pantalla completa */
component ImageLightbox {
  property src : String = ""
  property alt : String = ""
  property isOpen : Bool = false

  property onClose : Function(Html.Event, Promise(Void)) =
    (event : Html.Event) { Promise.resolve(void) }

  state scale : Number = 1
  state rotation : Number = 0

  connect ThemeStore exposing { currentTheme }

  style overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.95);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    backdrop-filter: blur(10px);
    animation: fadeIn 0.3s ease;
  }

  style hidden {
    display: none;
  }

  style imageContainer {
    max-width: 90vw;
    max-height: 90vh;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  style image {
    max-width: 100%;
    max-height: 90vh;
    object-fit: contain;
    transition: transform 0.3s ease;
  }

  style controls {
    position: fixed;
    bottom: 2rem;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 1rem;
    backdrop-filter: blur(20px);
    padding: 1rem 1.5rem;
    border-radius: 50px;
  }

  fun getControlsStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style controlButton {
    width: 2.5rem;
    height: 2.5rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    font-size: 1.25rem;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);

    &:hover {
      transform: scale(1.1);
    }
  }

  fun getControlButtonStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style closeButton {
    position: fixed;
    top: 2rem;
    right: 2rem;
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    border: none;
    cursor: pointer;
    font-size: 1.5rem;
    backdrop-filter: blur(20px);
    transition: all 0.2s ease;

    &:hover {
      transform: scale(1.1) rotate(90deg);
    }
  }

  fun getCloseButtonStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun handleZoomIn (event : Html.Event) : Promise(Void) {
    next { scale: scale + 0.25 }
  }

  fun handleZoomOut (event : Html.Event) : Promise(Void) {
    let newScale =
      if scale > 0.5 {
        scale - 0.25
      } else {
        0.5
      }

    next { scale: newScale }
  }

  fun handleRotate (event : Html.Event) : Promise(Void) {
    next { rotation: rotation + 90 }
  }

  fun handleReset (event : Html.Event) : Promise(Void) {
    next { scale: 1, rotation: 0 }
  }

  fun getImageTransform : String {
    "transform: scale(#{Number.toString(scale)}) rotate(#{Number.toString(
      rotation)}deg);"
  }

  fun render : Html {
    if isOpen {
      <div::overlay onClick={onClose}>
        <button::closeButton style={getCloseButtonStyles()} onClick={onClose}>
          "✕"
        </button>

        <div::imageContainer
          onClick={(event : Html.Event) { Promise.resolve(void) }}
        ><img::image style={getImageTransform()} src={src} alt={alt}/></div>

        <div::controls style={getControlsStyles()}>
          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleZoomOut}
          >"−"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleReset}
          >"⟲"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleZoomIn}
          >"+"</button>

          <button::controlButton
            style={getControlButtonStyles()}
            onClick={handleRotate}
          >"↻"</button>
        </div>
      </div>
    } else {
      <div::hidden/>
    }
  }
}

/* ImageMasonry - Grid de imágenes estilo Pinterest */
component ImageMasonry {
  property images : Array(String) = []
  property columns : Number = 3
  property gap : String = "1rem"

  connect ThemeStore exposing { currentTheme }

  style container {
    column-count: #{Number.toString(columns)};
    column-gap: #{gap};
    width: 100%;
  }

  style imageItem {
    break-inside: avoid;
    margin-bottom: #{gap};
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    cursor: pointer;

    &:hover {
      transform: scale(1.02);
    }
  }

  fun getImageItemStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: auto;
    display: block;
  }

  fun render : Html {
    <div::container>
      {
        Array.map(images,
          (image : String) {
            <div::imageItem style={getImageItemStyles()}>
              <img::image src={image} alt="Masonry image"/>
            </div>
          })
      }
    </div>
  }
}

/* ImageParallax - Imagen con efecto parallax */
component ImageParallax {
  property src : String = ""
  property alt : String = ""
  property height : String = "400px"
  property speed : Number = 0.5

  state scrollY : Number = 0

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    height: #{height};
    overflow: hidden;
    border-radius: 16px;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 120%;
    object-fit: cover;
  }

  fun getImageTransform : String {
    "transform: translateY(#{Number.toString(scrollY * speed)}px);"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <img::image style={getImageTransform()} src={src} alt={alt}/>
    </div>
  }
}

/* ImageHoverZoom - Zoom al pasar el mouse */
component ImageHoverZoom {
  property src : String = ""
  property alt : String = ""
  property height : String = "300px"

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    height: #{height};
    overflow: hidden;
    border-radius: 12px;
    cursor: pointer;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;

    &:hover {
      transform: scale(1.2);
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <img::image src={src} alt={alt}/>
    </div>
  }
}

/* ImageOverlay - Imagen con overlay de información */
component ImageOverlay {
  property src : String = ""
  property title : String = ""
  property description : String = ""
  property height : String = "300px"

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    height: #{height};
    overflow: hidden;
    border-radius: 16px;
    cursor: pointer;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
  }

  style overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 1.5rem;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.9) 0%, transparent 100%);
    transform: translateY(100%);
    transition: transform 0.3s ease;
    color: white;
  }

  style containerHover {
    &:hover .overlay {
      transform: translateY(0);
    }

    &:hover .image {
      transform: scale(1.1);
    }
  }

  style overlayTitle {
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
    color: white;
  }

  style overlayDescription {
    font-size: 0.875rem;
    opacity: 0.9;
    color: white;
  }

  fun render : Html {
    <div::container::containerHover style={getContainerStyles()}>
      <img::image src={src} alt={title}/>

      <div::overlay>
        <div::overlayTitle>
          {
            title
          }
        </div>

        <div::overlayDescription>
          {
            description
          }
        </div>
      </div>
    </div>
  }
}

/* ImageGrid - Grid responsive de imágenes */
component ImageGrid {
  property images : Array(String) = []
  property columns : Number = 4
  property aspectRatio : String = "1/1"
  property gap : String = "1rem"

  connect ThemeStore exposing { currentTheme }

  style grid {
    display: grid;
    grid-template-columns: repeat(#{Number.toString(columns)}, 1fr);
    gap: #{gap};
    width: 100%;

    @media (max-width: 1024px) {
      grid-template-columns: repeat(3, 1fr);
    }

    @media (max-width: 768px) {
      grid-template-columns: repeat(2, 1fr);
    }

    @media (max-width: 480px) {
      grid-template-columns: 1fr;
    }
  }

  style gridItem {
    aspect-ratio: #{aspectRatio};
    overflow: hidden;
    border-radius: 12px;
    transition: all 0.3s ease;
    cursor: pointer;

    &:hover {
      transform: translateY(-4px);
    }
  }

  fun getGridItemStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;

    &:hover {
      transform: scale(1.05);
    }
  }

  fun render : Html {
    <div::grid>
      {
        Array.map(images,
          (image : String) {
            <div::gridItem style={getGridItemStyles()}>
              <img::image src={image} alt="Grid image"/>
            </div>
          })
      }
    </div>
  }
}

/* ImageLazyLoad - Imagen con lazy loading visual */
component ImageLazyLoad {
  property src : String = ""
  property placeholder : String = ""
  property alt : String = ""
  property height : String = "300px"

  state isLoaded : Bool = false
  state hasError : Bool = false

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    height: #{height};
    overflow: hidden;
    border-radius: 12px;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: opacity 0.5s ease;
  }

  style loading {
    opacity: 0;
  }

  style loaded {
    opacity: 1;
  }

  style placeholderImg {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    filter: blur(20px);
    transform: scale(1.1);
  }

  style loader {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 3rem;
    height: 3rem;
    border: 4px solid rgba(255, 255, 255, 0.2);
    border-top-color: white;
    border-radius: 50%;
    animation: spin 1s linear infinite;
  }

  fun handleLoad (event : Html.Event) : Promise(Void) {
    next { isLoaded: true }
  }

  fun handleError (event : Html.Event) : Promise(Void) {
    next { hasError: true }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        if !String.isEmpty(placeholder) && !isLoaded {
          <img::placeholderImg src={placeholder} alt=""/>
        } else {
          <div/>
        }
      }

      <img::image
        class={
          if isLoaded {
            "loaded"
          } else {
            "loading"
          }
        }
        src={src}
        alt={alt}
        onLoad={handleLoad}
        onError={handleError}
        loading="lazy"
      />

      {
        if !isLoaded && !hasError {
          <div::loader/>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* ImageFilter - Imagen con filtros CSS */
component ImageFilter {
  property src : String = ""
  property alt : String = ""
  property filter : String = "none"
  property height : String = "300px"

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    height: #{height};
    overflow: hidden;
    border-radius: 12px;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: filter 0.3s ease;
  }

  fun getImageFilter : String {
    case filter {
      "grayscale" => "filter: grayscale(100%);"
      "sepia" => "filter: sepia(100%);"
      "blur" => "filter: blur(5px);"
      "brightness" => "filter: brightness(1.5);"
      "contrast" => "filter: contrast(1.5);"
      "saturate" => "filter: saturate(2);"
      "hue-rotate" => "filter: hue-rotate(180deg);"
      "invert" => "filter: invert(100%);"
      "vintage" => "filter: sepia(50%) contrast(1.2) brightness(0.9);"
      _ => "filter: none;"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <img::image style={getImageFilter()} src={src} alt={alt}/>
    </div>
  }
}

/* ImageComparison - Comparar dos imágenes con slider */
component ImageComparison {
  property beforeImage : String = ""
  property afterImage : String = ""
  property beforeLabel : String = "Antes"
  property afterLabel : String = "Después"

  state sliderPosition : Number = 50

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: 100%;
    height: 500px;
    border-radius: 16px;
    overflow: hidden;
    cursor: ew-resize;
    backdrop-filter: blur(10px);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style imageWrapper {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    user-select: none;
  }

  style afterWrapper {
    clip-path: inset(0 0 0 #{Number.toString(sliderPosition)}%);
  }

  style slider {
    position: absolute;
    top: 0;
    bottom: 0;
    width: 4px;
    left: #{Number.toString(sliderPosition)}%;
    transform: translateX(-50%);
    cursor: ew-resize;
    z-index: 10;
  }

  fun getSliderStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style sliderHandle {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.25rem;
    cursor: ew-resize;
    backdrop-filter: blur(10px);
  }

  fun getSliderHandleStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style label {
    position: absolute;
    top: 1rem;
    padding: 0.5rem 1rem;
    border-radius: 8px;
    backdrop-filter: blur(10px);
    font-size: 0.875rem;
    font-weight: 600;
    pointer-events: none;
  }

  fun getLabelStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  style beforeLabel {
    left: 1rem;
  }

  style afterLabel {
    right: 1rem;
  }

  fun handleMouseMove (event : Html.Event) : Promise(Void) {
    let percentage = `(() => {
      const r = #{event}.currentTarget.getBoundingClientRect();
      const x = #{event}.clientX - r.left;
      return Math.max(0, Math.min(100, (x / r.width) * 100));
    })()` as Number

    next { sliderPosition: percentage }
  }

  fun render : Html {
    <div::container style={getContainerStyles()} onMouseMove={handleMouseMove}>
      <div::imageWrapper><img::image src={beforeImage} alt={beforeLabel}/></div>

      <div::imageWrapper::afterWrapper>
        <img::image src={afterImage} alt={afterLabel}/>
      </div>

      <div::slider style={getSliderStyles()}>
        <div::sliderHandle style={getSliderHandleStyles()}>"⇄"</div>
      </div>

      <div::label::beforeLabel style={getLabelStyles()}>
        {
          beforeLabel
        }
      </div>

      <div::label::afterLabel style={getLabelStyles()}>
        {
          afterLabel
        }
      </div>
    </div>
  }
}
