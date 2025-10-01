/* JavaScript Syntax Highlighter */
module JavaScriptHighlighter {
  fun highlightJavaScript (line : String) : String {
    `
    (() => {
      const MARK = '\u200B';
      const w = (t, type) => MARK + '<span class="token-' + type + '">' + t + '</span>' + MARK;

      // Helper to escape HTML
      const escapeHtml = (str) => str
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#39;');

      // Escape HTML first
      let r = escapeHtml(#{line});

      // Comments first
      r = r.replace(/(\/\*[\s\S]*?\*\/)/g, m => w(m, 'comment'));
      r = r.replace(/(\/\/.*$)/g, m => w(m, 'comment'));

      // Class names (after 'class' keyword or 'extends' keyword) - BEFORE strings
      r = r.replace(/\b(class)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, className) => w(kw, 'keyword') + ' ' + w(className, 'type'));
      r = r.replace(/\b(extends)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, className) => w(kw, 'keyword') + ' ' + w(className, 'type'));

      // All keywords grouped - BEFORE strings to avoid word boundary issues
      r = r.replace(/\b(const|let|var|function|implements)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(if|else|switch|case|default|break|continue)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(for|while|do|of|in|with)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(try|catch|finally|throw|return)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(async|await|yield|generator)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(import|export|from|as|default)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(new|this|super|static|get|set|delete|typeof|instanceof|void|debugger)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(class|extends)\b/g, m => w(m, 'keyword'));

      // Strings (double and single quotes - now escaped) - AFTER keywords
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Built-in objects and constructors (must not match within keywords)
      r = r.replace(/\b(Promise|Array|Object|String|Number|Boolean|Math|JSON|Date|RegExp|Error|Map|Set|FormData|Response|Request)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));
      r = r.replace(/\b(console|window|document|fetch)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Booleans and special values
      r = r.replace(/\b(true|false|null|undefined|NaN|Infinity)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers (hex, binary, octal, decimal, scientific)
      r = r.replace(/\b(0x[0-9a-fA-F]+|0b[01]+|0o[0-7]+|\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Functions (word followed IMMEDIATELY by opening paren, no other words between)
      r = r.replace(/\b([a-zA-Z_$][a-zA-Z0-9_$]*)(\s*)(\()/g, (match, fname, space, paren) => {
        // Only highlight as function if not already marked (check for zero-width space)
        if (fname.includes(MARK) || match.includes(MARK)) return match;
        return w(fname, 'function') + space + paren;
      });

      // Properties (after dot) - using replace with capturing group instead of lookbehind
      r = r.replace(/(\.)([a-zA-Z_$][a-zA-Z0-9_$]*)(?![^\u200B]*\u200B)/g, (_, dot, prop) => dot + w(prop, 'property'));

      // Operators with escaped characters
      r = r.replace(/(&lt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&lt;&lt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;&gt;&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(=&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&amp;&amp;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Other multi-char operators
      r = r.replace(/(===|!==|==|!=|\|\||\+\+|--)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Single char operators
      r = r.replace(/([\+\-\*\/%=!|^~?:])(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
