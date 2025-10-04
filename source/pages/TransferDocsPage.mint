component TransferDocsPage {
  connect ThemeStore exposing { currentTheme }

  state demoData : Array(TransferItem) = []
  state basicTransferData : Array(TransferItem) = []
  state smallTransferData : Array(TransferItem) = []

  fun componentDidMount : Promise(Void) {
    initializeDemoData()
  }

  fun initializeDemoData : Promise(Void) {
    let demos = [
      { value: "item1", name: "React", description: "A JavaScript library for building user interfaces", chosen: false, selected: false, disabled: false, keywords: ["javascript", "frontend", "ui", "library"], justMoved: false },
      { value: "item2", name: "Vue.js", description: "The Progressive JavaScript Framework", chosen: false, selected: false, disabled: false, keywords: ["javascript", "frontend", "progressive", "framework"], justMoved: false },
      { value: "item3", name: "Angular", description: "Platform for building mobile and desktop web applications", chosen: true, selected: false, disabled: false, keywords: ["typescript", "frontend", "platform", "mobile"], justMoved: false },
      { value: "item4", name: "Svelte", description: "Cybernetically enhanced web apps", chosen: false, selected: false, disabled: false, keywords: ["javascript", "frontend", "compiler", "performance"], justMoved: false },
      { value: "item5", name: "Mint", description: "A refreshing language for the front-end web", chosen: true, selected: false, disabled: false, keywords: ["mint", "functional", "frontend", "refreshing"], justMoved: false },
      { value: "item6", name: "jQuery", description: "Fast, small, and feature-rich JavaScript library", chosen: false, selected: false, disabled: true, keywords: ["javascript", "dom", "legacy"], justMoved: false },
      { value: "item7", name: "Ember.js", description: "A framework for ambitious web developers", chosen: false, selected: false, disabled: false, keywords: ["javascript", "frontend", "ambitious", "convention"], justMoved: false },
      { value: "item8", name: "Alpine.js", description: "A lightweight JavaScript framework", chosen: false, selected: false, disabled: false, keywords: ["javascript", "lightweight", "reactive"], justMoved: false }
    ]

    let basicData = [
      { value: "option1", name: "Option 1", description: "First option", chosen: false, selected: false, disabled: false, keywords: ["one", "first"], justMoved: false },
      { value: "option2", name: "Option 2", description: "Second option", chosen: true, selected: false, disabled: false, keywords: ["two", "second"], justMoved: false },
      { value: "option3", name: "Option 3", description: "Third option", chosen: false, selected: false, disabled: false, keywords: ["three", "third"], justMoved: false }
    ]

    let smallData = [
      { value: "small1", name: "Small Item 1", description: "Compact size demo", chosen: false, selected: false, disabled: false, keywords: ["small", "compact"], justMoved: false },
      { value: "small2", name: "Small Item 2", description: "Another compact item", chosen: true, selected: false, disabled: false, keywords: ["small", "another"], justMoved: false }
    ]

    next {
      demoData: demos,
      basicTransferData: basicData,
      smallTransferData: smallData
    }
  }

  fun handleDemoTransfer (chosen : Array(TransferItem), unChosen : Array(TransferItem)) : Promise(Void) {
    next { demoData: Array.concat([chosen, unChosen]) }
  }

  fun handleBasicTransfer (chosen : Array(TransferItem), unChosen : Array(TransferItem)) : Promise(Void) {
    next { basicTransferData: Array.concat([chosen, unChosen]) }
  }

  fun handleSmallTransfer (chosen : Array(TransferItem), unChosen : Array(TransferItem)) : Promise(Void) {
    next { smallTransferData: Array.concat([chosen, unChosen]) }
  }

  style page {
    padding: 2rem;
    max-width: 1200px;
    margin: 0 auto;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 3rem;
  }

  style title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
    text-align: center;
  }

  style subtitle {
    font-size: 1.25rem;
    margin-bottom: 1rem;
    font-weight: 600;
    padding-bottom: 0.5rem;
    border-bottom-width: 2px;
    border-bottom-style: solid;
  }

  style description {
    font-size: 1rem;
    margin-bottom: 1.5rem;
    opacity: 0.9;
  }

  style demoContainer {
    padding: 2rem;
    border-radius: 12px;
    margin: 1.5rem 0;
    border-width: 1px;
    border-style: solid;
  }

  style codeBlock {
    background: rgba(0, 0, 0, 0.05);
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 1rem;
    font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', monospace;
    font-size: 0.875rem;
    overflow-x: auto;
    margin: 1rem 0;
    white-space: pre;
  }

  style featureList {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1rem;
    margin: 1.5rem 0;
  }

  style featureCard {
    padding: 1.5rem;
    border-radius: 8px;
    border-width: 1px;
    border-style: solid;
  }

  style propTable {
    width: 100%;
    border-collapse: collapse;
    margin: 1.5rem 0;
    border-radius: 8px;
    overflow: hidden;
    border-width: 1px;
    border-style: solid;
  }

  style propHeader {
    padding: 1rem;
    font-weight: 600;
    text-align: left;
    border-bottom-width: 1px;
    border-bottom-style: solid;
  }

  style propCell {
    padding: 0.75rem 1rem;
    border-bottom-width: 1px;
    border-bottom-style: solid;
    vertical-align: top;
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getSubtitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getAccent(currentTheme)};
    "
  }

  fun getDescriptionStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getDemoContainerStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-color: #{ThemeHelpers.getBorderSecondary(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getFeatureCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getTableStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getTableHeaderStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  fun getTableCellStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getBorderSecondary(currentTheme)};
    "
  }

  fun render : Html {
    <div::page
      style="
        background: #{ThemeHelpers.getBackground(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      "
    >
      <div::section>
        <h1::title style={getTitleStyles()}>
          "Transfer Component"
        </h1>
        <p::description style={getDescriptionStyles()}>
          "A dual-list transfer component that allows users to move items between two lists. Perfect for selecting items from a large dataset with search and selection capabilities."
        </p>
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Features"
        </h2>
        <div::featureList>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"🔍 Search & Filter"</h3>
            <p>"Built-in search functionality with keyword matching"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"✅ Bulk Selection"</h3>
            <p>"Select all items with a single click"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"🎨 Theme Support"</h3>
            <p>"Fully integrated with the theme system"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"♿ Accessibility"</h3>
            <p>"Keyboard navigation and ARIA labels"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"🚫 Disabled States"</h3>
            <p>"Support for disabled items and component"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h3>"📱 Responsive"</h3>
            <p>"Works on mobile and desktop devices"</p>
          </div>
        </div>
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Basic Usage"
        </h2>
        <div::demoContainer style={getDemoContainerStyles()}>
          <Transfer
            data={basicTransferData}
            onTransfer={handleBasicTransfer}
            leftTitle="Available Items"
            rightTitle="Selected Items"
            height={200}
          />
        </div>
        <CodeHighlight
          language="mint"
          code="<Transfer
  data={myTransferData}
  onTransfer={handleTransfer}
  leftTitle=\"Available Items\"
  rightTitle=\"Selected Items\"
  height={200}
/>"
        />
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Advanced Example"
        </h2>
        <p::description style={getDescriptionStyles()}>
          "A more complex example with search, custom titles, and callback handling."
        </p>
        <div::demoContainer style={getDemoContainerStyles()}>
          <Transfer
            data={demoData}
            onTransfer={handleDemoTransfer}
            leftTitle="Available Frameworks"
            rightTitle="Selected Frameworks"
            checkAllText="Select All"
            searchPlaceholder="Search frameworks..."
            showSearch={true}
            height={300}
          />
        </div>
        <CodeHighlight
          language="mint"
          code="<Transfer
  data={frameworkData}
  onTransfer={handleFrameworkTransfer}
  leftTitle=\"Available Frameworks\"
  rightTitle=\"Selected Frameworks\"
  checkAllText=\"Select All\"
  searchPlaceholder=\"Search frameworks...\"
  showSearch={true}
  height={300}
/>"
        />
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Compact Size"
        </h2>
        <p::description style={getDescriptionStyles()}>
          "Transfer component with reduced height for smaller interfaces."
        </p>
        <div::demoContainer style={getDemoContainerStyles()}>
          <Transfer
            data={smallTransferData}
            onTransfer={handleSmallTransfer}
            leftTitle="Source"
            rightTitle="Target"
            height={150}
            showSearch={false}
          />
        </div>
        <CodeHighlight
          language="mint"
          code="<Transfer
  data={compactData}
  onTransfer={handleCompactTransfer}
  leftTitle=\"Source\"
  rightTitle=\"Target\"
  height={150}
  showSearch={false}
/>"
        />
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Disabled State"
        </h2>
        <div::demoContainer style={getDemoContainerStyles()}>
          <Transfer
            data={basicTransferData}
            onTransfer={handleBasicTransfer}
            disabled={true}
            leftTitle="Disabled Transfer"
            rightTitle="Cannot Select"
          />
        </div>
        <CodeHighlight
          language="mint"
          code="<Transfer
  data={myData}
  onTransfer={handleTransfer}
  disabled={true}
  leftTitle=\"Disabled Transfer\"
  rightTitle=\"Cannot Select\"
/>"
        />
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Properties"
        </h2>
        <table::propTable style={getTableStyles()}>
          <thead>
            <tr>
              <th::propHeader style={getTableHeaderStyles()}>"Property"</th>
              <th::propHeader style={getTableHeaderStyles()}>"Type"</th>
              <th::propHeader style={getTableHeaderStyles()}>"Default"</th>
              <th::propHeader style={getTableHeaderStyles()}>"Description"</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"data"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"Array(TransferItem)"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"[]"</code></td>
              <td::propCell style={getTableCellStyles()}>"Array of items to display"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"height"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"Number"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"280"</code></td>
              <td::propCell style={getTableCellStyles()}>"Height of the transfer lists"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"showSearch"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"Bool"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"true"</code></td>
              <td::propCell style={getTableCellStyles()}>"Show search input fields"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"disabled"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"Bool"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"false"</code></td>
              <td::propCell style={getTableCellStyles()}>"Disable the entire component"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"leftTitle"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"String"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"\"Available\""</code></td>
              <td::propCell style={getTableCellStyles()}>"Title for the left list"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"rightTitle"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"String"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"\"Selected\""</code></td>
              <td::propCell style={getTableCellStyles()}>"Title for the right list"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"checkAllText"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"String"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"\"Select All\""</code></td>
              <td::propCell style={getTableCellStyles()}>"Text for select all buttons"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"searchPlaceholder"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"String"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"\"Search items...\""</code></td>
              <td::propCell style={getTableCellStyles()}>"Placeholder text for search inputs"</td>
            </tr>
            <tr>
              <td::propCell style={getTableCellStyles()}><code>"onTransfer"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"Function"</code></td>
              <td::propCell style={getTableCellStyles()}><code>"-"</code></td>
              <td::propCell style={getTableCellStyles()}>"Callback when items are transferred"</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "TransferItem Type"
        </h2>
        <p::description style={getDescriptionStyles()}>
          "Each item in the data array should conform to the TransferItem type:"
        </p>
        <CodeHighlight
          language="mint"
          code="type TransferItem {
  value : String,
  name : String,
  description : String,
  chosen : Bool,
  selected : Bool,
  disabled : Bool,
  keywords : Array(String),
  justMoved : Bool
}"
        />
      </div>

      <div::section>
        <h2::subtitle style={getSubtitleStyles()}>
          "Usage Notes"
        </h2>
        <div::featureList>
          <div::featureCard style={getFeatureCardStyles()}>
            <h4>"Search Functionality"</h4>
            <p>"Search works across name, description, and keywords fields"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h4>"Selection State"</h4>
            <p>"Items must be selected before they can be transferred"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h4>"Disabled Items"</h4>
            <p>"Items with disabled=true cannot be selected or transferred"</p>
          </div>
          <div::featureCard style={getFeatureCardStyles()}>
            <h4>"Callbacks"</h4>
            <p>"onTransfer is called with updated chosen and unChosen arrays"</p>
          </div>
        </div>
      </div>
    </div>
  }
}