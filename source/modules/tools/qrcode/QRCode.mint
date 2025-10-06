/* QRCode Component - Professional QR Code generator */

component QRCode {
  /* Properties */
  property data : String = ""
  property size : Number = 256
  property backgroundColor : String = "#ffffff"
  property foregroundColor : String = "#000000"
  property border : Number = 2
  property errorCorrection : String = "M"
  property showLabel : Bool = false
  property label : String = ""

  /* Computed QR Code Data URL - REACTIVE */
  get qrCodeDataUrl : String {
    `
    (() => {
      try {
        const matrixJson = #{QREncoder.generate(data, errorCorrection)};
        if (!matrixJson) return '';

        const matrix = JSON.parse(matrixJson);
        const qrSize = matrix.length;
        const border = #{border};
        const totalSize = qrSize + (border * 2);
        const pixelSize = #{size} / totalSize;

        const canvas = document.createElement('canvas');
        canvas.width = #{size};
        canvas.height = #{size};
        const ctx = canvas.getContext('2d');

        // Background
        ctx.fillStyle = #{backgroundColor};
        ctx.fillRect(0, 0, #{size}, #{size});

        // Draw QR code
        ctx.fillStyle = #{foregroundColor};
        for (let row = 0; row < qrSize; row++) {
          for (let col = 0; col < qrSize; col++) {
            if (matrix[row][col] === 1) {
              ctx.fillRect(
                (col + border) * pixelSize,
                (row + border) * pixelSize,
                pixelSize,
                pixelSize
              );
            }
          }
        }

        return canvas.toDataURL();
      } catch (e) {
        console.error('QR Code generation error:', e);
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

  style qrWrapper {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  }

  style qrImage {
    display: block;
    border-radius: 8px;
    image-rendering: crisp-edges;
    image-rendering: pixelated;
    max-width: 100%;
    height: auto;
  }

  style label {
    font-size: 0.875rem;
    font-weight: 600;
    text-align: center;
    margin-top: 0.5rem;
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
    background: #10b981;
    color: white;
    margin-left: 0.5rem;
  }

  style formatLabel {
    font-size: 0.75rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    opacity: 0.7;
    margin-bottom: 0.5rem;
  }

  fun getContainerStyles : String {
    "
      background: white;
      border: 2px solid #e0e0e0;
    "
  }

  fun getLabelStyles : String {
    "color: #323233;"
  }

  fun getPlaceholderStyles : String {
    "color: #646566;"
  }

  fun getFormatLabelStyles : String {
    "color: #646566;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      if String.isEmpty(qrCodeDataUrl) == false {
        <>
          <div::formatLabel style={getFormatLabelStyles()}>
            "QR CODE"
            <span::badge>"SCANNABLE"</span>
          </div>

          <div::qrWrapper>
            <img::qrImage src={qrCodeDataUrl} alt="QR Code"/>
          </div>

          if showLabel && String.isEmpty(label) == false {
            <div::label style={getLabelStyles()}>{label}</div>
          } else {
            <span/>
          }
        </>
      } else {
        <div::placeholder style={getPlaceholderStyles()}>"No data provided"</div>
      }
    </div>
  }
}
