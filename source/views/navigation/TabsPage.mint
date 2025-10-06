/* TabsPage - Professional showcase for Tabs component */

component TabsPage {
  connect ViewModeStore exposing { viewMode }

  state activeBasic : String = "tab1"
  state activeIcons : String = "home"
  state activeCard : String = "card1"
  state activeBadge : String = "badge1"
  state activeAnimated : String = "animate1"
  state animationDirection : String = "right"

  /* Tab Data */
  fun getBasicTabs : Array(TabItem) {
    [
      {
        name: "tab1",
        title: "Tab 1",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "tab2",
        title: "Tab 2",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "tab3",
        title: "Tab 3",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "tab4",
        title: "Tab 4",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      }
    ]
  }

  fun getIconTabs : Array(TabItem) {
    [
      {
        name: "home",
        title: "Home",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "🏠",
        content: ""
      },
      {
        name: "profile",
        title: "Profile",
        disabled: false,
        dot: true,
        badge: "",
        titleStyle: "",
        icon: "👤",
        content: ""
      },
      {
        name: "messages",
        title: "Messages",
        disabled: false,
        dot: false,
        badge: "5",
        titleStyle: "",
        icon: "💬",
        content: ""
      },
      {
        name: "settings",
        title: "Settings",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "⚙️",
        content: ""
      }
    ]
  }

  fun getBadgeTabs : Array(TabItem) {
    [
      {
        name: "badge1",
        title: "Dot",
        disabled: false,
        dot: true,
        badge: "",
        titleStyle: "",
        icon: "🔴",
        content: ""
      },
      {
        name: "badge2",
        title: "Count",
        disabled: false,
        dot: false,
        badge: "5",
        titleStyle: "",
        icon: "📬",
        content: ""
      },
      {
        name: "badge3",
        title: "Max",
        disabled: false,
        dot: false,
        badge: "150",
        titleStyle: "",
        icon: "🔔",
        content: ""
      },
      {
        name: "badge4",
        title: "Zero",
        disabled: false,
        dot: false,
        badge: "0",
        titleStyle: "",
        icon: "✅",
        content: ""
      }
    ]
  }

  /* Event Handlers */
  fun handleBasicChange (event : TabChangeEvent) : Promise(Void) {
    next { activeBasic: event.name }
  }

  fun handleIconsChange (event : TabChangeEvent) : Promise(Void) {
    next { activeIcons: event.name }
  }

  fun handleCardChange (event : TabChangeEvent) : Promise(Void) {
    next { activeCard: event.name }
  }

  fun handleBadgeChange (event : TabChangeEvent) : Promise(Void) {
    next { activeBadge: event.name }
  }

  fun handleAnimatedChange (event : TabChangeEvent) : Promise(Void) {
    next { activeAnimated: event.name }
  }

  fun handleDirectionChange (direction : String) : Promise(Void) {
    next { animationDirection: direction }
  }

  fun getAnimationType : String {
    case animationDirection {
      "left" => "slideInLeft"
      "right" => "slideInRight"
      => "fadeIn"
    }
  }

  /* Styles */
  style container {
    background: #f7f8fa;
    min-height: 100vh;
    padding: 20px;

    if viewMode == "mobile" {
      padding: 0;
    }
  }

  style simulatorFrame {
    width: 375px;
    height: 667px;
    margin: 0 auto;
    background: #000;
    border-radius: 36px;
    padding: 12px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    position: relative;
  }

  style desktopView {
    width: 100%;
    height: auto;
    background: transparent;
    border-radius: 0;
    padding: 0;
    box-shadow: none;
  }

  style simulatorNotch {
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 140px;
    height: 28px;
    background: #000;
    border-radius: 0 0 20px 20px;
    z-index: 10;
  }

  style simulatorSpeaker {
    position: absolute;
    top: 8px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 5px;
    background: #1a1a1a;
    border-radius: 3px;
  }

  style simulatorScreen {
    width: 100%;
    height: 100%;
    background: #f7f8fa;
    border-radius: 28px;
    overflow-y: auto;
    overflow-x: hidden;
  }

  style desktopScreen {
    border-radius: 0;
    max-width: 100%;
  }

  style content {
    background: #fff;
    padding: 16px;
  }

  style section {
    margin-bottom: 24px;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;

    if viewMode == "mobile" {
      margin-bottom: 16px;
      border-radius: 0;
    }
  }

  style sectionTitle {
    padding: 16px;
    font-size: 14px;
    font-weight: 500;
    color: #646566;
    background: #f7f8fa;
  }

  style tabContent {
    padding: 24px;
    font-size: 14px;
    color: #323233;
    text-align: center;
    background: #fff;
  }

  style pageTitle {
    font-size: 34px;
    font-weight: 400;
    margin: 0 0 30px;
    line-height: 1.5;
    color: #333;
    padding: 0 16px;

    if viewMode == "mobile" {
      font-size: 24px;
      margin: 0 0 16px;
      padding: 16px;
    }
  }

  style pageText {
    color: #34495e;
    margin-top: 16px;
    font-size: 15px;
    line-height: 26px;
    padding: 0 16px;

    if viewMode == "mobile" {
      font-size: 14px;
      line-height: 22px;
    }
  }

  style badge {
    display: inline-block;
    padding: 2px 8px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: #fff;
    font-size: 12px;
    border-radius: 4px;
    margin-left: 8px;
    font-weight: 500;
  }

  style animatedContent {
    padding: 20px;
    text-align: center;
  }

  style contentTitle {
    font-size: 18px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 8px;
  }

  style contentText {
    font-size: 14px;
    color: #646566;
    line-height: 1.6;
  }

  /* Render */
  fun renderContent : Html {
    <div::content>
      <h1::pageTitle>
        "Tabs"
        <span::badge>"Navigation"</span>
      </h1>

      <p::pageText>
        "Professional mobile-first tabs navigation component."
      </p>

      <div::section>
        <div::sectionTitle>"Basic Line Type"</div>

        <Tabs
          tabs={getBasicTabs()}
          active={activeBasic}
          type="line"
          color="#667eea"
          titleActiveColor="#667eea"
          titleInactiveColor="#646566"
          border={true}
          onChange={handleBasicChange}/>

        <div::tabContent>
          if activeBasic == "tab1" {
            "Content of Tab 1"
          } else if activeBasic == "tab2" {
            "Content of Tab 2"
          } else if activeBasic == "tab3" {
            "Content of Tab 3"
          } else {
            "Content of Tab 4"
          }
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"With Icons & Badges"</div>

        <Tabs
          tabs={getIconTabs()}
          active={activeIcons}
          type="line"
          color="#10b981"
          titleActiveColor="#10b981"
          border={true}
          onChange={handleIconsChange}/>

        <div::tabContent>
          "Selected: " {activeIcons}
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"Card Type"</div>

        <Tabs
          tabs={getBasicTabs()}
          active={activeCard}
          type="card"
          color="#8b5cf6"
          onChange={handleCardChange}/>

        <div::tabContent>
          if activeCard == "tab1" {
            "Card Tab 1"
          } else if activeCard == "tab2" {
            "Card Tab 2"
          } else if activeCard == "tab3" {
            "Card Tab 3"
          } else {
            "Card Tab 4"
          }
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"Badge & Dot Indicators"</div>

        <Tabs
          tabs={getBadgeTabs()}
          active={activeBadge}
          type="line"
          color="#f59e0b"
          titleActiveColor="#f59e0b"
          border={true}
          onChange={handleBadgeChange}/>

        <div::tabContent>
          if activeBadge == "badge1" {
            "Tab with dot indicator"
          } else if activeBadge == "badge2" {
            "Tab with badge (5)"
          } else {
            "Tab with 99+ badge"
          }
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"Native Swipe Experience 👆"</div>

        <Tabs
          tabs={getBasicTabs()}
          active={activeAnimated}
          type="line"
          color="#667eea"
          titleActiveColor="#667eea"
          border={true}
          swipeable={false}
          onChange={handleAnimatedChange}/>

        <TabsSwipeContent
          tabs={getBasicTabs()}
          activeTab={activeAnimated}>

          <div::tabContent>
            <div::animatedContent>
              <div::contentTitle>"Tab 1 Content"</div>
              <div::contentText>"Swipe left/right! Content moves with your finger 👆"</div>
            </div>
          </div>

          <div::tabContent>
            <div::animatedContent>
              <div::contentTitle>"Tab 2 Content"</div>
              <div::contentText>"Native app feeling - drag to see next/previous ✨"</div>
            </div>
          </div>

          <div::tabContent>
            <div::animatedContent>
              <div::contentTitle>"Tab 3 Content"</div>
              <div::contentText>"Like Instagram Stories or ViewPager 🚀"</div>
            </div>
          </div>

          <div::tabContent>
            <div::animatedContent>
              <div::contentTitle>"Tab 4 Content"</div>
              <div::contentText>"Pure Mint Lang carousel magic 💚"</div>
            </div>
          </div>

        </TabsSwipeContent>
      </div>
    </div>
  }

  fun render : Html {
    <div::container>
      if viewMode == "mobile" {
        <div::simulatorFrame>
          <div::simulatorNotch>
            <div::simulatorSpeaker/>
          </div>

          <div::simulatorScreen>
            {renderContent()}
          </div>
        </div>
      } else {
        <div::simulatorFrame::desktopView>
          <div::simulatorScreen::desktopScreen>
            {renderContent()}
          </div>
        </div>
      }
    </div>
  }
}
