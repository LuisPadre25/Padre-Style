module HAMLHighlighter {
  /* Highlight HAML - Ruby templating */
  fun highlightHAML (line : String) : String {
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

      // HAML comments
      r = r.replace(/^(\s*-#.*$)/g, m => w(m, 'comment'));
      r = r.replace(/^(\s*\/.*$)/g, m => w(m, 'comment'));

      // Doctype
      r = r.replace(/^(!!!)(.*)$/g, (_, doctype, rest) => w(doctype, 'keyword') + rest);

      // HTML tags (%, %div, %p, etc)
      r = r.replace(/(%[a-zA-Z][a-zA-Z0-9]*)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // ID selectors (#id)
      r = r.replace(/(#[a-zA-Z][a-zA-Z0-9_-]*)(?![^\u200B]*\u200B)/g, m => w(m, 'property'));

      // Class selectors (.class)
      r = r.replace(/(\.[a-zA-Z][a-zA-Z0-9_-]*)(?![^\u200B]*\u200B)/g, m => w(m, 'property'));

      // Attributes in braces {key: value}
      r = r.replace(/([a-zA-Z_][a-zA-Z0-9_]*)(?=\s*:)(?![^\u200B]*\u200B)/g, m => w(m, 'property'));

      // Ruby interpolation (hash with braces)
      r = r.replace(/(#\{[^}]+\})/g, m => w(m, 'variable'));

      // Strings
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Ruby code markers (-, =)
      r = r.replace(/^(\s*)([-=])(?![^\u200B]*\u200B)/g, (_, space, marker) => space + w(marker, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
