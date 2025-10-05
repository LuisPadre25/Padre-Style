component QRCodeCanvas {
  connect CodeStore exposing { qrMatrix, qrSize, qrText }

  property moduleSize : Number = 8
  property quietZone : Number = 4

  style canvas {
    border: 2px solid #e0e0e0;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    background: white;
    image-rendering: pixelated;
    image-rendering: crisp-edges;
  }

  fun componentDidMount : Promise(Void) {
    `
    (() => {
      setTimeout(() => {
        const canvas = document.querySelector('[data-qr-canvas]');
        if (!canvas) return;

        const ctx = canvas.getContext('2d');
        const matrix = JSON.parse(#{qrMatrix} || '[]');
        const size = #{qrSize};
        const moduleSize = #{moduleSize};
        const quietZone = #{quietZone};

        if (!matrix.length || !size) return;

        const canvasSize = (size + quietZone * 2) * moduleSize;
        canvas.width = canvasSize;
        canvas.height = canvasSize;

        ctx.fillStyle = '#FFFFFF';
        ctx.fillRect(0, 0, canvasSize, canvasSize);

        ctx.fillStyle = '#000000';
        for (let row = 0; row < size; row++) {
          for (let col = 0; col < size; col++) {
            if (matrix[row] && matrix[row][col] === 1) {
              ctx.fillRect(
                (col + quietZone) * moduleSize,
                (row + quietZone) * moduleSize,
                moduleSize,
                moduleSize
              );
            }
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
    <canvas::canvas data-qr-canvas="true"/>
  }
}
