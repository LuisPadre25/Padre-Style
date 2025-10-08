component AddressEditPage {
  connect ViewModeStore exposing { viewMode }

  state searchResult : Array(AddressEditSearchItem) = []

  state addressInfo : AddressEditInfo =
    {
      name: "John Doe",
      tel: "+1 234-567-8900",
      province: "California",
      city: "Los Angeles",
      county: "Los Angeles County",
      addressDetail: "123 Main Street, Apt 4B, Building A",
      areaCode: "90001",
      isDefault: true
    }

  state emptyAddressInfo : AddressEditInfo =
    {
      name: "",
      tel: "",
      province: "",
      city: "",
      county: "",
      addressDetail: "",
      areaCode: "",
      isDefault: false
    }

  state showToast : Bool = false
  state toastMessage : String = ""
  state showExample : String = "filled"

  /* Mobile-First Styles */
  style container {
    width: 100%;
    background: var(--mint-background, #f7f8fa);
    min-height: 100vh;
  }

  style header {
    background: white;
    padding: 20px;
    border-bottom: 1px solid var(--mint-border-color, #ebedf0);
    position: sticky;
    top: 0;
    z-index: 100;
  }

  style title {
    font-size: 24px;
    font-weight: 600;
    margin: 0 0 8px;
    color: var(--mint-text-color, #323233);
  }

  style subtitle {
    font-size: 14px;
    color: var(--mint-text-color-2, #646566);
    margin: 0;
    line-height: 1.6;
  }

  style content {
    max-width: 1400px;
    margin: 0 auto;
    padding: 20px;
  }

  style demoSection {
    background: white;
    border-radius: 8px;
    padding: 24px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
  }

  style sectionTitle {
    font-size: 20px;
    font-weight: 600;
    margin: 0 0 16px;
    color: var(--mint-text-color, #323233);
    display: flex;
    align-items: center;
    gap: 8px;
  }

  style badge {
    background: var(--mint-primary-color, #1989fa);
    color: white;
    padding: 2px 8px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 600;
  }

  style mobileSimulator {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    justify-content: center;
  }

  style simulatorFrame {
    flex: 1;
    min-width: 320px;
    max-width: 375px;
    background: white;
    border-radius: 36px;
    padding: 12px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    position: relative;
    transition: all 0.3s ease;
  }

  style desktopView {
    max-width: 100%;
    border-radius: 8px;
    padding: 0;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  style simulatorNotch {
    height: 20px;
    background: #1a1a1a;
    border-radius: 24px 24px 0 0;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  style simulatorSpeaker {
    width: 80px;
    height: 4px;
    background: #2a2a2a;
    border-radius: 2px;
  }

  style simulatorScreen {
    background: var(--mint-background, #f7f8fa);
    height: 640px;
    overflow-y: auto;
    overflow-x: hidden;
    border-radius: 0 0 24px 24px;
    position: relative;
    transition: all 0.3s ease;
  }

  style desktopScreen {
    height: auto;
    min-height: 400px;
    border-radius: 8px;
  }

  style codeBlock {
    background: #f7f8fa;
    border-radius: 8px;
    padding: 16px;
    margin-top: 16px;
    font-family: 'Monaco', 'Menlo', 'Consolas', monospace;
    font-size: 13px;
    color: #1f2937;
    overflow-x: auto;
    border: 1px solid #e5e7eb;
    line-height: 1.6;
  }

  style apiTable {
    width: 100%;
    border-collapse: collapse;
    margin-top: 16px;
    font-size: 14px;
  }

  style tableHead {
    background: #f7f8fa;
  }

  style tableHeader {
    padding: 12px;
    text-align: left;
    font-weight: 600;
    color: var(--van-text-color, #323233);
    border-bottom: 2px solid #e5e7eb;
  }

  style tableRow {
    border-bottom: 1px solid #e5e7eb;

    &:hover {
      background: #f9fafb;
    }
  }

  style tableCell {
    padding: 12px;
    color: var(--van-text-color-2, #646566);
  }

  style tableCellCode {
    padding: 12px;
    font-family: 'Monaco', 'Menlo', 'Consolas', monospace;
    font-size: 12px;
    color: #d63384;
  }

  style toast {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 12px 24px;
    border-radius: 8px;
    font-size: 14px;
    z-index: 9999;
    animation: fadeInOut 2s ease-in-out;
  }

  style infoBox {
    background: #e7f5ff;
    border-left: 4px solid #1989fa;
    padding: 12px 16px;
    border-radius: 4px;
    margin-top: 16px;
    font-size: 14px;
    color: #1976d2;
    line-height: 1.6;
  }

  style exampleTabs {
    display: flex;
    gap: 12px;
    margin-bottom: 16px;
    background: var(--mint-background, #f7f8fa);
    padding: 8px;
    border-radius: 8px;
  }

  style tabButton {
    flex: 1;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.2s;
    background: transparent;
    color: var(--mint-text-color-2, #646566);
  }

  style tabButtonActive {
    background: white;
    color: var(--mint-primary-color, #1989fa);
    font-weight: 500;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  }

  /* Functions */
  fun hideToast : Promise(Void) {
    next { showToast: false }
  }

  fun displayToast (message : String) : Promise(Void) {
    next { showToast: true, toastMessage: message }
  }

  fun showToastMessage (message : String) : Promise(Void) {
    `
    (() => {
      #{displayToast(message)}

      setTimeout(() => {
        #{hideToast()}
      }, 2000);
    })()
    `

    Promise.resolve(void)
  }

  fun handleSave (info : AddressEditInfo) : Promise(Void) {
    showToastMessage("Address saved!")
  }

  fun handleDelete (info : AddressEditInfo) : Promise(Void) {
    showToastMessage("Address deleted!")
  }

  fun handleChange (key : String, value : String) : Promise(Void) {
    Promise.resolve(void)
  }

  fun handleChangeDetail (value : String) : Promise(Void) {
    if String.isNotEmpty(value) {
      next {
        searchResult:
          [
            { name: "Home", address: "123 Main Street, Apt 4B" },
            { name: "Work", address: "456 Business Ave, Suite 100" }
          ]
      }
    } else {
      next { searchResult: [] }
    }
  }

  fun handleChangeDefault (checked : Bool) : Promise(Void) {
    Promise.resolve(void)
  }

  fun handleSelectSearch (item : AddressEditSearchItem) : Promise(Void) {
    next { searchResult: [] }
    showToastMessage("Selected: " + item.name)
  }

  fun switchToFilled (event : Html.Event) : Promise(Void) {
    next { showExample: "filled" }
  }

  fun switchToEmpty (event : Html.Event) : Promise(Void) {
    next { showExample: "empty" }
  }

  fun getCurrentAddressInfo : AddressEditInfo {
    if showExample == "filled" {
      addressInfo
    } else {
      emptyAddressInfo
    }
  }

  fun render : Html {
    <div::container>
      <div::header>
        <Heading level="1" margin="0 0 24px">"📍 AddressEdit"</Heading>

        <Text size="lg" margin="0 0 40px">
          "Create, update, and delete receiving addresses with validation and search functionality"
        </Text>
      </div>

      <div::content>
        /* Basic Usage */
        <div::demoSection>
          <Heading level="2" margin="32px 0 16px">
            "📱 Basic Usage"
            <span::badge>"Mobile"</span>
          </Heading>

          <div::exampleTabs>
            <button::tabButton
              class={
                if showExample == "filled" {
                  "tabButtonActive"
                } else {
                  ""
                }
              }
              onClick={switchToFilled}
            >"With Data"</button>

            <button::tabButton
              class={
                if showExample == "empty" {
                  "tabButtonActive"
                } else {
                  ""
                }
              }
              onClick={switchToEmpty}
            >"Empty Form"</button>
          </div>

          <div::mobileSimulator>
            if viewMode == "mobile" {
              <div::simulatorFrame>
                <div::simulatorNotch><div::simulatorSpeaker/></div>

                <div::simulatorScreen>
                  <AddressEdit
                    addressInfo={getCurrentAddressInfo()}
                    searchResult={searchResult}
                    showDelete={true}
                    showSetDefault={true}
                    showSearchResult={Array.size(searchResult) > 0}
                    showArea={true}
                    showDetail={true}
                    namePlaceholder="Name"
                    telPlaceholder="Phone"
                    areaPlaceholder="Area"
                    detailPlaceholder="Address"
                    saveButtonText="Save Address"
                    deleteButtonText="Delete Address"
                    onSave={handleSave}
                    onDelete={handleDelete}
                    onChange={handleChange}
                    onChangeDetail={handleChangeDetail}
                    onChangeDefault={handleChangeDefault}
                    onSelectSearch={handleSelectSearch}
                  />
                </div>
              </div>
            } else {
              <div::simulatorFrame::desktopView>
                <div::simulatorScreen::desktopScreen>
                  <AddressEdit
                    addressInfo={getCurrentAddressInfo()}
                    searchResult={searchResult}
                    showDelete={true}
                    showSetDefault={true}
                    showSearchResult={Array.size(searchResult) > 0}
                    showArea={true}
                    showDetail={true}
                    namePlaceholder="Name"
                    telPlaceholder="Phone"
                    areaPlaceholder="Area"
                    detailPlaceholder="Address"
                    saveButtonText="Save Address"
                    deleteButtonText="Delete Address"
                    onSave={handleSave}
                    onDelete={handleDelete}
                    onChange={handleChange}
                    onChangeDetail={handleChangeDetail}
                    onChangeDefault={handleChangeDefault}
                    onSelectSearch={handleSelectSearch}
                  />
                </div>
              </div>
            }
          </div>

          <div::infoBox>
            if viewMode == "mobile" {
              "💡 Mobile view: Switch between 'With Data' and 'Empty Form' to see different states. Try typing in the 'Address' field to see search suggestions. Use the navbar toggle to switch to Desktop view."
            } else {
              "💡 Desktop view: This shows how the component looks on larger screens. Switch to Mobile view using the navbar toggle to see the mobile-optimized design."
            }
          </div>

          <div::codeBlock>
            "<AddressEdit\n"
            "  addressInfo={addressInfo}\n"
            "  searchResult={searchResult}\n"
            "  showDelete={true}\n"
            "  showSetDefault={true}\n"
            "  showSearchResult={true}\n"
            "  onSave={handleSave}\n"
            "  onDelete={handleDelete}\n"
            "  onChangeDetail={handleChangeDetail}/>"
          </div>
        </div>

        /* Props API */
        <div::demoSection>
          <Heading level="2" margin="32px 0 16px">"📋 Props"</Heading>

          <table::apiTable>
            <thead::tableHead>
              <tr>
                <th::tableHeader>"Attribute"</th>
                <th::tableHeader>"Description"</th>
                <th::tableHeader>"Type"</th>
                <th::tableHeader>"Default"</th>
              </tr>
            </thead>

            <tbody>
              <tr::tableRow>
                <td::tableCellCode>"addressInfo"</td>
                <td::tableCell>"Address information object"</td>
                <td::tableCellCode>"AddressEditInfo"</td>
                <td::tableCellCode>"{}"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"searchResult"</td>
                <td::tableCell>"Address search results"</td>
                <td::tableCellCode>"Array(AddressEditSearchItem)"</td>
                <td::tableCellCode>"[]"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"showDelete"</td>
                <td::tableCell>"Whether to show delete button"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"showSetDefault"</td>
                <td::tableCell>"Whether to show default address switch"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"showSearchResult"</td>
                <td::tableCell>"Whether to show search results"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"showArea"</td>
                <td::tableCell>"Whether to show area field"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"true"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"showDetail"</td>
                <td::tableCell>"Whether to show detail field"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"true"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"disableArea"</td>
                <td::tableCell>"Whether to disable area select"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"isSaving"</td>
                <td::tableCell>"Show save button loading status"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"isDeleting"</td>
                <td::tableCell>"Show delete button loading status"</td>
                <td::tableCellCode>"Bool"</td>
                <td::tableCellCode>"false"</td>
              </tr>
            </tbody>
          </table>
        </div>

        /* Events API */
        <div::demoSection>
          <Heading level="2" margin="32px 0 16px">"⚡ Events"</Heading>

          <table::apiTable>
            <thead::tableHead>
              <tr>
                <th::tableHeader>"Event"</th>
                <th::tableHeader>"Description"</th>
                <th::tableHeader>"Arguments"</th>
              </tr>
            </thead>

            <tbody>
              <tr::tableRow>
                <td::tableCellCode>"onSave"</td>
                <td::tableCell>"Emitted when save button is clicked"</td>
                <td::tableCellCode>"info: AddressEditInfo"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"onDelete"</td>
                <td::tableCell>"Emitted when delete is confirmed"</td>
                <td::tableCellCode>"info: AddressEditInfo"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"onChange"</td>
                <td::tableCell>"Emitted when name or tel field changes"</td>
                <td::tableCellCode>"key: String, value: String"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"onChangeDetail"</td>
                <td::tableCell>"Emitted when address detail changes"</td>
                <td::tableCellCode>"value: String"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"onChangeDefault"</td>
                <td::tableCell>"Emitted when switching default address"</td>
                <td::tableCellCode>"checked: Bool"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"onSelectSearch"</td>
                <td::tableCell>"Emitted when search result is selected"</td>
                <td::tableCellCode>"item: AddressEditSearchItem"</td>
              </tr>
            </tbody>
          </table>
        </div>

        /* Types */
        <div::demoSection>
          <Heading level="2" margin="32px 0 16px">"📦 Types"</Heading>

          <div::codeBlock>
            "type AddressEditInfo {\n"
            "  name: String,\n"
            "  tel: String,\n"
            "  province: String,\n"
            "  city: String,\n"
            "  county: String,\n"
            "  addressDetail: String,\n"
            "  areaCode: String,\n"
            "  isDefault: Bool\n"
            "}\n\n"
            "type AddressEditSearchItem {\n"
            "  name: String,\n"
            "  address: String\n"
            "}"
          </div>
        </div>

        /* CSS Variables */
        <div::demoSection>
          <Heading level="2" margin="32px 0 16px">"🎨 CSS Variables"</Heading>

          <table::apiTable>
            <thead::tableHead>
              <tr>
                <th::tableHeader>"Name"</th>
                <th::tableHeader>"Default Value"</th>
                <th::tableHeader>"Description"</th>
              </tr>
            </thead>

            <tbody>
              <tr::tableRow>
                <td::tableCellCode>"--mint-address-edit-padding"</td>
                <td::tableCellCode>"var(--mint-padding-sm, 12px)"</td>
                <td::tableCell>"Form fields padding"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-address-edit-buttons-padding"</td>
                <td::tableCellCode>"16px 16px"</td>
                <td::tableCell>"Buttons container padding"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-address-edit-button-margin-bottom"</td>
                <td::tableCellCode>"12px"</td>
                <td::tableCell>"Button margin bottom"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-address-edit-button-font-size"</td>
                <td::tableCellCode>"var(--mint-font-size-lg, 16px)"</td>
                <td::tableCell>"Button font size"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-primary-color"</td>
                <td::tableCellCode>"#1989fa"</td>
                <td::tableCell>"Primary color for buttons and switch"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-danger-color"</td>
                <td::tableCellCode>"#ee0a24"</td>
                <td::tableCell>"Danger color for delete and errors"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-background"</td>
                <td::tableCellCode>"#f7f8fa"</td>
                <td::tableCell>"Background color"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-border-color"</td>
                <td::tableCellCode>"#ebedf0"</td>
                <td::tableCell>"Border color"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-text-color"</td>
                <td::tableCellCode>"#323233"</td>
                <td::tableCell>"Primary text color"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-text-color-2"</td>
                <td::tableCellCode>"#969799"</td>
                <td::tableCell>"Secondary text color"</td>
              </tr>

              <tr::tableRow>
                <td::tableCellCode>"--mint-text-color-3"</td>
                <td::tableCellCode>"#c8c9cc"</td>
                <td::tableCell>"Placeholder text color"</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      if showToast {
        <div::toast>
          {
            toastMessage
          }
        </div>
      }
    </div>
  }
}
