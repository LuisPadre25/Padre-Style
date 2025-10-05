/* TabsPage - Demonstration page for Tabs component */

component TabsPage {
  connect ViewModeStore exposing { viewMode }

  state activeBasic : String = "tab1"
  state activeMatch : String = "a"
  state activeCard : String = "card1"
  state activeBadge : String = "badge1"

  /* Sample tabs data */
  fun basicTabs : Array(TabItem) {
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

  fun matchTabs : Array(TabItem) {
    [
      {
        name: "a",
        title: "Tab A",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "b",
        title: "Tab B",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "c",
        title: "Tab C",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      }
    ]
  }

  fun badgeTabs : Array(TabItem) {
    [
      {
        name: "badge1",
        title: "Tab",
        disabled: false,
        dot: true,
        badge: "",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "badge2",
        title: "Tab",
        disabled: false,
        dot: false,
        badge: "5",
        titleStyle: "",
        icon: "",
        content: ""
      },
      {
        name: "badge3",
        title: "Tab",
        disabled: false,
        dot: false,
        badge: "99+",
        titleStyle: "",
        icon: "",
        content: ""
      }
    ]
  }

  /* Event handlers */
  fun handleBasicChange (event : TabChangeEvent) : Promise(Void) {
    next { activeBasic: event.name }
  }

  fun handleMatchChange (event : TabChangeEvent) : Promise(Void) {
    next { activeMatch: event.name }
  }

  fun handleCardChange (event : TabChangeEvent) : Promise(Void) {
    next { activeCard: event.name }
  }

  fun handleBadgeChange (event : TabChangeEvent) : Promise(Void) {
    next { activeBadge: event.name }
  }

  /* Styles */
  style container {
    background: var(--mint-background, #f7f8fa);
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
    background: var(--mint-background, #f7f8fa);
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
    color: var(--mint-text-color-2, #646566);
    background: var(--mint-background, #f7f8fa);
  }

  style tabContent {
    padding: 24px;
    font-size: 14px;
    color: var(--mint-text-color, #323233);
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
    color: rgba(52, 73, 94, 1);
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
    padding: 2px 6px;
    background: var(--mint-primary-color, #1989fa);
    color: #fff;
    font-size: 12px;
    border-radius: 3px;
    margin-left: 8px;
  }

  /* Render */
  fun renderContent : Html {
    <div::content>
      <h1::pageTitle>
        "Tabs"
        <span::badge>"Navigation"</span>
      </h1>

      <p::pageText>
        "Used to switch between different content areas."
      </p>

      <div::section>
        <div::sectionTitle>"Basic Usage"</div>

        <Tabs
          tabs={basicTabs()}
          active={activeBasic}
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
        <div::sectionTitle>"Match by name"</div>

        <Tabs
          tabs={matchTabs()}
          active={activeMatch}
          onChange={handleMatchChange}/>

        <div::tabContent>
          if activeMatch == "a" {
            "Content of Tab A"
          } else if activeMatch == "b" {
            "Content of Tab B"
          } else {
            "Content of Tab C"
          }
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"Card Style"</div>

        <Tabs
          tabs={basicTabs()}
          active={activeCard}
          type="card"
          onChange={handleCardChange}/>

        <div::tabContent>
          if activeCard == "tab1" {
            "Card Style Tab 1"
          } else if activeCard == "tab2" {
            "Card Style Tab 2"
          } else if activeCard == "tab3" {
            "Card Style Tab 3"
          } else {
            "Card Style Tab 4"
          }
        </div>
      </div>

      <div::section>
        <div::sectionTitle>"Badge & Dot"</div>

        <Tabs
          tabs={badgeTabs()}
          active={activeBadge}
          onChange={handleBadgeChange}/>

        <div::tabContent>
          if activeBadge == "badge1" {
            "Tab with dot indicator"
          } else if activeBadge == "badge2" {
            "Tab with badge count (5)"
          } else {
            "Tab with 99+ badge"
          }
        </div>
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
