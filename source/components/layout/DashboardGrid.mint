/* Dashboard Grid Component - Composes StatCard and MetricCard */
component DashboardGrid {
  property columns : Number = 3
  property gap : String = "1.5rem"

  connect ThemeStore exposing { currentTheme }

  style grid {
    display: grid;
    gap: 1.5rem;
  }

  fun getGridStyles : String {
    "
      grid-template-columns: repeat(#{Number.toString(columns)}, 1fr);
      gap: #{gap};
    "
  }

  fun render : Html {
    <div::grid style={getGridStyles()}>
      <StatCard
        title="Total Revenue"
        value="$45,231"
        icon="💰"
        trend="+12.5%"
        trendDirection="up"
        description="vs last month"
      />

      <StatCard
        title="Active Users"
        value="2,847"
        icon="👥"
        trend="+8.2%"
        trendDirection="up"
        description="currently online"
      />

      <StatCard
        title="Sales Today"
        value="142"
        icon="📊"
        trend="-3.1%"
        trendDirection="down"
        description="vs yesterday"
      />

      <MetricCard
        label="Project Progress"
        current={68}
        target={100}
        unit="%"
        variant="success"
      />

      <MetricCard
        label="Storage Used"
        current={7.2}
        target={10}
        unit="GB"
        variant="warning"
      />

      <MetricCard
        label="Tasks Completed"
        current={24}
        target={30}
        unit="tasks"
        variant="primary"
      />
    </div>
  }
}
