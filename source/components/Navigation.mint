/* Navigation Components */

/* Tabs Component - Modern tab navigation */
component Tabs {
  property tabs : Array(String) = []
  property activeTab : String = ""
  property onTabChange = (tab : String) : Promise(Void) { Promise.never() }

  style tabsContainer {
    background: var(--glass-bg, rgba(255, 255, 255, 0.1));
    border-radius: 12px;
    padding: 0.25rem;
    display: flex;
    gap: 0.25rem;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.2);
  }

  style tab {
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    color: rgba(255, 255, 255, 0.7);
    font-weight: 500;
    white-space: nowrap;
    user-select: none;

    &:hover {
      color: rgba(255, 255, 255, 0.9);
      background: var(--glass-bg, rgba(255, 255, 255, 0.1));
    }
  }

  style activeTab {
    background: var(--glass-hover, rgba(255, 255, 255, 0.2));
    color: white;
    font-weight: 600;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  fun handleTabClick (tab : String) : Promise(Void) {
    onTabChange(tab)
  }

  fun render : Html {
    <div::tabsContainer>
      for tab of tabs {
        <div::tab
          class={
            if tab == activeTab {
              "activeTab"
            } else {
              ""
            }
          }
          onClick={(event : Html.Event) { handleTabClick(tab) }}
        >tab</div>
      }
    </div>
  }
}

/* Breadcrumb Component - Navigation breadcrumbs */
component Breadcrumb {
  property items : Array(String) = []
  property separator : String = "/"

  property onItemClick =
    (item : String, index : Number) : Promise(Void) { Promise.never() }

  style breadcrumb {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.875rem;
  }

  style item {
    color: rgba(255, 255, 255, 0.7);
    cursor: pointer;
    transition: color 0.2s ease;
    text-decoration: none;

    &:hover {
      color: white;
    }
  }

  style activeItem {
    color: white;
    font-weight: 600;
    cursor: default;
  }

  style separator {
    color: rgba(255, 255, 255, 0.5);
    user-select: none;
  }

  fun render : Html {
    <nav::breadcrumb>
      {
        let indexedItems =
          Array.mapWithIndex(items,
            (item : String, index : Number) : Html {
              <>
                <span::item
                  class={
                    if index == Array.size(items) - 1 {
                      "activeItem"
                    } else {
                      ""
                    }
                  }
                  onClick={(event : Html.Event) { onItemClick(item, index) }}
                >item</span>

                {
                  if index < Array.size(items) - 1 {
                    <span::separator>separator</span>
                  } else {
                    <span/>
                  }
                }
              </>
            })

        for item of indexedItems {
          item
        }
      }
    </nav>
  }
}

