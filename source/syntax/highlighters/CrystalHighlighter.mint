module CrystalHighlighter {
  /* Highlight Crystal */
  fun highlightCrystal (line : String) : String {
    `
    (() => {
      const esc = (t) => t.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
      const w = (t, type) => '<span class="token-' + type + '">' + esc(t) + '</span>';
      let r = #{line};

      r = r.replace(/(#.*$)/g, m => w(m, 'comment'));
      r = r.replace(/(\"(?:[^\"\\]|\\.)*\"|'(?:[^'\\]|\\.)*')/g, m => w(m, 'string'));
      r = r.replace(/\b(def|class|module|struct|enum|if|else|elsif|unless|case|when|while|until|for|in|begin|rescue|ensure|end|return|break|next|yield)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(require|include|extend|property|getter|setter|private|protected|public|abstract|alias|macro)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(true|false|nil)\b/g, m => w(m, 'boolean'));
      r = r.replace(/\b(\d+\.?\d*)\b/g, m => w(m, 'number'));
      r = r.replace(/(:[a-zA-Z_][a-zA-Z0-9_?!]*)/g, m => w(m, 'symbol'));
      r = r.replace(/(@[a-zA-Z_][a-zA-Z0-9_]*)/g, m => w(m, 'property'));
      r = r.replace(/\b([a-zA-Z_][a-zA-Z0-9_?!]*)(?=\s*\()/g, m => w(m, 'function'));

      return r;
    })()
    `
  }
}
