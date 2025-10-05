component VideoPlayerPage {
  style container {
    width: 100%;
    max-width: 1400px;
    padding: 20px;
  }

  style header {
    margin-bottom: 40px;
  }

  style title {
    font-size: 32px;
    font-weight: 600;
    margin: 0 0 12px;
    color: var(--heading-color, #1a1a1a);
    transition: color 0.3s ease;
  }

  style subtitle {
    font-size: 16px;
    color: var(--text-color, #666);
    margin: 0;
    line-height: 1.6;
    transition: color 0.3s ease;
  }

  style section {
    background: var(--card-bg, white);
    border-radius: 16px;
    padding: 32px;
    margin-bottom: 32px;
    box-shadow: 0 2px 8px var(--shadow-color, rgba(0, 0, 0, 0.05));
    transition: all 0.3s ease;
  }

  style sectionTitle {
    font-size: 24px;
    font-weight: 600;
    margin: 0 0 24px;
    color: var(--heading-color, #2c3e50);
    display: flex;
    align-items: center;
    gap: 12px;
    transition: color 0.3s ease;
  }

  style grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 32px;
  }

  style grid2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;

    @media (max-width: 900px) {
      grid-template-columns: 1fr;
    }
  }

  style demoCard {
    background: var(--bg-color, #f8f9fa);
    border-radius: 12px;
    padding: 20px;
    transition: all 0.3s ease;
  }

  style demoTitle {
    font-size: 16px;
    font-weight: 600;
    margin: 0 0 16px;
    color: var(--text-color, #333);
    transition: color 0.3s ease;
  }

  style features {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-top: 24px;
  }

  style feature {
    background: var(--card-bg, white);
    border-radius: 12px;
    padding: 16px;
    border-left: 4px solid var(--primary-color, #1989fa);
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px var(--shadow-color, rgba(0, 0, 0, 0.1));
    }
  }

  style featureIcon {
    font-size: 28px;
    margin-bottom: 8px;
  }

  style featureTitle {
    font-size: 14px;
    font-weight: 600;
    margin: 0 0 4px;
    color: var(--heading-color, #1a1a1a);
    transition: color 0.3s ease;
  }

  style featureDesc {
    font-size: 13px;
    color: var(--text-color, #666);
    margin: 0;
    line-height: 1.4;
    transition: color 0.3s ease;
  }

  style info {
    background: color-mix(in srgb, var(--primary-color, #2196f3) 10%, transparent);
    border-left: 4px solid var(--primary-color, #2196f3);
    padding: 16px;
    border-radius: 8px;
    margin-top: 16px;
    font-size: 14px;
    color: var(--text-color, #1976d2);
    line-height: 1.6;
    transition: all 0.3s ease;
  }

  style badge {
    background: var(--primary-color, #1989fa);
    color: white;
    padding: 4px 12px;
    border-radius: 16px;
    font-size: 12px;
    font-weight: 600;
    margin-left: 8px;
  }

  style comparisonTable {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  style tableHeader {
    background: var(--bg-color, #f8f9fa);
    padding: 12px;
    text-align: left;
    font-weight: 600;
    color: var(--heading-color, #333);
    border-bottom: 2px solid var(--border-color, #e0e0e0);
    transition: all 0.3s ease;
  }

  style tableCell {
    padding: 12px;
    border-bottom: 1px solid var(--border-color, #e0e0e0);
    color: var(--text-color, #666);
    transition: all 0.3s ease;
  }

  style checkmark {
    color: var(--primary-color, #00b96b);
    font-weight: 600;
  }

  fun render : Html {
    <div::container>
      <div::header>
        <h1::title>"🎬 Video Players"</h1>
        <p::subtitle>
          "Professional video player with all advanced features: keyboard shortcuts, playlist, quality selector, subtitles, analytics, mini-player, PiP, and external platform support (YouTube, Vimeo)"
        </p>
      </div>

      <div::section>
        <h2::sectionTitle>
          "🚀 Pro Video Player"
          <span::badge>"Ultimate"</span>
        </h2>

        <div::grid>
          <div::demoCard>
            <h3::demoTitle>"Full-Featured Professional Player with Playlist"</h3>

            <ProVideoPlayer
              sources={
                [
                  { label: "1080p", src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", height: 1080 },
                  { label: "720p", src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4", height: 720 },
                  { label: "480p", src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4", height: 480 }
                ]
              }
              captions={
                [
                  { label: "English", src: "/captions/en.vtt", language: "en", isDefault: true }
                ]
              }
              playlist={
                [
                  {
                    id: "1",
                    title: "Big Buck Bunny",
                    src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    poster: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
                    duration: 596
                  },
                  {
                    id: "2",
                    title: "Elephants Dream",
                    src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    poster: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                    duration: 653
                  },
                  {
                    id: "3",
                    title: "For Bigger Blazes",
                    src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                    poster: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
                    duration: 15
                  }
                ]
              }
              poster="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
              width="100%"
              height="600px"
              keyboard={true}
              analytics={true}/>

            <p::info>
              "🔥 Professional player with: Keyboard shortcuts (Space, ←→ seek, ↑↓ volume, F fullscreen, M mute, J/L 10s jumps, 0-9 percentage jumps), seek preview, buffer indicator, playlist, mini-player mode, analytics tracking, and all controls!"
            </p>
          </div>

          <div::demoCard>
            <h3::demoTitle>"Pro Player - Single Video with Auto-play"</h3>

            <ProVideoPlayer
              sources={
                [
                  { label: "HD", src: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4", height: 720 }
                ]
              }
              poster="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg"
              width="100%"
              height="500px"
              autoplay={true}
              muted={true}
              keyboard={true}/>

            <p::info>
              "⚡ All pro features in a single video configuration"
            </p>
          </div>
        </div>
      </div>

      <div::section>
        <h2::sectionTitle>
          "🌐 Embed Player (YouTube, Vimeo, Dailymotion)"
          <span::badge>"External"</span>
        </h2>

        <div::grid2>
          <div::demoCard>
            <h3::demoTitle>"YouTube Video"</h3>

            <EmbedPlayer
              url="https://www.youtube.com/watch?v=dQw4w9WgXcQ"
              width="100%"
              height="400px"
              controls={true}/>

            <p::info>
              "📺 Supports standard YouTube URLs, short URLs (youtu.be), and embed URLs"
            </p>
          </div>

          <div::demoCard>
            <h3::demoTitle>"Vimeo Video"</h3>

            <EmbedPlayer
              url="https://vimeo.com/148751763"
              width="100%"
              height="400px"
              controls={true}/>

            <p::info>
              "🎬 Clean Vimeo player integration with responsive design"
            </p>
          </div>
        </div>
      </div>

      <div::section>
        <h2::sectionTitle>"✨ Feature Comparison"</h2>

        <table::comparisonTable>
          <thead>
            <tr>
              <th::tableHeader>"Feature"</th>
              <th::tableHeader>"ProVideoPlayer"</th>
              <th::tableHeader>"EmbedPlayer"</th>
            </tr>
          </thead>

          <tbody>
            <tr>
              <td::tableCell>"Play/Pause"</td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"Progress Bar with Preview"</td>
              <td::tableCell>
                <span::checkmark>"✓ Hover preview"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"Volume Control"</td>
              <td::tableCell>
                <span::checkmark>"✓ Slider + Mute"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"Playback Speed"</td>
              <td::tableCell>
                <span::checkmark>"✓ (0.25x - 2x)"</span>
              </td>
              <td::tableCell>"Platform-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Quality Selector"</td>
              <td::tableCell>
                <span::checkmark>"✓ Multi-source"</span>
              </td>
              <td::tableCell>"Platform-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Subtitles/Captions"</td>
              <td::tableCell>
                <span::checkmark>"✓ VTT format"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"Fullscreen"</td>
              <td::tableCell>
                <span::checkmark>"✓ + Double-click"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"Picture-in-Picture"</td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
              <td::tableCell>"Browser-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Keyboard Shortcuts"</td>
              <td::tableCell>
                <span::checkmark>"✓ (15+ keys)"</span>
              </td>
              <td::tableCell>"Platform-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Buffer Indicator"</td>
              <td::tableCell>
                <span::checkmark>"✓ Visual bar"</span>
              </td>
              <td::tableCell>"Platform-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Playlist Support"</td>
              <td::tableCell>
                <span::checkmark>"✓ Auto-advance"</span>
              </td>
              <td::tableCell>"✗"</td>
            </tr>

            <tr>
              <td::tableCell>"Mini-Player"</td>
              <td::tableCell>
                <span::checkmark>"✓ Floating mode"</span>
              </td>
              <td::tableCell>"✗"</td>
            </tr>

            <tr>
              <td::tableCell>"Analytics Tracking"</td>
              <td::tableCell>
                <span::checkmark>"✓ 5 metrics"</span>
              </td>
              <td::tableCell>"✗"</td>
            </tr>

            <tr>
              <td::tableCell>"Loading State"</td>
              <td::tableCell>
                <span::checkmark>"✓ Spinner"</span>
              </td>
              <td::tableCell>"Platform-dependent"</td>
            </tr>

            <tr>
              <td::tableCell>"Theme Integration"</td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
              <td::tableCell>
                <span::checkmark>"✓"</span>
              </td>
            </tr>

            <tr>
              <td::tableCell>"External Platforms"</td>
              <td::tableCell>"✗"</td>
              <td::tableCell>
                <span::checkmark>"✓ YouTube, Vimeo"</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::section>
        <h2::sectionTitle>"🎯 All Features"</h2>

        <div::features>
          <div::feature>
            <div::featureIcon>"▶️"</div>
            <h3::featureTitle>"Play/Pause"</h3>
            <p::featureDesc>"Smooth playback control with visual feedback"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⏱️"</div>
            <h3::featureTitle>"Speed Control"</h3>
            <p::featureDesc>"0.25x to 2x playback speed"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🔊"</div>
            <h3::featureTitle>"Volume"</h3>
            <p::featureDesc>"Slider control with mute toggle"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⚙️"</div>
            <h3::featureTitle>"Quality"</h3>
            <p::featureDesc>"Multiple quality options"</p>
          </div>

          <div::feature>
            <div::featureIcon>"CC"</div>
            <h3::featureTitle>"Subtitles"</h3>
            <p::featureDesc>"VTT caption track support"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⛶"</div>
            <h3::featureTitle>"Fullscreen"</h3>
            <p::featureDesc>"Native fullscreen API"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⧉"</div>
            <h3::featureTitle>"PiP Mode"</h3>
            <p::featureDesc>"Picture-in-Picture support"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🎨"</div>
            <h3::featureTitle>"Theming"</h3>
            <p::featureDesc>"Full CSS variable support"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⌨️"</div>
            <h3::featureTitle>"Keyboard"</h3>
            <p::featureDesc>"Space, arrows shortcuts"</p>
          </div>

          <div::feature>
            <div::featureIcon>"📱"</div>
            <h3::featureTitle>"Responsive"</h3>
            <p::featureDesc>"Mobile-friendly design"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🌐"</div>
            <h3::featureTitle>"Embeds"</h3>
            <p::featureDesc>"YouTube, Vimeo, Dailymotion"</p>
          </div>

          <div::feature>
            <div::featureIcon>"⚡"</div>
            <h3::featureTitle>"Performance"</h3>
            <p::featureDesc>"Optimized HTML5 video"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🎮"</div>
            <h3::featureTitle>"Playlist"</h3>
            <p::featureDesc>"Auto-advance queue system"</p>
          </div>

          <div::feature>
            <div::featureIcon>"📊"</div>
            <h3::featureTitle>"Analytics"</h3>
            <p::featureDesc>"Track play, pause, seek, watch time"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🔍"</div>
            <h3::featureTitle>"Seek Preview"</h3>
            <p::featureDesc>"Hover to preview timestamp"</p>
          </div>

          <div::feature>
            <div::featureIcon>"📦"</div>
            <h3::featureTitle>"Buffer Bar"</h3>
            <p::featureDesc>"Visual buffering indicator"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🎬"</div>
            <h3::featureTitle>"Mini Player"</h3>
            <p::featureDesc>"Floating player mode"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🎯"</div>
            <h3::featureTitle>"Precise Control"</h3>
            <p::featureDesc>"Frame-accurate seeking"</p>
          </div>

          <div::feature>
            <div::featureIcon>"🔢"</div>
            <h3::featureTitle>"Jump to %"</h3>
            <p::featureDesc>"Press 0-9 for percentage"</p>
          </div>
        </div>
      </div>
    </div>
  }
}
