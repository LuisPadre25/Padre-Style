/* AvatarDemo Component
 * Demonstrates all Avatar variants and features
 */

component AvatarDemo {
  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem;
  }

  style header {
    text-align: center;
    margin-bottom: 3rem;
  }

  style title {
    font-size: clamp(1.75rem, 4vw, 2.5rem);
    font-weight: 800;
    margin-bottom: 0.5rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  style subtitle {
    font-size: clamp(0.875rem, 2vw, 1.125rem);
    opacity: 0.7;
    margin-bottom: 2rem;
  }

  style section {
    margin-bottom: 3rem;
    border-radius: 20px;
    padding: 2rem;
    transition: all 0.3s ease;
  }

  style sectionTitle {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }

  style exampleCard {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    padding: 1.5rem;
    border-radius: 12px;
    text-align: center;
  }

  style label {
    font-size: 0.875rem;
    font-weight: 600;
    opacity: 0.8;
  }

  style flexRow {
    display: flex;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
    justify-content: center;
  }

  fun getSectionStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getSubtitleStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getCardStyles : String {
    "
      background: #{ThemeHelpers.getCardBackground(currentTheme)};
      border: 1px solid #{ThemeHelpers.getCardBorder(currentTheme)};
    "
  }

  fun render : Html {
    <div::container>
      <div::header>
        <h1::title>"Avatar Components"</h1>

        <p::subtitle style={getSubtitleStyles()}>
          "Flexible avatar components with images, initials, status indicators, and groups"
        </p>
      </div>

      /* Sizes */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Avatar Sizes"</h2>

        <div::flexRow>
          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=1"
              size="xs"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Extra Small"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=2"
              size="sm"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Small"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=3"
              size="md"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Medium"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=4"
              size="lg"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Large"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=5"
              size="xl"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Extra Large"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=6"
              size="2xl"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"2X Large"</span>
          </div>
        </div>
      </div>

      /* Shapes */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Avatar Shapes"</h2>

        <div::flexRow>
          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=7"
              size="xl"
              shape="circle"
            />

            <span::label style={getSubtitleStyles()}>"Circle"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=8"
              size="xl"
              shape="rounded"
            />

            <span::label style={getSubtitleStyles()}>"Rounded"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=9"
              size="xl"
              shape="square"
            />

            <span::label style={getSubtitleStyles()}>"Square"</span>
          </div>
        </div>
      </div>

      /* Initials */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Avatar with Initials"</h2>

        <div::flexRow>
          <div::exampleCard style={getCardStyles()}>
            <Avatar initials="JD" size="lg" shape="circle"/>

            <span::label style={getSubtitleStyles()}>"John Doe"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              initials="AB"
              size="lg"
              shape="circle"
              bgColor="#ef4444"
            />

            <span::label style={getSubtitleStyles()}>"Custom Red"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              initials="CD"
              size="lg"
              shape="circle"
              bgColor="#10b981"
            />

            <span::label style={getSubtitleStyles()}>"Custom Green"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              initials="EF"
              size="lg"
              shape="circle"
              bgColor="#f59e0b"
            />

            <span::label style={getSubtitleStyles()}>"Custom Orange"</span>
          </div>
        </div>
      </div>

      /* Status Indicators */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Status Indicators"</h2>

        <div::flexRow>
          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=10"
              size="xl"
              shape="circle"
              showStatus={true}
              status="online"
            />

            <span::label style={getSubtitleStyles()}>"Online"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=11"
              size="xl"
              shape="circle"
              showStatus={true}
              status="away"
            />

            <span::label style={getSubtitleStyles()}>"Away"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=12"
              size="xl"
              shape="circle"
              showStatus={true}
              status="busy"
            />

            <span::label style={getSubtitleStyles()}>"Busy"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <Avatar
              src="https://i.pravatar.cc/150?img=13"
              size="xl"
              shape="circle"
              showStatus={true}
              status="offline"
            />

            <span::label style={getSubtitleStyles()}>"Offline"</span>
          </div>
        </div>
      </div>

      /* Avatar Groups */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Avatar Groups"</h2>

        <div::grid>
          <div::exampleCard style={getCardStyles()}>
            <AvatarGroup
              avatars={[
                "https://i.pravatar.cc/150?img=14",
                "https://i.pravatar.cc/150?img=15",
                "https://i.pravatar.cc/150?img=16"
              ]}
              size="md"
              max={5}
            />

            <span::label style={getSubtitleStyles()}>"Small Group"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <AvatarGroup
              avatars={[
                "https://i.pravatar.cc/150?img=17",
                "https://i.pravatar.cc/150?img=18",
                "https://i.pravatar.cc/150?img=19",
                "https://i.pravatar.cc/150?img=20",
                "https://i.pravatar.cc/150?img=21",
                "https://i.pravatar.cc/150?img=22"
              ]}
              size="md"
              max={5}
            />

            <span::label style={getSubtitleStyles()}>"Large Group (max 5)"</span>
          </div>

          <div::exampleCard style={getCardStyles()}>
            <AvatarGroup
              avatars={[
                "https://i.pravatar.cc/150?img=23",
                "https://i.pravatar.cc/150?img=24",
                "https://i.pravatar.cc/150?img=25",
                "https://i.pravatar.cc/150?img=26"
              ]}
              size="lg"
              max={5}
            />

            <span::label style={getSubtitleStyles()}>"Large Size"</span>
          </div>
        </div>
      </div>

      /* Bordered Avatars */
      <div::section style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Bordered Avatars"</h2>

        <div::flexRow>
          <Avatar
            src="https://i.pravatar.cc/150?img=27"
            size="lg"
            shape="circle"
            bordered={true}
          />

          <Avatar
            initials="BC"
            size="lg"
            shape="circle"
            bordered={true}
            bgColor="#8b5cf6"
          />

          <Avatar
            src="https://i.pravatar.cc/150?img=28"
            size="lg"
            shape="rounded"
            bordered={true}
          />

          <Avatar
            initials="XY"
            size="lg"
            shape="square"
            bordered={true}
            bgColor="#ec4899"
          />
        </div>
      </div>
    </div>
  }
}
