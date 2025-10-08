/* Barcode Component - Professional CODE128 barcode generator */
component Barcode {
  /* Properties */
  property data : String = ""

  property format : String = "CODE128"
  property width : Number = 2
  property height : Number = 100
  property displayValue : Bool = true
  property fontSize : Number = 14
  property lineColor : String = "#000000"
  property background : String = "#ffffff"
  property margin : Number = 10

  /* Validate barcode format */
  fun validateFormat (fmt : String) : Bool {
    case fmt {
      "CODE128" => true
      "CODE39" => true
      "EAN13" => true
      "EAN8" => true
      "UPC" => true
      "ITF14" => true
      "MSI" => true
      "Pharmacode" => true
      "Codabar" => true
      => false
    }
  }

  /* Computed Barcode Data URL - REACTIVE */
  get barcodeDataUrl : String {
    if validateFormat(format) {
      case format {
        "CODE128" => generateCode128()
        => ""
      }
    } else {
      ""
    }
  }

  /* Generate CODE128 barcode */
  fun generateCode128 : String {
    `
    (() => {
      try {
        const binary = #{Code128.generateBarcode(data)};
        if (!binary) return '';

        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');

        const margin = #{margin};
        const barWidth = #{width};
        const barHeight = #{height};
        const displayValue = #{displayValue};
        const fontSize = #{fontSize};

        // Calculate canvas dimensions
        const binaryWidth = binary.length * barWidth;
        const textHeight = displayValue ? fontSize + 10 : 0;
        canvas.width = binaryWidth + (margin * 2);
        canvas.height = barHeight + (margin * 2) + textHeight;

        // Fill background
        ctx.fillStyle = #{background};
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        // Draw barcode
        ctx.fillStyle = #{lineColor};
        for (let i = 0; i < binary.length; i++) {
          if (binary[i] === '1') {
            ctx.fillRect(margin + (i * barWidth), margin, barWidth, barHeight);
          }
        }

        // Draw value text
        if (displayValue) {
          ctx.fillStyle = #{lineColor};
          ctx.font = fontSize + 'px monospace';
          ctx.textAlign = 'center';
          ctx.fillText(#{data}, canvas.width / 2, margin + barHeight + fontSize + 5);
        }

        return canvas.toDataURL();
      } catch (e) {
        console.error('CODE128 generation error:', e);
        return '';
      }
    })()
    `
  }

  /* Styles */
  style container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1rem;
    padding: 1.5rem;
    border-radius: 16px;
    transition: all 0.3s ease;
  }

  style barcodeWrapper {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  }

  style barcodeImage {
    display: block;
    max-width: 100%;
    height: auto;
  }

  style formatLabel {
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    opacity: 0.7;
  }

  style placeholder {
    font-size: 0.875rem;
    padding: 1rem;
    opacity: 0.7;
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.65rem;
    font-weight: 700;
    margin-left: 0.5rem;
    background: #10b981;
    color: white;
  }

  fun getContainerStyles : String {
    "
      background: white;
      border: 2px solid #e0e0e0;
    "
  }

  fun getFormatLabelStyles : String {
    "color: #646566;"
  }

  fun getPlaceholderStyles : String {
    "color: #646566;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      if String.isEmpty(barcodeDataUrl) == false {
        <>
          <div::formatLabel style={getFormatLabelStyles()}>
            {
              format
            }

            <span::badge>"SCANNABLE"</span>
          </div>

          <div::barcodeWrapper>
            <img::barcodeImage src={barcodeDataUrl} alt={"Barcode: " + data}/>
          </div>
        </>
      } else {
        <div::placeholder style={getPlaceholderStyles()}>"No data provided"</div>
      }
    </div>
  }
}
