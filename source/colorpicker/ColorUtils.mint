/* Color Utilities - Conversions between RGB, HSL, HEX */
module ColorUtils {
  /* Convert RGB to HEX */
  fun rgbToHex (r : Number, g : Number, b : Number) : String {
    let rInt =
      `Math.floor(#{r})` as Number

    let rHex =
      `#{rInt}.toString(16).padStart(2, '0')`

    let gInt =
      `Math.floor(#{g})` as Number

    let gHex =
      `#{gInt}.toString(16).padStart(2, '0')`

    let bInt =
      `Math.floor(#{b})` as Number

    let bHex =
      `#{bInt}.toString(16).padStart(2, '0')`

    "#" + rHex + gHex + bHex
  }

  /* Convert HEX to RGB */
  fun hexToRgb (hex : String) : Tuple(Number, Number, Number) {
    let cleaned =
      String.replace(hex, "#", "")

    let r =
      `parseInt(#{cleaned}.substring(0, 2), 16)` as Number

    let g =
      `parseInt(#{cleaned}.substring(2, 4), 16)` as Number

    let b =
      `parseInt(#{cleaned}.substring(4, 6), 16)` as Number

    {r, g, b}
  }

  /* Convert HSL to RGB */
  fun hslToRgb (h : Number, s : Number, l : Number) : Tuple(Number, Number, Number) {
    let hNorm =
      h / 360

    let sNorm =
      s / 100

    let lNorm =
      l / 100

    let rgb =
      `
      (() => {
        let r, g, b;

        if (#{sNorm} === 0) {
          r = g = b = #{lNorm};
        } else {
          const hue2rgb = (p, q, t) => {
            if (t < 0) t += 1;
            if (t > 1) t -= 1;
            if (t < 1/6) return p + (q - p) * 6 * t;
            if (t < 1/2) return q;
            if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
            return p;
          };

          const q = #{lNorm} < 0.5 ? #{lNorm} * (1 + #{sNorm}) : #{lNorm} + #{sNorm} - #{lNorm} * #{sNorm};
          const p = 2 * #{lNorm} - q;

          r = hue2rgb(p, q, #{hNorm} + 1/3);
          g = hue2rgb(p, q, #{hNorm});
          b = hue2rgb(p, q, #{hNorm} - 1/3);
        }

        return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
      })()
      ` as Array(Number)

    let r =
      Array.at(rgb, 0)
      |> Maybe.withDefault(0)

    let g =
      Array.at(rgb, 1)
      |> Maybe.withDefault(0)

    let b =
      Array.at(rgb, 2)
      |> Maybe.withDefault(0)

    {r, g, b}
  }

  /* Convert RGB to HSL */
  fun rgbToHsl (r : Number, g : Number, b : Number) : Tuple(Number, Number, Number) {
    let rNorm =
      r / 255

    let gNorm =
      g / 255

    let bNorm =
      b / 255

    let hsl =
      `
      (() => {
        const max = Math.max(#{rNorm}, #{gNorm}, #{bNorm});
        const min = Math.min(#{rNorm}, #{gNorm}, #{bNorm});
        let h, s, l = (max + min) / 2;

        if (max === min) {
          h = s = 0;
        } else {
          const d = max - min;
          s = l > 0.5 ? d / (2 - max - min) : d / (max + min);

          switch(max) {
            case #{rNorm}: h = ((#{gNorm} - #{bNorm}) / d + (#{gNorm} < #{bNorm} ? 6 : 0)) / 6; break;
            case #{gNorm}: h = ((#{bNorm} - #{rNorm}) / d + 2) / 6; break;
            case #{bNorm}: h = ((#{rNorm} - #{gNorm}) / d + 4) / 6; break;
          }
        }

        return [Math.round(h * 360), Math.round(s * 100), Math.round(l * 100)];
      })()
      ` as Array(Number)

    let h =
      Array.at(hsl, 0)
      |> Maybe.withDefault(0)

    let s =
      Array.at(hsl, 1)
      |> Maybe.withDefault(0)

    let l =
      Array.at(hsl, 2)
      |> Maybe.withDefault(0)

    {h, s, l}
  }

  /* Format RGB as CSS string */
  fun formatRgb (r : Number, g : Number, b : Number) : String {
    "rgb(" + Number.toString(r) + ", " + Number.toString(g) + ", " + Number.toString(b) + ")"
  }

  /* Format HSL as CSS string */
  fun formatHsl (h : Number, s : Number, l : Number) : String {
    "hsl(" + Number.toString(h) + ", " + Number.toString(s) + "%, " + Number.toString(l) + "%)"
  }
}
