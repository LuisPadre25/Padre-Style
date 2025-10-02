/* Main Showcase Component - Simplified */
component Showcase {
  state activeTab : String = "Layout"

  style container {
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 2rem;
  }

  style content {
    max-width: 1400px;
    margin: 0 auto;
  }

  style header {
    text-align: center;
    color: white;
    margin-bottom: 3rem;
  }

  style title {
    font-size: 3rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style subtitle {
    font-size: 1.25rem;
    opacity: 0.9;
  }

  style tabNav {
    display: flex;
    gap: 1rem;
    margin-bottom: 2rem;
    background: rgba(255, 255, 255, 0.1);
    padding: 1rem;
    border-radius: 12px;
    backdrop-filter: blur(10px);
  }

  style tab {
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    background: transparent;
    color: white;
    border: 2px solid transparent;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;

    &:hover {
      background: rgba(255, 255, 255, 0.1);
    }
  }

  style activeTab {
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    background: white;
    color: #667eea;
    border: 2px solid white;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;

    &:hover {
      background: rgba(255, 255, 255, 0.95);
    }
  }

  style tabContent {
    background: white;
    border-radius: 12px;
    padding: 2rem;
    min-height: 500px;
  }

  fun setTab (tab : String) : Promise(Void) {
    next { activeTab: tab }
  }

  fun renderTabButton (label : String) : Html {
    let isActive =
      activeTab == label

    if isActive {
      <button::activeTab onClick={() { setTab(label) }}>label</button>
    } else {
      <button::tab onClick={() { setTab(label) }}>label</button>
    }
  }

  fun renderContent : Html {
    case activeTab {
      "Layout" => <LayoutShowcase/>
      "Forms" => <FormsShowcase/>
      "Data" => <DataShowcase/>
      "Feedback" => <FeedbackShowcase/>
      "Navigation" => <NavigationShowcase/>
      "Charts" => <ChartsShowcase/>
      "Code" => <CodeShowcase/>
      "Markdown" => <MarkdownShowcase/>
      "Table" => <TableShowcase/>
      "Drag & Drop" => <DragDropDemo/>
      => <div>"Select a tab"</div>
    }
  }

  fun render : Html {
    <div::container>
      <div::content>
        <div::header>
          <h1::title>"Padre Style"</h1>
          <p::subtitle>"Modern UI Components for Mint Lang"</p>
        </div>

        <div::tabNav>
          renderTabButton("Layout")
          renderTabButton("Forms")
          renderTabButton("Data")
          renderTabButton("Feedback")
          renderTabButton("Navigation")
          renderTabButton("Charts")
          renderTabButton("Code")
          renderTabButton("Markdown")
          renderTabButton("Table")
          renderTabButton("Drag & Drop")
        </div>

        <div::tabContent>renderContent()</div>
      </div>
    </div>
  }
}
