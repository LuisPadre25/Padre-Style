component CodesPage {
  connect CodeStore exposing { qrText, qrErrorLevel, barcodeText }

  state qrExamples : Array(CodeExample) = []
  state barcodeExamples : Array(CodeExample) = []

  style container {
    width: 100%;
    max-width: 1400px;
    padding: 20px;
  }

  style header {
    margin-bottom: 40px;
  }

  style title {
    font-size: 34px;
    font-weight: 600;
    margin: 0 0 16px;
    color: var(--heading-color, #1a1a1a);
    transition: color 0.3s ease;
  }

  style subtitle {
    font-size: 16px;
    color: var(--text-color, #666);
    margin: 0;
    transition: color 0.3s ease;
  }

  style section {
    background: var(--card-bg, #f8f9fa);
    border-radius: 16px;
    padding: 32px;
    margin-bottom: 32px;
    transition: background 0.3s ease;
  }

  style sectionTitle {
    font-size: 24px;
    font-weight: 600;
    margin: 0 0 24px;
    color: var(--heading-color, #2c3e50);
    display: flex;
    align-items: center;
    gap: 12px;
    transition: color 0.3s ease;
  }

  style grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 32px;
    align-items: start;

    @media (max-width: 900px) {
      grid-template-columns: 1fr;
    }
  }

  style preview {
    background: var(--bg-color, white);
    border-radius: 12px;
    padding: 24px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 300px;
    transition: background 0.3s ease;
  }

  style icon {
    font-size: 32px;
    margin-right: 8px;
  }

  style badge {
    background: var(--primary-color, linear-gradient(135deg, #667eea 0%, #764ba2 100%));
    color: white;
    padding: 4px 12px;
    border-radius: 16px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    transition: background 0.3s ease;
  }

  style info {
    background: color-mix(in srgb, var(--primary-color, #2196f3) 10%, transparent);
    border-left: 4px solid var(--primary-color, #2196f3);
    padding: 16px;
    border-radius: 8px;
    margin-top: 20px;
    font-size: 14px;
    color: var(--text-color, #1976d2);
    line-height: 1.6;
    transition: all 0.3s ease;
  }

  style examplesGrid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 12px;
    margin-top: 20px;
  }

  style exampleCard {
    background: var(--card-bg, white);
    border: 2px solid var(--border-color, #e0e0e0);
    border-radius: 8px;
    padding: 12px;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      border-color: var(--primary-color, #1989fa);
      box-shadow: 0 2px 8px color-mix(in srgb, var(--primary-color, #1989fa) 20%, transparent);
      transform: translateY(-2px);
    }

    &:active {
      transform: translateY(0);
    }
  }

  style exampleTitle {
    font-weight: 600;
    color: var(--heading-color, #2c3e50);
    font-size: 14px;
    margin-bottom: 4px;
    transition: color 0.3s ease;
  }

  style exampleDesc {
    font-size: 12px;
    color: var(--text-color, #666);
    line-height: 1.4;
    transition: color 0.3s ease;
  }

  style exampleCode {
    font-family: 'Courier New', monospace;
    font-size: 11px;
    color: var(--primary-color, #e74c3c);
    background: color-mix(in srgb, var(--primary-color, #e74c3c) 5%, transparent);
    padding: 4px 6px;
    border-radius: 4px;
    margin-top: 6px;
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    transition: all 0.3s ease;
  }

  style sectionSubtitle {
    font-size: 18px;
    font-weight: 600;
    margin: 24px 0 12px;
    color: var(--heading-color, #34495e);
    transition: color 0.3s ease;
  }

  fun componentDidMount : Promise(Void) {
    next {
      qrExamples: CodeExamples.getQRExamples(),
      barcodeExamples: CodeExamples.getBarcodeExamples()
    }

    CodeStore.initialize()
  }

  fun loadQRExample (text : String) : Promise(Void) {
    CodeStore.setQrText(text)
  }

  fun loadBarcodeExample (text : String) : Promise(Void) {
    CodeStore.setBarcodeText(text)
  }

  fun renderQRExample (example : CodeExample) : Html {
    <div::exampleCard
      onClick={(event : Html.Event) : Promise(Void) { loadQRExample(example.content) }}>

      <div::exampleTitle>{example.title}</div>
      <div::exampleDesc>{example.description}</div>
      <code::exampleCode>{example.content}</code>
    </div>
  }

  fun renderBarcodeExample (example : CodeExample) : Html {
    <div::exampleCard
      onClick={(event : Html.Event) : Promise(Void) { loadBarcodeExample(example.content) }}>

      <div::exampleTitle>{example.title}</div>
      <div::exampleDesc>{example.description}</div>
      <code::exampleCode>{example.content}</code>
    </div>
  }

  fun render : Html {
    <div::container>
      <div::header>
        <h1::title>"QR Codes & Barcodes"</h1>
        <p::subtitle>
          "Generate scannable QR codes and CODE128 barcodes in real-time"
        </p>
      </div>

      <div::section>
        <div::sectionTitle>
          <span::icon>"📱"</span>
          "QR Code Generator"
          <span::badge>"Live"</span>
        </div>

        <div::grid>
          <div>
            <p::info>
              "📋 Current Content: "
              {qrText}
            </p>

            <div::sectionSubtitle>"📚 Click an example to load:"</div>

            <div::examplesGrid>
              for example of qrExamples {
                renderQRExample(example)
              }
            </div>
          </div>

          <div::preview>
            <QRCodeCanvas moduleSize={6} quietZone={4}/>
          </div>
        </div>
      </div>

      <div::section>
        <div::sectionTitle>
          <span::icon>"📊"</span>
          "CODE128 Barcode Generator"
          <span::badge>"Live"</span>
        </div>

        <div::grid>
          <div>
            <p::info>
              "📋 Current Text: "
              {barcodeText}
            </p>

            <div::sectionSubtitle>"📚 Click an example to load:"</div>

            <div::examplesGrid>
              for example of barcodeExamples {
                renderBarcodeExample(example)
              }
            </div>
          </div>

          <div::preview>
            <BarcodeCanvas barHeight={120} barWidth={3}/>
          </div>
        </div>
      </div>
    </div>
  }
}
