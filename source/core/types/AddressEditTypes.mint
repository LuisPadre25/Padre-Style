/* Address Edit Types */
type AddressEditInfo {
  name : String,
  tel : String,
  province : String,
  city : String,
  county : String,
  addressDetail : String,
  areaCode : String,
  isDefault : Bool
}

type AddressEditSearchItem {
  name : String,
  address : String
}

type AreaItem {
  code : String,
  name : String
}

type AreaList {
  province : Array(AreaItem),
  city : Array(AreaItem),
  county : Array(AreaItem)
}
