/* CodesPage - QR & Barcode showcase using ComponentShowcase */
component CodesPageNew {
  connect NavigationStore exposing { setPage }
  connect CodeStore exposing { qrText, qrErrorLevel, barcodeText }

  /* State for component controls */
  state activeCodeType : String = "qr"

  /* qr or barcode */
  state selectedQRExample : Number = 0

  state selectedBarcodeExample : Number = 0

  /* QR Code examples */
  fun getQRExamples : Array(Tuple(String, String, String)) {
    [
      {"Website URL", "https://mint-lang.com", "Simple website URL"},
      {
        "Contact vCard",
        "BEGIN:VCARD\nFN:John Doe\nTEL:+1234567890\nEND:VCARD",
        "Contact information"
      },
      {
        "WiFi Config",
        "WIFI:T:WPA;S:MyNetwork;P:password123;;",
        "WiFi credentials"
      },
      {"Email", "mailto:hello@example.com", "Email address"},
      {"SMS", "smsto:+1234567890:Hello!", "SMS message"},
      {"Geo Location", "geo:37.7749,-122.4194", "GPS coordinates"}
    ]
  }

  /* Barcode examples */
  fun getBarcodeExamples : Array(Tuple(String, String, String)) {
    [
      {"Product Code", "MINT-LANG-2025", "CODE128 product identifier"},
      {"Shipping Label", "SHIP-987654321", "Shipping tracking number"},
      {"Serial Number", "SN-ABC123XYZ", "Device serial number"},
      {"License Plate", "CA-ABC-1234", "Vehicle plate number"},
      {"Order ID", "ORDER-2025-001", "Order tracking code"},
      {"Ticket Code", "TICKET-VIP-789", "Event ticket barcode"}
    ]
  }

  fun componentDidMount : Promise(Void) {
    setPage("codes")
    CodeStore.initialize()
  }

  /* Event handlers */
  fun handleCodeTypeChange (event : TabChangeEvent) : Promise(Void) {
    next { activeCodeType: event.name }
  }

  /* Get code type tabs */
  fun getCodeTypeTabs : Array(TabItem) {
    [
      {
        name: "qr",
        title: "QR Code",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "📱",
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      },
      {
        name: "barcode",
        title: "Barcode",
        disabled: false,
        dot: false,
        badge: "",
        titleStyle: "",
        icon: "📊",
        content: "",
        badgeVariant: "",
        badgeSize: "",
        badgeColor: "",
        dotStatus: "",
        dotSize: "",
        dotAnimation: ""
      }
    ]
  }

  fun handleQRExampleClick (index : Number) : Promise(Void) {
    next { selectedQRExample: index }

    Array.at(getQRExamples(), index)
    |> Maybe.map(
      (example : Tuple(String, String, String)) : Promise(Void) {
        let {title, content, description} =
          example

        CodeStore.setQrText(content)
      })
    |> Maybe.withDefault(Promise.never())
  }

  fun handleBarcodeExampleClick (index : Number) : Promise(Void) {
    next { selectedBarcodeExample: index }

    Array.at(getBarcodeExamples(), index)
    |> Maybe.map(
      (example : Tuple(String, String, String)) : Promise(Void) {
        let {title, content, description} =
          example

        CodeStore.setBarcodeText(content)
      })
    |> Maybe.withDefault(Promise.never())
  }

  /* Get preview content */
  fun getPreviewContent : Html {
    <div::previewWrapper>
      if activeCodeType == "qr" {
        <QRCode
          data={qrText}
          size={200}
          showLabel={true}
          label="Scan me!"
          errorCorrection={qrErrorLevel}
        />
      } else {
        <Barcode
          data={barcodeText}
          format="CODE128"
          width={3}
          height={120}
          displayValue={true}
          fontSize={12}
        />
      }
    </div>
  }

  /* Handle custom text input */
  fun handleQRTextChange (event : Html.Event) : Promise(Void) {
    CodeStore.setQrText(Dom.getValue(event.target))
  }

  fun handleBarcodeTextChange (event : Html.Event) : Promise(Void) {
    CodeStore.setBarcodeText(Dom.getValue(event.target))
  }

  fun handleErrorCorrectionChange (event : Html.Event) : Promise(Void) {
    CodeStore.setQrErrorLevel(Dom.getValue(event.target))
  }

  /* Get controls content */
  fun getControlsContent : Html {
    <div>
      <div::tabsWrapper>
        <Tabs
          tabs={getCodeTypeTabs()}
          active={activeCodeType}
          type="line"
          color="#667eea"
          titleActiveColor="#667eea"
          titleInactiveColor="#646566"
          border={true}
          lineWidth="40px"
          lineHeight="3px"
          duration={200}
          onChange={handleCodeTypeChange}
        />
      </div>

      if activeCodeType == "qr" {
        <>
          <div::controlsTitleWrapper>
            <Heading level="4" margin="0 0 12px">"Enter Data"</Heading>
          </div>

          <div::controlGroup>
            <div::controlLabel>"QR Code Content:"</div>

            <textarea::textarea
              value={qrText}
              onInput={handleQRTextChange}
              placeholder="Enter URL, text, vCard, WiFi config, etc..."
              rows="3"
            />
          </div>

          <div::controlGroup>
            <div::controlLabel>"Error Correction Level:"</div>

            <select::select
              value={qrErrorLevel}
              onChange={handleErrorCorrectionChange}
            >
              <option value="L">"L - Low (7%)"</option>
              <option value="M">"M - Medium (15%)"</option>
              <option value="Q">"Q - Quartile (25%)"</option>
              <option value="H">"H - High (30%)"</option>
            </select>
          </div>

          <div::controlsTitleWrapper>
            <Heading level="4" margin="0 0 12px">"Quick Examples"</Heading>
          </div>

          <div::controlGroup>
            <div::examplesList>
              {
                Array.mapWithIndex(getQRExamples(),
                  (example : Tuple(String, String, String), index : Number) : Html {
                    let {title, content, description} =
                      example

                    <button::exampleButton(selectedQRExample == index)
                      onClick={(e : Html.Event) { handleQRExampleClick(index) }}
                    >
                      <div::exampleButtonTitle>
                        {
                          title
                        }
                      </div>

                      <div::exampleButtonDesc>
                        {
                          description
                        }
                      </div>
                    </button>
                  })
              }
            </div>
          </div>
        </>
      } else {
        <>
          <div::controlsTitleWrapper>
            <Heading level="4" margin="0 0 12px">"Enter Data"</Heading>
          </div>

          <div::controlGroup>
            <div::controlLabel>"Barcode Content:"</div>

            <input::input
              type="text"
              value={barcodeText}
              onInput={handleBarcodeTextChange}
              placeholder="Enter product code, serial number, etc..."
            />
          </div>

          <div::controlGroup>
            <div::controlLabel>"Format:"</div>

            <select::select disabled={true}>
              <option value="CODE128">"CODE128 (Alphanumeric)"</option>
            </select>

            <div::formatNote>"📝 More formats coming soon"</div>
          </div>

          <div::controlsTitleWrapper>
            <Heading level="4" margin="0 0 12px">"Quick Examples"</Heading>
          </div>

          <div::controlGroup>
            <div::examplesList>
              {
                Array.mapWithIndex(getBarcodeExamples(),
                  (example : Tuple(String, String, String), index : Number) : Html {
                    let {title, content, description} =
                      example

                    <button::exampleButton(selectedBarcodeExample == index)
                      onClick={
                        (e : Html.Event) { handleBarcodeExampleClick(index) }
                      }
                    >
                      <div::exampleButtonTitle>
                        {
                          title
                        }
                      </div>

                      <div::exampleButtonDesc>
                        {
                          description
                        }
                      </div>
                    </button>
                  })
              }
            </div>
          </div>
        </>
      }
    </div>
  }

  /* Code examples for Usage tab */
  fun getCodeExamples : Array(UsageExample) {
    [
      {
        title: "Basic QR Code",
        description: "Generate a simple QR code with URL",
        snippet:
          {
            code:
              "<QRCode\n  data=\"https://mint-lang.com\"\n  size={200}\n  showLabel={true}\n  label=\"Visit Mint Lang\"\n/>",
            language: "mint"
          },
        previewContent:
          <QRCode
            data="https://mint-lang.com"
            size={200}
            showLabel={true}
            label="Visit Mint Lang"
          />,
        showReplay: false
      },
      {
        title: "Custom Styled QR Code",
        description: "QR code with custom colors and styling",
        snippet:
          {
            code:
              "<QRCode\n  data=\"https://github.com\"\n  size={250}\n  foregroundColor=\"#6e5494\"\n  backgroundColor=\"#f6f8fa\"\n  border={4}\n  errorCorrection=\"H\"\n/>",
            language: "mint"
          },
        previewContent:
          <QRCode
            data="https://github.com"
            size={250}
            foregroundColor="#6e5494"
            backgroundColor="#f6f8fa"
            border={4}
            errorCorrection="H"
          />,
        showReplay: false
      },
      {
        title: "Contact vCard QR",
        description: "QR code for contact information",
        snippet:
          {
            code:
              "<QRCode\n  data=\"BEGIN:VCARD\\nFN:John Doe\\nTEL:+1234567890\\nEMAIL:john@example.com\\nEND:VCARD\"\n  size={220}\n  showLabel={true}\n  label=\"Scan to add contact\"\n/>",
            language: "mint"
          },
        previewContent:
          <QRCode
            data="BEGIN:VCARD\nFN:John Doe\nTEL:+1234567890\nEMAIL:john@example.com\nEND:VCARD"
            size={220}
            showLabel={true}
            label="Scan to add contact"
          />,
        showReplay: false
      },
      {
        title: "Basic CODE128 Barcode",
        description: "Simple barcode with text display",
        snippet:
          {
            code:
              "<Barcode\n  data=\"MINT-LANG-2025\"\n  format=\"CODE128\"\n  width={2}\n  height={80}\n  displayValue={true}\n/>",
            language: "mint"
          },
        previewContent:
          <Barcode
            data="MINT-LANG-2025"
            format="CODE128"
            width={2}
            height={80}
            displayValue={true}
          />,
        showReplay: false
      },
      {
        title: "Shipping Label Barcode",
        description: "Larger barcode for shipping labels",
        snippet:
          {
            code:
              "<Barcode\n  data=\"SHIP-987654321\"\n  format=\"CODE128\"\n  width={3}\n  height={120}\n  displayValue={true}\n  fontSize={14}\n/>",
            language: "mint"
          },
        previewContent:
          <Barcode
            data="SHIP-987654321"
            format="CODE128"
            width={3}
            height={120}
            displayValue={true}
            fontSize={14}
          />,
        showReplay: false
      },
      {
        title: "Custom Styled Barcode",
        description: "Barcode with custom colors",
        snippet:
          {
            code:
              "<Barcode\n  data=\"PRODUCT-ABC123\"\n  format=\"CODE128\"\n  width={2}\n  height={100}\n  displayValue={true}\n  lineColor=\"#1989fa\"\n  background=\"#f7f8fa\"\n  margin={20}\n/>",
            language: "mint"
          },
        previewContent:
          <Barcode
            data="PRODUCT-ABC123"
            format="CODE128"
            width={2}
            height={100}
            displayValue={true}
            lineColor="#1989fa"
            background="#f7f8fa"
            margin={20}
          />,
        showReplay: false
      }
    ]
  }

  /* API Properties for QR Code */
  fun getQRApiProperties : Array(ApiProperty) {
    [
      {
        name: "data",
        description: "The data to encode in the QR code",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "size",
        description: "Size of the QR code in pixels",
        type: "Number",
        defaultValue: "256"
      },
      {
        name: "backgroundColor",
        description: "Background color",
        type: "String",
        defaultValue: "\"#ffffff\""
      },
      {
        name: "foregroundColor",
        description: "QR code color",
        type: "String",
        defaultValue: "\"#000000\""
      },
      {
        name: "border",
        description: "Quiet zone size (0-4)",
        type: "Number",
        defaultValue: "2"
      },
      {
        name: "errorCorrection",
        description: "Error correction level (L, M, Q, H)",
        type: "String",
        defaultValue: "\"M\""
      },
      {
        name: "showLabel",
        description: "Show label below QR code",
        type: "Bool",
        defaultValue: "false"
      },
      {
        name: "label",
        description: "Label text",
        type: "String",
        defaultValue: "\"\""
      }
    ]
  }

  /* API Properties for Barcode */
  fun getBarcodeApiProperties : Array(ApiProperty) {
    [
      {
        name: "data",
        description: "The data to encode in the barcode",
        type: "String",
        defaultValue: "\"\""
      },
      {
        name: "format",
        description: "Barcode format (CODE128, CODE39, EAN13, etc.)",
        type: "String",
        defaultValue: "\"CODE128\""
      },
      {
        name: "width",
        description: "Width of each bar",
        type: "Number",
        defaultValue: "2"
      },
      {
        name: "height",
        description: "Height of the barcode in pixels",
        type: "Number",
        defaultValue: "100"
      },
      {
        name: "displayValue",
        description: "Display value below barcode",
        type: "Bool",
        defaultValue: "true"
      },
      {
        name: "fontSize",
        description: "Font size for the value text",
        type: "Number",
        defaultValue: "14"
      },
      {
        name: "lineColor",
        description: "Barcode color",
        type: "String",
        defaultValue: "\"#000000\""
      },
      {
        name: "background",
        description: "Background color",
        type: "String",
        defaultValue: "\"#ffffff\""
      },
      {
        name: "margin",
        description: "Margin around barcode",
        type: "Number",
        defaultValue: "10"
      }
    ]
  }

  /* Styles */
  style previewWrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    min-height: 300px;
  }

  style controlsTitleWrapper {
    &:not(:first-child) {
      margin-top: 24px;
    }
  }

  style controlGroup {
    margin-bottom: 16px;
  }

  style controlLabel {
    font-size: 14px;
    font-weight: 500;
    color: #646566;
    margin-bottom: 8px;
  }

  style buttonGroup {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  style button (active : Bool) {
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
    border: 2px solid;

    if active {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border-color: transparent;
    }

    else {
      background: white;
      color: #646566;
      border-color: #e0e0e0;

      &:hover {
        border-color: #667eea;
        color: #667eea;
      }
    }
  }

  style examplesList {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  style exampleButton (active : Bool) {
    padding: 12px;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
    border: 2px solid;
    text-align: left;

    if active {
      background: #f0f0ff;
      border-color: #667eea;
    }

    else {
      background: white;
      border-color: #e0e0e0;

      &:hover {
        border-color: #667eea;
        background: #fafafa;
      }
    }
  }

  style exampleButtonTitle {
    font-size: 14px;
    font-weight: 600;
    color: #323233;
    margin-bottom: 4px;
  }

  style exampleButtonDesc {
    font-size: 12px;
    color: #646566;
  }

  style infoBox {
    background: #f7f8fa;
    border-radius: 8px;
    padding: 12px;
    margin-top: 16px;
  }

  style infoLabel {
    font-size: 12px;
    font-weight: 600;
    color: #646566;
    margin-bottom: 4px;
  }

  style infoValue {
    font-size: 13px;
    color: #323233;
    font-family: 'Courier New', monospace;
    word-break: break-all;
  }

  style textarea {
    width: 100%;
    padding: 12px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
    font-family: 'Courier New', monospace;
    resize: vertical;
    transition: all 0.2s ease;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
  }

  style input {
    width: 100%;
    padding: 12px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
    font-family: 'Courier New', monospace;
    transition: all 0.2s ease;
    box-sizing: border-box;

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
  }

  style select {
    width: 100%;
    padding: 12px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.2s ease;
    box-sizing: border-box;
    background: white;

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    &:disabled {
      background: #f5f5f5;
      cursor: not-allowed;
      opacity: 0.6;
    }
  }

  style formatNote {
    font-size: 12px;
    color: #999;
    margin-top: 8px;
    font-style: italic;
  }

  style tabsWrapper {
    margin-bottom: 24px;
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="QR Codes & Barcodes"
      description="Generate scannable QR codes and CODE128 barcodes in real-time"
      badge="Tools"
      previewContent={getPreviewContent()}
      controlsContent={getControlsContent()}
      usageText="QR codes and barcodes are essential for encoding data that can be quickly scanned. QR codes can store URLs, contact information, WiFi credentials, and more. CODE128 barcodes are widely used for product identification, shipping labels, and inventory management."
      codeExamples={getCodeExamples()}
      apiProperties={
        if activeCodeType == "qr" {
          getQRApiProperties()
        } else {
          getBarcodeApiProperties()
        }
      }
      enabledTabs={["preview", "usage", "api"]}
      desktopUrl="codes.mint-lang.com"
    />
  }
}
