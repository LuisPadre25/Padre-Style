component EmbedPlayer {
  property url : String = ""
  property width : String = "100%"
  property height : String = "500px"
  property autoplay : Bool = false
  property muted : Bool = false
  property controls : Bool = true

  state platform : String = ""
  state videoId : String = ""

  style container {
    position: relative;
    width: #{width};
    height: #{height};
    border-radius: 12px;
    overflow: hidden;
    background: var(--card-bg, #000);
    box-shadow: 0 4px 16px var(--shadow-color, rgba(0, 0, 0, 0.1));
    transition: all 0.3s ease;
  }

  style iframe {
    width: 100%;
    height: 100%;
    border: none;
    display: block;
  }

  style placeholder {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 16px;
    background: var(--bg-color, #f0f0f0);
    color: var(--text-color, #666);
  }

  style icon {
    font-size: 64px;
  }

  style message {
    font-size: 16px;
    font-weight: 500;
  }

  style platformBadge {
    background: var(--primary-color, #1989fa);
    color: white;
    padding: 6px 16px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  fun extractVideoInfo : Promise(Void) {
    let info =
      detectPlatform(url)

    next { platform: info.platform, videoId: info.videoId }
  }

  fun detectPlatform (videoUrl : String) : PlatformInfo {
    if String.contains(videoUrl, "youtube.com") || String.contains(videoUrl, "youtu.be") {
      {
        platform: "youtube",
        videoId: extractYouTubeId(videoUrl)
      }
    } else if String.contains(videoUrl, "vimeo.com") {
      {
        platform: "vimeo",
        videoId: extractVimeoId(videoUrl)
      }
    } else if String.contains(videoUrl, "dailymotion.com") || String.contains(videoUrl, "dai.ly") {
      {
        platform: "dailymotion",
        videoId: extractDailymotionId(videoUrl)
      }
    } else {
      {
        platform: "unknown",
        videoId: ""
      }
    }
  }

  fun extractYouTubeId (videoUrl : String) : String {
    `
    (() => {
      const url = #{videoUrl};
      let videoId = '';

      // Standard youtube.com URL
      if (url.includes('youtube.com/watch?v=')) {
        videoId = url.split('v=')[1]?.split('&')[0] || '';
      }
      // Short youtu.be URL
      else if (url.includes('youtu.be/')) {
        videoId = url.split('youtu.be/')[1]?.split('?')[0] || '';
      }
      // Embed URL
      else if (url.includes('youtube.com/embed/')) {
        videoId = url.split('embed/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })()
    `
  }

  fun extractVimeoId (videoUrl : String) : String {
    `
    (() => {
      const url = #{videoUrl};
      let videoId = '';

      // Standard vimeo.com URL
      if (url.includes('vimeo.com/')) {
        const parts = url.split('vimeo.com/');
        if (parts[1]) {
          videoId = parts[1].split('/')[0].split('?')[0] || '';
        }
      }

      return videoId;
    })()
    `
  }

  fun extractDailymotionId (videoUrl : String) : String {
    `
    (() => {
      const url = #{videoUrl};
      let videoId = '';

      // Standard dailymotion.com URL
      if (url.includes('dailymotion.com/video/')) {
        videoId = url.split('video/')[1]?.split('_')[0] || '';
      }
      // Short dai.ly URL
      else if (url.includes('dai.ly/')) {
        videoId = url.split('dai.ly/')[1]?.split('?')[0] || '';
      }

      return videoId;
    })()
    `
  }

  fun getEmbedUrl : String {
    let autoplayParam =
      if autoplay {
        "1"
      } else {
        "0"
      }

    let mutedParam =
      if muted {
        "1"
      } else {
        "0"
      }

    let controlsParam =
      if controls {
        "1"
      } else {
        "0"
      }

    case platform {
      "youtube" =>
        "https://www.youtube.com/embed/" + videoId + "?autoplay=" + autoplayParam + "&mute=" + mutedParam + "&controls=" + controlsParam

      "vimeo" =>
        "https://player.vimeo.com/video/" + videoId + "?autoplay=" + autoplayParam + "&muted=" + mutedParam + "&controls=" + controlsParam

      "dailymotion" =>
        "https://www.dailymotion.com/embed/video/" + videoId + "?autoplay=" + autoplayParam + "&mute=" + mutedParam + "&controls=" + controlsParam

      =>
        ""
    }
  }

  fun getPlatformIcon : String {
    case platform {
      "youtube" => "📺"
      "vimeo" => "🎬"
      "dailymotion" => "🎥"
      => "❓"
    }
  }

  fun getPlatformName : String {
    case platform {
      "youtube" => "YouTube"
      "vimeo" => "Vimeo"
      "dailymotion" => "Dailymotion"
      => "Unknown Platform"
    }
  }

  fun componentDidMount : Promise(Void) {
    extractVideoInfo()
  }

  fun componentDidUpdate : Promise(Void) {
    extractVideoInfo()
  }

  fun render : Html {
    <div::container>
      if String.isNotEmpty(videoId) && String.isNotEmpty(platform) {
        <>
          <iframe::iframe
            src={getEmbedUrl()}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen="true"/>
        </>
      } else if String.isEmpty(url) {
        <div::placeholder>
          <div::icon>"🎬"</div>
          <div::message>"Enter a video URL to start"</div>
          <div style="font-size: 12px; color: var(--text-color, #999);">
            "Supports YouTube, Vimeo, and Dailymotion"
          </div>
        </div>
      } else {
        <div::placeholder>
          <div::icon>"⚠️"</div>
          <div::message>"Unsupported video platform"</div>
          <div style="font-size: 12px; color: var(--text-color, #999);">
            "Please use YouTube, Vimeo, or Dailymotion URLs"
          </div>
        </div>
      }
    </div>
  }
}
