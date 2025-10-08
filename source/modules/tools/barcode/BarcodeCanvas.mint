component BarcodeCanvas {
  connect CodeStore exposing { barcodePattern, barcodeWidth, barcodeText }

  property barHeight : Number = 100
  property barWidth : Number = 2

  style canvas {
    border: 2px solid #e0e0e0;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    background: white;
    max-width: 100%;
  }

  style textLabel {
    text-align: center;
    margin-top: 8px;
    font-family: 'Courier New', monospace;
    font-size: 14px;
    font-weight: 600;
    color: #333;
  }

  fun componentDidMount : Promise(Void) {
    `
    (() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-barcode-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const pattern = #{barcodePattern};
        const barHeight = #{barHeight};
        const barWidth = #{barWidth};

        if (!pattern) return;

        const totalWidth = pattern.length * barWidth;
        canvas.width = totalWidth + 20;
        canvas.height = barHeight + 20;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.fillStyle = '#000000';
        for (let i = 0; i < pattern.length; i++) {
          if (pattern[i] === '1') {
            ctx.fillRect(10 + i * barWidth, 10, barWidth, barHeight);
          }
        }
      }, 10);

      return Promise.resolve();
    })()
    `
  }

  fun componentDidUpdate : Promise(Void) {
    componentDidMount()
  }

  fun render : Html {
    <div>
      <canvas::canvas data-barcode-canvas="true"/>

      <div::textLabel>
        {
          barcodeText
        }
      </div>
    </div>
  }
}
