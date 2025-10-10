/* Hero - Hero section component like Bulma */
component Hero {
  /* Content */
  property title : String = ""

  property subtitle : String = ""
  property children : Array(Html) = []

  /* Size */
  property size : String = "medium"

  /* Style */
  property variant : String = "primary"

  property bgImage : String = ""
  property overlay : Bool = false
  property textAlign : String = "center"

  /* Custom styles */
  property bgColor : String = ""

  property textColor : String = ""

  /* Get background color based on variant */
  fun getBgColor : String {
    if String.isNotEmpty(bgColor) {
      bgColor
    } else {
      case variant {
        "primary" => "#1989fa"
        "success" => "#10b981"
        "warning" => "#f59e0b"
        "danger" => "#ef4444"
        "error" => "#ef4444"
        "info" => "#3b82f6"
        "secondary" => "#6366f1"
        "dark" => "#1f2937"
        "light" => "#f3f4f6"
        => "#1989fa"
      }
    }
  }

  /* Get text color based on variant */
  fun getTextColor : String {
    if String.isNotEmpty(textColor) {
      textColor
    } else {
      case variant {
        "light" => "#1f2937"
        => "white"
      }
    }
  }

  /* Get padding based on size */
  fun getPadding : String {
    case size {
      "small" => "48px 24px"
      "medium" => "96px 24px"
      "large" => "144px 24px"
      "fullheight" => "48px 24px"
      => "96px 24px"
    }
  }

  /* Get height based on size */
  fun getMinHeight : String {
    case size {
      "fullheight" => "100vh"
      => "auto"
    }
  }

  /* Styles */
  style hero {
    position: relative;
    background-color: #{getBgColor()};
    color: #{getTextColor()};
    padding: #{getPadding()};
    min-height: #{getMinHeight()};
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: #{textAlign};
    overflow: hidden;

    /* Background image */
    if String.isNotEmpty(bgImage) {
      background-image: url(#{bgImage});
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

    /* Responsive padding */
    @media (max-width: 768px) {
      if size == "large" {
        padding: 96px 16px;
      }

      if size == "medium" {
        padding: 64px 16px;
      }

      if size == "small" {
        padding: 32px 16px;
      }
    }
  }

  style overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1;
  }

  style content {
    position: relative;
    z-index: 2;
    max-width: 960px;
    width: 100%;
  }

  style title {
    font-size: 48px;
    font-weight: 700;
    margin: 0 0 16px 0;
    line-height: 1.2;

    @media (max-width: 768px) {
      font-size: 32px;
    }

    @media (max-width: 480px) {
      font-size: 24px;
    }
  }

  style subtitle {
    font-size: 24px;
    font-weight: 400;
    margin: 0 0 32px 0;
    line-height: 1.5;
    opacity: 0.95;

    @media (max-width: 768px) {
      font-size: 18px;
      margin-bottom: 24px;
    }

    @media (max-width: 480px) {
      font-size: 16px;
    }
  }

  style actions {
    display: flex;
    gap: 16px;
    justify-content: #{textAlign};
    flex-wrap: wrap;

    if textAlign == "center" {
      justify-content: center;
    }

    if textAlign == "left" {
      justify-content: flex-start;
    }

    if textAlign == "right" {
      justify-content: flex-end;
    }

    @media (max-width: 480px) {
      flex-direction: column;
      width: 100%;
    }
  }

  fun render : Html {
    <div::hero>
      if overlay && String.isNotEmpty(bgImage) {
        <div::overlay/>
      } else {
        <></>
      }

      <div::content>
        if String.isNotEmpty(title) {
          <h1::title>
            {
              title
            }
          </h1>
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

        if !Array.isEmpty(children) {
          <div::actions>
            for child of children {
              child
            }
          </div>
        } else {
          <></>
        }
      </div>
    </div>
  }
}
