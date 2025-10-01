/* CSS Syntax Highlighter */
module CSSHighlighter {
  /* Highlight CSS */
  fun highlightCSS (line : String) : String {
    `
    (() => {
      const esc = (t) => t.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
      const w = (t, type) => '<span class="token-' + type + '">' + esc(t) + '</span>';
      let r = #{line};

      // Comments
      r = r.replace(/(\/\*[\s\S]*?\*\/)/g, m => w(m, 'comment'));

      // Selectors (class, id, element, pseudo)
      r = r.replace(/([.#]?[a-zA-Z][a-zA-Z0-9-]*)(?=\s*[{,])/g, m => w(m, 'keyword'));
      r = r.replace(/(:[a-zA-Z-]+)/g, m => w(m, 'keyword'));

      // Property names
      r = r.replace(/([a-zA-Z-]+)(\s*)(:)/g, (_, prop, space, colon) => w(prop, 'property') + space + colon);

      // Color values
      r = r.replace(/(#[0-9a-fA-F]{3,8})\b/g, m => w(m, 'string'));

      // Numbers with units
      r = r.replace(/(\d+\.?\d*)(px|em|rem|%|vh|vw|vmin|vmax|ch|ex|cm|mm|in|pt|pc|deg|rad|turn|s|ms)?\b/g, (_, num, unit) => {
        return w(num, 'number') + (unit ? w(unit, 'keyword') : '');
      });

      // CSS keywords and values
      r = r.replace(/\b(auto|none|inherit|initial|unset|flex|grid|block|inline|absolute|relative|fixed|sticky)\b/g, m => w(m, 'keyword'));

      return r;
    })()
    `
  }
}
