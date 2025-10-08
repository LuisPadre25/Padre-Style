/* Grid - Responsive CSS Grid Layout Component
 * Mobile-first design with support for 12-column grid system
 * Breakpoints: mobile (default), tablet (768px), desktop (1024px), widescreen (1216px), fullhd (1408px)
 */

component Grid {
  /* Content */
  property children : Array(Html) = []

  /* Grid Column System - Mobile First */
  property cols : String = "auto"
  property colsTablet : String = ""
  property colsDesktop : String = ""
  property colsWidescreen : String = ""
  property colsFullhd : String = ""

  /* Gap Properties */
  property gap : String = "1rem"
  property rowGap : String = ""
  property columnGap : String = ""

  /* Alignment */
  property justifyItems : String = "stretch"
  property alignItems : String = "stretch"
  property justifyContent : String = "start"
  property alignContent : String = "start"

  /* Grid Flow */
  property autoFlow : String = "row"
  property autoRows : String = "auto"
  property autoCols : String = "auto"

  /* Sizing */
  property width : String = "100%"
  property height : String = "auto"
  property minHeight : String = "auto"

  /* Spacing */
  property padding : String = "0"
  property margin : String = "0"

  /* Styling */
  property background : String = "transparent"
  property border : String = "none"
  property borderRadius : String = "0"
  property boxShadow : String = "none"

  /* Advanced */
  property className : String = ""

  /* Handle custom column values (numbers > 12 or CSS values) */
  fun handleCustomColumns(columns : String) : String {
    case Number.fromString(columns) {
      Just(num) =>
        if num > 0 {
          "repeat(" + columns + ", 1fr)"
        } else {
          "none"
        }

      Nothing => columns
    }
  }

  /* Convert column count to CSS grid template
   * Supports: 0-12, auto, or any number (13+) or custom CSS value
   */
  fun getGridTemplate(columns : String) : String {
    case columns {
      "auto" => "repeat(auto-fit, minmax(250px, 1fr))"
      "0" => "none"
      "1" => "repeat(1, 1fr)"
      "2" => "repeat(2, 1fr)"
      "3" => "repeat(3, 1fr)"
      "4" => "repeat(4, 1fr)"
      "5" => "repeat(5, 1fr)"
      "6" => "repeat(6, 1fr)"
      "7" => "repeat(7, 1fr)"
      "8" => "repeat(8, 1fr)"
      "9" => "repeat(9, 1fr)"
      "10" => "repeat(10, 1fr)"
      "11" => "repeat(11, 1fr)"
      "12" => "repeat(12, 1fr)"
      => handleCustomColumns(columns)
    }
  }

  style base {
    display: grid;
    grid-template-columns: #{getGridTemplate(cols)};
    grid-auto-flow: #{autoFlow};
    grid-auto-rows: #{autoRows};
    grid-auto-columns: #{autoCols};

    if rowGap != "" && columnGap != "" {
      row-gap: #{rowGap};
      column-gap: #{columnGap};
    } else if rowGap != "" {
      row-gap: #{rowGap};
      column-gap: #{gap};
    } else if columnGap != "" {
      row-gap: #{gap};
      column-gap: #{columnGap};
    } else {
      gap: #{gap};
    }

    justify-items: #{justifyItems};
    align-items: #{alignItems};
    justify-content: #{justifyContent};
    align-content: #{alignContent};

    width: #{width};
    height: #{height};
    min-height: #{minHeight};

    padding: #{padding};
    margin: #{margin};

    background: #{background};
    border: #{border};
    border-radius: #{borderRadius};
    box-shadow: #{boxShadow};
    box-sizing: border-box;
  }

  style responsive {
    /* Tablet: 768px and up */
    if colsTablet != "" {
      @media (min-width: 768px) {
        grid-template-columns: #{getGridTemplate(colsTablet)};
      }
    }

    /* Desktop: 1024px and up */
    if colsDesktop != "" {
      @media (min-width: 1024px) {
        grid-template-columns: #{getGridTemplate(colsDesktop)};
      }
    }

    /* Widescreen: 1216px and up */
    if colsWidescreen != "" {
      @media (min-width: 1216px) {
        grid-template-columns: #{getGridTemplate(colsWidescreen)};
      }
    }

    /* Fullhd: 1408px and up */
    if colsFullhd != "" {
      @media (min-width: 1408px) {
        grid-template-columns: #{getGridTemplate(colsFullhd)};
      }
    }
  }

  fun render : Html {
    <div::base::responsive class={className}>
      for child of children {
        child
      }
    </div>
  }
}
