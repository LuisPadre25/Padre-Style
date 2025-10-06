/* CollapseTypes - Type definitions for Collapse component */

/* Individual collapse item configuration */
type CollapseItem {
  name : String,
  title : String,
  content : Html,
  disabled : Bool,
  icon : String,
  badge : String,
  removable : Bool,
  extraData : String
}

/* Collapse change event data */
type CollapseChangeEvent {
  name : String,
  active : Array(String),
  expanded : Bool
}

/* Collapse item click event data */
type CollapseItemClickEvent {
  name : String,
  index : Number,
  expanded : Bool
}

/* Collapse item remove event data */
type CollapseRemoveEvent {
  name : String,
  index : Number
}

/* User field for editable forms */
type UserField {
  id : String,
  label : String,
  placeholder : String,
  value : String
}
