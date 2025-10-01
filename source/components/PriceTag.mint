/* Price Tag Component */
component PriceTag {
  property price : String = "0"
  property currency : String = "$"
  property size : String = "medium"
  property discount : String = ""

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    align-items: baseline;
    gap: 0.5rem;
  }

  style price {
    font-weight: 700;
  }

  style currency {
    font-weight: 600;
  }

  style discount {
    text-decoration: line-through;
    opacity: 0.6;
  }

  fun getPriceStyles : String {
    let fontSize =
      case size {
        "small" => "1rem"
        "large" => "2.5rem"
        _ => "1.75rem"
      }

    "
      font-size: #{fontSize};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getCurrencyStyles : String {
    let fontSize =
      case size {
        "small" => "0.875rem"
        "large" => "1.5rem"
        _ => "1.25rem"
      }

    "
      font-size: #{fontSize};
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun getDiscountStyles : String {
    let fontSize =
      case size {
        "small" => "0.75rem"
        "large" => "1.25rem"
        _ => "1rem"
      }

    "
      font-size: #{fontSize};
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun render : Html {
    <div::container>
      {
        if !String.isEmpty(discount) {
          <span::discount style={getDiscountStyles()}>
            <span>currency</span>
            <span>discount</span>
          </span>
        } else {
          <span/>
        }
      }

      <span::currency style={getCurrencyStyles()}>currency</span>
      <span::price style={getPriceStyles()}>price</span>
    </div>
  }
}
