# Mint Language Reference

## Overview
Mint is a refreshing programming language for building single page applications. It features a strong type system, immutable data structures, and a built-in development server.

## Language Basics

### Types
Mint has a strong static type system with type inference.

#### Primitive Types
- `String` - Text values
- `Number` - Numeric values (floating point)
- `Bool` - Boolean values (true/false)
- `Void` - No value
- `Never` - Type that never occurs

#### Type Annotations
```mint
let name : String = "John"
let age : Number = 25
let isActive : Bool = true
```

### Literals

#### String Literals
```mint
"Hello, World!"
"Multiline strings
can span multiple lines"
```

#### Number Literals
```mint
42
3.14159
-100
1_000_000  // Underscores for readability
```

#### Boolean Literals
```mint
true
false
```

### Strings
Strings support interpolation using `#{}`:
```mint
let name = "Alice"
let greeting = "Hello, #{name}!"
```

### Arrays
Arrays are ordered collections of values of the same type:
```mint
let numbers : Array(Number) = [1, 2, 3, 4, 5]
let strings : Array(String) = ["apple", "banana", "cherry"]

// Array operations
Array.map(numbers, (n) { n * 2 })
Array.filter(numbers, (n) { n > 2 })
Array.length(numbers)
```

### Tuples
Tuples are fixed-size collections of values with potentially different types:
```mint
let person : Tuple(String, Number) = {"Alice", 30}
let {name, age} = person  // Destructuring
```

### Operators

#### Arithmetic Operators
- `+` Addition
- `-` Subtraction
- `*` Multiplication
- `/` Division
- `%` Modulo

#### Comparison Operators
- `==` Equal
- `!=` Not equal
- `<` Less than
- `>` Greater than
- `<=` Less than or equal
- `>=` Greater than or equal

#### Logical Operators
- `&&` Logical AND
- `||` Logical OR
- `!` Logical NOT

#### String Operators
- `<>` String concatenation

### Functions

#### Function Declaration
```mint
fun greet (name : String) : String {
  "Hello, #{name}!"
}

// With multiple parameters
fun add (a : Number, b : Number) : Number {
  a + b
}
```

#### Function Arguments
Functions can have named arguments:
```mint
fun createUser (
  name : String,
  age : Number = 18,  // Default value
  active : Bool = true
) : User {
  // ...
}

// Calling with named arguments
createUser(name = "Alice", age = 25)
```

#### Anonymous Functions
```mint
let double = (n : Number) : Number { n * 2 }

// Short syntax for single expressions
let triple = (n) { n * 3 }

// Used with higher-order functions
Array.map([1, 2, 3], (n) { n * 2 })
```

### Function Calls
```mint
// Regular function call
greet("World")

// Method-like syntax for module functions
Array.length([1, 2, 3])

// Pipeline operator
[1, 2, 3]
|> Array.map((n) { n * 2 })
|> Array.filter((n) { n > 2 })
```

### Blocks
Blocks group multiple expressions:
```mint
{
  let x = 10
  let y = 20
  x + y  // Last expression is the return value
}
```

### Custom Types
Define your own types with enums:
```mint
enum Color {
  Red
  Green
  Blue
  RGB(Number, Number, Number)
}

// Usage
let primary = Color.Red
let custom = Color.RGB(255, 128, 0)
```

### Generic Types
Types can be parameterized:
```mint
enum Maybe(a) {
  Just(a)
  Nothing
}

enum Result(error, value) {
  Ok(value)
  Err(error)
}
```

### Records
Records are structured data types:
```mint
record User {
  id : Number,
  name : String,
  email : String,
  active : Bool = true  // Default value
}

// Creating a record
let user = {
  id = 1,
  name = "Alice",
  email = "alice@example.com"
}

// Updating records (creates a new record)
let updatedUser = { user | name = "Alicia" }
```

### Field Access
Access record fields with dot notation:
```mint
let userName = user.name
let isActive = user.active
```

### Constants
Define compile-time constants:
```mint
const API_URL = "https://api.example.com"
const MAX_RETRIES = 3
```

### Modules
Modules group related functions:
```mint
module Math {
  fun add (a : Number, b : Number) : Number {
    a + b
  }

  fun multiply (a : Number, b : Number) : Number {
    a * b
  }
}

// Usage
Math.add(5, 3)
```

### State
Components can have local state:
```mint
component Counter {
  state count : Number = 0

  fun increment : Promise(Void) {
    next { count = count + 1 }
  }

  fun render : Html {
    <div>
      <{ Number.toString(count) }>
      <button onClick={increment}>
        "Increment"
      </button>
    </div>
  }
}
```