/* Pagination Component - Page navigation */
component Pagination {
  property currentPage : Number = 1
  property totalPages : Number = 1
  property onPageChange = (page : Number) : Promise(Void) { Promise.never() }

  style pagination {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    justify-content: center;
  }

  style pageButton {
    padding: 0.5rem 0.75rem;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 6px;
    background: var(--glass-bg, rgba(255, 255, 255, 0.1));
    color: rgba(255, 255, 255, 0.8);
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 0.875rem;
    min-width: 2.5rem;
    text-align: center;
    backdrop-filter: blur(10px);

    &:hover {
      background: var(--glass-hover, rgba(255, 255, 255, 0.2));
      color: white;
    }

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  style activePage {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-color: #667eea;
    font-weight: 600;
  }

  style ellipsis {
    color: rgba(255, 255, 255, 0.5);
    padding: 0.5rem;
    user-select: none;
  }

  fun handlePageChange (page : Number) : Promise(Void) {
    if page >= 1 && page <= totalPages && page != currentPage {
      onPageChange(page)
    } else {
      Promise.never()
    }
  }

  fun getVisiblePages : Array(Number) {
    if totalPages <= 7 {
      Array.range(1, totalPages)
    } else {
      if currentPage <= 4 {
        [1, 2, 3, 4, 5, -1, totalPages]
      } else if currentPage >= totalPages - 3 {
        [
          1,
          -1,
          totalPages - 4,
          totalPages - 3,
          totalPages - 2,
          totalPages - 1,
          totalPages
        ]
      } else {
        [1, -1, currentPage - 1, currentPage, currentPage + 1, -1, totalPages]
      }
    }
  }

  fun render : Html {
    <div::pagination>
      <button::pageButton
        disabled={currentPage == 1}
        onClick={(event : Html.Event) { handlePageChange(currentPage - 1) }}
      >"‹"</button>

      {
        let visiblePages =
          getVisiblePages()

        for page of visiblePages {
          if page == -1 {
            <span::ellipsis>"..."</span>
          } else {
            <button::pageButton
              class={
                if page == currentPage {
                  "activePage"
                } else {
                  ""
                }
              }
              onClick={(event : Html.Event) { handlePageChange(page) }}
            >Number.toString(page)</button>
          }
        }
      }

      <button::pageButton
        disabled={currentPage == totalPages}
        onClick={(event : Html.Event) { handlePageChange(currentPage + 1) }}
      >"›"</button>
    </div>
  }
}

/* Stepper Component - Step-by-step navigation */
component Stepper {
  property steps : Array(String) = []
  property currentStep : Number = 0
  property onStepChange = (step : Number) : Promise(Void) { Promise.never() }

  style stepper {
    display: flex;
    align-items: center;
    width: 100%;
  }

  style step {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1;
    position: relative;
  }

  style stepNumber {
    width: 2.5rem;
    height: 2.5rem;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 0.875rem;
    transition: all 0.3s ease;
    border: 2px solid rgba(255, 255, 255, 0.3);
    background: var(--glass-bg, rgba(255, 255, 255, 0.1));
    color: rgba(255, 255, 255, 0.7);
    cursor: pointer;
  }

  style activeStep {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-color: #667eea;
    color: white;
  }

  style completedStep {
    background: rgba(16, 185, 129, 0.9);
    border-color: #10b981;
    color: white;
  }

  style stepLabel {
    margin-top: 0.5rem;
    font-size: 0.75rem;
    color: rgba(255, 255, 255, 0.7);
    text-align: center;
    font-weight: 500;
  }

  style activeLabel {
    color: white;
    font-weight: 600;
  }

  style connector {
    height: 2px;
    background: var(--glass-hover, rgba(255, 255, 255, 0.2));
    flex: 1;
    margin: 0 0.5rem;
    position: absolute;
    top: 1.25rem;
    left: 50%;
    right: -50%;
    z-index: 1;
  }

  style activeConnector {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  }

  fun handleStepClick (step : Number) : Promise(Void) {
    onStepChange(step)
  }

  fun getStepClass (index : Number) : String {
    if index < currentStep {
      "completedStep"
    } else if index == currentStep {
      "activeStep"
    } else {
      ""
    }
  }

  fun render : Html {
    <div::stepper>
      {
        let indexedSteps =
          Array.mapWithIndex(steps,
            (step : String, index : Number) : Html {
              <div::step key={Number.toString(index)}>
                {
                  if index < Array.size(steps) - 1 {
                    <div::connector
                      class={
                        if index < currentStep {
                          "activeConnector"
                        } else {
                          ""
                        }
                      }
                    />
                  } else {
                    <div/>
                  }
                }

                <div::stepNumber
                  class={getStepClass(index)}
                  onClick={(event : Html.Event) { handleStepClick(index) }}
                >
                  {
                    if index < currentStep {
                      "✓"
                    } else {
                      Number.toString(index + 1)
                    }
                  }
                </div>

                <div::stepLabel
                  class={
                    if index == currentStep {
                      "activeLabel"
                    } else {
                      ""
                    }
                  }
                >step</div>
              </div>
            })

        for step of indexedSteps {
          step
        }
      }
    </div>
  }
}

/* NavBar Component - Top navigation bar */
component NavBar {
  property brand : String = ""
  property items : Array(String) = []
  property activeItem : String = ""
  property onItemClick = (item : String) : Promise(Void) { Promise.never() }

  style navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 1.5rem;
    background: var(--glass-bg, rgba(255, 255, 255, 0.1));
    backdrop-filter: blur(20px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  }

  style brand {
    font-size: 1.25rem;
    font-weight: 700;
    color: white;
    text-decoration: none;
  }

  style nav {
    display: flex;
    gap: 2rem;
    align-items: center;
  }

  style navItem {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    font-weight: 500;
    cursor: pointer;
    transition: color 0.2s ease;
    position: relative;

    &:hover {
      color: white;
    }

    &::after {
      content: "";
      position: absolute;
      bottom: -0.5rem;
      left: 0;
      right: 0;
      height: 2px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      transform: scaleX(0);
      transition: transform 0.2s ease;
    }
  }

  style activeNavItem {
    color: white;
    font-weight: 600;

    &::after {
      transform: scaleX(1);
    }
  }

  fun render : Html {
    <nav::navbar>
      <div::brand>brand</div>

      <div::nav>
        for item of items {
          <a::navItem
            class={
              if item == activeItem {
                "activeNavItem"
              } else {
                ""
              }
            }
            onClick={(event : Html.Event) { onItemClick(item) }}
          >item</a>
        }
      </div>
    </nav>
  }
}
