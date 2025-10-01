/* Python Syntax Highlighter */
module PythonHighlighter {
  fun highlightPython (line : String) : String {
    `
    (() => {
      const MARK = '\u200B';
      const w = (t, type) => MARK + '<span class="token-' + type + '">' + t + '</span>' + MARK;

      // Escape HTML first
      let r = #{line}
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#39;');

      // Comments
      r = r.replace(/(#.*$)/g, m => w(m, 'comment'));

      // Docstrings (triple quotes)
      r = r.replace(/(&quot;&quot;&quot;[\s\S]*?&quot;&quot;&quot;|&#39;&#39;&#39;[\s\S]*?&#39;&#39;&#39;)/g, m => w(m, 'string'));

      // Regular strings
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Keywords - definitions
      r = r.replace(/\b(def|lambda|class)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - control flow
      r = r.replace(/\b(if|elif|else|for|while|break|continue|pass)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(try|except|finally|raise|with|as|match|case)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(return|yield|await|async)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - imports and scope
      r = r.replace(/\b(import|from|global|nonlocal|assert)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - operators as words
      r = r.replace(/\b(and|or|not|in|is|del)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Built-in functions (common ones)
      r = r.replace(/\b(print|len|range|enumerate|zip|map|filter|sorted|sum|min|max|abs|round|any|all|next|iter)(?![^\u200B]*\u200B)/g, m => w(m, 'function'));
      r = r.replace(/\b(type|isinstance|issubclass|hasattr|getattr|setattr|delattr|dir|vars|callable|id|hash)(?![^\u200B]*\u200B)/g, m => w(m, 'function'));
      r = r.replace(/\b(str|int|float|bool|list|dict|set|tuple|frozenset|bytes|bytearray|complex|reduce|open|input)(?![^\u200B]*\u200B)/g, m => w(m, 'function'));

      // Decorators
      r = r.replace(/(@[a-zA-Z_][a-zA-Z0-9_]*)(?![^\u200B]*\u200B)/g, m => w(m, 'decorator'));

      // Special parameters
      r = r.replace(/\b(self|cls)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Booleans and special values
      r = r.replace(/\b(True|False|None)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers
      r = r.replace(/\b(0x[0-9a-fA-F]+|0b[01]+|0o[0-7]+|\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Functions (before opening paren)
      r = r.replace(/\b([a-zA-Z_][a-zA-Z0-9_]*)(?=\s*\()(?![^\u200B]*\u200B)/g, m => w(m, 'function'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
