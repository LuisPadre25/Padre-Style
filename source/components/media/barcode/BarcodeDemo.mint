/*
Barcode & QR Code Demo Component
 * Demonstrates all available barcode and QR code formats
*/
component BarcodeDemo {
  connect ThemeStore exposing { currentTheme }

  // State for interactive demos
  state qrCodeData : String = "https://mint-lang.com"

  state barcodeData : String = "1234567890"
  state selectedFormat : String = "CODE128"

  // Available barcode formats
  const BARCODE_FORMATS =
    [
      "CODE128",
      "CODE39",
      "EAN13",
      "EAN8",
      "UPC",
      "ITF14",
      "MSI",
      "Pharmacode",
      "Codabar"
    ]

  fun handleQRDataChange (event : Html.Event) : Promise(Void) {
    next { qrCodeData: Dom.getValue(event.target) }
  }

  fun handleBarcodeDataChange (event : Html.Event) : Promise(Void) {
    next { barcodeData: Dom.getValue(event.target) }
  }

  fun handleFormatChange (event : Html.Event) : Promise(Void) {
    next { selectedFormat: Dom.getValue(event.target) }
  }

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

  style grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
  }

  style section {
    border-radius: 20px;
    padding: 2rem;
    transition: all 0.3s ease;
  }

  style sectionTitle {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    text-align: center;
  }

  style inputGroup {
    margin-bottom: 1.5rem;
  }

  style label {
    display: block;
    font-size: 0.875rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border-radius: 8px;
    border: 2px solid;
    font-size: 1rem;
    transition: all 0.2s ease;
    box-sizing: border-box;
  }

  style select {
    width: 100%;
    padding: 0.75rem 1rem;
    border-radius: 8px;
    border: 2px solid;
    font-size: 1rem;
    transition: all 0.2s ease;
    box-sizing: border-box;
    cursor: pointer;
    background-position: right 0.75rem center;
    background-repeat: no-repeat;
    background-size: 12px;
    appearance: none;
  }

  style displayArea {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 300px;
  }

  style examplesSection {
    margin-top: 3rem;
    border-radius: 20px;
    padding: 2rem;
  }

  style examplesGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-top: 1.5rem;
  }

  style exampleCard {
    border-radius: 12px;
    padding: 1.5rem;
    text-align: center;
  }

  style exampleTitle {
    font-size: 0.875rem;
    font-weight: 600;
    margin-bottom: 1rem;
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

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getInputStyles : String {
    "
      background: #{ThemeHelpers.getInputBackground(currentTheme)};
      border-color: #{ThemeHelpers.getInputBorder(currentTheme)};
      color: #{ThemeHelpers.getInputText(currentTheme)};
    "
  }

  fun getSelectStyles : String {
    "
      background: #{ThemeHelpers.getInputBackground(currentTheme)};
      border-color: #{ThemeHelpers.getInputBorder(currentTheme)};
      color: #{ThemeHelpers.getInputText(currentTheme)};
    "
  }

  fun getExampleCardStyles : String {
    "
      background: #{ThemeHelpers.getCardBackground(currentTheme)};
      border: 1px solid #{ThemeHelpers.getCardBorder(currentTheme)};
    "
  }

  fun render : Html {
    <div::container>
      <div::header>
        <h1::title>"Barcode & QR Code Components"</h1>

        <p::subtitle style={getSubtitleStyles()}>
          "Generate QR codes and various barcode formats with ease"
        </p>
      </div>

      <div::grid>
        /* QR Code Section */
        <div::section style={getSectionStyles()}>
          <h2::sectionTitle style={getTitleStyles()}>"QR Code Generator"</h2>

          <div::inputGroup>
            <label::label style={getLabelStyles()}>"Data to encode:"</label>

            <input::input
              type="text"
              value={qrCodeData}
              onInput={handleQRDataChange}
              placeholder="Enter URL or text"
              style={getInputStyles()}
            />
          </div>

          <div::displayArea>
            <QRCode
              data={qrCodeData}
              size={200}
              showLabel={true}
              label="Scan me!"
            />
          </div>
        </div>

        /* Barcode Section */
        <div::section style={getSectionStyles()}>
          <h2::sectionTitle style={getTitleStyles()}>"Barcode Generator"</h2>

          <div::inputGroup>
            <label::label style={getLabelStyles()}>"Barcode format:"</label>

            <select::select
              value={selectedFormat}
              onChange={handleFormatChange}
              style={getSelectStyles()}
            >
              {
                Array.map(BARCODE_FORMATS,
                  (format : String) { <option value={format}>format</option> })
              }
            </select>
          </div>

          <div::inputGroup>
            <label::label style={getLabelStyles()}>"Data to encode:"</label>

            <input::input
              type="text"
              value={barcodeData}
              onInput={handleBarcodeDataChange}
              placeholder="Enter barcode data"
              style={getInputStyles()}
            />
          </div>

          <div::displayArea>
            <Barcode
              data={barcodeData}
              format={selectedFormat}
              width={2}
              height={80}
              displayValue={true}
              fontSize={12}
            />
          </div>
        </div>
      </div>

      /* Examples Section */
      <div::examplesSection style={getSectionStyles()}>
        <h2::sectionTitle style={getTitleStyles()}>"Quick Examples"</h2>

        <div::examplesGrid>
          <div::exampleCard style={getExampleCardStyles()}>
            <div::exampleTitle style={getTitleStyles()}>"Website URL"</div>

            <QRCode
              data="https://mint-lang.com"
              size={150}
              foregroundColor="#667eea"
            />
          </div>

          <div::exampleCard style={getExampleCardStyles()}>
            <div::exampleTitle style={getTitleStyles()}>"Contact Info"</div>

            <QRCode
              data="BEGIN:VCARD\nFN:John Doe\nTEL:+1234567890\nEND:VCARD"
              size={150}
              foregroundColor="#764ba2"
            />
          </div>

          <div::exampleCard style={getExampleCardStyles()}>
            <div::exampleTitle style={getTitleStyles()}>"Product Code (EAN13)"</div>

            <Barcode
              data="5901234123457"
              format="EAN13"
              width={2}
              height={60}
              displayValue={true}
            />
          </div>

          <div::exampleCard style={getExampleCardStyles()}>
            <div::exampleTitle style={getTitleStyles()}>"Shipping Code"</div>

            <Barcode
              data="SHIP123456"
              format="CODE128"
              width={2}
              height={60}
              displayValue={true}
            />
          </div>
        </div>
      </div>
    </div>
  }
}
