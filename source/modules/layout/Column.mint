/* Column - Individual column component for Columns layout */

component Column {
  /* Properties */
  property size : String = "auto"
  property customSize : String = ""
  property offset : String = "0"
  property children : Array(Html) = []

  /* Responsive sizes */
  property sizeTablet : String = ""
  property sizeDesktop : String = ""
  property offsetTablet : String = ""
  property offsetDesktop : String = ""

  /* Get flex basis based on size */
  fun getFlexBasis(sizeValue : String) : String {
    case sizeValue {
      "auto" => "0"
      "1" => "10%"
      "2" => "20%"
      "3" => "30%"
      "4" => "40%"
      "5" => "50%"
      "6" => "60%"
      "7" => "70%"
      "8" => "80%"
      "9" => "90%"
      "10" => "100%"
      "custom" => customSize
      => sizeValue
    }
  }

  /* Get flex grow based on size */
  fun getFlexGrow(sizeValue : String) : String {
    if sizeValue == "auto" {
      "1"
    } else {
      "0"
    }
  }

  /* Get flex shrink based on size */
  fun getFlexShrink(sizeValue : String) : String {
    if sizeValue == "auto" {
      "1"
    } else {
      "1"
    }
  }

  /* Get margin left for offset */
  fun getOffset(offsetValue : String) : String {
    case offsetValue {
      "0" => "0"
      "1" => "10%"
      "2" => "20%"
      "3" => "30%"
      "4" => "40%"
      "5" => "50%"
      "6" => "60%"
      "7" => "70%"
      "8" => "80%"
      "9" => "90%"
      => "0"
    }
  }

  /* Styles */
  style column {
    flex-basis: #{getFlexBasis(size)};
    flex-grow: #{getFlexGrow(size)};
    flex-shrink: #{getFlexShrink(size)};
    margin-left: #{getOffset(offset)};
    box-sizing: border-box;
    min-width: 0;

    /* When parent is vertical (column), control width too */
    if size != "auto" && size != "custom" {
      width: #{getFlexBasis(size)};
    }

    /* Tablet breakpoint */
    if sizeTablet != "" {
      @media (min-width: 768px) {
        flex-basis: #{getFlexBasis(sizeTablet)};
        flex-grow: #{getFlexGrow(sizeTablet)};
        flex-shrink: #{getFlexShrink(sizeTablet)};
      }
    }

    if offsetTablet != "" {
      @media (min-width: 768px) {
        margin-left: #{getOffset(offsetTablet)};
      }
    }

    /* Desktop breakpoint */
    if sizeDesktop != "" {
      @media (min-width: 1024px) {
        flex-basis: #{getFlexBasis(sizeDesktop)};
        flex-grow: #{getFlexGrow(sizeDesktop)};
        flex-shrink: #{getFlexShrink(sizeDesktop)};
      }
    }

    if offsetDesktop != "" {
      @media (min-width: 1024px) {
        margin-left: #{getOffset(offsetDesktop)};
      }
    }
  }

  fun render : Html {
    <div::column>
      for child of children {
        child
      }
    </div>
  }
}
