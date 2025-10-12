/* Highlight Types - Type definitions for Highlight component */

/* Match result with position information */
type HighlightMatch {
  text : String,
  isMatch : Bool,
  index : Number
}

/* Highlight configuration */
type HighlightConfig {
  keywords : Array(String),
  sourceString : String,
  caseSensitive : Bool,
  autoEscape : Bool,
  highlightClass : String,
  unhighlightClass : String,
  highlightColor : String,
  highlightBackground : String
}

/* Highlight style variant */
type HighlightVariant {
  name : String,
  color : String,
  background : String,
  fontWeight : String
}
