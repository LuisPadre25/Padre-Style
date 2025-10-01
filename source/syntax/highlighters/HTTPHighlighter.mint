/* HTTP Syntax Highlighter */
module HTTPHighlighter {
  /* Highlight HTTP */
  fun highlightHTTP (line : String) : String {
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

      // HTTP methods
      r = r.replace(/^(GET|POST|PUT|DELETE|PATCH|HEAD|OPTIONS|TRACE|CONNECT)(\s)/g, (_, method, space) => w(method, 'keyword') + space);

      // HTTP version
      r = r.replace(/(HTTP\/[0-9.]+)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Status codes
      r = r.replace(/\b([1-5][0-9]{2})(?![^\u200B]*\u200B)\b/g, m => w(m, 'number'));

      // Header names (at start of line)
      r = r.replace(/^([A-Z][a-zA-Z-]*)(:)(?![^\u200B]*\u200B)/gm, (_, header, colon) => w(header, 'property') + colon);

      // URLs
      r = r.replace(/(https?:\/\/[^\s\u200B]+)(?![^\u200B]*\u200B)/g, m => w(m, 'string'));

      // Strings in JSON body (now escaped as &quot;)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;)(?![^\u200B]*\u200B)/g, m => w(m, 'string'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
