/* Matrix Types */
type MatrixCell {
  x : Number,
  y : Number,
  col : Number,
  row : Number,
  text : String,
  className : String
}

type MatrixData {
  data : Array(MatrixCell)
}

type VirtualMatrix {
  numData : Array(MatrixCell),
  vm : Array(Array(Number)),
  error : String
}
