/* Table Component Showcase */
component TableShowcase {
  /* Sample headers */
  fun getHeaders : Array(String) {
    ["ID", "Name", "Email", "Role", "Status", "Joined"]
  }

  /* Sample data */
  fun getRows : Array(Array(String)) {
    [
      ["1", "John Doe", "john@example.com", "Admin", "Active", "2024-01-15"],
      ["2", "Jane Smith", "jane@example.com", "Editor", "Active", "2024-02-20"],
      ["3", "Bob Johnson", "bob@example.com", "User", "Inactive", "2024-03-10"],
      ["4", "Alice Williams", "alice@example.com", "Editor", "Active", "2024-04-05"],
      ["5", "Charlie Brown", "charlie@example.com", "User", "Active", "2024-05-12"],
      ["6", "Diana Prince", "diana@example.com", "Admin", "Active", "2024-06-18"],
      ["7", "Edward Norton", "edward@example.com", "User", "Inactive", "2024-07-22"],
      ["8", "Fiona Apple", "fiona@example.com", "Editor", "Active", "2024-08-30"],
      ["9", "George Martin", "george@example.com", "User", "Active", "2024-09-14"],
      ["10", "Hannah Montana", "hannah@example.com", "Admin", "Active", "2024-10-01"],
      ["11", "Ian McKellen", "ian@example.com", "User", "Inactive", "2024-01-28"],
      ["12", "Julia Roberts", "julia@example.com", "Editor", "Active", "2024-02-16"]
    ]
  }

  style container {
    padding: 2rem;
  }

  style section {
    margin-bottom: 3rem;
  }

  style sectionTitle {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 1rem;
    color: #374151;
  }

  style description {
    font-size: 1rem;
    color: #6b7280;
    margin-bottom: 2rem;
    line-height: 1.6;
  }

  fun render : Html {
    <div::container>
      <h1::sectionTitle>"Advanced Table Component"</h1>
      <p::description>
        "A professional table component with sorting, pagination, and search features."
      </p>

      <div::section>
        <h2::sectionTitle>"Full-Featured Table"</h2>
        <p::description>
          "Table with search, sort, and pagination (5 rows per page)."
        </p>

        <AdvancedTable
          headers={getHeaders()}
          rows={getRows()}
          pageSize={5}
          searchable={true}
          striped={true}
          hoverable={true}/>
      </div>

      <div::section>
        <h2::sectionTitle>"Simple Table (No Features)"</h2>
        <p::description>
          "Basic table without search or pagination."
        </p>

        <AdvancedTable
          headers={getHeaders()}
          rows={Array.slice(getRows(), 0, 5)}
          pageSize={100}
          searchable={false}
          striped={true}
          hoverable={false}/>
      </div>

      <div::section>
        <h2::sectionTitle>"Compact Table (3 items per page)"</h2>
        <p::description>
          "Table with smaller page size for compact display."
        </p>

        <AdvancedTable
          headers={getHeaders()}
          rows={getRows()}
          pageSize={3}
          searchable={true}
          striped={false}
          hoverable={true}/>
      </div>
    </div>
  }
}
