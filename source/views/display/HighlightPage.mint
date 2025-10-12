/* HighlightPage - Comprehensive showcase for Highlight component */
component HighlightPage {
  /* State for interactive controls */
  state selectedVariant : String = "primary"
  state selectedSize : String = "medium"
  state animatedEnabled : Bool = false
  state numberedEnabled : Bool = false
  state caseSensitiveEnabled : Bool = false
  state matchWholeEnabled : Bool = false
  state maxMatches : Number = -1
  state highlightFirstOnly : Bool = false
  state textOnlyEnabled : Bool = false

  /* Sample texts */
  const SAMPLE_TEXT =
    "Take your time and be patient. Life itself will eventually answer all those questions it once raised for you."

  const SAMPLE_TEXT_LONG =
    "The journey of a thousand miles begins with a single step. Every moment is a fresh beginning. Success is not final, failure is not fatal: it is the courage to continue that counts."

  const CODE_SAMPLE =
    "function calculateTotal(items) { return items.reduce((sum, item) => sum + item.price, 0); }"

  /* Styles */
  style selectBox {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 14px;
    background: var(--card-bg);
    color: var(--text-color);
  }

  style checkboxLabel {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
  }

  style checkbox {
    width: 16px;
    height: 16px;
    cursor: pointer;
  }

  style numberInput {
    width: 100%;
    padding: 8px 12px;
    border: 1px solid var(--border-color);
    border-radius: 8px;
    font-size: 14px;
    background: var(--card-bg);
    color: var(--text-color);
  }

  style codeBlock {
    font-family: var(--font-mono);
    background: var(--code-bg);
    padding: 12px;
    border-radius: 8px;
  }

  /* Handle variant change */
  fun handleVariantChange (event : Html.Event) : Promise(Void) {
    let value =
      `#{event}.target.value`

    next { selectedVariant: value }
  }

  /* Handle size change */
  fun handleSizeChange (event : Html.Event) : Promise(Void) {
    let value =
      `#{event}.target.value`

    next { selectedSize: value }
  }

  /* Toggle animated */
  fun toggleAnimated (event : Html.Event) : Promise(Void) {
    next { animatedEnabled: !animatedEnabled }
  }

  /* Toggle numbered */
  fun toggleNumbered (event : Html.Event) : Promise(Void) {
    next { numberedEnabled: !numberedEnabled }
  }

  /* Toggle case sensitive */
  fun toggleCaseSensitive (event : Html.Event) : Promise(Void) {
    next { caseSensitiveEnabled: !caseSensitiveEnabled }
  }

  /* Toggle match whole */
  fun toggleMatchWhole (event : Html.Event) : Promise(Void) {
    next { matchWholeEnabled: !matchWholeEnabled }
  }

  /* Toggle highlight first only */
  fun toggleHighlightFirst (event : Html.Event) : Promise(Void) {
    next { highlightFirstOnly: !highlightFirstOnly }
  }

  /* Toggle text only */
  fun toggleTextOnly (event : Html.Event) : Promise(Void) {
    next { textOnlyEnabled: !textOnlyEnabled }
  }

  /* Change max matches */
  fun handleMaxMatchesChange (event : Html.Event) : Promise(Void) {
    let value =
      `parseInt(#{event}.target.value) || -1`

    next { maxMatches: value }
  }

  /* Example usage code */
  fun getUsageCode : String {
    "<Highlight\n" + "  keywords={[\"time\", \"life\", \"answer\"]}\n" + "  sourceString=\"" + SAMPLE_TEXT + "\"\n" + "  variant=\"" + selectedVariant + "\"\n" + "  size=\"" + selectedSize + "\"\n" + "  animated={" + (
      if animatedEnabled {
        "true"
      } else {
        "false"
      }) + "}\n" + "  numbered={" + (
      if numberedEnabled {
        "true"
      } else {
        "false"
      }) + "}\n" + "/>"
  }

  /* Render */
  fun render : Html {
    <ComponentShowcase
      title="Highlight"
      description="Advanced text highlighting component with multiple variants, animations, and intelligent matching. Superior to Vant UI with numbered highlights, match limits, and more."
      badge="Display"
      enabledTabs={["preview", "usage", "api"]}
      previewContent={
        <Flex direction="column" gap="24px" align="stretch">
          /* Basic example */
          <div>
            <Highlight
              keywords={["time", "patient"]}
              sourceString={SAMPLE_TEXT}
              variant={selectedVariant}
              size={selectedSize}
              animated={animatedEnabled}
              numbered={numberedEnabled}
              caseSensitive={caseSensitiveEnabled}
              matchWhole={matchWholeEnabled}
              maxMatches={maxMatches}
              highlightFirst={highlightFirstOnly}
              textOnly={textOnlyEnabled}
            />
          </div>
        </Flex>
      }
      controlsContent={
        <Flex direction="column" gap="20px">
          /* Variant selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Variant"</Heading>

            <select::selectBox onChange={handleVariantChange} value={selectedVariant}>
              <option value="primary">"Primary"</option>
              <option value="success">"Success"</option>
              <option value="warning">"Warning"</option>
              <option value="danger">"Danger"</option>
              <option value="info">"Info"</option>
            </select>
          </div>

          /* Size selector */
          <div>
            <Heading level="4" margin="0 0 12px">"Size"</Heading>

            <select::selectBox onChange={handleSizeChange} value={selectedSize}>
              <option value="small">"Small"</option>
              <option value="medium">"Medium"</option>
              <option value="large">"Large"</option>
            </select>
          </div>

          /* Animated toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={animatedEnabled}
                onChange={toggleAnimated}/>

              <Text>"Animated"</Text>
            </label>
          </div>

          /* Numbered toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={numberedEnabled}
                onChange={toggleNumbered}/>

              <Text>"Numbered Matches"</Text>
            </label>
          </div>

          /* Case sensitive toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={caseSensitiveEnabled}
                onChange={toggleCaseSensitive}/>

              <Text>"Case Sensitive"</Text>
            </label>
          </div>

          /* Match whole words toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={matchWholeEnabled}
                onChange={toggleMatchWhole}/>

              <Text>"Match Whole Words"</Text>
            </label>
          </div>

          /* Highlight first only toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={highlightFirstOnly}
                onChange={toggleHighlightFirst}/>

              <Text>"Highlight First Only"</Text>
            </label>
          </div>

          /* Text only toggle */
          <div>
            <label::checkboxLabel>
              <input::checkbox
                type="checkbox"
                checked={textOnlyEnabled}
                onChange={toggleTextOnly}/>

              <Text>"Text Only (No Background)"</Text>
            </label>
          </div>

          /* Max matches input */
          <div>
            <Heading level="4" margin="0 0 12px">
              "Max Matches (-1 = unlimited)"
            </Heading>

            <input::numberInput
              type="number"
              value={Number.toString(maxMatches)}
              onChange={handleMaxMatchesChange}
              min="-1"/>
          </div>
        </Flex>
      }
      usageText="Highlight keywords in text with advanced features like animations, numbering, and intelligent matching."
      codeExamples={
        [
          {
            title: "Basic Usage",
            description: "Simple keyword highlighting",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"questions\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["questions"]}
                sourceString={SAMPLE_TEXT}
              />,
            showReplay: false
          },
          {
            title: "Multiple Keywords",
            description: "Highlight multiple keywords at once",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"time\", \"life\", \"answer\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n  variant=\"success\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["time", "life", "answer"]}
                sourceString={SAMPLE_TEXT}
                variant="success"
              />,
            showReplay: false
          },
          {
            title: "Numbered Highlights",
            description: "Show match numbers for each highlight",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"the\", \"a\"]}\n  sourceString=\"" + SAMPLE_TEXT_LONG + "\"\n  numbered={true}\n  variant=\"primary\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["the", "a"]}
                sourceString={SAMPLE_TEXT_LONG}
                numbered={true}
                variant="primary"
              />,
            showReplay: false
          },
          {
            title: "Animated Highlights",
            description: "Add pulse animation to highlights",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"success\", \"failure\", \"courage\"]}\n  sourceString=\"" + SAMPLE_TEXT_LONG + "\"\n  animated={true}\n  variant=\"warning\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["success", "failure", "courage"]}
                sourceString={SAMPLE_TEXT_LONG}
                animated={true}
                variant="warning"
              />,
            showReplay: false
          },
          {
            title: "Match Whole Words",
            description: "Only match complete words, not partial matches",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"it\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n  matchWhole={true}\n  variant=\"danger\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["it"]}
                sourceString={SAMPLE_TEXT}
                matchWhole={true}
                variant="danger"
              />,
            showReplay: false
          },
          {
            title: "Limit Max Matches",
            description: "Highlight only the first N matches",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"e\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n  maxMatches={5}\n  numbered={true}\n  variant=\"info\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["e"]}
                sourceString={SAMPLE_TEXT}
                maxMatches={5}
                numbered={true}
                variant="info"
              />,
            showReplay: false
          },
          {
            title: "Code Highlighting",
            description: "Highlight keywords in code snippets",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"function\", \"return\", \"items\"]}\n  sourceString=\"" + CODE_SAMPLE + "\"\n  variant=\"primary\"\n  size=\"small\"\n/>",
                language: "mint"
              },
            previewContent:
              <div::codeBlock>
                <Highlight
                  keywords={["function", "return", "items"]}
                  sourceString={CODE_SAMPLE}
                  variant="primary"
                  size="small"
                />
              </div>,
            showReplay: false
          },
          {
            title: "Text Only Mode",
            description: "Highlight with color only, no background",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"time\", \"patient\", \"life\", \"answer\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n  textOnly={true}\n  variant=\"danger\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["time", "patient", "life", "answer"]}
                sourceString={SAMPLE_TEXT}
                textOnly={true}
                variant="danger"
              />,
            showReplay: false
          },
          {
            title: "Case Sensitive",
            description: "Enable case-sensitive matching",
            snippet:
              {
                code:
                  "<Highlight\n  keywords={[\"Life\"]}\n  sourceString=\"" + SAMPLE_TEXT + "\"\n  caseSensitive={true}\n  variant=\"success\"\n/>",
                language: "mint"
              },
            previewContent:
              <Highlight
                keywords={["Life"]}
                sourceString={SAMPLE_TEXT}
                caseSensitive={true}
                variant="success"
              />,
            showReplay: false
          },
          {
            title: "Different Sizes",
            description: "Use small, medium, or large sizes",
            snippet:
              {
                code:
                  "<Flex direction=\"column\" gap=\"16px\">\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" size=\"small\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" size=\"medium\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" size=\"large\"/>\n</Flex>",
                language: "mint"
              },
            previewContent:
              <Flex direction="column" gap="16px">
                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  size="small"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  size="medium"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  size="large"
                />
              </Flex>,
            showReplay: false
          },
          {
            title: "All Variants",
            description: "Showcase all color variants",
            snippet:
              {
                code:
                  "<Flex direction=\"column\" gap=\"12px\">\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" variant=\"primary\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" variant=\"success\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" variant=\"warning\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" variant=\"danger\"/>\n  <Highlight keywords={[\"time\"]} sourceString=\"" + SAMPLE_TEXT + "\" variant=\"info\"/>\n</Flex>",
                language: "mint"
              },
            previewContent:
              <Flex direction="column" gap="12px">
                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  variant="primary"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  variant="success"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  variant="warning"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  variant="danger"
                />

                <Highlight
                  keywords={["time"]}
                  sourceString={SAMPLE_TEXT}
                  variant="info"
                />
              </Flex>,
            showReplay: false
          }
        ]
      }
      apiProperties={
        [
          {
            name: "keywords",
            description: "Array of keywords to highlight",
            type: "Array(String)",
            defaultValue: "[]"
          },
          {
            name: "sourceString",
            description: "The source text to search in",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "variant",
            description: "Color variant (primary, success, warning, danger, info)",
            type: "String",
            defaultValue: "\"primary\""
          },
          {
            name: "size",
            description: "Size of highlights (small, medium, large)",
            type: "String",
            defaultValue: "\"medium\""
          },
          {
            name: "animated",
            description: "Enable pulse animation on highlights",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "numbered",
            description: "Show match numbers on each highlight",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "textOnly",
            description: "Highlight with text color only, no background",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "caseSensitive",
            description: "Enable case-sensitive matching",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "autoEscape",
            description: "Automatically escape regex special characters",
            type: "Bool",
            defaultValue: "true"
          },
          {
            name: "matchWhole",
            description: "Only match whole words (word boundaries)",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "maxMatches",
            description: "Maximum number of matches to highlight (-1 = unlimited)",
            type: "Number",
            defaultValue: "-1"
          },
          {
            name: "highlightFirst",
            description: "Only highlight the first match",
            type: "Bool",
            defaultValue: "false"
          },
          {
            name: "highlightClass",
            description: "Custom CSS class for highlighted text",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "unhighlightClass",
            description: "Custom CSS class for non-highlighted text",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "highlightColor",
            description: "Custom text color for highlights",
            type: "String",
            defaultValue: "\"\""
          },
          {
            name: "highlightBackground",
            description: "Custom background color for highlights",
            type: "String",
            defaultValue: "\"\""
          }
        ]
      }
    />
  }
}
