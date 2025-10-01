/* Data Table Component */
component DataTable {
  property headers : Array(String) = []
  property rows : Array(Array(String)) = []
  property striped : Bool = true
  property hoverable : Bool = true

  connect ThemeStore exposing { currentTheme }

  style table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 12px;
    overflow: hidden;
  }

  style thead {
    font-weight: 600;
  }

  style th {
    padding: 1rem;
    text-align: left;
    font-weight: 600;
    font-size: 0.875rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  style td {
    padding: 1rem;
    border-top-width: 1px;
    border-top-style: solid;
  }

  style tr {
    transition: all 0.2s ease;
  }

  fun getTableStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getTheadStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  fun getThStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getTdStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      border-top-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getRowStyles (index : Number) : String {
    let hoverStyle =
      if hoverable {
        "cursor: pointer;"
      } else {
        ""
      }

    let stripedStyle =
      if striped && (index % 2 == 1) {
        "background: #{ThemeHelpers.getSurface(currentTheme)};"
      } else {
        ""
      }

    "#{stripedStyle} #{hoverStyle}"
  }

  fun render : Html {
    <table::table style={getTableStyles()}>
      <thead::thead style={getTheadStyles()}>
        <tr>
          for header of headers {
            <th::th style={getThStyles()}>header</th>
          }
        </tr>
      </thead>

      <tbody>
        {
          Array.mapWithIndex(rows,
            (row : Array(String), rowIndex : Number) {
              <tr::tr style={getRowStyles(rowIndex)}>
                for cell of row {
                  <td::td style={getTdStyles()}>cell</td>
                }
              </tr>
            })
        }
      </tbody>
    </table>
  }
}
