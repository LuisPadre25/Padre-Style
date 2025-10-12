/*
IndexBarPage - Professional IndexBar Component Showcase
 * Using ComponentShowcase template with Mobile/Tablet/Desktop simulators
*/
component IndexBarPage {
  connect NavigationStore exposing { setPage }
  connect ViewModeStore exposing { viewMode }
  connect ThemeStore exposing { theme }

  fun componentDidMount : Promise(Void) {
    setPage("index-bar")
  }

  /* State for interactive controls */
  state selectedIndex : String = ""

  state activeIndex : String = ""
  state previousIndex : String = ""
  state selectCount : Number = 0

  /* Configuration State */
  state showHint : Bool = true

  state sidebarPosition : String = "right"
  state highlightColor : String = "#1989fa"
  state customIndexes : Bool = false

  /* Event Handlers */
  fun handleSelect (event : IndexBarSelectEvent) : Promise(Void) {
    `console.log('onSelect called:', #{event.index}, 'count:', #{selectCount})`

    next { selectedIndex: event.index, selectCount: selectCount + 1 }
  }

  fun handleChange (event : IndexBarChangeEvent) : Promise(Void) {
    `console.log('onChange called:', #{event.index}, 'prev:', #{event.previousIndex})`

    next { activeIndex: event.index, previousIndex: event.previousIndex }
  }

  /* Configuration Handlers */
  fun toggleHint (event : Html.Event) : Promise(Void) {
    next { showHint: !showHint }
  }

  fun togglePosition (event : Html.Event) : Promise(Void) {
    next {
      sidebarPosition:
        if sidebarPosition == "right" {
          "left"
        } else {
          "right"
        }
    }
  }

  fun toggleCustomIndexes (event : Html.Event) : Promise(Void) {
    next { customIndexes: !customIndexes }
  }

  fun changeHighlightColor (color : String) : Promise(Void) {
    next { highlightColor: color }
  }

  /* Sample Data */
  fun getContactsByLetter (letter : String) : Array(String) {
    case letter {
      "A" =>
        ["Alice Anderson", "Andrew Adams", "Anna Allen", "Anthony Armstrong"]

      "B" => ["Bob Brown", "Barbara Bennett", "Brian Baker", "Betty Brooks"]

      "C" =>
        [
          "Carol Clark",
          "Charles Cooper",
          "Christina Carter",
          "Christopher Campbell"
        ]

      "D" => ["David Davis", "Diana Dixon", "Daniel Douglas", "Dorothy Diaz"]

      "E" => ["Emma Edwards", "Eric Evans", "Elizabeth Ellis", "Edward Elliott"]

      "F" => ["Frank Foster", "Fiona Fisher", "Fred Freeman", "Frances Flores"]

      "G" => ["George Green", "Grace Gibson", "Gary Graham", "Gloria Gonzalez"]

      "H" => ["Helen Harris", "Henry Hall", "Hannah Hughes", "Howard Henderson"]

      "I" => ["Ian Irving", "Isabel Ingram", "Isaac Irwin"]

      "J" => [
        "John Johnson",
        "Julia Jackson",
        "James Jones",
        "Jennifer Jenkins"
      ]

      "K" => [
        "Karen King",
        "Kevin Kelly",
        "Katherine Knight",
        "Kenneth Kennedy"
      ]

      "L" => ["Linda Lewis", "Larry Lee", "Laura Lopez", "Leonard Long"]

      "M" => [
        "Mary Martin",
        "Michael Moore",
        "Margaret Miller",
        "Mark Mitchell"
      ]

      "N" => ["Nancy Nelson", "Nicholas Nash", "Natalie Newman"]

      "O" => ["Oliver Owens", "Olivia O'Brien", "Oscar Ortiz"]

      "P" =>
        ["Patricia Parker", "Paul Peterson", "Pamela Phillips", "Peter Powell"]

      "Q" => ["Quinn Quigley", "Queenie Quick"]

      "R" =>
        [
          "Robert Rodriguez",
          "Rachel Roberts",
          "Richard Russell",
          "Rebecca Reed"
        ]

      "S" =>
        ["Sarah Smith", "Steven Stewart", "Susan Sanders", "Samuel Sullivan"]

      "T" =>
        ["Thomas Taylor", "Theresa Turner", "Timothy Thompson", "Teresa Torres"]

      "U" => ["Ursula Underwood", "Ulysses Urban"]

      "V" => ["Victoria Valdez", "Vincent Vaughn", "Veronica Villa"]

      "W" => ["William Williams", "Wendy Walsh", "Walter Watson", "Wanda Woods"]

      "X" => ["Xavier Ximenez", "Xena Xu"]

      "Y" => ["Yvonne Young", "Yolanda Yates", "Yasmine Yu"]

      "Z" => ["Zachary Zhang", "Zoe Zimmerman", "Zara Ziegler"]

      => []
    }
  }

  fun getAllIndexes : Array(String) {
    [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "K",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ]
  }

  fun getCustomIndexes : Array(String) {
    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  }

  /* Styles */
  style statsBar {
    display: flex;
    gap: 16px;
    padding: 16px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    flex-wrap: wrap;
    border-radius: 12px;
    margin-bottom: 20px;
  }

  style statItem {
    display: flex;
    flex-direction: column;
    gap: 4px;
  }

  style statLabel {
    font-size: 11px;
    opacity: 0.8;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-weight: 500;
  }

  style statValue {
    font-size: 18px;
    font-weight: 700;
  }

  style controlsTitle {
    font-size: 16px;
    font-weight: 600;
    color: var(--heading-color, #1a1a1a);
    margin: 0 0 16px 0;
  }

  style controlsGrid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 16px;
  }

  style controlItem {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  style checkbox {
    width: 20px;
    height: 20px;
    cursor: pointer;
    accent-color: var(--primary-color, #1989fa);
  }

  style controlLabel {
    font-size: 14px;
    color: var(--text-color, #333);
    cursor: pointer;
    user-select: none;
  }

  style colorPicker {
    display: flex;
    gap: 8px;
    align-items: center;
    flex-wrap: wrap;
  }

  style colorButton {
    width: 32px;
    height: 32px;
    border-radius: 8px;
    border: 2px solid transparent;
    cursor: pointer;
    transition: all 0.2s ease;

    &:hover {
      transform: scale(1.1);
      border-color: rgba(0, 0, 0, 0.2);
    }

    &.active {
      border-color: rgba(0, 0, 0, 0.5);
      box-shadow: 0 0 0 3px rgba(0, 0, 0, 0.1);
    }
  }

  style contactList {
    background: #fff;
    width: 100%;
    min-height: 100px;
  }

  style contactItem {
    padding: 14px 16px;
    border-bottom: 1px solid #ebedf0;
    color: #323233;
    font-size: 14px;
    transition: background 0.15s ease;
    cursor: pointer;
    user-select: none;
    display: flex;
    align-items: center;
    gap: 12px;

    &:hover {
      background: #f7f8fa;
    }

    &:active {
      background: #ebedf0;
    }

    &::before {
      content: "👤";
      font-size: 16px;
      opacity: 0.6;
    }
  }

  style emptySection {
    padding: 60px 20px;
    text-align: center;
    color: #969799;
    font-size: 13px;
    font-style: italic;
  }

  /* Get first letter */
  fun getFirstLetter (name : String) : String {
    `#{name}.charAt(0)`
  }

  /* Render preview content */
  fun renderPreviewContent : Html {
    <div style="width: 100%; height: 600px; overflow-y: auto; overflow-x: hidden; position: relative;">
      <IndexBar
        indexList={
          if customIndexes {
            getCustomIndexes()
          } else {
            getAllIndexes()
          }
        }
        highlightColor={highlightColor}
        sticky={true}
        stickyOffsetTop={0}
        showHint={showHint}
        sidebarPosition={sidebarPosition}
        sidebarOffset={0}
        indexFontSize={10}
        hintFontSize={24}
        animationDuration={300}
        onSelect={handleSelect}
        onChange={handleChange}
      >
        if customIndexes {
          for number of getCustomIndexes() {
            <div key={number} style="width: 100%;">
              <IndexAnchor index={number} sticky={true} stickyOffsetTop={0}>
                <span style="font-weight: 600;">
                  {
                    "Section " + number
                  }
                </span>
              </IndexAnchor>

              <div::contactList>
                <div::emptySection>
                  {
                    "Custom section " + number
                  }
                </div>
              </div>
            </div>
          }
        } else {
          for letter of getAllIndexes() {
            <div key={letter} style="width: 100%;">
              <IndexAnchor
                index={letter}
                sticky={true}
                stickyOffsetTop={0}
                activeColor={highlightColor}
              >
                <div
                  style={
                    "display: flex; align-items: center; gap: 8px; font-weight: 600; " + if letter == activeIndex {
                      "color: " + highlightColor + ";"
                    } else {
                      ""
                    }
                  }
                >
                  if letter == activeIndex {
                    <span style="color: #{highlightColor};">{"▶ "}</span>
                  } else {
                    <></>
                  }

                  <span>
                    {
                      letter
                    }
                  </span>

                  if letter == selectedIndex {
                    <span
                      style="background: #{highlightColor}; color: white; padding: 2px 8px; border-radius: 12px; font-size: 11px; margin-left: auto;"
                    >"SELECTED"</span>
                  } else {
                    <></>
                  }
                </div>
              </IndexAnchor>

              <div::contactList>
                for contact of getContactsByLetter(letter) {
                  <div::contactItem key={contact}>
                    {
                      contact
                    }
                  </div>
                }
              </div>
            </div>
          }
        }
      </IndexBar>
    </div>
  }

  /* Render controls */
  fun renderControls : Html {
    <div>
      <div::statsBar>
        <div::statItem>
          <div::statLabel>"Selected"</div>

          <div::statValue>
            {
              if String.isEmpty(selectedIndex) {
                "—"
              } else {
                selectedIndex
              }
            }
          </div>
        </div>

        <div::statItem>
          <div::statLabel>"Active"</div>

          <div::statValue>
            {
              if String.isEmpty(activeIndex) {
                "—"
              } else {
                activeIndex
              }
            }
          </div>
        </div>

        <div::statItem>
          <div::statLabel>"Previous"</div>

          <div::statValue>
            {
              if String.isEmpty(previousIndex) {
                "—"
              } else {
                previousIndex
              }
            }
          </div>
        </div>

        <div::statItem>
          <div::statLabel>"Count"</div>

          <div::statValue>
            {
              Number.toString(selectCount)
            }
          </div>
        </div>
      </div>

      <div::controlsTitle>"Configuration"</div>

      <div::controlsGrid>
        <div::controlItem>
          <input::checkbox
            type="checkbox"
            checked={showHint}
            onChange={toggleHint}
            id="showHint"
          />

          <label::controlLabel for="showHint">"Show Hint"</label>
        </div>

        <div::controlItem>
          <input::checkbox
            type="checkbox"
            checked={sidebarPosition == "left"}
            onChange={togglePosition}
            id="sidebarLeft"
          />

          <label::controlLabel for="sidebarLeft">"Sidebar Left"</label>
        </div>

        <div::controlItem>
          <input::checkbox
            type="checkbox"
            checked={customIndexes}
            onChange={toggleCustomIndexes}
            id="customIndexes"
          />

          <label::controlLabel for="customIndexes">"Custom (1-10)"</label>
        </div>

        <div::controlItem>
          <span::controlLabel>"Highlight:"</span>

          <div::colorPicker>
            <button::colorButton
              class={
                if highlightColor == "#1989fa" {
                  "active"
                } else {
                  ""
                }
              }
              style="background: #1989fa;"
              onClick={(e : Html.Event) { changeHighlightColor("#1989fa") }}
            />

            <button::colorButton
              class={
                if highlightColor == "#07c160" {
                  "active"
                } else {
                  ""
                }
              }
              style="background: #07c160;"
              onClick={(e : Html.Event) { changeHighlightColor("#07c160") }}
            />

            <button::colorButton
              class={
                if highlightColor == "#ff976a" {
                  "active"
                } else {
                  ""
                }
              }
              style="background: #ff976a;"
              onClick={(e : Html.Event) { changeHighlightColor("#ff976a") }}
            />

            <button::colorButton
              class={
                if highlightColor == "#ee0a24" {
                  "active"
                } else {
                  ""
                }
              }
              style="background: #ee0a24;"
              onClick={(e : Html.Event) { changeHighlightColor("#ee0a24") }}
            />
          </div>
        </div>
      </div>
    </div>
  }

  /* API Documentation */
  fun getApiProperties : Array(ApiProperty) {
    [
      {
        name: "indexList",
        description: "Array of index characters to display",
        type: "Array(String)",
        defaultValue: "A-Z"
      },
      {
        name: "sticky",
        description: "Enable sticky anchor positioning",
        type: "Bool",
        defaultValue: "true"
      },
      {
        name: "stickyOffsetTop",
        description: "Offset from top when sticky (px)",
        type: "Number",
        defaultValue: "0"
      },
      {
        name: "highlightColor",
        description: "Color for active index highlight",
        type: "String",
        defaultValue: "#1989fa"
      },
      {
        name: "zIndex",
        description: "Z-index for sidebar positioning",
        type: "Number",
        defaultValue: "1"
      },
      {
        name: "showHint",
        description: "Show floating hint on touch",
        type: "Bool",
        defaultValue: "true"
      },
      {
        name: "hintColor",
        description: "Custom hint text color",
        type: "String",
        defaultValue: "#fff"
      },
      {
        name: "hintBackground",
        description: "Custom hint background color",
        type: "String",
        defaultValue: "rgba(0,0,0,0.7)"
      },
      {
        name: "sidebarPosition",
        description: "Sidebar position: 'left' or 'right'",
        type: "String",
        defaultValue: "right"
      },
      {
        name: "sidebarOffset",
        description: "Offset from screen edge (px)",
        type: "Number",
        defaultValue: "0"
      },
      {
        name: "indexFontSize",
        description: "Font size for index items (px)",
        type: "Number",
        defaultValue: "10"
      },
      {
        name: "hintFontSize",
        description: "Font size for hint display (px)",
        type: "Number",
        defaultValue: "24"
      },
      {
        name: "animationDuration",
        description: "Animation duration (ms)",
        type: "Number",
        defaultValue: "300"
      }
    ]
  }

  fun getApiEvents : Array(ApiProperty) {
    [
      {
        name: "onSelect",
        description: "Triggered when user clicks/touches an index",
        type: "IndexBarSelectEvent",
        defaultValue: "{ index, timestamp }"
      },
      {
        name: "onChange",
        description: "Triggered when active index changes",
        type: "IndexBarChangeEvent",
        defaultValue: "{ index, previousIndex }"
      }
    ]
  }

  /* Code Examples */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic Usage",
        description: "Simple contact list with alphabetical index",
        snippet:
          {
            code:
              "<IndexBar>
  <IndexAnchor index=\"A\">
    <span>\"A\"</span>
  </IndexAnchor>
  <div>/* Content for A */</div>

  <IndexAnchor index=\"B\">
    <span>\"B\"</span>
  </IndexAnchor>
  <div>/* Content for B */</div>
</IndexBar>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Custom Configuration",
        description: "With custom colors and positioning",
        snippet:
          {
            code:
              "<IndexBar
  highlightColor=\"#07c160\"
  showHint={true}
  sidebarPosition=\"left\"
  sticky={true}
  onSelect={handleSelect}
  onChange={handleChange}
>
  {/* content */}
</IndexBar>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      },
      {
        title: "Custom Indexes",
        description: "Use numbers or custom characters",
        snippet:
          {
            code:
              "<IndexBar
  indexList={[\"1\", \"2\", \"3\", \"4\", \"5\"]}
  highlightColor=\"#ff976a\"
>
  <IndexAnchor index=\"1\">
    <span>\"Section 1\"</span>
  </IndexAnchor>
  <div>/* Section 1 content */</div>
</IndexBar>",
            language: "mint"
          },
        previewContent: Html.empty(),
        showReplay: false
      }
    ]
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="IndexBar"
      description="Professional alphabetical index navigation for long lists. Touch-optimized with haptic feedback, intersection observer, and smooth scrolling. Perfect for contact lists, directories, and sorted content."
      badge="Navigation"
      previewContent={renderPreviewContent()}
      controlsContent={renderControls()}
      usageText="IndexBar provides quick navigation through alphabetically organized content. The sidebar allows users to jump to specific sections by clicking or dragging their finger over the index characters."
      codeExamples={getCodeExamples()}
      apiProperties={getApiProperties()}
      events={getApiEvents()}
      enabledTabs={["preview", "usage", "api"]}
      hideSimulator={false}
      mobileTitle="IndexBar Demo"
      desktopUrl="padre-style.dev/index-bar"
    />
  }
}
