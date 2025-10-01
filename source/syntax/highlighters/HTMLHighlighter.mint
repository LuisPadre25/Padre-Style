module HTMLHighlighter {
  /* Highlight HTML */
  fun highlightHTML (line : String) : String {
    `
    (() => {
      const esc = (t) => t.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
      const w = (t, type) => '<span class="token-' + type + '">' + esc(t) + '</span>';
      let r = #{line};

      // Comments first
      r = r.replace(/(<!--[\s\S]*?-->)/g, m => w(m, 'comment'));

      // Doctype
      r = r.replace(/(<!DOCTYPE[^>]*>)/gi, m => w(m, 'keyword'));

      // Complete tags with attributes - process entire tag at once
      r = r.replace(/(<\/?)([a-zA-Z][a-zA-Z0-9-]*)([^>]*)(\/?>)/g, (match, openBracket, tagName, attrs, closeBracket) => {
        let result = w(openBracket, 'keyword') + w(tagName, 'keyword');

        // Process attributes
        if (attrs) {
          attrs = attrs.replace(/\s+([a-zA-Z][a-zA-Z0-9-]*)(?:=(["'])([^"']*)\2)?/g, (_, attrName, quote, attrValue) => {
            if (quote && attrValue !== undefined) {
              return ' ' + w(attrName, 'property') + '=' + w(quote + attrValue + quote, 'string');
            } else if (attrName) {
              return ' ' + w(attrName, 'property');
            }
            return _;
          });
          result += attrs;
        }

        result += w(closeBracket, 'keyword');
        return result;
      });

      return r;
    })()
    `
  }
}
