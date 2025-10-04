/* Simple Rating Component */
component SimpleRating {
  property value : Number = 0
  property max : Number = 5
  property onChange = (rating : Number) : Promise(Void) { Promise.never() }
  property readonly : Bool = false

  connect ThemeStore exposing { currentTheme }

  state hover : Number = 0

  fun handleClick (rating : Number) : Promise(Void) {
    if readonly {
      Promise.never()
    } else {
      onChange(rating)
    }
  }

  fun handleEnter (rating : Number) : Promise(Void) {
    if readonly {
      Promise.never()
    } else {
      next { hover: rating }
    }
  }

  fun handleLeave : Promise(Void) {
    next { hover: 0 }
  }

  style container {
    display: inline-flex;
    gap: 0.25rem;
  }

  style star {
    font-size: 1.5rem;
    transition: all 0.2s ease;
  }

  fun getStarStyles (index : Number) : String {
    let display =
      if hover > 0 {
        hover
      } else {
        value
      }

    let filled =
      index <= display

    let color =
      if filled {
        "#fbbf24"
      } else {
        ThemeHelpers.getBorderPrimary(currentTheme)
      }

    let cursor =
      if readonly {
        "default"
      } else {
        "pointer"
      }

    "color: #{color}; cursor: #{cursor};"
  }

  fun render : Html {
    <div::container onMouseLeave={(e : Html.Event) { handleLeave() }}>
      {
        let stars =
          Array.range(1, max)

        for index of stars {
          <span::star
            style={getStarStyles(index)}
            onClick={(e : Html.Event) { handleClick(index) }}
            onMouseEnter={(e : Html.Event) { handleEnter(index) }}
          >"★"</span>
        }
      }
    </div>
  }
}
