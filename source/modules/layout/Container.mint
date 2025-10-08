/* Container - Responsive container component for centering content */
component Container {
  /* Properties */
  property children : Array(Html) = []

  property width : String = "1200px"
  property fluid : Bool = false
  property padding : String = ""

  /* Get max width */
  fun getMaxWidth : String {
    if fluid {
      "100%"
    } else {
      width
    }
  }

  /* Get horizontal padding */
  fun getHorizontalPadding : String {
    if String.isNotEmpty(padding) {
      padding
    } else {
      "16px"
    }
  }

  /* Styles */
  style container {
    width: 100%;
    max-width: #{getMaxWidth()};
    margin-left: auto;
    margin-right: auto;
    padding-left: #{getHorizontalPadding()};
    padding-right: #{getHorizontalPadding()};
    box-sizing: border-box;

    /* Tablet: aumentar padding */
    @media (min-width: 768px) {
      if String.isEmpty(padding) {
        padding-left: 24px;
        padding-right: 24px;
      }
    }

    /* Desktop: aumentar padding */
    @media (min-width: 1024px) {
      if String.isEmpty(padding) {
        padding-left: 32px;
        padding-right: 32px;
      }
    }
  }

  fun render : Html {
    <div::container>
      for child of children {
        child
      }
    </div>
  }
}
