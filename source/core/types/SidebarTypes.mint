type SidebarItem {
  id : String,
  label : String,
  route : String,
  subtitle : String,
  badge : String
}

type SidebarCategory {
  id : String,
  title : String,
  icon : String,
  items : Array(SidebarItem)
}
