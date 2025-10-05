/* ShowcaseTypes - Type definitions for ComponentShowcase */

/* API Property documentation */
type ApiProperty {
  name : String,
  description : String,
  type : String,
  defaultValue : String
}

/* Code snippet with language for syntax highlighting */
type CodeSnippet {
  code : String,
  language : String
}

/* Usage example with title and description for showcase documentation */
type UsageExample {
  title : String,
  description : String,
  snippet : CodeSnippet
}

/* Showcase tab configuration */
type ShowcaseTab {
  id : String,
  title : String,
  enabled : Bool
}
