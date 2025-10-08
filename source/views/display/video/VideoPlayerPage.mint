component VideoPlayerPage {
  style container {
    width: 100%;
    max-width: 1400px;
    padding: 20px;
  }

  style header {
    margin-bottom: 40px;
  }

  style section {
    background: var(--card-bg, white);
    border-radius: 16px;
    padding: 32px;
    margin-bottom: 32px;
    box-shadow: 0 2px 8px var(--shadow-color, rgba(0, 0, 0, 0.05));
    transition: all 0.3s ease;
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
        <Heading level="1" margin="0 0 16px">"🎬 Video Players"</Heading>
        <Text size="lg" margin="0 0 40px">
          "Professional video player with all advanced features: keyboard shortcuts, playlist, quality selector, subtitles, analytics, mini-player, PiP, and external platform support (YouTube, Vimeo)"
        </Text>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 20px">
          "🚀 Pro Video Player"
          <span::badge>"Ultimate"</span>
        </Heading>

        <div::grid>
          <div::demoCard>
            <Heading level="3" margin="0 0 12px">"Full-Featured Professional Player with Playlist"</Heading>

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

            <Text size="sm" margin="8px 0 0">
              "🔥 Professional player with: Keyboard shortcuts (Space, ←→ seek, ↑↓ volume, F fullscreen, M mute, J/L 10s jumps, 0-9 percentage jumps), seek preview, buffer indicator, playlist, mini-player mode, analytics tracking, and all controls!"
            </Text>
          </div>

          <div::demoCard>
            <Heading level="3" margin="0 0 12px">"Pro Player - Single Video with Auto-play"</Heading>

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

            <Text size="sm" margin="8px 0 0">
              "⚡ All pro features in a single video configuration"
            </Text>
          </div>
        </div>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 20px">
          "🌐 Embed Player (YouTube, Vimeo, Dailymotion)"
          <span::badge>"External"</span>
        </Heading>

        <div::grid2>
          <div::demoCard>
            <Heading level="3" margin="0 0 12px">"YouTube Video"</Heading>

            <EmbedPlayer
              url="https://www.youtube.com/watch?v=dQw4w9WgXcQ"
              width="100%"
              height="400px"
              controls={true}/>

            <Text size="sm" margin="8px 0 0">
              "📺 Supports standard YouTube URLs, short URLs (youtu.be), and embed URLs"
            </Text>
          </div>

          <div::demoCard>
            <Heading level="3" margin="0 0 12px">"Vimeo Video"</Heading>

            <EmbedPlayer
              url="https://vimeo.com/148751763"
              width="100%"
              height="400px"
              controls={true}/>

            <Text size="sm" margin="8px 0 0">
              "🎬 Clean Vimeo player integration with responsive design"
            </Text>
          </div>
        </div>
      </div>

      <div::section>
        <Heading level="2" margin="32px 0 20px">"✨ Feature Comparison"</Heading>

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
        <Heading level="2" margin="32px 0 20px">"🎯 All Features"</Heading>

        <div::features>
          <div::feature>
            <div::featureIcon>"▶️"</div>
            <Heading level="4" margin="0 0 8px">"Play/Pause"</Heading>
            <Text size="sm" margin="0">"Smooth playback control with visual feedback"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⏱️"</div>
            <Heading level="4" margin="0 0 8px">"Speed Control"</Heading>
            <Text size="sm" margin="0">"0.25x to 2x playback speed"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🔊"</div>
            <Heading level="4" margin="0 0 8px">"Volume"</Heading>
            <Text size="sm" margin="0">"Slider control with mute toggle"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⚙️"</div>
            <Heading level="4" margin="0 0 8px">"Quality"</Heading>
            <Text size="sm" margin="0">"Multiple quality options"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"CC"</div>
            <Heading level="4" margin="0 0 8px">"Subtitles"</Heading>
            <Text size="sm" margin="0">"VTT caption track support"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⛶"</div>
            <Heading level="4" margin="0 0 8px">"Fullscreen"</Heading>
            <Text size="sm" margin="0">"Native fullscreen API"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⧉"</div>
            <Heading level="4" margin="0 0 8px">"PiP Mode"</Heading>
            <Text size="sm" margin="0">"Picture-in-Picture support"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🎨"</div>
            <Heading level="4" margin="0 0 8px">"Theming"</Heading>
            <Text size="sm" margin="0">"Full CSS variable support"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⌨️"</div>
            <Heading level="4" margin="0 0 8px">"Keyboard"</Heading>
            <Text size="sm" margin="0">"Space, arrows shortcuts"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"📱"</div>
            <Heading level="4" margin="0 0 8px">"Responsive"</Heading>
            <Text size="sm" margin="0">"Mobile-friendly design"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🌐"</div>
            <Heading level="4" margin="0 0 8px">"Embeds"</Heading>
            <Text size="sm" margin="0">"YouTube, Vimeo, Dailymotion"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"⚡"</div>
            <Heading level="4" margin="0 0 8px">"Performance"</Heading>
            <Text size="sm" margin="0">"Optimized HTML5 video"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🎮"</div>
            <Heading level="4" margin="0 0 8px">"Playlist"</Heading>
            <Text size="sm" margin="0">"Auto-advance queue system"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"📊"</div>
            <Heading level="4" margin="0 0 8px">"Analytics"</Heading>
            <Text size="sm" margin="0">"Track play, pause, seek, watch time"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🔍"</div>
            <Heading level="4" margin="0 0 8px">"Seek Preview"</Heading>
            <Text size="sm" margin="0">"Hover to preview timestamp"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"📦"</div>
            <Heading level="4" margin="0 0 8px">"Buffer Bar"</Heading>
            <Text size="sm" margin="0">"Visual buffering indicator"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🎬"</div>
            <Heading level="4" margin="0 0 8px">"Mini Player"</Heading>
            <Text size="sm" margin="0">"Floating player mode"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🎯"</div>
            <Heading level="4" margin="0 0 8px">"Precise Control"</Heading>
            <Text size="sm" margin="0">"Frame-accurate seeking"</Text>
          </div>

          <div::feature>
            <div::featureIcon>"🔢"</div>
            <Heading level="4" margin="0 0 8px">"Jump to %"</Heading>
            <Text size="sm" margin="0">"Press 0-9 for percentage"</Text>
          </div>
        </div>
      </div>
    </div>
  }
}
