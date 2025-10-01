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

  fun getCrystalExample : String {
    CodeExamples.CRYSTAL_EXAMPLE
  }

  fun getBashExample : String {
    CodeExamples.BASH_EXAMPLE
  }

  fun getHtmlCssExample : String {
    CodeExamples.HTML_CSS_EXAMPLE
  }

  fun getJsonDeepExample : String {
    CodeExamples.JSON_DEEP_EXAMPLE
  }

  fun getSqlExample : String {
    CodeExamples.SQL_EXAMPLE
  }

  fun getNestedBracketsExample : String {
    CodeExamples.NESTED_BRACKETS_EXAMPLE
  }

  fun getScssExample : String {
    CodeExamples.SCSS_EXAMPLE
  }

  fun getSassExample : String {
    CodeExamples.SASS_EXAMPLE
  }

  fun getLessExample : String {
    CodeExamples.LESS_EXAMPLE
  }

  fun render : Html {
    <div>
      <h2>"Code Highlighting Showcase"</h2>
      <p>"Syntax highlighting with bracket pair colorization (12+ levels)"</p>

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

        <Card title="Crystal">
          <CodeHighlight
            language="crystal"
            title="Crystal Web Framework"
            code={getCrystalExample()}
          />
        </Card>

        <Card title="Bash">
          <CodeHighlight
            language="bash"
            title="Bash Deployment Script"
            code={getBashExample()}
          />
        </Card>

        <Card title="HTML/CSS">
          <CodeHighlight
            language="html"
            title="HTML Dashboard Layout"
            code={getHtmlCssExample()}
          />
        </Card>

        <Card title="JSON (Deep Nesting)">
          <CodeHighlight
            language="json"
            title="JSON API Configuration (15+ levels)"
            code={getJsonDeepExample()}
          />
        </Card>

        <Card title="SQL">
          <CodeHighlight
            language="javascript"
            title="SQL Analytics Query"
            code={getSqlExample()}
          />
        </Card>

        <Card title="Extreme Bracket Nesting">
          <CodeHighlight
            language="javascript"
            title="Testing 20+ Bracket Levels (HSL Colors)"
            code={getNestedBracketsExample()}
          />
        </Card>

        <Card title="SCSS">
          <CodeHighlight
            language="scss"
            title="SCSS with Mixins & Interpolation"
            code={getScssExample()}
          />
        </Card>

        <Card title="SASS">
          <CodeHighlight
            language="sass"
            title="SASS (Indented Syntax)"
            code={getSassExample()}
          />
        </Card>

        <Card title="LESS">
          <CodeHighlight
            language="less"
            title="LESS with Variables & Operations"
            code={getLessExample()}
          />
        </Card>
      </div>
    </div>
  }
}