### Stores
Stores manage global application state:
```mint
store Application {
  state user : Maybe(User) = Maybe.Nothing
  state theme : String = "light"

  fun login (user : User) : Promise(Void) {
    next { user = Maybe.Just(user) }
  }

  fun logout : Promise(Void) {
    next { user = Maybe.Nothing }
  }
}
```

### Routes
Define application routes:
```mint
routes {
  / {
    Application.setPage(Page.Home)
  }

  /users/:id (id : String) {
    Application.loadUser(id)
  }

  /search?q=:query (query : String) {
    Application.search(query)
  }

  * {
    Application.setPage(Page.NotFound)
  }
}
```

## Control Flow

### If Statements
```mint
if (condition) {
  // true branch
} else {
  // false branch
}

// As an expression
let message = if (age >= 18) { "Adult" } else { "Minor" }
```

### For Loops
Iterate over arrays:
```mint
for (item of items) {
  <li><{ item }></li>
}

// With index
for (item of items) when (index) {
  <li><{ "#{index}: #{item}" }></li>
}
```

### Case Statements
Pattern matching with case:
```mint
case (color) {
  Color.Red => "It's red!"
  Color.Green => "It's green!"
  Color.RGB(r, g, b) => "RGB: #{r}, #{g}, #{b}"
}
```

### Defer
Execute code after the current block:
```mint
{
  defer {
    Console.log("This runs after")
  }
  Console.log("This runs first")
}
```

## Pattern Matching

### Case Pattern Matching
```mint
case (maybe) {
  Maybe.Just(value) => value
  Maybe.Nothing => "No value"
}
```

### Let Pattern Matching
Destructure values:
```mint
let Maybe.Just(value) = maybeValue
let {name, age} = person
```

### If-Let
Conditional pattern matching:
```mint
if let Maybe.Just(user) = currentUser {
  // User is available
} else {
  // No user
}
```

### Array Pattern Matching
```mint
case (array) {
  [] => "Empty array"
  [single] => "One element: #{single}"
  [first, ...rest] => "First: #{first}, Rest: #{rest}"
}
```

## HTML

### HTML Tags
```mint
<div>
  <h1>"Hello, World!"</h1>
  <p>"This is a paragraph"</p>
</div>
```

### HTML Properties
```mint
<div
  class="container"
  id="main"
  data-value="42">
  "Content"
</div>
```

### HTML Events
```mint
<button onClick={handleClick}>
  "Click me"
</button>

<input
  onChange={(event : Html.Event) { handleInput(event) }}
  onKeyDown={handleKeyDown}
/>
```

### Inline Styles
```mint
<div
  style="
    color: red;
    font-size: 16px;
    margin: 10px;
  ">
  "Styled content"
</div>
```

### HTML Fragments
Group elements without a wrapper:
```mint
<>
  <h1>"Title"</h1>
  <p>"Paragraph"</p>
</>
```

### HTML Expressions
Embed Mint expressions in HTML:
```mint
<div>
  <{ "Dynamic content" }>
  <{ Number.toString(count) }>
  <{
    if (isLoggedIn) {
      "Welcome!"
    } else {
      "Please log in"
    }
  }>
</div>
```

## Components

### Basic Components
```mint
component Hello {
  fun render : Html {
    <div>"Hello, World!"</div>
  }
}
```

### Component Properties
```mint
component Greeting {
  property name : String = "World"
  property formal : Bool = false

  fun render : Html {
    <div>
      <{
        if (formal) {
          "Good day, #{name}"
        } else {
          "Hello, #{name}"
        }
      }>
    </div>
  }
}

// Usage
<Greeting name="Alice" formal={true}/>
```

### Computed Properties
```mint
component UserCard {
  property firstName : String
  property lastName : String

  get fullName : String {
    "#{firstName} #{lastName}"
  }

  fun render : Html {
    <div><{ fullName }></div>
  }
}
```

### Component Styling
```mint
component Card {
  style base {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;

    &:hover {
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
  }

  fun render : Html {
    <div::base>
      "Card content"
    </div>
  }
}
```

### Component Composition
```mint
component Layout {
  property children : Array(Html) = []

  fun render : Html {
    <div class="layout">
      <Header/>
      <main>
        <{ children }>
      </main>
      <Footer/>
    </div>
  }
}

// Usage
<Layout>
  <HomePage/>
</Layout>
```

### Connecting to Stores
```mint
component UserProfile {
  connect Application exposing { user }

  fun render : Html {
    case (user) {
      Maybe.Just(u) => <div>"Welcome, #{u.name}"</div>
      Maybe.Nothing => <div>"Not logged in"</div>
    }
  }
}
```

### Context
Share data between components:
```mint
component Provider {
  state theme : String = "light"

  use Provider {
    theme = theme
  }

  fun render : Html {
    <App/>
  }
}

component Child {
  connect Provider exposing { theme }

  fun render : Html {
    <div class={theme}>
      "Current theme: #{theme}"
    </div>
  }
}
```

