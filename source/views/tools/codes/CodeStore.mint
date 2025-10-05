store CodeStore {
  state qrText : String = "https://mint-lang.com"
  state qrErrorLevel : String = "M"
  state qrMatrix : String = ""
  state qrSize : Number = 0

  state barcodeText : String = "MINT-LANG-2025"
  state barcodePattern : String = ""
  state barcodeWidth : Number = 0

  fun setQrText (text : String) : Promise(Void) {
    next {
      qrText: text,
      qrMatrix: QREncoder.generate(text, qrErrorLevel),
      qrSize: QREncoder.getSize(text)
    }
  }

  fun setQrErrorLevel (level : String) : Promise(Void) {
    next {
      qrErrorLevel: level,
      qrMatrix: QREncoder.generate(qrText, level),
      qrSize: QREncoder.getSize(qrText)
    }
  }

  fun setBarcodeText (text : String) : Promise(Void) {
    next {
      barcodeText: text,
      barcodePattern: Code128.generateBarcode(text),
      barcodeWidth: Code128.getBarcodeWidth(text)
    }
  }

  fun generateQR : Promise(Void) {
    next {
      qrMatrix: QREncoder.generate(qrText, qrErrorLevel),
      qrSize: QREncoder.getSize(qrText)
    }
  }

  fun generateBarcode : Promise(Void) {
    next {
      barcodePattern: Code128.generateBarcode(barcodeText),
      barcodeWidth: Code128.getBarcodeWidth(barcodeText)
    }
  }

  fun initialize : Promise(Void) {
    next {
      qrMatrix: QREncoder.generate(qrText, qrErrorLevel),
      qrSize: QREncoder.getSize(qrText),
      barcodePattern: Code128.generateBarcode(barcodeText),
      barcodeWidth: Code128.getBarcodeWidth(barcodeText)
    }
  }
}
