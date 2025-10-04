/* User Profile Component - Reuses Avatar, Button, Badge */
component UserProfile {
  property name : String = "John Doe"
  property email : String = "john@example.com"
  property role : String = "Admin"
  property avatar : String = "JD"
  property onEdit = (e : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: 2rem;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1.5rem;
    text-align: center;
  }

  style info {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }

  style name {
    font-size: 1.5rem;
    font-weight: 700;
  }

  style email {
    font-size: 0.875rem;
    opacity: 0.7;
  }

  style actions {
    display: flex;
    gap: 0.75rem;
    margin-top: 1rem;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getNameStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getEmailStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <Avatar size="lg" initials={avatar}/>

      <div::info>
        <div::name style={getNameStyles()}>name</div>
        <div::email style={getEmailStyles()}>email</div>
        <div style="margin-top: 0.5rem;"><Badge variant="primary">role</Badge></div>
      </div>

      <div::actions>
        <Button onClick={onEdit}>"Edit Profile"</Button>
        <Button variant="secondary">"View Activity"</Button>
      </div>
    </div>
  }
}
