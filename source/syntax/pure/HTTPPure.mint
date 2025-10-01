/* HTTP Syntax Highlighter - Pure Mint Lang */
module HTTPPure {
  fun highlightHTTP (line : String) : String {
    HighlightEngine.highlight(
      line,
      [
          "GET",
          "POST",
          "PUT",
          "DELETE",
          "PATCH",
          "HEAD",
          "OPTIONS",
          "CONNECT",
          "TRACE",
          "HTTP"
        ],
      [
          "Content-Type",
          "Authorization",
          "Accept",
          "User-Agent",
          "Host",
          "Connection",
          "Cache-Control",
          "Cookie",
          "Set-Cookie"
        ],
      [],
      "",
      "",
      "",
      [
          "&quot;"
        ])
  }
}
