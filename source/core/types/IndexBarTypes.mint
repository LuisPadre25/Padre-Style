/* IndexBarTypes - Type definitions for IndexBar component */

/* Event when index is selected */
type IndexBarSelectEvent {
  index : String,
  timestamp : Number
}

/* Event when active index changes */
type IndexBarChangeEvent {
  index : String,
  previousIndex : String
}

/* Configuration for custom index item */
type IndexBarIndexItem {
  index : String,
  label : String,
  disabled : Bool
}
