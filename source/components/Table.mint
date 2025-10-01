/* Advanced Table Component with Sorting, Pagination, and Search */
component AdvancedTable {
  property headers : Array(String) = []
  property rows : Array(Array(String)) = []
  property pageSize : Number = 10
  property searchable : Bool = true
  property striped : Bool = true
  property hoverable : Bool = true

  connect ThemeStore exposing { currentTheme }

  state currentPage : Number = 1
  state sortColumnIndex : Number = -1
  state sortDirection : String = "asc"
  state searchQuery : String = ""

  style container {
    width: 100%;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  style searchBar {
    padding: 1rem;
    display: flex;
    gap: 1rem;
    align-items: center;
  }

  style searchInput {
    flex: 1;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(102, 126, 234, 0.2);
    border-radius: 8px;
    font-size: 1rem;
    outline: none;
    transition: all 0.3s ease;

    &:focus {
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    &::placeholder {
      color: #9ca3af;
    }
  }

  style tableWrapper {
    overflow-x: auto;
  }

  style table {
    width: 100%;
    border-collapse: collapse;
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
    cursor: pointer;
    user-select: none;
    transition: background 0.2s ease;

    &:hover {
      opacity: 0.8;
    }
  }

  style td {
    padding: 1rem;
    font-size: 0.9375rem;
  }

  style tr {
    transition: all 0.2s ease;
  }

  style sortIcon {
    display: inline-block;
    margin-left: 0.5rem;
    font-size: 0.75rem;
    opacity: 0.5;
  }

  style pagination {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    border-top-width: 1px;
    border-top-style: solid;
  }

  style paginationInfo {
    font-size: 0.875rem;
  }

  style paginationButtons {
    display: flex;
    gap: 0.5rem;
  }

  style pageButton {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;

    &:hover:not(:disabled) {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }
  }

  style emptyState {
    padding: 3rem;
    text-align: center;
    font-size: 1rem;
    color: #9ca3af;
  }

  /* Filter rows by search query */
  fun filterRows (allRows : Array(Array(String))) : Array(Array(String)) {
    if String.isEmpty(searchQuery) {
      allRows
    } else {
      let query =
        String.toLowerCase(searchQuery)

      Array.select(allRows,
        (row : Array(String)) : Bool {
          Array.any(row,
            (cell : String) : Bool {
              String.contains(String.toLowerCase(cell), query)
            })
        })
    }
  }

  /* Sort rows */
  fun sortRows (filteredRows : Array(Array(String))) : Array(Array(String)) {
    if sortColumnIndex < 0 {
      filteredRows
    } else {
      let sorted =
        Array.sortBy(filteredRows,
          (row : Array(String)) : String {
            case Array.at(row, sortColumnIndex) {
              Maybe.Just(value) => value
              Maybe.Nothing => ""
            }
          })

      if sortDirection == "desc" {
        Array.reverse(sorted)
      } else {
        sorted
      }
    }
  }

  /* Get processed rows */
  fun getProcessedRows : Array(Array(String)) {
    rows
    |> filterRows
    |> sortRows
  }

  /* Get paginated rows */
  fun getPaginatedRows : Array(Array(String)) {
    let processed =
      getProcessedRows()

    let startIndex =
      (currentPage - 1) * pageSize

    let endIndex =
      startIndex + pageSize

    Array.slice(processed, startIndex, endIndex)
  }

  /* Get total pages */
  fun getTotalPages : Number {
    let processed =
      getProcessedRows()

    let total =
      Array.size(processed)

    let pages =
      total / pageSize

    let remainder =
      total % pageSize

    if remainder > 0 {
      pages + 1
    } else {
      pages
    }
  }

  /* Handle search input */
  fun handleSearch (event : Html.Event) : Promise(Void) {
    let value =
      Dom.getValue(event.target)

    next { searchQuery: value, currentPage: 1 }
  }

  /* Handle sort */
  fun handleSort (columnIndex : Number) : Promise(Void) {
    let newDirection =
      if sortColumnIndex == columnIndex && sortDirection == "asc" {
        "desc"
      } else {
        "asc"
      }

    next {
      sortColumnIndex: columnIndex,
      sortDirection: newDirection
    }
  }

  /* Navigate to page */
  fun goToPage (page : Number) : Promise(Void) {
    next { currentPage: page }
  }

  /* Render sort icon */
  fun renderSortIcon (columnIndex : Number) : Html {
    if sortColumnIndex == columnIndex {
      if sortDirection == "asc" {
        <span::sortIcon>"▲"</span>
      } else {
        <span::sortIcon>"▼"</span>
      }
    } else {
      <span::sortIcon>"⇅"</span>
    }
  }

  /* Get container styles */
  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  /* Get search bar styles */
  fun getSearchBarStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-bottom: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  /* Get search input styles */
  fun getSearchInputStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  /* Get thead styles */
  fun getTheadStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-bottom: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  /* Get td styles */
  fun getTdStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      border-top: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  /* Get row styles */
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

  /* Get pagination styles */
  fun getPaginationStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      border-top-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun render : Html {
    let paginatedRows =
      getPaginatedRows()

    let totalPages =
      getTotalPages()

    let totalRows =
      Array.size(getProcessedRows())

    let startRow =
      ((currentPage - 1) * pageSize) + 1

    let endRow =
      if currentPage * pageSize > totalRows {
        totalRows
      } else {
        currentPage * pageSize
      }

    <div::container style={getContainerStyles()}>
      if searchable {
        <div::searchBar style={getSearchBarStyles()}>
          <input::searchInput
            type="text"
            placeholder="Search..."
            value={searchQuery}
            onInput={handleSearch}
            style={getSearchInputStyles()}/>
        </div>
      }

      <div::tableWrapper>
        <table::table>
          <thead::thead style={getTheadStyles()}>
            <tr>
              {
                Array.mapWithIndex(headers,
                  (header : String, index : Number) {
                    <th::th onClick={() { handleSort(index) }}>
                      header
                      renderSortIcon(index)
                    </th>
                  })
              }
            </tr>
          </thead>

          <tbody>
            {
              if Array.isEmpty(paginatedRows) {
                [
                  <tr>
                    <td::emptyState colSpan={Number.toString(Array.size(headers))}>
                      "No data available"
                    </td>
                  </tr>
                ]
              } else {
                Array.mapWithIndex(paginatedRows,
                  (row : Array(String), rowIndex : Number) {
                    <tr::tr style={getRowStyles(rowIndex)}>
                      for cell of row {
                        <td::td style={getTdStyles()}>
                          cell
                        </td>
                      }
                    </tr>
                  })
              }
            }
          </tbody>
        </table>
      </div>

      if totalPages > 1 {
        <div::pagination style={getPaginationStyles()}>
          <div::paginationInfo>
            "Showing #{Number.toString(startRow)}-#{Number.toString(endRow)} of #{Number.toString(totalRows)}"
          </div>

          <div::paginationButtons>
            <button::pageButton
              onClick={() { goToPage(currentPage - 1) }}
              disabled={currentPage <= 1}>

              "Previous"
            </button>

            <button::pageButton
              onClick={() { goToPage(currentPage + 1) }}
              disabled={currentPage >= totalPages}>

              "Next"
            </button>
          </div>
        </div>
      }
    </div>
  }
}
