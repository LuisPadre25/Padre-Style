/* Footer Component */
component Footer {
  property brandName : String = "Brand"
  property copyright : String = ""
  property links : Array(String) = []
  property onLinkClick = (link : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style footer {
    padding: 2rem;
    margin-top: 4rem;
  }

  style container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
  }

  style topSection {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 1rem;
  }

  style brand {
    font-size: 1.5rem;
    font-weight: 700;
  }

  style links {
    display: flex;
    gap: 2rem;
    flex-wrap: wrap;
  }

  style link {
    cursor: pointer;
    transition: all 0.2s ease;
    font-weight: 500;
  }

  style bottomSection {
    padding-top: 1.5rem;
    text-align: center;
    font-size: 0.875rem;
  }

  fun getFooterStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border-top: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getBrandStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getLinkStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun getCopyrightStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      opacity: 0.7;
      border-top: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun render : Html {
    <footer::footer style={getFooterStyles()}>
      <div::container>
        <div::topSection>
          <div::brand style={getBrandStyles()}>brandName</div>

          <div::links>
            for link of links {
              <a::link
                style={getLinkStyles()}
                onClick={(e : Html.Event) { onLinkClick(link) }}
              >link</a>
            }
          </div>
        </div>

        {
          if !String.isEmpty(copyright) {
            <div::bottomSection style={getCopyrightStyles()}>copyright</div>
          } else {
            <div/>
          }
        }
      </div>
    </footer>
  }
}
