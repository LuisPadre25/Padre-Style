/* VideoPlayer - 100% Custom Video Player con Mint Lang */

/* CustomVideoPlayer - Reproductor de video completamente personalizado */
component CustomVideoPlayer {
  property src : String = ""
  property poster : String = ""
  property width : String = "100%"
  property height : String = "500px"
  property autoplay : Bool = false
  property loop : Bool = false

  state isPlaying : Bool = false
  state currentTime : Number = 0
  state duration : Number = 0
  state volume : Number = 1
  state isMuted : Bool = false
  state playbackRate : Number = 1
  state isFullscreen : Bool = false
  state showControls : Bool = true
  state buffered : Number = 0
  state seeking : Bool = false
  state isLoading : Bool = false
  state hasError : Bool = false
  state errorMessage : String = ""
  state isWaiting : Bool = false
  state canPlay : Bool = false
  state retryCount : Number = 0
  state isDownloading : Bool = false
  state downloadProgress : Number = 0

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 16px;
    overflow: hidden;
    backdrop-filter: blur(10px);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  style video {
    width: 100%;
    height: 100%;
    object-fit: contain;
    background: #000;
    cursor: pointer;
  }

  style videoArea {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    cursor: pointer;
    z-index: 1;
  }

  style controlsOverlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 1.5rem;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.9) 0%, transparent 100%);
    transition: opacity 0.3s ease, transform 0.3s ease;
    transform: translateY(0);
    z-index: 10;
  }

  style controlsHidden {
    opacity: 0;
    transform: translateY(100%);
    pointer-events: none;
  }

  style progressContainer {
    margin-bottom: 1rem;
    cursor: pointer;
  }

  style progressBar {
    width: 100%;
    height: 6px;
    border-radius: 3px;
    position: relative;
    overflow: hidden;
  }

  fun getProgressBarStyles : String {
    "
      background: #{ThemeHelpers.getDivider(currentTheme)};
    "
  }

  style bufferedBar {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    background: rgba(255, 255, 255, 0.3);
    transition: width 0.2s ease;
  }

  style currentProgress {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
    transition: width 0.1s ease;
  }

  style progressThumb {
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
    cursor: pointer;
    transition: transform 0.2s ease;

    &:hover {
      transform: translate(-50%, -50%) scale(1.2);
    }
  }

  style controlsRow {
    display: flex;
    align-items: center;
    gap: 1rem;
    color: white;
  }

  style controlButton {
    background: transparent;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 1.25rem;
    padding: 0.5rem;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    min-width: 2.5rem;
    height: 2.5rem;

    &:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: scale(1.1);
    }
  }

  style volumeContainer {
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  style volumeSlider {
    width: 80px;
    height: 4px;
    border-radius: 2px;
    background: rgba(255, 255, 255, 0.3);
    position: relative;
    cursor: pointer;
  }

  style volumeProgress {
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    background: white;
    border-radius: 2px;
  }

  style timeDisplay {
    font-size: 0.875rem;
    font-weight: 500;
    color: white;
    min-width: 100px;
    text-align: center;
    font-family: monospace;
  }

  style spacer {
    flex: 1;
  }

  style speedButton {
    background: rgba(255, 255, 255, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.3);
    color: white;
    cursor: pointer;
    font-size: 0.875rem;
    padding: 0.375rem 0.75rem;
    border-radius: 6px;
    font-weight: 600;
    transition: all 0.2s ease;

    &:hover {
      background: rgba(255, 255, 255, 0.25);
      transform: scale(1.05);
    }
  }

  style bigPlayButton {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 5rem;
    height: 5rem;
    border-radius: 50%;
    background: rgba(102, 126, 234, 0.95);
    border: none;
    color: white;
    font-size: 2rem;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    z-index: 15;

    &:hover {
      transform: translate(-50%, -50%) scale(1.1);
      background: rgba(102, 126, 234, 1);
    }
  }

  style loadingSpinner {
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

  style errorOverlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.8);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;
    padding: 2rem;
    text-align: center;
    z-index: 20;
  }

  style errorIcon {
    font-size: 3rem;
    margin-bottom: 1rem;
  }

  style errorMessage {
    font-size: 1rem;
    margin-bottom: 1.5rem;
    max-width: 400px;
  }

  style retryButton {
    background: rgba(102, 126, 234, 0.95);
    border: none;
    color: white;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      background: rgba(102, 126, 234, 1);
      transform: scale(1.05);
    }
  }

  style bufferingIndicator {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
    font-size: 0.875rem;
    font-weight: 500;
    z-index: 15;
  }

  style bufferingText {
    margin-top: 1rem;
    background: rgba(0, 0, 0, 0.6);
    padding: 0.5rem 1rem;
    border-radius: 6px;
  }

  style downloadIndicator {
    position: absolute;
    top: 1rem;
    right: 1rem;
    background: rgba(102, 126, 234, 0.95);
    color: white;
    padding: 0.75rem 1.25rem;
    border-radius: 8px;
    font-size: 0.875rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    z-index: 25;
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
  }

  style downloadProgressBar {
    width: 100px;
    height: 4px;
    background: rgba(255, 255, 255, 0.3);
    border-radius: 2px;
    overflow: hidden;
  }

  style downloadProgressFill {
    height: 100%;
    background: white;
    border-radius: 2px;
    transition: width 0.3s ease;
  }

  fun togglePlay (event : Html.Event) : Promise(Void) {
    `document.querySelector('video')?.paused ?
      document.querySelector('video')?.play() :
      document.querySelector('video')?.pause()`

    Promise.resolve(void)
  }

  fun handleVideoAreaClick (event : Html.Event) : Promise(Void) {
    togglePlay(event)
  }

  fun handleTimeUpdate (event : Html.Event) : Promise(Void) {
    let newCurrentTime =
      `#{event}.target.currentTime || 0` as Number

    let newDuration =
      `#{event}.target.duration || 0` as Number

    let newBuffered =
      `
      (() => {
        const v = #{event}.target;
        return v.buffered.length > 0 && v.duration > 0
          ? (v.buffered.end(0) / v.duration) * 100
          : 0;
      })()
      ` as Number

    next
      {
        currentTime: newCurrentTime,
        duration: newDuration,
        buffered: newBuffered
      }
  }

  fun handlePlay (event : Html.Event) : Promise(Void) {
    next { isPlaying: true }
  }

  fun handlePause (event : Html.Event) : Promise(Void) {
    next { isPlaying: false }
  }

  fun handleLoadStart (event : Html.Event) : Promise(Void) {
    next { isLoading: true, hasError: false, canPlay: false }
  }

  fun handleLoadedMetadata (event : Html.Event) : Promise(Void) {
    next { isLoading: false }
  }

  fun handleCanPlay (event : Html.Event) : Promise(Void) {
    next { canPlay: true, isLoading: false, isWaiting: false }
  }

  fun handleWaiting (event : Html.Event) : Promise(Void) {
    next { isWaiting: true }
  }

  fun handlePlaying (event : Html.Event) : Promise(Void) {
    next { isWaiting: false, isLoading: false, hasError: false }
  }

  fun handleError (event : Html.Event) : Promise(Void) {
    let errorMsg =
      `
      (() => {
        const video = #{event}.target;
        const error = video.error;

        if (!error) return "Error desconocido al cargar el video";

        switch(error.code) {
          case 1: return "Carga de video abortada";
          case 2: return "Error de red al cargar el video";
          case 3: return "Error al decodificar el video";
          case 4: return "Formato de video no soportado";
          default: return "Error desconocido: " + error.message;
        }
      })()
      ` as String

    next
      {
        hasError: true,
        isLoading: false,
        isWaiting: false,
        errorMessage: errorMsg
      }
  }

  fun handleStalled (event : Html.Event) : Promise(Void) {
    next { isWaiting: true }
  }

  fun handleSeeking (event : Html.Event) : Promise(Void) {
    next { seeking: true, isWaiting: true }
  }

  fun handleSeeked (event : Html.Event) : Promise(Void) {
    next { seeking: false, isWaiting: false }
  }

  fun retryLoad (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('video');
      if (video) {
        video.load();
        setTimeout(() => {
          video.play().catch(err => console.log('Autoplay prevented:', err));
        }, 100);
      }
    })()
    `

    next
      {
        hasError: false,
        errorMessage: "",
        retryCount: retryCount + 1,
        isLoading: true
      }
  }

  fun handleVolumeChange (event : Html.Event) : Promise(Void) {
    let newVolume =
      `#{event}.target.volume || 0` as Number

    let newMuted =
      `#{event}.target.muted || false` as Bool

    next { volume: newVolume, isMuted: newMuted }
  }

  fun seekTo (percentage : Number, event : Html.Event) : Promise(Void) {
    `
    (() => {
      const v = document.querySelector('video');
      if (v?.duration) v.currentTime = (#{percentage} / 100) * v.duration;
    })()
    `

    Promise.resolve(void)
  }

  fun handleProgressClick (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const r = #{event}.currentTarget.getBoundingClientRect();
      const p = ((#{event}.clientX - r.left) / r.width) * 100;
      const v = document.querySelector('video');
      if (v?.duration) v.currentTime = (p / 100) * v.duration;
    })()
    `

    Promise.resolve(void)
  }

  fun toggleMute (event : Html.Event) : Promise(Void) {
    `(() => {
      const v = document.querySelector('video');
      if (v) v.muted = !v.muted;
    })()`

    next { isMuted: !isMuted }
  }

  fun changeVolume (event : Html.Event) : Promise(Void) {
    `(() => {
      const r = #{event}.currentTarget.getBoundingClientRect();
      const p = Math.max(0, Math.min(100, ((#{event}.clientX - r.left) / r.width) * 100));
      const v = document.querySelector('video');
      if (v) v.volume = p / 100;
    })()`

    Promise.resolve(void)
  }

  fun changeSpeed (event : Html.Event) : Promise(Void) {
    let newRate =
      if playbackRate >= 2 {
        0.5
      } else {
        playbackRate + 0.25
      }

    `(() => {
      const v = document.querySelector('video');
      if (v) v.playbackRate = #{newRate};
    })()`

    next { playbackRate: newRate }
  }

  fun toggleFullscreen (event : Html.Event) : Promise(Void) {
    `(() => {
      const c = document.querySelector('.video-container');
      if (c) {
        document.fullscreenElement ? document.exitFullscreen() : c.requestFullscreen();
      }
    })()`

    next { isFullscreen: !isFullscreen }
  }

  fun pollDownloadProgress : Promise(Void) {
    let progress = `window._mintUpdateProgress || 0` as Number
    let done = `window._mintDownloadDone || false` as Bool

    next { downloadProgress: progress }

    if done {
      `setTimeout(() => this.resetDownloadState(), 1000)`
      Promise.resolve(void)
    } else {
      `setTimeout(() => this.pollDownloadProgress(), 200)`
      Promise.resolve(void)
    }
  }

  fun resetDownloadState : Promise(Void) {
    `window._mintUpdateProgress = 0; window._mintDownloadDone = false;`
    next { isDownloading: false, downloadProgress: 0 }
  }

  fun downloadVideo (event : Html.Event) : Promise(Void) {
    next { isDownloading: true, downloadProgress: 0 }

    `(async () => {
      const v = document.querySelector('video');
      if (!v?.src) return;

      const url = v.src;
      const fileName = 'video_' + Date.now() + '.mp4';

      try {
        const res = await fetch(url, { mode: 'cors', cache: 'force-cache' });
        if (!res.ok) throw new Error();

        const total = parseInt(res.headers.get('content-length'), 10);
        const reader = res.body.getReader();
        let received = 0;
        let chunks = [];

        for (;;) {
          const {done, value} = await reader.read();
          if (done) break;

          chunks.push(value);
          received += value.length;

          if (total) {
            window._mintUpdateProgress = Math.round((received / total) * 100);
          }
        }

        const blob = new Blob(chunks);
        const blobUrl = URL.createObjectURL(blob);
        const l = document.createElement('a');
        l.href = blobUrl;
        l.download = fileName;
        document.body.appendChild(l);
        l.click();
        document.body.removeChild(l);
        setTimeout(() => URL.revokeObjectURL(blobUrl), 100);

        window._mintDownloadDone = true;
      } catch {
        const l = document.createElement('a');
        l.href = url;
        l.download = fileName;
        document.body.appendChild(l);
        l.click();
        document.body.removeChild(l);

        window._mintDownloadDone = true;
      }
    })()`

    `setTimeout(() => this.pollDownloadProgress(), 100)`

    Promise.resolve(void)
  }

  fun formatTime (seconds : Number) : String {
    let mins =
      Math.floor(seconds / 60)

    let secs =
      Math.floor(seconds % 60)

    let secsStr =
      if secs < 10 {
        "0#{Number.toString(secs)}"
      } else {
        Number.toString(secs)
      }

    "#{Number.toString(mins)}:#{secsStr}"
  }

  fun getProgressPercentage : Number {
    if duration > 0 {
      (currentTime / duration) * 100
    } else {
      0
    }
  }

  fun getVolumePercentage : Number {
    volume * 100
  }

  fun render : Html {
    <div::container style={getContainerStyles()} class="video-container">
      <video::video
        src={src}
        poster={poster}
        preload="metadata"
        onTimeUpdate={handleTimeUpdate}
        onPlay={handlePlay}
        onPause={handlePause}
        onVolumeChange={handleVolumeChange}
        onLoadStart={handleLoadStart}
        onLoadedMetadata={handleLoadedMetadata}
        onCanPlay={handleCanPlay}
        onWaiting={handleWaiting}
        onPlaying={handlePlaying}
        onError={handleError}
        onStalled={handleStalled}
        onSeeking={handleSeeking}
        onSeeked={handleSeeked}
      />

      <div::videoArea onClick={handleVideoAreaClick}/>

      {
        if isDownloading {
          <div::downloadIndicator>
            <span>"⬇ Descargando"</span>
            <div::downloadProgressBar>
              <div::downloadProgressFill
                style="width: #{Number.toString(downloadProgress)}%"
              />
            </div>
            <span>{Number.toString(downloadProgress)}" %"</span>
          </div>
        } else {
          <div/>
        }
      }

      {
        if hasError {
          <div::errorOverlay>
            <div::errorIcon>"⚠️"</div>
            <div::errorMessage>{errorMessage}</div>
            <button::retryButton onClick={retryLoad}>"Reintentar"</button>
          </div>
        } else if isLoading || isWaiting {
          <div::bufferingIndicator>
            <div::loadingSpinner/>
            <div::bufferingText>
              {
                if isLoading {
                  "Cargando video..."
                } else {
                  "Buffering..."
                }
              }
            </div>
          </div>
        } else if !isPlaying && currentTime == 0 {
          <button::bigPlayButton onClick={togglePlay}>"▶"</button>
        } else {
          <div/>
        }
      }

      <div::controlsOverlay
        class={
          if showControls {
            ""
          } else {
            "controlsHidden"
          }
        }
      >
        <div::progressContainer onClick={handleProgressClick}>
          <div::progressBar style={getProgressBarStyles()}>
            <div::bufferedBar
              style="width: #{Number.toString(buffered)}%"
            />
            <div::currentProgress
              style="width: #{Number.toString(getProgressPercentage())}%"
            />
            <div::progressThumb
              style="left: #{Number.toString(getProgressPercentage())}%"
            />
          </div>
        </div>

        <div::controlsRow>
          <button::controlButton onClick={togglePlay}>
            {
              if isPlaying {
                "⏸"
              } else {
                "▶"
              }
            }
          </button>

          <div::volumeContainer>
            <button::controlButton onClick={toggleMute}>
              {
                if isMuted {
                  "🔇"
                } else if volume > 0.5 {
                  "🔊"
                } else if volume > 0 {
                  "🔉"
                } else {
                  "🔈"
                }
              }
            </button>

            <div::volumeSlider onClick={changeVolume}>
              <div::volumeProgress
                style="width: #{Number.toString(getVolumePercentage())}%"
              />
            </div>
          </div>

          <div::timeDisplay>
            {formatTime(currentTime)}
            " / "
            {formatTime(duration)}
          </div>

          <div::spacer/>

          <button::speedButton onClick={changeSpeed}>
            {Number.toString(playbackRate)}
            "x"
          </button>

          <button::controlButton onClick={downloadVideo}>
            "⬇"
          </button>

          <button::controlButton onClick={toggleFullscreen}>
            {
              if isFullscreen {
                "⛶"
              } else {
                "⛶"
              }
            }
          </button>
        </div>
      </div>
    </div>
  }
}

/* MiniVideoPlayer - Versión compacta del reproductor */
component MiniVideoPlayer {
  property src : String = ""
  property poster : String = ""
  property width : String = "300px"
  property height : String = "200px"

  state isPlaying : Bool = false

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 12px;
    overflow: hidden;
    cursor: pointer;
  }

  fun getContainerStyles : String {
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
    background: rgba(0, 0, 0, 0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: opacity 0.3s ease;
  }

  style overlayHidden {
    opacity: 0;
    pointer-events: none;
    visibility: hidden;
  }

  style playIcon {
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    background: rgba(102, 126, 234, 0.95);
    border: none;
    color: white;
    font-size: 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;

    &:hover {
      transform: scale(1.1);
      background: rgba(102, 126, 234, 1);
    }
  }

  fun togglePlay (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const video = #{event}.currentTarget.querySelector('video');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })()
    `

    Promise.resolve(void)
  }

  fun handlePlay (event : Html.Event) : Promise(Void) {
    next { isPlaying: true }
  }

  fun handlePause (event : Html.Event) : Promise(Void) {
    next { isPlaying: false }
  }

  fun getOverlayClass : String {
    if isPlaying {
      "overlayHidden"
    } else {
      ""
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()} onClick={togglePlay}>
      <video::video
        src={src}
        poster={poster}
        onPlay={handlePlay}
        onPause={handlePause}
      />

      {
        if isPlaying {
          <div/>
        } else {
          <div::overlay>
            <div::playIcon>"▶"</div>
          </div>
        }
      }
    </div>
  }
}

/* VideoGrid - Grid de videos */
component VideoGrid {
  property videos : Array(String) = []
  property posters : Array(String) = []
  property columns : Number = 3

  connect ThemeStore exposing { currentTheme }

  style grid {
    display: grid;
    grid-template-columns: repeat(#{Number.toString(columns)}, 1fr);
    gap: 1.5rem;
    width: 100%;

    @media (max-width: 1024px) {
      grid-template-columns: repeat(2, 1fr);
    }

    @media (max-width: 640px) {
      grid-template-columns: 1fr;
    }
  }

  fun render : Html {
    <div::grid>
      {
        Array.mapWithIndex(videos,
          (video : String, index : Number) {
            let poster =
              Array.at(posters, index)
              |> Maybe.withDefault("")

            <MiniVideoPlayer src={video} poster={poster} width="100%" height="200px"/>
          })
      }
    </div>
  }
}
