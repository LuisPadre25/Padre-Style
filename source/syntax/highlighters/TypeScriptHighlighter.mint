/* TypeScript Syntax Highlighter */
module TypeScriptHighlighter {
  fun highlightTypeScript (line : String) : String {
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

      // Comments first
      r = r.replace(/(\/\*[\s\S]*?\*\/)/g, m => w(m, 'comment'));
      r = r.replace(/(\/\/.*$)/g, m => w(m, 'comment'));

      // Class/Interface/Type names (BEFORE strings)
      r = r.replace(/\b(class|interface|enum|type)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, name) => w(kw, 'keyword') + ' ' + w(name, 'type'));
      r = r.replace(/\b(extends|implements)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, name) => w(kw, 'keyword') + ' ' + w(name, 'type'));

      // TypeScript-specific keywords (BEFORE strings)
      r = r.replace(/\b(interface|type|enum|namespace|module|declare|abstract|implements)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(public|private|protected|readonly|static|override)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(is|keyof|infer|asserts|satisfies)\b/g, m => w(m, 'keyword'));

      // All JavaScript keywords (BEFORE strings)
      r = r.replace(/\b(const|let|var|function|class|extends)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(if|else|switch|case|default|for|while|do|of|in|with|break|continue)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(try|catch|finally|throw|return)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(async|await|yield|import|export|from|as|default)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(new|this|super|get|set|delete|typeof|instanceof|void|debugger)\b/g, m => w(m, 'keyword'));

      // Strings (single and double quotes - now escaped) - AFTER keywords
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Custom type names (capitalized words)
      r = r.replace(/\b([A-Z][a-zA-Z0-9_$]*)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // TypeScript primitive types (after custom types)
      r = r.replace(/\b(string|number|boolean|any|void|never|unknown|symbol|bigint|object)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Built-in types
      r = r.replace(/\b(Promise|Array|Map|Set|Record|Partial|Required|Readonly|Pick|Omit)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Decorators
      r = r.replace(/(@[a-zA-Z_][a-zA-Z0-9_]*)(?![^\u200B]*\u200B)/g, m => w(m, 'decorator'));

      // Booleans and null values
      r = r.replace(/\b(true|false|null|undefined)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers (hex, binary, octal, decimal, scientific)
      r = r.replace(/\b(0x[0-9a-fA-F]+|0b[01]+|0o[0-7]+|\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Functions and methods (word followed IMMEDIATELY by paren)
      r = r.replace(/\b([a-z][a-zA-Z0-9_$]*)(\s*)(\()/g, (match, fname, space, paren) => {
        if (fname.includes(MARK) || match.includes(MARK)) return match;
        return w(fname, 'function') + space + paren;
      });

      // Generic functions (word followed by <)
      r = r.replace(/\b([a-z][a-zA-Z0-9_$]*)(\s*)(&lt;)/g, (match, fname, space, bracket) => {
        if (fname.includes(MARK) || match.includes(MARK)) return match;
        return w(fname, 'function') + space + bracket;
      });

      // Properties (after dot) - using replace with capturing group instead of lookbehind
      r = r.replace(/(\.)([a-zA-Z_$][a-zA-Z0-9_$]*)(?![^\u200B]*\u200B)/g, (_, dot, prop) => dot + w(prop, 'property'));

      // Operators with escaped characters
      r = r.replace(/(\?\?)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(\?\.)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&lt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&lt;&lt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;&gt;&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(=&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&amp;&amp;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Other operators
      r = r.replace(/(===|!==|==|!=|\|\||\+\+|--)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/([\+\-\*\/%=!|^~?:])(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
