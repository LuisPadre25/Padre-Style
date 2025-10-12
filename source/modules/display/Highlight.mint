/* Highlight Component - Advanced text highlighting with multiple features */
component Highlight {
  /* Props */
  property keywords : Array(String) = []

  property sourceString : String = ""
  property caseSensitive : Bool = false
  property autoEscape : Bool = true
  property highlightClass : String = ""
  property unhighlightClass : String = ""

  /* Style variants */
  property variant : String = "primary"

  property size : String = "medium"
  property animated : Bool = false
  property numbered : Bool = false
  property textOnly : Bool = false

  /* Colors */
  property highlightColor : String = ""

  property highlightBackground : String = ""

  /* Advanced features */
  property matchWhole : Bool = false

  property maxMatches : Number = -1
  property highlightFirst : Bool = false

  /* State */
  state currentMatchIndex : Number = 0

  /* Escape special regex characters */
  fun escapeRegex (text : String) : String {
    if autoEscape {
      `
      (() => {
        const text = #{text};
        return text.replace(/[\\^$.*+?()[\]{}|]/g, '\\$&');
      })()
      `
    } else {
      text
    }
  }

  /* Build regex pattern from keywords */
  fun buildPattern : String {
    if Array.isEmpty(keywords) {
      ""
    } else {
      let escapedKeywords =
        keywords
        |> Array.map(escapeRegex)
        |> Array.reject(String.isEmpty)

      if Array.isEmpty(escapedKeywords) {
        ""
      } else {
        `
        (() => {
          const keywords = #{escapedKeywords};
          const matchWhole = #{matchWhole};
          const pattern = keywords.join('|');
          return matchWhole ? '\\\\b(' + pattern + ')\\\\b' : '(' + pattern + ')';
        })()
        `
      }
    }
  }

  /* Split text into matches and non-matches */
  fun getMatches : Array(HighlightMatch) {
    if String.isEmpty(sourceString) || Array.isEmpty(keywords) {
      [{ text: sourceString, isMatch: false, index: 0 }]
    } else {
      let pattern =
        buildPattern()

      if String.isEmpty(pattern) {
        [{ text: sourceString, isMatch: false, index: 0 }]
      } else {
        splitByPattern(sourceString, pattern, caseSensitive)
      }
    }
  }

  /* Split text using regex pattern */
  fun splitByPattern (
    text : String,
    pattern : String,
    caseSensitive : Bool
  ) : Array(HighlightMatch) {
    `
    (() => {
      try {
        const flags = #{caseSensitive} ? 'g' : 'gi';
        const regex = new RegExp(#{pattern}, flags);
        const matches = [];
        let lastIndex = 0;
        let matchCount = 0;
        const maxMatches = #{maxMatches};
        const highlightFirst = #{highlightFirst};

        const text = #{text};
        let match;

        while ((match = regex.exec(text)) !== null) {
          // Check max matches limit
          if (maxMatches > 0 && matchCount >= maxMatches) break;

          // Add non-match before this match
          if (match.index > lastIndex) {
            matches.push({
              text: text.substring(lastIndex, match.index),
              isMatch: false,
              index: lastIndex
            });
          }

          // Add the match
          const shouldHighlight = !highlightFirst || matchCount === 0;
          matches.push({
            text: match[0],
            isMatch: shouldHighlight,
            index: match.index
          });

          lastIndex = regex.lastIndex;
          matchCount++;
        }

        // Add remaining text
        if (lastIndex < text.length) {
          matches.push({
            text: text.substring(lastIndex),
            isMatch: false,
            index: lastIndex
          });
        }

        return matches.length > 0 ? matches : [{ text: text, isMatch: false, index: 0 }];
      } catch (e) {
        console.error('Highlight regex error:', e);
        return [{ text: #{text}, isMatch: false, index: 0 }];
      }
    })()
    `
  }

  /* Get variant colors */
  fun getVariantColors : HighlightVariant {
    if textOnly {
      case variant {
        "primary" =>
          {
            name: "primary",
            color: "#1989fa",
            background: "transparent",
            fontWeight: "700"
          }

        "success" =>
          {
            name: "success",
            color: "#07c160",
            background: "transparent",
            fontWeight: "700"
          }

        "warning" =>
          {
            name: "warning",
            color: "#ff9800",
            background: "transparent",
            fontWeight: "700"
          }

        "danger" =>
          {
            name: "danger",
            color: "#ee0a24",
            background: "transparent",
            fontWeight: "700"
          }

        "info" =>
          {
            name: "info",
            color: "#909399",
            background: "transparent",
            fontWeight: "700"
          }

        =>
          {
            name: "custom",
            color: highlightColor,
            background: "transparent",
            fontWeight: "700"
          }
      }
    } else {
      case variant {
        "primary" =>
          {
            name: "primary",
            color: "#ffffff",
            background: "#1989fa",
            fontWeight: "600"
          }

        "success" =>
          {
            name: "success",
            color: "#ffffff",
            background: "#07c160",
            fontWeight: "600"
          }

        "warning" =>
          {
            name: "warning",
            color: "#663c00",
            background: "#ffba00",
            fontWeight: "600"
          }

        "danger" =>
          {
            name: "danger",
            color: "#ffffff",
            background: "#ee0a24",
            fontWeight: "600"
          }

        "info" =>
          {
            name: "info",
            color: "#ffffff",
            background: "#909399",
            fontWeight: "600"
          }

        =>
          {
            name: "custom",
            color: highlightColor,
            background: highlightBackground,
            fontWeight: "600"
          }
      }
    }
  }

  /* Styles */
  style container {
    display: inline;
    line-height: 1.6;
    word-break: break-word;
  }

  style text {
    display: inline;
  }

  style highlight {
    display: inline;
    transition: all 0.3s ease;
    font-weight: 600;

    if textOnly {
      padding: 0;
      border-radius: 0;
      font-weight: 700;
    } else {
      padding: 2px 4px;
      border-radius: 4px;

      if size == "small" {
        padding: 1px 3px;
        font-size: 12px;
      }

      if size == "large" {
        padding: 3px 6px;
        font-size: 16px;
      }
    }

    if animated {
      animation: highlightPulse 1.5s ease-in-out infinite;
    }

    @keyframes highlightPulse {
      0%, 100% {
        opacity: 1;
        transform: scale(1);
      }

      50% {
        opacity: 0.8;
        transform: scale(1.02);
      }
    }
  }

  style numbered {
    display: inline-flex;
    align-items: center;
    gap: 2px;
    padding: 2px 6px;
    border-radius: 4px;
    font-weight: 600;
  }

  style matchNumber {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 18px;
    height: 18px;
    padding: 0 4px;
    background: rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    font-size: 10px;
    font-weight: 700;
    margin-right: 2px;
  }

  /* Render matched text with highlighting */
  fun renderMatch (match : HighlightMatch, index : Number) : Html {
    if match.isMatch {
      let variantColors =
        getVariantColors()

      let bgColor =
        if String.isEmpty(highlightBackground) {
          variantColors.background
        } else {
          highlightBackground
        }

      let textColor =
        if String.isEmpty(highlightColor) {
          variantColors.color
        } else {
          highlightColor
        }

      let customClass =
        if String.isEmpty(highlightClass) {
          ""
        } else {
          highlightClass
        }

      if numbered {
        <span::highlight::numbered
          class={customClass}
          style={"background: " + bgColor + "; color: " + textColor + ";"}
          key={"match-" + Number.toString(index)}
        >
          <span::matchNumber>
            {
              Number.toString(index + 1)
            }
          </span>

          {
            match.text
          }
        </span>
      } else {
        <span::highlight
          class={customClass}
          style={"background: " + bgColor + "; color: " + textColor + ";"}
          key={"match-" + Number.toString(index)}
        >
          {
            match.text
          }
        </span>
      }
    } else {
      let customClass =
        if String.isEmpty(unhighlightClass) {
          ""
        } else {
          unhighlightClass
        }

      <span::text class={customClass} key={"text-" + Number.toString(index)}>
        {
          match.text
        }
      </span>
    }
  }

  /* Render */
  fun render : Html {
    let matches =
      getMatches()

    <div::container>
      {
        Array.mapWithIndex(matches,
          (match : HighlightMatch, index : Number) : Html {
            renderMatch(match, index)
          })
      }
    </div>
  }
}
