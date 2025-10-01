/* Mint Language Syntax Highlighter */
module MintHighlighter {
  fun highlightMint (line : String) : String {
    `
    (() => {
      // Use a unique marker that won't appear in code
      const MARK = '\u200B'; // Zero-width space as marker
      const w = (t, type) => MARK + '<span class="token-' + type + '">' + t + '</span>' + MARK;

      // Escape HTML first
      let r = #{line}
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');

      // Comments first (highest priority)
      r = r.replace(/(\/\*[\s\S]*?\*\/)/g, m => w(m, 'comment'));
      r = r.replace(/(\/\/.*$)/g, m => w(m, 'comment'));

      // Strings (before keywords to avoid false matches)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;)/g, m => w(m, 'string'));

      // Keywords - declarations
      r = r.replace(/\b(component|module|store|provider|routes|enum|suite|test)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(property|state|signal|get|set|const)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - control flow
      r = r.replace(/\b(fun|if|else|case|when|try|catch|finally|for|of|do|while)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(sequence|parallel|await|dbg|defer)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Keywords - special
      r = r.replace(/\b(return|next|let|where|as|expose|exposing)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(connect|disconnecting|use|encode|decode)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(style|global|inline)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Built-in types
      r = r.replace(/\b(String|Number|Bool|Array|Maybe|Result|Promise|Html|Void|Time|Map|Set|Tuple|Record|Object|Function|Event|File|FormData|Blob)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Standard library modules (commonly used)
      r = r.replace(/\b(Array|String|Number|Math|Object|Map|Set|Maybe|Result|Promise|Html|Dom|Window|Debug|Test|Encode|Decode|File|Http|WebSocket|Storage|Location|Url|Time|Json)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Booleans and special values
      r = r.replace(/\b(true|false|void)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers (integers, floats, hex)
      r = r.replace(/\b(0x[0-9a-fA-F]+|\d+\.?\d*)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Functions and methods (before property access)
      r = r.replace(/\b([a-zA-Z_][a-zA-Z0-9_]*)(?=\s*\()(?![^\u200B]*\u200B)/g, m => w(m, 'function'));

      // Property access (after dot) - using replace with capturing group instead of lookbehind
      r = r.replace(/(\.)([a-zA-Z_][a-zA-Z0-9_]*)(?![^\u200B]*\u200B)/g, (_, dot, prop) => dot + w(prop, 'property'));

      // Operators - Mint-specific pipe operators (search for escaped versions)
      r = r.replace(/(\|&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(=&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(-&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Comparison operators (search for escaped versions)
      r = r.replace(/(&lt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Logical operators (search for escaped &)
      r = r.replace(/(&amp;&amp;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Other multi-char operators
      r = r.replace(/(==|!=|\|\||\+\+|--|::)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Single character operators
      r = r.replace(/([\+\-\*\/%=!|~?:])(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
