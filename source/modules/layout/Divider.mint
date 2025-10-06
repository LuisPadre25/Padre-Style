/* Divider - Visual separator line
 * Features: Horizontal/vertical dividers with custom styling
 */

component Divider {
  /* Orientation */
  property orientation : String = "horizontal"  // horizontal, vertical

  /* Styling */
  property color : String = "rgba(0, 0, 0, 0.1)"
  property thickness : String = "1px"
  property style : String = "solid"  // solid, dashed, dotted
  property length : String = "100%"

  /* Spacing */
  property margin : String = "1rem 0"
  property spacing : String = ""  // Override margin

  /* Label */
  property label : String = ""
  property labelPosition : String = "center"  // left, center, right

  style horizontalDivider {
    width: #{length};
    height: #{thickness};
    background: #{color};
    border: none;
    margin: #{if String.isEmpty(spacing) { margin } else { spacing }};
  }

  style verticalDivider {
    width: #{thickness};
    height: #{length};
    background: #{color};
    border: none;
    margin: #{if String.isEmpty(spacing) { margin } else { spacing }};
    display: inline-block;
  }

  style dividerWithLabel {
    display: flex;
    align-items: center;
    width: #{length};
    margin: #{if String.isEmpty(spacing) { margin } else { spacing }};
    gap: 1rem;
  }

  style line {
    flex: 1;
    height: #{thickness};
    background: #{color};
  }

  style labelText {
    color: rgba(0, 0, 0, 0.45);
    font-size: 14px;
    white-space: nowrap;
  }

  fun render : Html {
    if String.isNotEmpty(label) {
      <div::dividerWithLabel>
        if labelPosition != "left" {
          <div::line/>
        }

        <span::labelText>{label}</span>

        if labelPosition != "right" {
          <div::line/>
        }
      </div>
    } else {
      if orientation == "vertical" {
        <div::verticalDivider/>
      } else {
        <hr::horizontalDivider/>
      }
    }
  }
}
