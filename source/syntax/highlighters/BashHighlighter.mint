module BashHighlighter {
  /* Highlight Bash/Shell */
  fun highlightBash (line : String) : String {
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

      // Shebang first (if at start of line)
      if (r.match(/^#!/)) {
        return w(r, 'comment');
      }

      // Comments (not shebang)
      r = r.replace(/(#.*$)/g, m => w(m, 'comment'));

      // Strings (now escaped)
      r = r.replace(/(&quot;(?:[^&\u200B]|&(?!quot;))*&quot;|&#39;(?:[^&#\u200B]|&#(?!39;)|&(?!#))*&#39;)/g, m => w(m, 'string'));

      // Commands (common utilities)
      r = r.replace(/\b(curl|wget|jq|echo|cat|grep|sed|awk|ls|cd|pwd|mkdir|rm|cp|mv|chmod|chown|chgrp)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(sudo|su|apt|yum|dnf|brew|npm|yarn|pip|git|docker|kubectl)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(bash|sh|zsh|fish|node|python|ruby|go|cargo)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));
      r = r.replace(/\b(if|then|else|elif|fi|case|esac|for|while|do|done|function)(?![^\u200B]*\u200B)/g, m => w(m, 'keyword'));

      // Options/flags (-X, --flag)
      r = r.replace(/\s(-[a-zA-Z0-9]+|--[a-zA-Z][a-zA-Z0-9-]*)(?![^\u200B]*\u200B)/g, m => m.charAt(0) + w(m.trim(), 'property'));

      // Variables ($VAR, ${VAR})
      r = r.replace(/(\$[a-zA-Z_][a-zA-Z0-9_]*|\$\{[^}]+\})(?![^\u200B]*\u200B)/g, m => w(m, 'variable'));

      // URLs (escaped)
      r = r.replace(/(https?:\/\/[^\s&quot;&#39;\\\u200B]+)(?![^\u200B]*\u200B)/g, m => w(m, 'string'));

      // Pipes and redirects (now escaped)
      r = r.replace(/([|&amp;&lt;&gt;]+)(?![^\u200B]*\u200B)/g, m => w(m, 'operator'));

      // Remove markers
      r = r.replace(/\u200B/g, '');

      return r;
    })()
    `
  }
}
