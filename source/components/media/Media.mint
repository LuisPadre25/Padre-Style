/* Media Components */

/* Avatar Component - User profile picture */
component Avatar {
  property src : String = ""
  property alt : String = "Avatar"
  property size : String = "md"
  property shape : String = "circle"
  property fallback : String = ""

  connect ThemeStore exposing { currentTheme }

  style avatar {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    backdrop-filter: blur(10px);
    overflow: hidden;
    position: relative;
  }

  fun getAvatarStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style small {
    width: 2rem;
    height: 2rem;
    font-size: 0.75rem;
  }

  style medium {
    width: 3rem;
    height: 3rem;
    font-size: 1rem;
  }

  style large {
    width: 4rem;
    height: 4rem;
    font-size: 1.25rem;
  }

  style xlarge {
    width: 6rem;
    height: 6rem;
    font-size: 1.5rem;
  }

  style circle {
    border-radius: 50%;
  }

  style square {
    border-radius: 8px;
  }

  style rounded {
    border-radius: 12px;
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
  }

  fun getInitials : String {
    if String.isEmpty(fallback) {
      "?"
    } else {
      String.toUpperCase(fallback)
    }
  }

  fun render : Html {
    <div::avatar style={getAvatarStyles()} class="#{size} #{shape}">
      {
        if !String.isEmpty(src) {
          <img::image src={src} alt={alt}/>
        } else {
          <span>
            {
              getInitials()
            }
          </span>
        }
      }
    </div>
  }
}

