module GoHighlighter {
  /* Highlight Go - comprehensive */
  fun highlightGo (line : String) : String {
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
      r = r.replace(/(\/\*[\s\S]*?\*\/)/g, m => w(m, 'comment'));
      r = r.replace(/(\/\/.*$)/g, m => w(m, 'comment'));

      // Strings (double quotes and backticks)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;)/g, m => w(m, 'string'));
      r = r.replace(/(&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Keywords - declarations
      r = r.replace(/\b(package|import|func|var|const|type|struct|interface|map|chan|any)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - control flow
      r = r.replace(/\b(if|else|switch|case|default|fallthrough|break|continue)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(for|range|goto|return)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - goroutines
      r = r.replace(/\b(go|defer|select)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Built-in functions
      r = r.replace(/\b(make|new|len|cap|append|copy|delete|panic|recover|close|print|println|real|imag|complex)(?![^\u200B]*\u200B)/g, m => w(m, 'function'));

      // Built-in types
      r = r.replace(/\b(int|int8|int16|int32|int64|uint|uint8|uint16|uint32|uint64|uintptr)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));
      r = r.replace(/\b(float32|float64|complex64|complex128)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));
      r = r.replace(/\b(bool|byte|rune|string|error)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Booleans and special values
      r = r.replace(/\b(true|false|nil|iota)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers
      r = r.replace(/\b(0x[0-9a-fA-F]+|0o[0-7]+|0b[01]+|\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Custom types (capitalized)
      r = r.replace(/\b([A-Z][a-zA-Z0-9_]*)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Functions
      r = r.replace(/\b([a-zA-Z_][a-zA-Z0-9_]*)(?=\s*\()(?![^\u200B]*\u200B)/g, m => w(m, 'function'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
