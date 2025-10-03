/* DataDisplayDocsPage - Documentación de Data Display */
component DataDisplayDocsPage {
  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style section {
    margin-bottom: 3rem;
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Data Display Components"</h1>
      <p>"Components for displaying data: tables, cards, lists, badges, tags."</p>

      <div::section>
        <h2>"Table - Data Tables"</h2>
        <p>"Sortable, filterable tables with pagination."</p>
      </div>

      <div::section>
        <h2>"DynamicCard - Card Component"</h2>
        <p>"Flexible card with header, body, footer."</p>
      </div>

      <div::section>
        <h2>"MetricCard - Metric Display"</h2>
        <p>"Display KPIs and metrics with trends."</p>
      </div>

      <div::section>
        <h2>"Badge - Badges"</h2>
        <p>"Small count and label badges."</p>
      </div>

      <div::section>
        <h2>"Tag - Tags"</h2>
        <p>"Removable tags for categories and filters."</p>
      </div>
    </div>
  }
}