/* Image Component - Enhanced image with loading states */
component Image {
  property src : String = ""
  property alt : String = ""
  property width : String = "auto"
  property height : String = "auto"
  property objectFit : String = "cover"
  property radius : String = "8px"
  property loading : String = "lazy"

  state isLoaded : Bool = false
  state hasError : Bool = false

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    display: inline-block;
    width: #{width};
    height: #{height};
    border-radius: #{radius};
    overflow: hidden;
    backdrop-filter: blur(10px);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: #{objectFit};
    transition: opacity 0.3s ease;
  }

  style loading {
    opacity: 0;
  }

  style loaded {
    opacity: 1;
  }

  style placeholder {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.875rem;
  }

  fun getPlaceholderStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
    "
  }

  fun getErrorStyles : String {
    "
      background: #{ThemeHelpers.getError(currentTheme)};
    "
  }

  fun handleLoad (event : Html.Event) : Promise(Void) {
    next { isLoaded: true }
  }

  fun handleError (event : Html.Event) : Promise(Void) {
    next { hasError: true }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
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
        loading={loading}
        onLoad={handleLoad}
        onError={handleError}
      />

      {
        if !isLoaded && !hasError {
          <div::placeholder style={getPlaceholderStyles()}>"Cargando..."</div>
        } else if hasError {
          <div::placeholder
            style="#{getPlaceholderStyles()} #{getErrorStyles()}"
          >"Error al cargar"</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* Video Component - Video player with controls */
component Video {
  property src : String = ""
  property poster : String = ""
  property width : String = "100%"
  property height : String = "auto"
  property controls : Bool = true
  property autoplay : Bool = false
  property muted : Bool = false
  property loop : Bool = false

  state isPlaying : Bool = false
  state currentTime : Number = 0
  state duration : Number = 0

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 12px;
    overflow: hidden;
    backdrop-filter: blur(10px);
  }

  fun getVideoContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style video {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  style overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.3) 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
  }

  style visible {
    opacity: 1;
    pointer-events: auto;
  }

  style playButton {
    width: 4rem;
    height: 4rem;
    border-radius: 50%;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);

    &:hover {
      transform: scale(1.1);
    }
  }

  fun getPlayButtonStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style controls {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0%, transparent 100%);
    padding: 1rem;
    display: flex;
    align-items: center;
    gap: 1rem;
    color: white;
  }

  style progressBar {
    flex: 1;
    height: 4px;
    border-radius: 2px;
    overflow: hidden;
    cursor: pointer;
  }

  fun getProgressBarStyles : String {
    "
      background: #{ThemeHelpers.getGlassBg(currentTheme)};
    "
  }

  style progress {
    height: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    transition: width 0.1s ease;
  }

  style time {
    font-size: 0.875rem;
    font-weight: 500;
    min-width: 80px;
    text-align: center;
  }

  fun handlePlay (event : Html.Event) : Promise(Void) {
    next { isPlaying: !isPlaying }
  }

  fun formatTime (seconds : Number) : String {
    let minutes =
      Math.floor(seconds / 60)

    let remainingSeconds =
      Math.floor(seconds % 60)

    let secondsStr =
      if remainingSeconds < 10 {
        "0#{Number.toString(remainingSeconds)}"
      } else {
        Number.toString(remainingSeconds)
      }

    "#{Number.toString(minutes)}:#{secondsStr}"
  }

  fun getProgressPercentage : Number {
    if duration > 0 {
      (currentTime / duration) * 100
    } else {
      0
    }
  }

  fun render : Html {
    <div::container style={getVideoContainerStyles()}>
      <video::video
        src={src}
        poster={poster}
        autoplay={Bool.toString(autoplay)}
        muted={Bool.toString(muted)}
        loop={Bool.toString(loop)}
      />

      {
        if !isPlaying {
          <div::overlay::visible>
            <button::playButton
              style={getPlayButtonStyles()}
              onClick={handlePlay}
            >"▶"</button>
          </div>
        } else {
          <div::overlay/>
        }
      }

      {
        if controls {
          <div::controls>
            <button::playButton
              style="#{getPlayButtonStyles()} width: 2.5rem; height: 2.5rem; font-size: 1rem;"
              onClick={handlePlay}
            >
              {
                if isPlaying {
                  "⏸"
                } else {
                  "▶"
                }
              }
            </button>

            <div::progressBar style={getProgressBarStyles()}>
              <div::progress
                style="width: #{Number.toString(getProgressPercentage())}%"
              />
            </div>

            <div::time>"{formatTime(currentTime)} / {formatTime(duration)}"</div>
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* ImageGallery Component - Gallery with thumbnails */
component ImageGallery {
  property images : Array(String) = []
  property alts : Array(String) = []

  state selectedIndex : Number = 0

  connect ThemeStore exposing { currentTheme }

  style gallery {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    border-radius: 12px;
    padding: 1.5rem;
    backdrop-filter: blur(10px);
  }

  fun getGalleryStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style mainImage {
    width: 100%;
    height: 400px;
    border-radius: 8px;
    overflow: hidden;
  }

  fun getMainImageStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  style thumbnails {
    display: flex;
    gap: 0.5rem;
    overflow-x: auto;
    padding: 0.5rem 0;
  }

  style thumbnail {
    width: 80px;
    height: 80px;
    border-radius: 6px;
    overflow: hidden;
    cursor: pointer;
    transition: all 0.2s ease;
    border: 2px solid transparent;
    flex-shrink: 0;

    &:hover {
      transform: scale(1.05);
      border-color: var(--border-accent, rgba(255, 255, 255, 0.3));
    }
  }

  style selected {
    border-color: #667eea;
    transform: scale(1.05);
  }

  fun handleThumbnailClick (index : Number) : Promise(Void) {
    next { selectedIndex: index }
  }

  fun getSelectedImage : String {
    Array.at(images, selectedIndex)
    |> Maybe.withDefault("")
  }

  fun getSelectedAlt : String {
    Array.at(alts, selectedIndex)
    |> Maybe.withDefault("Gallery image")
  }

  fun render : Html {
    <div::gallery style={getGalleryStyles()}>
      <div::mainImage style={getMainImageStyles()}>
        <Image
          src={getSelectedImage()}
          alt={getSelectedAlt()}
          width="100%"
          height="100%"
        />
      </div>

      <div::thumbnails>
        {
          Array.mapWithIndex(images,
            (image : String, index : Number) {
              <div::thumbnail
                class={
                  if selectedIndex == index {
                    "selected"
                  } else {
                    ""
                  }
                }
              ><Image src={image} alt="Thumbnail" width="100%" height="100%"/></div>
            })
        }
      </div>
    </div>
  }
}

/* Icon Component - SVG icon wrapper */
component Icon {
  property name : String = ""
  property size : String = "md"
  property color : String = "currentColor"

  connect ThemeStore exposing { currentTheme }

  style icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: #{color};
  }

  style small {
    width: 1rem;
    height: 1rem;
  }

  style medium {
    width: 1.5rem;
    height: 1.5rem;
  }

  style large {
    width: 2rem;
    height: 2rem;
  }

  style xlarge {
    width: 3rem;
    height: 3rem;
  }

  fun getIconSvg : String {
    case name {
      "heart" =>
        "<svg viewBox='0 0 24 24' fill='currentColor'><path d='M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z'/></svg>"

      "star" =>
        "<svg viewBox='0 0 24 24' fill='currentColor'><path d='M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z'/></svg>"

      "user" =>
        "<svg viewBox='0 0 24 24' fill='currentColor'><path d='M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2'/><circle cx='12' cy='7' r='4'/></svg>"

      "home" =>
        "<svg viewBox='0 0 24 24' fill='currentColor'><path d='M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z'/><polyline points='9,22 9,12 15,12 15,22'/></svg>"

      "check" =>
        "<svg viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2'><polyline points='20,6 9,17 4,12'/></svg>"

      "x" =>
        "<svg viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2'><line x1='18' y1='6' x2='6' y2='18'/><line x1='6' y1='6' x2='18' y2='18'/></svg>"

      _ =>
        "<svg viewBox='0 0 24 24' fill='currentColor'><circle cx='12' cy='12' r='3'/></svg>"
    }
  }

  fun getIconEmoji : String {
    case name {
      "heart" => "❤️"
      "star" => "⭐"
      "user" => "👤"
      "home" => "🏠"
      "check" => "✅"
      "x" => "❌"
      _ => "🔹"
    }
  }

  fun render : Html {
    <div::icon class={size}>
      {
        getIconEmoji()
      }
    </div>
  }
}
