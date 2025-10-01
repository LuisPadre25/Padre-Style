module JSONHighlighter {
  /* Highlight JSON */
  fun highlightJSON (line : String) : String {
    `
    (() => {
      const MARK = '\u200B';
      const w = (t, type) => MARK + '<span class="token-' + type + '">' + t + '</span>' + MARK;

      // Escape HTML first
      let r = #{line}
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');

      // Keys (strings before colon) - must be first
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;)(\s*:)/g, (_, key, colon) => w(key, 'property') + colon);

      // Remaining strings (values)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;)(?![^\u200B]*\u200B)/g, m => w(m, 'string'));

      // Booleans and null
      r = r.replace(/\b(true|false|null)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers (including scientific notation and negatives)
      r = r.replace(/(-?\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
