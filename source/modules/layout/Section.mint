/* Section - Simple container to divide page into sections */
component Section {
  /* Content */
  property children : Array(Html) = []
  property title : String = ""
  property subtitle : String = ""

  /* Layout */
  property size : String = "medium"
  property maxWidth : String = "1200px"
  property centered : Bool = true

  /* Style */
  property bgColor : String = ""
  property variant : String = "default"
  property bordered : Bool = false

  /* Get background color */
  fun getBgColor : String {
    if String.isNotEmpty(bgColor) {
      bgColor
    } else {
      case variant {
        "primary" => "#f0f9ff"
        "success" => "#f0fdf4"
        "warning" => "#fffbeb"
        "danger" => "#fef2f2"
        "info" => "#eff6ff"
        "light" => "#f9fafb"
        "dark" => "#1f2937"
        => "transparent"
      }
    }
  }

  /* Get text color */
  fun getTextColor : String {
    case variant {
      "dark" => "white"
      => "inherit"
    }
  }

  /* Get padding based on size */
  fun getPadding : String {
    case size {
      "small" => "32px 16px"
      "medium" => "64px 24px"
      "large" => "96px 32px"
      => "64px 24px"
    }
  }

  /* Styles */
  style section {
    background-color: #{getBgColor()};
    color: #{getTextColor()};
    padding: #{getPadding()};
    position: relative;

    if bordered {
      border-top: 1px solid #e5e7eb;
      border-bottom: 1px solid #e5e7eb;
    }

    @media (max-width: 768px) {
      if size == "large" {
        padding: 64px 16px;
      }

      if size == "medium" {
        padding: 48px 16px;
      }

      if size == "small" {
        padding: 24px 16px;
      }
    }
  }

  style container {
    max-width: #{maxWidth};
    width: 100%;
    box-sizing: border-box;

    if centered {
      margin-left: auto;
      margin-right: auto;
    }
  }

  style header {
    margin-bottom: 40px;

    @media (max-width: 768px) {
      margin-bottom: 24px;
    }
  }

  style title {
    font-size: 36px;
    font-weight: 700;
    margin: 0 0 12px 0;
    line-height: 1.2;

    @media (max-width: 768px) {
      font-size: 28px;
    }

    @media (max-width: 480px) {
      font-size: 24px;
    }
  }

  style subtitle {
    font-size: 18px;
    font-weight: 400;
    margin: 0;
    line-height: 1.6;
    opacity: 0.85;

    @media (max-width: 768px) {
      font-size: 16px;
    }

    @media (max-width: 480px) {
      font-size: 14px;
    }
  }

  style content {
    width: 100%;
  }

  fun render : Html {
    <section::section>
      <div::container>
        if String.isNotEmpty(title) || String.isNotEmpty(subtitle) {
          <div::header>
            if String.isNotEmpty(title) {
              <h2::title>
                {
                  title
                }
              </h2>
            } else {
              <></>
            }

            if String.isNotEmpty(subtitle) {
              <p::subtitle>
                {
                  subtitle
                }
              </p>
            } else {
              <></>
            }
          </div>
        } else {
          <></>
        }

        <div::content>
          for child of children {
            child
          }
        </div>
      </div>
    </section>
  }
}
