// This is the component which gets rendered on the screen
component Main {
  connect ThemeStore exposing { theme }

  fun componentDidMount : Promise(Void) {
    `
    (() => {
      #{ThemeStore.initialize}();
      const path = window.location.pathname;
      const page = path.replace('/', '') || 'home';
      #{NavigationStore.setPage}(page);
    })()
    `
    Promise.resolve(void)
  }

  // Styles for the root element.
  style root {
    background-color: var(--bg-color, #eff2f5);
    box-sizing: border-box;
    min-height: 100vh;
    width: 100vw;
    font-family: Noto Sans, sans;
    color: var(--text-color, #333);
    position: relative;
    transition: background-color 0.3s ease, color 0.3s ease;
    overflow-x: hidden;
  }

  style layout {
    display: flex;
    padding-top: 64px;
    min-height: 100vh;
  }

  style container {
    flex: 1;
    margin-left: 220px;
    box-sizing: border-box;
    overflow-x: hidden;

    @media (max-width: 768px) {
      margin-left: 0;
      padding: 0;
      width: 100%;
    }
  }

  // Styles for the content.
  style content {
    justify-content: flex-start;
    flex-direction: column;
    align-items: center;
    display: flex;
    padding: 40px;
    background-color: var(--card-bg, #ffffff);
    margin: 20px;
    border-radius: 20px;
    min-height: calc(100vh - 104px);
    transition: background-color 0.3s ease;
    width: calc(100% - 40px);
    max-width: 1400px;
    margin-left: auto;
    margin-right: auto;
    box-sizing: border-box;

    @media (max-width: 768px) {
      background: rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(3px);
      padding: 16px;
      margin: 8px;
      width: calc(100% - 16px);
      max-width: 100%;
      border-radius: 12px;
    }
  }

  // Styles for the footer.
  style footer {
    border-top: 3px double rgba(0,0,0,0.1);
    padding-top: 30px;
    margin-top: 30px;
    max-width: 72ch;
    width: 100%;

    text-align: center;
    font-size: 20px;

    small {
      margin-top: 5px;
      font-size: 14px;
      display: block;
      opacity: 0.75;
    }
  }

  // Renders the component.
  fun render : Html {
    <div::root>
      <Navbar/>

      <div::layout>
        <Sidebar fixed={true}/>

        <div::container>
          <div::content>
            <PageContent/>

            <div::footer>
              @svg(../../assets/logo.svg)
              <small>"2018 - #{Time.year(Time.now())}"</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  }
}
