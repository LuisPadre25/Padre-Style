/* Markdown Editor Showcase */
component MarkdownShowcase {
  fun render : Html {
    <div>
      <h2>"Markdown Editor"</h2>
      <p>"Full-featured markdown editor with live preview, code syntax highlighting, tables, emojis, and more!"</p>

      <Card title="Markdown Editor">
        <MarkdownEditor/>
      </Card>
    </div>
  }
}
