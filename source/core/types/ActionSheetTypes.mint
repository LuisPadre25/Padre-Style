/* ActionSheetTypes - Type definitions for ActionSheet component */

/* Action item in the sheet */
type ActionSheetAction {
  name : String,
  subname : String,
  color : String,
  icon : String,
  className : String,
  loading : Bool,
  disabled : Bool
}

/* Event when action is selected */
type ActionSheetSelectEvent {
  action : ActionSheetAction,
  index : Number
}

/* Event for cancel button */
type ActionSheetCancelEvent {
  timestamp : Number
}

/* Event for open/close */
type ActionSheetStateEvent {
  timestamp : Number
}

/* Event for overlay click */
type ActionSheetOverlayEvent {
  timestamp : Number
}
