/* Matrix Component - Basic Grid Layout */

component Matrix {
  property data : MatrixData = { data: [] }
  property cellHeight : Array(Number) = [50]
  property cellWidth : Array(Number) = [100]
  property fixFirstRow : Bool = false
  property maxHeight : Number = 0

  fun renderCell (item : MatrixCell) : Html {
    <div
      key={Number.toString(item.x) + "-" + Number.toString(item.y)}
      style={
        "position: absolute; " +
        "top: " + Number.toString(item.y * 60) + "px; " +
        "left: " + Number.toString(item.x * 120) + "px; " +
        "width: " + Number.toString(item.col * 120 - 2) + "px; " +
        "height: " + Number.toString(item.row * 60 - 2) + "px; " +
        "border: 1px solid #ddd; display: flex; align-items: center; justify-content: center; padding: 10px;"
      }>

      {item.text}
    </div>
  }

  fun render : Html {
    <div style="border: 1px solid #ddd; position: relative; height: 400px; width: 600px;">
      for (item of data.data) {
        renderCell(item)
      }
    </div>
  }
}
