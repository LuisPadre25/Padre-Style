/* TabsTypes - Type definitions for Tabs component */

/* Individual tab item configuration */
type TabItem {
  name : String,
  title : String,
  disabled : Bool,
  dot : Bool,
  badge : String,
  titleStyle : String,
  icon : String,
  content : String,

  /* Badge customization */
  badgeVariant : String,

  badgeSize : String,
  badgeColor : String,

  /* StatusDot customization */
  dotStatus : String,

  dotSize : String,
  dotAnimation : String
}

/* Tabs change event data */
type TabChangeEvent {
  name : String,
  title : String,
  index : Number
}

/* Tabs click event data */
type TabClickEvent {
  name : String,
  title : String,
  index : Number,
  disabled : Bool
}

/* Tabs scroll event data */
type TabScrollEvent {
  scrollTop : Number,
  isFixed : Bool
}
