/* CODE128 Barcode Encoder
 * Pure Mint Lang implementation of CODE128 barcode standard
 * Generates REAL scannable CODE128 barcodes
 */

module Code128 {
  // CODE128 character set patterns (11 bars each)
  // Each pattern is a string of bar widths: "211412" means bars of width 2,1,1,4,1,2
  const PATTERNS = [
    "212222", "222122", "222221", "121223", "121322", "131222",
    "122213", "122312", "132212", "221213", "221312", "231212",
    "112232", "122132", "122231", "113222", "123122", "123221",
    "223211", "221132", "221231", "213212", "223112", "312131",
    "311222", "321122", "321221", "312212", "322112", "322211",
    "212123", "212321", "232121", "111323", "131123", "131321",
    "112313", "132113", "132311", "211313", "231113", "231311",
    "112133", "112331", "132131", "113123", "113321", "133121",
    "313121", "211331", "231131", "213113", "213311", "213131",
    "311123", "311321", "331121", "312113", "312311", "332111",
    "314111", "221411", "431111", "111224", "111422", "121124",
    "121421", "141122", "141221", "112214", "112412", "122114",
    "122411", "142112", "142211", "241211", "221114", "413111",
    "241112", "134111", "111242", "121142", "121241", "114212",
    "124112", "124211", "411212", "421112", "421211", "212141",
    "214121", "412121", "111143", "111341", "131141", "114113",
    "114311", "411113", "411311", "113141", "114131", "311141",
    "411131", "211412", "211214", "211232", "2331112"
  ]

  // Start code A, B, C
  const START_A = 103
  const START_B = 104
  const START_C = 105
  const STOP = 106

  // Encode text to CODE128-B binary string (supports ASCII 32-127)
  fun generateBarcode (text : String) : String {
    `
    (() => {
      const text = #{text};
      const patterns = #{PATTERNS};
      const START_B = #{START_B};
      const STOP = #{STOP};

      // Convert text to character codes
      const charCodes = text.split('').map(char => char.charCodeAt(0) - 32);
      const codes = [START_B, ...charCodes];

      // Calculate checksum
      let sum = 0;
      for (let i = 0; i < codes.length; i++) {
        const weight = (i === 0) ? 1 : i;
        sum += codes[i] * weight;
      }
      const checksum = sum % 103;
      codes.push(checksum);
      codes.push(STOP);

      // Convert codes to pattern string
      const patternStr = codes.map(code => patterns[code] || '').join('');

      // Convert pattern to binary
      let binary = '';
      for (let i = 0; i < patternStr.length; i++) {
        const width = parseInt(patternStr[i]);
        const bit = (i % 2 === 0) ? '1' : '0';
        binary += bit.repeat(width);
      }

      return binary;
    })()
    `
  }

  // Get barcode width (number of modules/bars)
  fun getBarcodeWidth (text : String) : Number {
    `#{generateBarcode(text)}.length`
  }
}
