/* Code Examples Showcase */
component CodeShowcase {
  fun getMintExample : String {
    CodeExamples.MINT_EXAMPLE
  }

  fun getJavaScriptExample : String {
    CodeExamples.JAVASCRIPT_EXAMPLE
  }

  fun getTypeScriptExample : String {
    CodeExamples.TYPESCRIPT_EXAMPLE
  }

  fun getPythonExample : String {
    CodeExamples.PYTHON_EXAMPLE
  }

  fun getGoExample : String {
    CodeExamples.GO_EXAMPLE
  }

  fun render : Html {
    <div>
      <h2>"Code Highlighting"</h2>
      <p>"Syntax highlighting for multiple programming languages"</p>

      <div>
        <Card title="Mint Lang">
          <CodeHighlight
            language="mint"
            title="Mint Component"
            code={getMintExample()}
          />
        </Card>

        <Card title="JavaScript">
          <CodeHighlight
            language="javascript"
            title="JavaScript ES6+"
            code={getJavaScriptExample()}
          />
        </Card>

        <Card title="TypeScript">
          <CodeHighlight
            language="typescript"
            title="TypeScript Interface"
            code={getTypeScriptExample()}
          />
        </Card>

        <Card title="Python">
          <CodeHighlight
            language="python"
            title="Python Function"
            code={getPythonExample()}
          />
        </Card>

        <Card title="Go">
          <CodeHighlight
            language="go"
            title="Go Struct & Method"
            code={getGoExample()}
          />
        </Card>
      </div>
    </div>
  }
}
