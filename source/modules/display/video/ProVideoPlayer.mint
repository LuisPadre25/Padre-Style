/*
ProVideoPlayer - Professional Video Player
  Features: Seek, Keyboard, Touch, Buffer, Thumbnails, Playlist, Analytics, Mini-player
*/
component ProVideoPlayer {
  /* Properties */
  property playlist : Array(PlaylistItem) = []

  property sources : Array(VideoQuality) = []
  property captions : Array(CaptionTrack) = []
  property thumbnailSprite : Maybe(ThumbnailSprite) = Maybe.nothing()
  property poster : String = ""
  property width : String = "100%"
  property height : String = "auto"
  property autoplay : Bool = false
  property muted : Bool = false
  property loop : Bool = false
  property keyboard : Bool = true
  property analytics : Bool = true
  property miniPlayer : Bool = true

  /* Player State */
  state isPlaying : Bool = false

  state currentTime : Number = 0
  state duration : Number = 0
  state buffered : Number = 0
  state volume : Number = 1
  state playbackRate : Number = 1
  state isMuted : Bool = false

  /* UI State */
  state currentQuality : Number = 0

  state currentCaption : Number = -1
  state currentPlaylistIndex : Number = 0
  state showControls : Bool = true
  state showVolumeSlider : Bool = false
  state showSpeedMenu : Bool = false
  state showQualityMenu : Bool = false
  state showCaptionMenu : Bool = false
  state showPlaylist : Bool = false
  state showSettings : Bool = false
  state isFullscreen : Bool = false
  state isMiniPlayer : Bool = false
  state isLoading : Bool = false
  state isSeeking : Bool = false

  /* Preview State */
  state hoverTime : Number = 0

  state showPreview : Bool = false
  state previewX : Number = 0

  /* Analytics State */
  state watchTime : Number = 0

  state playCount : Number = 0
  state pauseCount : Number = 0
  state seekCount : Number = 0
  state qualityChanges : Number = 0

  /* Base Styles */
  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 12px;
    overflow: hidden;
    background: var(--card-bg, #000);
    box-shadow: 0 4px 16px var(--shadow-color, rgba(0, 0, 0, 0.1));
    transition: all 0.3s ease;
    user-select: none;

    &.fullscreen {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      width: 100vw;
      height: 100vh;
      border-radius: 0;
      z-index: 9999;
    }

    &.mini {
      position: fixed;
      bottom: 20px;
      right: 20px;
      width: 400px;
      height: 225px;
      z-index: 9998;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    }
  }

  style video {
    width: 100%;
    height: 100%;
    object-fit: contain;
    display: block;
  }

  /* Loading Overlay */
  style loadingOverlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 15;
  }

  style spinner {
    width: 60px;
    height: 60px;
    border: 5px solid rgba(255, 255, 255, 0.3);
    border-top-color: var(--primary-color, #1989fa);
    border-radius: 50%;
    animation: spin 0.8s linear infinite;
  }

  /* Center Play Button */
  style centerOverlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
    pointer-events: none;
    z-index: 5;
  }

  style centerVisible {
    opacity: 1;
    pointer-events: auto;
  }

  style bigPlayButton {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    border: none;
    font-size: 36px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    padding-left: 8px;
    transition: all 0.3s ease;
    background: var(--card-bg, rgba(255, 255, 255, 0.95));
    color: var(--primary-color, #1989fa);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.4);

    &:hover {
      transform: scale(1.15);
      background: var(--primary-color, #1989fa);
      color: white;
      box-shadow: 0 6px 32px rgba(0, 0, 0, 0.5);
    }

    &:active {
      transform: scale(1.05);
    }
  }

  /* Controls Bar */
  style controlsBar {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.95) 0%, rgba(0, 0, 0, 0.8) 70%, transparent 100%);
    padding: 24px 16px 16px;
    display: flex;
    flex-direction: column;
    gap: 12px;
    color: white;
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: 10;
  }

  style controlsVisible {
    opacity: 1;
  }

  /* Progress Container */
  style progressContainer {
    width: 100%;
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 6px;
  }

  style progressWrapper {
    position: relative;
    width: 100%;
    height: 20px;
    display: flex;
    align-items: center;
    cursor: pointer;
  }

  style progressBar {
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background: rgba(255, 255, 255, 0.3);
    position: relative;
    transition: height 0.2s ease;
  }

  style progressBarHover {
    height: 10px;
  }

  style bufferProgress {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    background: rgba(255, 255, 255, 0.5);
    border-radius: 3px;
    transition: width 0.3s ease;
  }

  style currentProgress {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    background: var(--primary-color, #1989fa);
    border-radius: 3px;
    transition: width 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }

  style progressThumb {
    width: 16px;
    height: 16px;
    background: white;
    border-radius: 50%;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);
    opacity: 0;
    transition: opacity 0.2s ease;
  }

  style thumbVisible {
    opacity: 1;
  }

  /* Thumbnail Preview */
  style thumbnailPreview {
    position: absolute;
    bottom: 30px;
    transform: translateX(-50%);
    background: rgba(0, 0, 0, 0.95);
    border-radius: 8px;
    padding: 8px;
    pointer-events: none;
    opacity: 0;
    transition: opacity 0.2s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
    z-index: 20;
  }

  style previewVisible {
    opacity: 1;
  }

  style previewImage {
    width: 160px;
    height: 90px;
    background: #333;
    border-radius: 4px;
    margin-bottom: 4px;
  }

  style previewTime {
    text-align: center;
    font-size: 12px;
    font-weight: 600;
    font-family: monospace;
    color: white;
  }

  /* Control Buttons Row */
  style controlsRow {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  style controlButton {
    min-width: 40px;
    height: 40px;
    padding: 0 8px;
    border-radius: 6px;
    border: none;
    font-size: 16px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 4px;
    transition: all 0.2s ease;
    background: rgba(255, 255, 255, 0.1);
    color: white;
    font-weight: 500;

    &:hover {
      background: var(--primary-color, rgba(25, 137, 250, 0.8));
      transform: scale(1.05);
    }

    &:active {
      transform: scale(0.95);
    }
  }

  /* Volume Controls */
  style volumeContainer {
    position: relative;
    display: flex;
    align-items: center;
    gap: 4px;
  }

  style volumeSliderContainer {
    width: 0;
    opacity: 0;
    overflow: hidden;
    transition: all 0.3s ease;

    &.visible {
      width: 100px;
      opacity: 1;
    }
  }

  style volumeSlider {
    width: 100%;
    height: 6px;
    border-radius: 3px;
    background: rgba(255, 255, 255, 0.3);
    cursor: pointer;
    position: relative;
  }

  style volumeFill {
    height: 100%;
    background: var(--primary-color, #1989fa);
    border-radius: 3px;
    position: relative;
  }

  /* Time Display */
  style timeDisplay {
    font-size: 14px;
    font-weight: 600;
    font-family: monospace;
    white-space: nowrap;
    min-width: 110px;
    user-select: none;
  }

  style spacer {
    flex: 1;
  }

  /* Menus */
  style menu {
    position: absolute;
    bottom: 55px;
    right: 10px;
    background: rgba(0, 0, 0, 0.95);
    border-radius: 8px;
    padding: 8px 0;
    min-width: 180px;
    max-height: 300px;
    overflow-y: auto;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(10px);
    z-index: 20;
  }

  style menuItem {
    padding: 12px 16px;
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 14px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;

    &:hover {
      background: var(--primary-color, rgba(25, 137, 250, 0.3));
    }

    &.active {
      background: var(--primary-color, rgba(25, 137, 250, 0.5));
      font-weight: 700;
    }
  }

  style badge {
    background: var(--primary-color, #1989fa);
    color: white;
    padding: 3px 8px;
    border-radius: 12px;
    font-size: 11px;
    font-weight: 700;
  }

  /* Playlist Sidebar */
  style playlistSidebar {
    position: absolute;
    right: 0;
    top: 0;
    bottom: 0;
    width: 300px;
    background: rgba(0, 0, 0, 0.95);
    backdrop-filter: blur(10px);
    transform: translateX(100%);
    transition: transform 0.3s ease;
    z-index: 12;
    overflow-y: auto;
    padding: 16px;

    &.visible {
      transform: translateX(0);
    }
  }

  style playlistHeader {
    font-size: 18px;
    font-weight: 700;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 2px solid rgba(255, 255, 255, 0.2);
    color: white;
  }

  style playlistItem {
    display: flex;
    gap: 12px;
    padding: 10px;
    border-radius: 8px;
    cursor: pointer;
    margin-bottom: 8px;
    transition: all 0.2s ease;
    background: rgba(255, 255, 255, 0.05);

    &:hover {
      background: rgba(255, 255, 255, 0.1);
      transform: translateX(-4px);
    }

    &.active {
      background: var(--primary-color, rgba(25, 137, 250, 0.3));
      border-left: 4px solid var(--primary-color, #1989fa);
    }
  }

  style playlistThumb {
    width: 80px;
    height: 45px;
    border-radius: 4px;
    background: #333;
    flex-shrink: 0;
  }

  style playlistInfo {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 4px;
    color: white;
  }

  style playlistTitle {
    font-size: 13px;
    font-weight: 600;
    line-height: 1.3;
  }

  style playlistDuration {
    font-size: 11px;
    color: rgba(255, 255, 255, 0.7);
    font-family: monospace;
  }

  /* Mini Player Controls */
  style miniControls {
    position: absolute;
    top: 8px;
    right: 8px;
    display: flex;
    gap: 4px;
    z-index: 15;
  }

  style miniButton {
    width: 32px;
    height: 32px;
    border-radius: 6px;
    border: none;
    background: rgba(0, 0, 0, 0.7);
    color: white;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    backdrop-filter: blur(10px);

    &:hover {
      background: rgba(0, 0, 0, 0.9);
      transform: scale(1.1);
    }
  }

  /* Keyboard Shortcuts Overlay */
  style shortcutsOverlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: rgba(0, 0, 0, 0.95);
    border-radius: 12px;
    padding: 24px;
    max-width: 400px;
    z-index: 25;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s ease;

    &.visible {
      opacity: 1;
      pointer-events: auto;
    }
  }

  style shortcutTitle {
    font-size: 20px;
    font-weight: 700;
    margin-bottom: 16px;
    color: white;
  }

  style shortcutItem {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    color: white;
    font-size: 14px;
  }

  style shortcutKey {
    background: rgba(255, 255, 255, 0.2);
    padding: 4px 12px;
    border-radius: 4px;
    font-family: monospace;
    font-weight: 600;
  }

  /* ===== PLAYBACK CONTROLS ===== */
  fun handlePlayPause (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
      }
    })()
    `

    if analytics {
      if isPlaying {
        next { isPlaying: false, pauseCount: pauseCount + 1 }
      } else {
        next { isPlaying: true, playCount: playCount + 1 }
      }
    } else {
      next { isPlaying: !isPlaying }
    }
  }

  fun handleDoubleClick (event : Html.Event) : Promise(Void) {
    toggleFullscreen(event)
  }

  /* ===== SEEK/SCRUBBING ===== */
  fun handleProgressClick (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = x / rect.width;

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        video.currentTime = percentage * video.duration;
      }
    })()
    `

    next { seekCount: seekCount + 1 }
  }

  fun handleProgressHover (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = x / rect.width;

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        const hoverTime = percentage * video.duration;
        // Update hover state
      }
    })()
    `

    Promise.resolve(void)
  }

  fun handleProgressMouseMove (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const progressBar = event.currentTarget;
      const rect = progressBar.getBoundingClientRect();
      const x = event.clientX - rect.left;
      const percentage = Math.max(0, Math.min(1, x / rect.width));

      const video = document.querySelector('[data-pro-video]');
      if (video && video.duration) {
        const time = percentage * video.duration;
        #{updatePreviewState(`true`, `time`, `x`)}
      }
    })()
    `

    Promise.resolve(void)
  }

  fun handleProgressMouseLeave (event : Html.Event) : Promise(Void) {
    next { showPreview: false }
  }

  /* ===== VOLUME CONTROLS ===== */
  fun handleVolumeToggle (event : Html.Event) : Promise(Void) {
    next { showVolumeSlider: !showVolumeSlider }
  }

  fun handleMute (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.muted = !video.muted;
      }
    })()
    `

    next {
      isMuted: !isMuted,
      volume:
        if isMuted {
          1
        } else {
          0
        }
    }
  }

  fun handleVolumeChange (newVolume : Number) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.volume = #{newVolume};
        video.muted = false;
      }
    })()
    `

    next { volume: newVolume, isMuted: false }
  }

  /* ===== PLAYBACK SPEED ===== */
  fun handleSpeedMenu (event : Html.Event) : Promise(Void) {
    next {
      showSpeedMenu: !showSpeedMenu,
      showQualityMenu: false,
      showCaptionMenu: false,
      showSettings: false
    }
  }

  fun setPlaybackSpeed (speed : Number) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        video.playbackRate = #{speed};
      }
    })()
    `

    next { playbackRate: speed, showSpeedMenu: false }
  }

  /* ===== QUALITY CONTROLS ===== */
  fun handleQualityMenu (event : Html.Event) : Promise(Void) {
    next {
      showQualityMenu: !showQualityMenu,
      showSpeedMenu: false,
      showCaptionMenu: false,
      showSettings: false
    }
  }

  fun setQuality (index : Number) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime;
        const wasPlaying = !video.paused;

        // Store time and state, then change source
        video.addEventListener('loadedmetadata', () => {
          video.currentTime = currentTime;
          if (wasPlaying) {
            video.play();
          }
        }, { once: true });
      }
    })()
    `

    next {
      currentQuality: index,
      showQualityMenu: false,
      qualityChanges: qualityChanges + 1
    }
  }

  /* ===== CAPTION CONTROLS ===== */
  fun handleCaptionMenu (event : Html.Event) : Promise(Void) {
    next {
      showCaptionMenu: !showCaptionMenu,
      showSpeedMenu: false,
      showQualityMenu: false,
      showSettings: false
    }
  }

  fun setCaption (index : Number) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const tracks = video.textTracks;
        for (let i = 0; i < tracks.length; i++) {
          tracks[i].mode = i === #{index} ? 'showing' : 'hidden';
        }
      }
    })()
    `

    next { currentCaption: index, showCaptionMenu: false }
  }

  /* ===== FULLSCREEN ===== */
  fun toggleFullscreen (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const container = document.querySelector('[data-pro-container]');
      if (container) {
        if (!document.fullscreenElement) {
          container.requestFullscreen().catch(err => {
            console.error('Fullscreen error:', err);
          });
        } else {
          document.exitFullscreen();
        }
      }
    })()
    `

    next { isFullscreen: !isFullscreen }
  }

  /* ===== PICTURE IN PICTURE ===== */
  fun togglePiP (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video && document.pictureInPictureEnabled) {
        if (!document.pictureInPictureElement) {
          video.requestPictureInPicture().catch(err => {
            console.error('PiP error:', err);
          });
        } else {
          document.exitPictureInPicture();
        }
      }
    })()
    `

    Promise.resolve(void)
  }

  /* ===== MINI PLAYER ===== */
  fun toggleMiniPlayer (event : Html.Event) : Promise(Void) {
    next { isMiniPlayer: !isMiniPlayer }
  }

  fun closeMiniPlayer (event : Html.Event) : Promise(Void) {
    next { isMiniPlayer: false }
  }

  /* ===== PLAYLIST ===== */
  fun togglePlaylist (event : Html.Event) : Promise(Void) {
    next { showPlaylist: !showPlaylist }
  }

  fun playPlaylistItem (index : Number) : Promise(Void) {
    next { currentPlaylistIndex: index, showPlaylist: false }
  }

  fun playNext (event : Html.Event) : Promise(Void) {
    let nextIndex =
      if currentPlaylistIndex < Array.size(playlist) - 1 {
        currentPlaylistIndex + 1
      } else {
        0
      }

    next { currentPlaylistIndex: nextIndex }
  }

  fun playPrevious (event : Html.Event) : Promise(Void) {
    let prevIndex =
      if currentPlaylistIndex > 0 {
        currentPlaylistIndex - 1
      } else {
        Array.size(playlist) - 1
      }

    next { currentPlaylistIndex: prevIndex }
  }

  /* ===== KEYBOARD SHORTCUTS ===== */
  fun handleKeyPress (event : Html.Event) : Promise(Void) {
    if keyboard {
      `
      (() => {
        const key = event.key;
        const video = document.querySelector('[data-pro-video]');
        if (!video) return;

        event.preventDefault();

        switch(key) {
          case ' ':
          case 'k':
            // Play/Pause
            if (video.paused) {
              video.play();
            } else {
              video.pause();
            }
            break;

          case 'ArrowLeft':
            // Seek backward 5s
            video.currentTime = Math.max(0, video.currentTime - 5);
            break;

          case 'ArrowRight':
            // Seek forward 5s
            video.currentTime = Math.min(video.duration, video.currentTime + 5);
            break;

          case 'ArrowUp':
            // Volume up 10%
            video.volume = Math.min(1, video.volume + 0.1);
            break;

          case 'ArrowDown':
            // Volume down 10%
            video.volume = Math.max(0, video.volume - 0.1);
            break;

          case 'f':
            // Fullscreen
            const container = document.querySelector('[data-pro-container]');
            if (!document.fullscreenElement) {
              container.requestFullscreen();
            } else {
              document.exitFullscreen();
            }
            break;

          case 'm':
            // Mute
            video.muted = !video.muted;
            break;

          case 'j':
            // Seek backward 10s
            video.currentTime = Math.max(0, video.currentTime - 10);
            break;

          case 'l':
            // Seek forward 10s
            video.currentTime = Math.min(video.duration, video.currentTime + 10);
            break;

          case 'Home':
            // Jump to start
            video.currentTime = 0;
            break;

          case 'End':
            // Jump to end
            video.currentTime = video.duration;
            break;

          case '0':
          case '1':
          case '2':
          case '3':
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
            // Jump to percentage
            const percent = parseInt(key) * 10;
            video.currentTime = (percent / 100) * video.duration;
            break;

          case '<':
          case ',':
            // Decrease playback speed
            video.playbackRate = Math.max(0.25, video.playbackRate - 0.25);
            break;

          case '>':
          case '.':
            // Increase playback speed
            video.playbackRate = Math.min(2, video.playbackRate + 0.25);
            break;
        }
      })()
      `

      Promise.resolve(void)
    } else {
      Promise.resolve(void)
    }
  }

  /* ===== MOUSE CONTROLS ===== */
  fun handleMouseEnter (event : Html.Event) : Promise(Void) {
    next { showControls: true }
  }

  fun handleMouseLeave (event : Html.Event) : Promise(Void) {
    if isPlaying {
      next { showControls: false, showVolumeSlider: false }
    } else {
      Promise.resolve(void)
    }
  }

  fun handleMouseMove (event : Html.Event) : Promise(Void) {
    next { showControls: true }
  }

  /* ===== VIDEO EVENTS ===== */
  fun updateTimeState (
    time : Number,
    dur : Number,
    buffered : Number,
    loading : Bool
  ) : Promise(Void) {
    next {
      currentTime: time,
      duration: dur,
      buffered: buffered,
      isLoading: loading
    }
  }

  fun updatePlayState (playing : Bool) : Promise(Void) {
    next { isPlaying: playing }
  }

  fun updateVolumeState (vol : Number) : Promise(Void) {
    next { volume: vol }
  }

  fun updateLoadingState (loading : Bool) : Promise(Void) {
    next { isLoading: loading }
  }

  fun updateFullscreenState (fullscreen : Bool) : Promise(Void) {
    next { isFullscreen: fullscreen }
  }

  fun updatePreviewState (
    show : Bool,
    time : Number,
    x : Number
  ) : Promise(Void) {
    next { showPreview: show, hoverTime: time, previewX: x }
  }

  fun updateTime : Void {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      if (video) {
        const currentTime = video.currentTime || 0;
        const duration = video.duration || 0;
        const isLoading = video.readyState < 3;

        // Calculate buffered
        let bufferedEnd = 0;
        if (video.buffered.length > 0) {
          bufferedEnd = video.buffered.end(video.buffered.length - 1);
        }

        #{updateTimeState(
          `currentTime`,
          `duration`,
          `bufferedEnd`,
          `isLoading`
        )}
      }
    })()
    `
  }

  fun handleVideoEndedWrapper : Promise(Void) {
    if Array.size(playlist) > 0 {
      playNextInternal()
    } else if loop {
      `
      (() => {
        const video = document.querySelector('[data-pro-video]');
        if (video) {
          video.currentTime = 0;
          video.play();
        }
      })()
      `

      Promise.resolve(void)
    } else {
      next { isPlaying: false }
    }
  }

  fun playNextInternal : Promise(Void) {
    let nextIndex =
      if currentPlaylistIndex < Array.size(playlist) - 1 {
        currentPlaylistIndex + 1
      } else {
        0
      }

    next { currentPlaylistIndex: nextIndex }
  }

  fun handleVideoEnded (event : Html.Event) : Promise(Void) {
    handleVideoEndedWrapper()
  }

  /* ===== LIFECYCLE ===== */
  fun componentDidMount : Promise(Void) {
    `
    (() => {
      const video = document.querySelector('[data-pro-video]');
      const container = document.querySelector('[data-pro-container]');

      if (video) {
        // Time update
        video.addEventListener('timeupdate', () => {
          #{updateTime()}
        });

        // Metadata loaded
        video.addEventListener('loadedmetadata', () => {
          #{updateTime()}
        });

        // Waiting/buffering
        video.addEventListener('waiting', () => {
          #{updateLoadingState(`true`)}
        });

        // Can play
        video.addEventListener('canplay', () => {
          #{updateLoadingState(`false`)}
        });

        // Ended
        video.addEventListener('ended', () => {
          #{handleVideoEndedWrapper()}
        });

        // Volume change
        video.addEventListener('volumechange', () => {
          #{updateVolumeState(`video.volume`)}
        });

        // Play/Pause
        video.addEventListener('play', () => {
          #{updatePlayState(`true`)}
        });

        video.addEventListener('pause', () => {
          #{updatePlayState(`false`)}
        });
      }

      // Keyboard events
      if (#{keyboard}) {
        document.addEventListener('keydown', (event) => {
          if (document.activeElement === document.body ||
              document.activeElement.tagName === 'VIDEO') {
            const key = event.key;
            const video = document.querySelector('[data-pro-video]');
            if (!video) return;

            event.preventDefault();

            switch(key) {
              case ' ':
              case 'k':
                // Play/Pause
                if (video.paused) {
                  video.play();
                } else {
                  video.pause();
                }
                break;

              case 'ArrowLeft':
                // Seek backward 5s
                video.currentTime = Math.max(0, video.currentTime - 5);
                break;

              case 'ArrowRight':
                // Seek forward 5s
                video.currentTime = Math.min(video.duration, video.currentTime + 5);
                break;

              case 'ArrowUp':
                // Volume up 10%
                video.volume = Math.min(1, video.volume + 0.1);
                break;

              case 'ArrowDown':
                // Volume down 10%
                video.volume = Math.max(0, video.volume - 0.1);
                break;

              case 'f':
                // Fullscreen
                const container = document.querySelector('[data-pro-container]');
                if (!document.fullscreenElement) {
                  container.requestFullscreen();
                } else {
                  document.exitFullscreen();
                }
                break;

              case 'm':
                // Mute
                video.muted = !video.muted;
                break;

              case 'j':
                // Seek backward 10s
                video.currentTime = Math.max(0, video.currentTime - 10);
                break;

              case 'l':
                // Seek forward 10s
                video.currentTime = Math.min(video.duration, video.currentTime + 10);
                break;

              case 'Home':
                // Jump to start
                video.currentTime = 0;
                break;

              case 'End':
                // Jump to end
                video.currentTime = video.duration;
                break;

              case '0':
              case '1':
              case '2':
              case '3':
              case '4':
              case '5':
              case '6':
              case '7':
              case '8':
              case '9':
                // Jump to percentage
                const percent = parseInt(key) * 10;
                video.currentTime = (percent / 100) * video.duration;
                break;

              case '<':
              case ',':
                // Decrease playback speed
                video.playbackRate = Math.max(0.25, video.playbackRate - 0.25);
                break;

              case '>':
              case '.':
                // Increase playback speed
                video.playbackRate = Math.min(2, video.playbackRate + 0.25);
                break;
            }
          }
        });
      }

      // Fullscreen change
      document.addEventListener('fullscreenchange', () => {
        const isFs = !!document.fullscreenElement;
        #{updateFullscreenState(`isFs`)}
      });
    })()
    `

    Promise.resolve(void)
  }

  /* ===== HELPER FUNCTIONS ===== */
  fun formatTime (seconds : Number) : String {
    let hours =
      Math.floor(seconds / 3600)

    let minutes =
      Math.floor((seconds % 3600) / 60)

    let secs =
      Math.floor(seconds % 60)

    let minutesStr =
      if minutes < 10 {
        "0" + Number.toString(minutes)
      } else {
        Number.toString(minutes)
      }

    let secondsStr =
      if secs < 10 {
        "0" + Number.toString(secs)
      } else {
        Number.toString(secs)
      }

    if hours > 0 {
      Number.toString(hours) + ":" + minutesStr + ":" + secondsStr
    } else {
      Number.toString(minutes) + ":" + secondsStr
    }
  }

  fun getProgressPercentage : Number {
    if duration > 0 {
      (currentTime / duration) * 100
    } else {
      0
    }
  }

  fun getBufferPercentage : Number {
    if duration > 0 {
      (buffered / duration) * 100
    } else {
      0
    }
  }

  fun getCurrentSource : String {
    if Array.size(sources) > 0 {
      Array.at(sources, currentQuality)
      |> Maybe.map((q : VideoQuality) { q.src })
      |> Maybe.withDefault("")
    } else if Array.size(playlist) > 0 {
      Array.at(playlist, currentPlaylistIndex)
      |> Maybe.map((item : PlaylistItem) { item.src })
      |> Maybe.withDefault("")
    } else {
      ""
    }
  }

  fun getCurrentPoster : String {
    if Array.size(playlist) > 0 {
      Array.at(playlist, currentPlaylistIndex)
      |> Maybe.map((item : PlaylistItem) { item.poster })
      |> Maybe.withDefault(poster)
    } else {
      poster
    }
  }

  fun getVolumeIcon : String {
    if isMuted || volume == 0 {
      "🔇"
    } else if volume > 0.5 {
      "🔊"
    } else {
      "🔉"
    }
  }

  fun render : Html {
    <div::container
      class={
        if isFullscreen {
          "fullscreen"
        } else if isMiniPlayer {
          "mini"
        } else {
          ""
        }
      }
      data-pro-container="true"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      onMouseMove={handleMouseMove}
      onDoubleClick={handleDoubleClick}
    >
      if isMiniPlayer {
        <div::miniControls>
          <button::miniButton onClick={toggleMiniPlayer} title="Restore">"⛶"</button>

          <button::miniButton onClick={closeMiniPlayer} title="Close">"✕"</button>
        </div>
      }

      <video::video
        data-pro-video="true"
        src={getCurrentSource()}
        poster={getCurrentPoster()}
      >
        for caption of captions {
          if caption.isDefault {
            <track
              label={caption.label}
              kind="subtitles"
              srcLang={caption.language}
              src={caption.src}
              default="true"
            />
          } else {
            <track
              label={caption.label}
              kind="subtitles"
              srcLang={caption.language}
              src={caption.src}
            />
          }
        }
      </video>

      if isLoading {
        <div::loadingOverlay><div::spinner/></div>
      }

      if !isPlaying && !isMiniPlayer {
        <div::centerOverlay::centerVisible>
          <button::bigPlayButton onClick={handlePlayPause}>"▶"</button>
        </div>
      }

      <div::controlsBar
        style={
          if showControls || !isPlaying {
            "opacity: 1"
          } else {
            "opacity: 0"
          }
        }
      >
        <div::progressContainer>
          <div::progressWrapper
            onClick={handleProgressClick}
            onMouseMove={handleProgressMouseMove}
            onMouseLeave={handleProgressMouseLeave}
          >
            <div::progressBar
              class={
                if showPreview {
                  "progressBarHover"
                } else {
                  ""
                }
              }
            >
              <div::bufferProgress
                style={"width: " + Number.toString(getBufferPercentage()) + "%"}
              />

              <div::currentProgress
                style={
                  "width: " + Number.toString(getProgressPercentage()) + "%"
                }
              >
                <div::progressThumb
                  class={
                    if showPreview {
                      "thumbVisible"
                    } else {
                      ""
                    }
                  }
                />
              </div>
            </div>

            if showPreview {
              <div::thumbnailPreview::previewVisible
                style={"left: " + Number.toString(previewX) + "px"}
              >
                <div::previewImage/>

                <div::previewTime>
                  {
                    formatTime(hoverTime)
                  }
                </div>
              </div>
            }
          </div>
        </div>

        <div::controlsRow>
          <button::controlButton
            onClick={handlePlayPause}
            title="Play/Pause (Space)"
          >
            if isPlaying {
              "⏸"
            } else {
              "▶"
            }
          </button>

          if Array.size(playlist) > 1 {
            <button::controlButton onClick={playPrevious} title="Previous">"⏮"</button>
          }

          if Array.size(playlist) > 1 {
            <button::controlButton onClick={playNext} title="Next">"⏭"</button>
          }

          <div::volumeContainer
            onMouseEnter={handleVolumeToggle}
            onMouseLeave={handleVolumeToggle}
          >
            <button::controlButton onClick={handleMute} title="Mute (M)">
              {
                getVolumeIcon()
              }
            </button>

            <div::volumeSliderContainer
              class={
                if showVolumeSlider {
                  "visible"
                } else {
                  ""
                }
              }
            >
              <div::volumeSlider>
                <div::volumeFill
                  style={"width: " + Number.toString(volume * 100) + "%"}
                />
              </div>
            </div>
          </div>

          <div::timeDisplay>
            {
              formatTime(currentTime)
            }

            " / "

            {
              formatTime(duration)
            }
          </div>

          <div::spacer/>

          if Array.size(captions) > 0 && !isMiniPlayer {
            <div style="position: relative;">
              <button::controlButton
                onClick={handleCaptionMenu}
                title="Captions"
              >"CC"</button>

              if showCaptionMenu {
                <div::menu>
                  <div::menuItem
                    class={
                      if currentCaption == -1 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setCaption(-1) }}
                  >"Off"</div>

                  for caption, index of captions {
                    <div::menuItem
                      class={
                        if currentCaption == index {
                          "active"
                        } else {
                          ""
                        }
                      }
                      onClick={(e : Html.Event) { setCaption(index) }}
                    >
                      {
                        caption.label
                      }

                      if currentCaption == index {
                        <span::badge>"✓"</span>
                      }
                    </div>
                  }
                </div>
              }
            </div>
          }

          if Array.size(sources) > 1 && !isMiniPlayer {
            <div style="position: relative;">
              <button::controlButton onClick={handleQualityMenu} title="Quality">
                "⚙"
              </button>

              if showQualityMenu {
                <div::menu>
                  for quality, index of sources {
                    <div::menuItem
                      class={
                        if currentQuality == index {
                          "active"
                        } else {
                          ""
                        }
                      }
                      onClick={(e : Html.Event) { setQuality(index) }}
                    >
                      {
                        quality.label
                      }

                      if currentQuality == index {
                        <span::badge>"✓"</span>
                      }
                    </div>
                  }
                </div>
              }
            </div>
          }

          if !isMiniPlayer {
            <div style="position: relative;">
              <button::controlButton onClick={handleSpeedMenu} title="Speed">
                if playbackRate == 1 {
                  "1x"
                } else {
                  Number.toString(playbackRate) + "x"
                }
              </button>

              if showSpeedMenu {
                <div::menu>
                  <div::menuItem
                    class={
                      if playbackRate == 0.25 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(0.25) }}
                  >"0.25x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 0.5 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(0.5) }}
                  >"0.5x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 0.75 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(0.75) }}
                  >"0.75x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 1 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(1) }}
                  >"Normal"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 1.25 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(1.25) }}
                  >"1.25x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 1.5 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(1.5) }}
                  >"1.5x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 1.75 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(1.75) }}
                  >"1.75x"</div>

                  <div::menuItem
                    class={
                      if playbackRate == 2 {
                        "active"
                      } else {
                        ""
                      }
                    }
                    onClick={(e : Html.Event) { setPlaybackSpeed(2) }}
                  >"2x"</div>
                </div>
              }
            </div>
          }

          if Array.size(playlist) > 0 && !isMiniPlayer {
            <button::controlButton onClick={togglePlaylist} title="Playlist">"☰"</button>
          }

          if miniPlayer && !isFullscreen && !isMiniPlayer {
            <button::controlButton
              onClick={toggleMiniPlayer}
              title="Mini Player"
            >"⧉"</button>
          }

          if !isMiniPlayer {
            <button::controlButton
              onClick={togglePiP}
              title="Picture-in-Picture"
            >"⧉"</button>
          }

          if !isMiniPlayer {
            <button::controlButton
              onClick={toggleFullscreen}
              title="Fullscreen (F)"
            >
              if isFullscreen {
                "⛶"
              } else {
                "⛶"
              }
            </button>
          }
        </div>
      </div>

      if Array.size(playlist) > 0 {
        <div::playlistSidebar
          style={
            if showPlaylist {
              "transform: translateX(0)"
            } else {
              ""
            }
          }
        >
          <div::playlistHeader>
            "Playlist ("

            {
              Number.toString(Array.size(playlist))
            }

            " videos)"
          </div>

          for item, index of playlist {
            <div::playlistItem
              class={
                if currentPlaylistIndex == index {
                  "active"
                } else {
                  ""
                }
              }
              onClick={(e : Html.Event) { playPlaylistItem(index) }}
            >
              <img::playlistThumb src={item.poster} alt={item.title}/>

              <div::playlistInfo>
                <div::playlistTitle>
                  {
                    item.title
                  }
                </div>

                <div::playlistDuration>
                  {
                    formatTime(item.duration)
                  }
                </div>
              </div>
            </div>
          }
        </div>
      }
    </div>
  }
}
