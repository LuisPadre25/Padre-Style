module StimulusHighlighter {
  /* Highlight Stimulus JS - JavaScript framework */
  fun highlightStimulus (line : String) : String {
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

      // Class names (BEFORE strings)
      r = r.replace(/\b(class)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, className) => w(kw, 'keyword') + ' ' + w(className, 'type'));
      r = r.replace(/\b(extends)\s+([A-Z][a-zA-Z0-9_$]*)/g, (_, kw, className) => w(kw, 'keyword') + ' ' + w(className, 'type'));

      // JavaScript keywords (BEFORE strings)
      r = r.replace(/\b(import|export|from|as|default)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(class|extends|static|get|set)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(const|let|var|function|async|await)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(if|else|switch|case|for|while|return|try|catch)\b/g, m => w(m, 'keyword'));
      r = r.replace(/\b(this|super|new)\b/g, m => w(m, 'keyword'));

      // Strings (AFTER keywords)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Stimulus-specific keywords and APIs
      r = r.replace(/\b(Controller|Application|connect|disconnect|initialize)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));
      r = r.replace(/\b(targets|values|classes|outlets)(?![^\u200B]*\u200B)/g, m => w(m, 'property'));

      // Built-in APIs
      r = r.replace(/\b(console|fetch|FormData|Response|Request|document|window|event)(?![^\u200B]*\u200B)/g, m => w(m, 'type'));

      // Booleans and special values
      r = r.replace(/\b(true|false|null|undefined)(?![^\u200B]*\u200B)/g, m => w(m, 'boolean'));

      // Numbers
      r = r.replace(/\b(\d+\.?\d*(?:e[+-]?\d+)?)(?![^\u200B]*\u200B)/g, m => w(m, 'number'));

      // Functions (word followed IMMEDIATELY by paren)
      r = r.replace(/\b([a-zA-Z_$][a-zA-Z0-9_$]*)(\s*)(\()/g, (match, fname, space, paren) => {
        if (fname.includes(MARK) || match.includes(MARK)) return match;
        return w(fname, 'function') + space + paren;
      });

      // Properties (after dot) - using replace with capturing group instead of lookbehind
      r = r.replace(/(\.)([a-zA-Z_$][a-zA-Z0-9_$]*)(?![^\u200B]*\u200B)/g, (_, dot, prop) => dot + w(prop, 'property'));

      // Operators
      r = r.replace(/(&lt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&gt;=)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(=&gt;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(&amp;&amp;)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/(===|!==|==|!=|\|\||\+\+|--)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));
      r = r.replace(/([\+\-\*\/%=!|^~?:])(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