## Styling

### Basic Styling
```mint
style button {
  background: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
```

### Style Interpolation
```mint
component DynamicButton {
  property color : String = "#007bff"

  style button {
    background: #{color};
    color: white;
    padding: 10px 20px;
  }

  fun render : Html {
    <button::button>
      "Click me"
    </button>
  }
}
```

### Selectors and Nesting
```mint
style card {
  padding: 20px;

  & h1 {
    font-size: 24px;
    margin-bottom: 10px;
  }

  & p {
    line-height: 1.6;
  }

  &:hover {
    background: #f5f5f5;
  }

  &.active {
    border: 2px solid blue;
  }
}
```

## Directives

### @asset
Include static assets:
```mint
const LOGO = @asset("./assets/logo.png")

<img src={LOGO}/>
```

### @svg
Inline SVG files:
```mint
const ICON = @svg("./icons/arrow.svg")

<div>
  <{ ICON }>
</div>
```

### @format
Format strings at compile time:
```mint
const MESSAGE = @format("Hello, {name}!", name = "World")
```

### @inline
Inline files as strings:
```mint
const CONFIG = @inline("./config.json")
```

### @highlight
Syntax highlighting for code:
```mint
const CODE = @highlight("mint", "let x = 42")

<pre>
  <{ CODE }>
</pre>
```

### @highlight-file
Highlight code from files:
```mint
const EXAMPLE = @highlight-file("./example.mint")
```

## JavaScript Interoperability

### Inline JavaScript
```mint
fun calculateHash (input : String) : String {
  `
  (() => {
    // JavaScript code here
    const crypto = require('crypto');
    return crypto.createHash('md5')
      .update(#{input})
      .digest('hex');
  })()
  `
}
```

### Decode
Convert JavaScript values to Mint types:
```mint
fun parseJSON (json : String) : Result(Object.Error, User) {
  decode json as User
}
```

### Encode
Convert Mint values to JavaScript:
```mint
fun toJSON (user : User) : String {
  encode user
}
```

## Here Documents
Multi-line strings with special formatting:
```mint
const QUERY = <<~GRAPHQL
  query GetUser($id: ID!) {
    user(id: $id) {
      name
      email
    }
  }
GRAPHQL
```

## Locale
Internationalization support:
```mint
locale en {
  greeting = "Hello"
  farewell = "Goodbye"
}

locale es {
  greeting = "Hola"
  farewell = "Adiós"
}

// Usage
<div><{ @tr(greeting) }></div>
```

## Best Practices

1. **Type Safety**: Always use type annotations for function parameters and return types
2. **Immutability**: Prefer immutable data structures and use record updates
3. **Pattern Matching**: Use pattern matching instead of if-else chains when possible
4. **Component Composition**: Build small, reusable components
5. **Store Management**: Keep global state in stores, local state in components
6. **Error Handling**: Use Result and Maybe types for error handling
7. **Styling**: Use component-scoped styles to avoid conflicts
8. **Testing**: Write tests for business logic and components

## Common Patterns

### Loading States
```mint
enum LoadingState(a) {
  Initial
  Loading
  Success(a)
  Failure(String)
}

component DataLoader {
  state status : LoadingState(Data) = LoadingState.Initial

  fun load : Promise(Void) {
    sequence {
      next { status = LoadingState.Loading }

      case (Http.get("/api/data")) {
        Result.Ok(response) =>
          next { status = LoadingState.Success(response.body) }

        Result.Err(error) =>
          next { status = LoadingState.Failure(error.message) }
      }
    }
  }
}
```

### Form Handling
```mint
component LoginForm {
  state email : String = ""
  state password : String = ""

  fun handleSubmit (event : Html.Event) : Promise(Void) {
    sequence {
      Html.Event.preventDefault(event)

      // Validate and submit
      Application.login(email, password)
    }
  }

  fun render : Html {
    <form onSubmit={handleSubmit}>
      <input
        type="email"
        value={email}
        onChange={(e) { next { email = Dom.getValue(e.target) } }}
      />

      <input
        type="password"
        value={password}
        onChange={(e) { next { password = Dom.getValue(e.target) } }}
      />

      <button type="submit">
        "Login"
      </button>
    </form>
  }
}
```

### HTTP Requests
```mint
module API {
  fun getUser (id : String) : Promise(Result(Http.ErrorResponse, User)) {
    Http.get("/api/users/#{id}")
    |> Http.header("Authorization", "Bearer #{token}")
    |> Http.send()
    |> Promise.map((response) {
      decode response.body as User
    })
  }
}
```

This reference covers the core features of the Mint programming language. For more detailed information and examples, refer to the official Mint documentation.