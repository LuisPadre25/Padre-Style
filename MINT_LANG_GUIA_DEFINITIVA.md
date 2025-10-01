# MINT LANG - Guía Definitiva de Records y Functions

> Documentación completa basada en la documentación oficial de Mint Lang
> Fuente: https://mint-lang.com/guide/

---

## Tabla de Contenidos

1. [Tipos en Mint](#tipos-en-mint)
2. [Records - Definición y Uso](#records---definición-y-uso)
3. [Functions - Sintaxis Completa](#functions---sintaxis-completa)
4. [Blocks y Expresiones](#blocks-y-expresiones)
5. [Retornar Records desde Functions](#retornar-records-desde-functions)
6. [Custom Types y Enums](#custom-types-y-enums)
7. [Pattern Matching](#pattern-matching)
8. [Control de Flujo](#control-de-flujo)
9. [Manejo de Errores](#manejo-de-errores)
10. [Ejemplos Completos](#ejemplos-completos)

---

## Tipos en Mint

### Sistema de Tipos

Mint es un lenguaje **fuertemente tipado** con **inferencia de tipos**. Todos los tipos son **inmutables** por defecto.

### Tipos Básicos

```mint
String    // "Hello World"
Number    // 42, 3.14
Bool      // true, false
Array(a)  // [1, 2, 3]
Maybe(a)  // Maybe.Just(value), Maybe.Nothing
Result(error, value)  // Result.Ok(value), Result.Err(error)
Promise(error, value) // Para operaciones asíncronas
Tuple(a, b, c)       // {"A", 0, true}
```

### Anotaciones de Tipo

```mint
// Variables con tipo explícito
name : String = "John"
age : Number = 30
isActive : Bool = true

// Los tipos se pueden inferir automáticamente
name = "John"  // inferido como String
age = 30       // inferido como Number
```

---

## Records - Definición y Uso

### ¿Qué es un Record?

Records son estructuras de datos que tienen un conjunto fijo de campos (keys) con valores tipados. Son similares a objetos en JavaScript pero con tipos estáticos.

### Sintaxis: Definir un Record

```mint
record User {
  email : String,
  name : String,
  id : Number
}
```

**Reglas importantes:**
- Usa la palabra clave `record`
- Los campos se separan con comas `,`
- Cada campo debe tener un tipo definido
- Los nombres de campos son inmutables

### Sintaxis: Crear Instancias de Records

Hay **DOS formas** de crear instancias de records:

#### 1. Record Literal (sintaxis preferida)

```mint
user = {
  email = "john@doe.com",
  name = "John Doe",
  id = 1
}
```

**Características del Record Literal:**
- Usa llaves `{}`
- Asignación con `=` (NO con `:`)
- Los campos se separan con comas `,`
- El orden de los campos NO importa

#### 2. Constructor Function

Para cada record, Mint automáticamente genera una función constructora con el mismo nombre:

```mint
record User {
  name : String,
  age : Number,
  active : Bool
}

// Constructor generado automáticamente
User("John Doe", 32, true)
// equivale a:
// {
//   name = "John Doe",
//   age = 32,
//   active = true
// }
```

**Importante:** El orden de los argumentos en el constructor sigue el orden de definición de los campos.

### Records Anidados (Nested Records)

```mint
record Position {
  x : Number,
  y : Number
}

record Entity {
  position : Position,
  id : String
}

// Crear instancia con records anidados
entity = {
  position = {
    x = 10,
    y = 20
  },
  id = "entity-1"
}
```

### Actualizar Records (Immutable Update)

**IMPORTANTE:** No puedes mutar un record directamente. Debes crear uno nuevo.

```mint
user = {
  email = "john.doe@gmail.com",
  name = "John Doe",
  id = 0
}

// Sintaxis de actualización: { record | campo = nuevoValor }
updatedUser = { user | name = "Stuart" }
```

**Sintaxis de actualización:**
- `{ recordExistente | campo = nuevoValor }`
- Crea un NUEVO record copiando todos los campos del original
- Solo modifica los campos especificados después de `|`

### Acceso a Campos (Field Access)

**CAMBIO IMPORTANTE:** En versiones recientes de Mint, el acceso a campos requiere el tipo como parámetro.

```mint
record User {
  name : String,
  age : Number
}

user = {
  name = "John",
  age = 30
}

// Sintaxis moderna (requiere tipo como parámetro)
userName = .name(User)

// Uso en funciones
fun getUserName (user : User) : String {
  .name(User)
}
```

---

## Functions - Sintaxis Completa

### Definir Functions

```mint
fun functionName (param : Type) : ReturnType {
  // cuerpo de la función
}
```

**Componentes:**
1. `fun` - palabra clave
2. `functionName` - nombre de la función (camelCase)
3. `(param : Type)` - parámetros con tipos
4. `: ReturnType` - tipo de retorno (obligatorio)
5. `{ }` - bloque de código

### Ejemplos de Functions

#### Function Simple

```mint
fun greet (name : String) : String {
  "Hello " + name
}
```

#### Function con Múltiples Parámetros

```mint
fun add (a : Number, b : Number) : Number {
  a + b
}
```

#### Function sin Parámetros

```mint
fun getCurrentTime : String {
  "12:00 PM"
}
```

#### Function con Tipo Complejo

```mint
fun processData (data : Array(String)) : Result(String, Number) {
  // procesamiento
  Result.Ok(42)
}
```

### Anonymous Functions (Lambdas)

Sintaxis: `(param : Type) : ReturnType { body }`

```mint
// Lambda simple
numbers = [1, 2, 3]
doubled = Array.map(numbers, (number : Number) : Number { number * 2 })

// Lambda con múltiples parámetros
Array.mapWithIndex(
  [1, 2, 3],
  (number : Number, index : Number) : Number { number + index }
)

// Lambda que retorna Bool
Array.any([1, 2, 3, 4], (number : Number) : Bool { number % 2 == 0 })
```

### Function Arguments - Type Annotations

```mint
// Parámetro simple
fun greet (name : String) : String {
  "Hello " + name
}

// Múltiples parámetros
fun padEnd (
  string : String,
  padString : String,
  targetLength : Number
) : String {
  `#{string}.padEnd(#{targetLength}, #{padString})`
}

// Parámetros con tipos complejos
fun decodeUser (object : Object) : Result(Object.Error, User) {
  // implementación
}

// Function type como parámetro
fun onChange (value : String) : Promise(Void) {
  Debug.log(value)
  next { }
}
```

---

## Blocks y Expresiones

### ¿Qué es un Block?

Un block es un conjunto de expresiones envuelto en llaves `{ }`. El valor de un block es el valor de su **última expresión**.

### Diferencia: Expressions vs Statements

**Expressions** (Expresiones):
- Producen un valor
- Pueden ser usadas directamente
- Ejemplo: `5 + 3`, `"Hello"`, `if (x) { 1 } else { 2 }`

**Statements** (Declaraciones):
- Asignan valores a variables
- Se usan dentro de blocks
- Ejemplo: `x = 5`, `result = doSomething()`

### Valor de Retorno Implícito

```mint
fun calculate : Number {
  x = 5
  y = 10
  x + y  // Esta es la última expresión, se retorna automáticamente
}
// retorna 15
```

**Regla clave:** La última expresión de un block se retorna implícitamente. NO necesitas escribir `return`.

### Blocks en Control Expressions

Todos los control structures en Mint son **expresiones** que retornan un valor:

```mint
result = if (condition) {
  // block 1
  "yes"
} else {
  // block 2
  "no"
}
```

### Try Expression

El valor de un `try` expression es el valor de su última expresión:

```mint
fun decodeUser (object : Object) : Result(Object.Error, User) {
  try {
    email = object
      |> Object.Decode.field("email", Object.Decode.string)

    name = object
      |> Object.Decode.field("name", Object.Decode.string)

    // Última expresión: se retorna
    Result.ok({
      email = email,
      name = name
    })
  } catch Object.Error => error {
    Result.error(error)
  }
}
```

---

## Retornar Records desde Functions

### Sintaxis Exacta

**FORMA CORRECTA #1: Record Literal como última expresión**

```mint
record User {
  email : String,
  name : String
}

fun createUser (email : String, name : String) : User {
  {
    email = email,
    name = name
  }
}
```

**FORMA CORRECTA #2: Constructor Function**

```mint
fun createUser (email : String, name : String) : User {
  User(email, name)
}
```

**FORMA CORRECTA #3: Record Literal en una sola expresión**

```mint
fun createDefaultUser : User {
  { email = "default@example.com", name = "Default User" }
}
```

### Ejemplo Completo: Función que retorna Record

```mint
record User {
  email : String,
  name : String,
  id : Number
}

fun createUser (email : String, name : String, id : Number) : User {
  {
    email = email,
    name = name,
    id = id
  }
}

// Uso
user = createUser("john@example.com", "John Doe", 1)
```

### Function retornando Record envuelto en Result

```mint
record User {
  email : String,
  name : String
}

fun decodeUser (object : Object) : Result(Object.Error, User) {
  try {
    email = object
      |> Object.Decode.field("email", Object.Decode.string)

    name = object
      |> Object.Decode.field("name", Object.Decode.string)

    // Record literal envuelto en Result.ok
    Result.ok({
      email = email,
      name = name
    })
  } catch Object.Error => error {
    Result.error(error)
  }
}
```

### Function retornando Record en Promise

```mint
record User {
  id : Number,
  name : String
}

fun fetchUser (id : Number) : Promise(Http.ErrorResponse, User) {
  sequence {
    response = Http.get("https://api.example.com/users/#{id}")

    // Parsear y retornar record
    {
      id = id,
      name = response.body
    }
  }
}
```

### Blocks con Records

**SÍ funciona: Block con record literal como última expresión**

```mint
fun createUser : User {
  // Statements
  timestamp = Time.now()

  // Última expresión: record literal
  {
    email = "user@example.com",
    name = "User",
    id = timestamp
  }
}
```

**SÍ funciona: Block con lógica compleja**

```mint
fun getUser (id : Number) : User {
  baseEmail = "user-#{id}@example.com"
  userName = "User #{id}"

  {
    email = baseEmail,
    name = userName,
    id = id
  }
}
```

---

## Custom Types y Enums

### Enums (Algebraic Data Types)

Los enums representan tipos de datos algebraicos con diferentes variantes:

```mint
enum UserState {
  LoggedIn(User)
  Visitor
}
```

### Crear Instancias de Enums

Sintaxis: `EnumName::Variant(arguments)`

```mint
// Crear instancia de enum
state = UserState::LoggedIn(user)
visitor = UserState::Visitor
```

### Enums Genéricos

```mint
enum Result(error, value) {
  Err(error)
  Ok(value)
}

// Uso
success = Result.Ok(42)
failure = Result.Err("Error message")
```

### Enum Maybe (Optional Values)

```mint
enum Maybe(value) {
  Just(value)
  Nothing
}

// Uso
someValue = Maybe.Just("Hello")
noValue = Maybe.Nothing
```

### Ejemplo Completo: Enum con Pattern Matching

```mint
enum UserType {
  Trial
  Free
  Premium
}

fun greet (type : UserType) : String {
  case (type) {
    UserType::Trial => "You are on Trial"
    UserType::Free => "Upgrade to Premium"
    UserType::Premium => "Welcome Premium User!"
  }
}
```

---

## Pattern Matching

### Case Expression

El `case` expression permite hacer pattern matching sobre valores:

```mint
fun isLoggedIn (userState : UserState) : Bool {
  case (userState) {
    UserState::LoggedIn(user) => true
    UserState::Visitor => false
  }
}
```

### Pattern Matching con Records en Enums

```mint
enum Status {
  Loading
  Success(User)
  Error(String)
}

fun handleStatus (status : Status) : String {
  case (status) {
    Status::Loading => "Loading..."
    Status::Success(user) => "Welcome, #{user.name}"
    Status::Error(message) => "Error: #{message}"
  }
}
```

### Pattern Matching con Tuples

```mint
fun describeTuple (tuple : Tuple(String, Number)) : String {
  case (tuple) {
    {"hello", n} => "Hello #{n} times"
    {str, 0} => "#{str} zero times"
    {str, n} => "#{str} #{n} times"
  }
}
```

### Destructuring en Case

```mint
enum Result(error, value) {
  Err(error)
  Ok(value)
}

fun handleResult (result : Result(String, Number)) : String {
  case (result) {
    Result.Ok(value) => "Success: #{value}"
    Result.Err(error) => "Error: #{error}"
  }
}
```

---

## Control de Flujo

### If-Else Expression

**IMPORTANTE:** El `else` branch es obligatorio en Mint.

```mint
// If-else básico
result = if (number > 5) {
  "big"
} else {
  "small"
}

// If-else-if chain
result = if (number > 10) {
  "very big"
} else if (number > 5) {
  "big"
} else {
  "small"
}
```

**Reglas:**
1. La condición debe ser tipo `Bool`
2. Ambos branches deben retornar el **mismo tipo**
3. El `else` es obligatorio (no hay ternario)

### For-Of Expression

Itera sobre arrays y retorna un nuevo array:

```mint
// For básico
result = for item of ["bob", "joe"] {
  String.toUpperCase(item)
}
// result = ["BOB", "JOE"]

// For con índice
for item, index of [1, 2, 3] {
  item + index
}
```

### Sequence Expression (Async)

Para operaciones asíncronas en secuencia:

```mint
fun fetchData : Promise(Http.ErrorResponse, String) {
  sequence {
    // Statements ejecutados en secuencia
    response = Http.get("https://api.example.com/data")

    // Parsear respuesta
    data = Json.parse(response.body)

    // Retornar resultado
    data
  } catch Http.ErrorResponse => error {
    Promise.reject(error)
  }
}
```

### Parallel Expression (Async)

Para ejecutar operaciones asíncronas en paralelo:

```mint
fun fetchMultiple : Promise(Never, Array(String)) {
  parallel {
    user = Http.get("https://api.example.com/user")
    posts = Http.get("https://api.example.com/posts")
  } then {
    [user.body, posts.body]
  }
}
```

**Importante:**
- `sequence` retorna siempre `Promise(error, result)`
- `parallel` retorna siempre `Promise(error, result)`

---

## Manejo de Errores

### Try-Catch Expression

Para computaciones síncronas que pueden fallar:

```mint
record User {
  email : String,
  name : String
}

fun decodeUser (object : Object) : Result(Object.Error, User) {
  try {
    // Statements que pueden fallar
    email = object
      |> Object.Decode.field("email", Object.Decode.string)

    name = object
      |> Object.Decode.field("name", Object.Decode.string)

    // Última expresión: valor de retorno
    Result.ok({
      email = email,
      name = name
    })
  } catch Object.Error => error {
    // Manejo de errores
    Result.error(error)
  }
}
```

**Reglas:**
1. Debes manejar **todos** los tipos de error posibles
2. El compilador te avisará si falta un catch
3. El valor de retorno es la última expresión del try o del catch

### Result Type

```mint
enum Result(error, value) {
  Err(error)
  Ok(value)
}

// Crear Results
success = Result.Ok(42)
failure = Result.Err("Something went wrong")

// Pattern matching con Result
case (result) {
  Result.Ok(value) => Debug.log("Success: #{value}")
  Result.Err(error) => Debug.log("Error: #{error}")
}
```

### Maybe Type

```mint
enum Maybe(value) {
  Just(value)
  Nothing
}

// Funciones útiles
Maybe.withDefault(Maybe.Just("B"), "A")  // "B"
Maybe.withDefault(Maybe.Nothing, "A")    // "A"

Maybe.map(Maybe.Just(1), (n : Number) { n + 2 })  // Maybe.Just(3)

Maybe.toResult(Maybe.Nothing, "Error")  // Result.Error("Error")
Maybe.toResult(Maybe.Just("A"), "Error")  // Result.Ok("A")
```

### Promise Type

```mint
// Promise tiene dos type parameters: error y value
Promise(error, value)

// Ejemplos
Promise(Never, Void)          // Promise que nunca falla
Promise(Http.ErrorResponse, String)  // HTTP request
```

---

## Sintaxis Adicional

### Operador Pipe `|>`

El operador pipe permite encadenar funciones:

```mint
// Sin pipe
result = boundScore(0, 10, add(5, double(score)))

// Con pipe
result = score
  |> double
  |> add(5)
  |> boundScore(0, 10)
```

**Regla:** `x |> f` es equivalente a `f(x)`

### String Interpolation

Mint usa `#{}` para interpolación (NO `${}`):

```mint
// En strings regulares (requiere backticks para inline JS)
name = "John"
greeting = `"Hello " + #{name} + "!"`

// En CSS
style base {
  color: #{color};
}

// En inline JavaScript
fun greet (name : String) : String {
  `
  (() => {
    return "Hello " + #{name} + "!"
  })()
  `
}
```

### Arrays

```mint
// Array literal
numbers = [1, 2, 3]
strings = ["hello", "world"]
maybes = [Maybe.Just("A"), Maybe.Nothing]

// Array con records
users = [
  { name = "John", age = 30 },
  { name = "Jane", age = 25 }
]
```

### Tuples

```mint
// Tuple literal
tuple = {"A", 0, true}  // Tuple(String, Number, Bool)

// Destructuring en where
{idx2, distance} = traverse(genState, idx, direction, false)

// Destructuring en case
case (tuple) {
  {first, second, third} => Debug.log(first)
}
```

### Modules

Módulos para organizar funciones y constantes:

```mint
module Math {
  const PI : Number = 3.14159

  fun double (n : Number) : Number {
    n * 2
  }
}

// Acceso
Math::PI
result = Math.double(5)
```

### Constants

```mint
// En módulos, stores, o components
module Config {
  const API_URL : String = "https://api.example.com"
  const MAX_RETRIES : Number = 3
}

// Los nombres de constantes DEBEN estar en UPPERCASE
// Acceso con ::
url = Config::API_URL
```

---

## Ejemplos Completos

### Ejemplo 1: CRUD de Usuario

```mint
record User {
  id : Number,
  name : String,
  email : String,
  active : Bool
}

module UserService {
  fun createUser (name : String, email : String) : User {
    {
      id = 0,
      name = name,
      email = email,
      active = true
    }
  }

  fun updateUser (user : User, name : String) : User {
    { user | name = name }
  }

  fun deactivateUser (user : User) : User {
    { user | active = false }
  }

  fun formatUser (user : User) : String {
    if (user.active) {
      "#{user.name} (#{user.email}) - Active"
    } else {
      "#{user.name} (#{user.email}) - Inactive"
    }
  }
}

// Uso
user = UserService.createUser("John Doe", "john@example.com")
updatedUser = UserService.updateUser(user, "Jane Doe")
inactiveUser = UserService.deactivateUser(updatedUser)
```

### Ejemplo 2: HTTP Request con Error Handling

```mint
record Article {
  id : Number,
  title : String,
  content : String
}

module Api {
  fun fetchArticle (id : Number) : Promise(Http.ErrorResponse, Article) {
    sequence {
      response = Http.get("https://api.example.com/articles/#{id}")

      object = Json.parse(response.body)

      article = try {
        id = Object.Decode.field("id", Object.Decode.number, object)
        title = Object.Decode.field("title", Object.Decode.string, object)
        content = Object.Decode.field("content", Object.Decode.string, object)

        Result.ok({
          id = id,
          title = title,
          content = content
        })
      } catch Object.Error => error {
        Result.error(error)
      }

      case (article) {
        Result.Ok(a) => a
        Result.Err(e) => Promise.reject(Http.ErrorResponse)
      }
    } catch Http.ErrorResponse => error {
      Promise.reject(error)
    }
  }
}
```

### Ejemplo 3: State Management con Enum

```mint
record User {
  id : Number,
  name : String
}

enum LoadingState {
  Idle
  Loading
  Success(User)
  Error(String)
}

component UserProfile {
  state status : LoadingState = LoadingState::Idle

  fun loadUser (id : Number) : Promise(Never, Void) {
    sequence {
      next { status = LoadingState::Loading }

      user = fetchUser(id)

      next { status = LoadingState::Success(user) }
    } catch {
      next { status = LoadingState::Error("Failed to load user") }
    }
  }

  fun render : Html {
    case (status) {
      LoadingState::Idle => <div>"Click to load"</div>
      LoadingState::Loading => <div>"Loading..."</div>
      LoadingState::Success(user) => <div>"Hello, #{user.name}"</div>
      LoadingState::Error(msg) => <div>"Error: #{msg}"</div>
    }
  }
}
```

### Ejemplo 4: Funciones que Retornan Records Complejos

```mint
record Address {
  street : String,
  city : String,
  country : String
}

record Person {
  name : String,
  age : Number,
  address : Address
}

module PersonFactory {
  fun createDefaultAddress : Address {
    {
      street = "Unknown",
      city = "Unknown",
      country = "Unknown"
    }
  }

  fun createAddress (street : String, city : String, country : String) : Address {
    {
      street = street,
      city = city,
      country = country
    }
  }

  fun createPerson (
    name : String,
    age : Number,
    street : String,
    city : String,
    country : String
  ) : Person {
    address = createAddress(street, city, country)

    {
      name = name,
      age = age,
      address = address
    }
  }

  fun updateAddress (person : Person, newAddress : Address) : Person {
    { person | address = newAddress }
  }
}

// Uso
person = PersonFactory.createPerson(
  "John Doe",
  30,
  "123 Main St",
  "New York",
  "USA"
)

newAddress = PersonFactory.createAddress("456 Oak Ave", "Boston", "USA")
updatedPerson = PersonFactory.updateAddress(person, newAddress)
```

---

## Sintaxis: LO QUE FUNCIONA vs LO QUE NO FUNCIONA

### Records: FUNCIONA ✅

```mint
// ✅ Record literal como última expresión
fun createUser : User {
  {
    name = "John",
    email = "john@example.com"
  }
}

// ✅ Record literal en una línea
fun createUser : User {
  { name = "John", email = "john@example.com" }
}

// ✅ Constructor function
fun createUser : User {
  User("John", "john@example.com")
}

// ✅ Block con statements y record literal
fun createUser : User {
  timestamp = Time.now()
  defaultEmail = "user@example.com"

  {
    name = "User",
    email = defaultEmail,
    id = timestamp
  }
}

// ✅ Record en Result
fun createUser : Result(String, User) {
  Result.ok({
    name = "John",
    email = "john@example.com"
  })
}
```

### Records: NO FUNCIONA ❌

```mint
// ❌ NO existe palabra clave 'return'
fun createUser : User {
  return { name = "John", email = "john@example.com" }  // ERROR
}

// ❌ NO se puede usar dos puntos ':' en records
fun createUser : User {
  {
    name: "John",  // ERROR - debe ser '='
    email: "john@example.com"
  }
}

// ❌ NO se puede mutar un record directamente
fun updateUser (user : User) : Void {
  user.name = "New Name"  // ERROR - records son inmutables
}

// ❌ NO existe sintaxis de spread como en JS
fun updateUser (user : User) : User {
  { ...user, name = "New Name" }  // ERROR
}
// Correcto:
fun updateUser (user : User) : User {
  { user | name = "New Name" }  // ✅ Sintaxis correcta
}
```

### Functions: FUNCIONA ✅

```mint
// ✅ Tipo de retorno obligatorio
fun add (a : Number, b : Number) : Number {
  a + b
}

// ✅ Última expresión se retorna automáticamente
fun calculate : Number {
  x = 5
  y = 10
  x + y  // Se retorna 15
}

// ✅ Lambda con tipos explícitos
numbers.map((n : Number) : Number { n * 2 })

// ✅ Pipe operator
result = value
  |> transform
  |> process
```

### Functions: NO FUNCIONA ❌

```mint
// ❌ NO existe 'return' keyword
fun add (a : Number, b : Number) : Number {
  return a + b  // ERROR
}

// ❌ Tipo de retorno es obligatorio
fun add (a : Number, b : Number) {  // ERROR - falta tipo de retorno
  a + b
}

// ❌ Tipos de parámetros son obligatorios
fun add (a, b) : Number {  // ERROR - faltan tipos de parámetros
  a + b
}

// ❌ NO existe ternario
result = condition ? "yes" : "no"  // ERROR
// Correcto:
result = if (condition) { "yes" } else { "no" }  // ✅
```

---

## Casos Especiales y Limitaciones

### 1. Inmutabilidad

**TODAS** las estructuras de datos son inmutables:

```mint
// ❌ NO funciona
numbers = [1, 2, 3]
numbers[0] = 100  // ERROR

// ✅ Funciona - crear nuevo array
numbers = [1, 2, 3]
newNumbers = [100, 2, 3]
```

### 2. Variables en Mint

- NO existen `let` o `const` como en JavaScript
- Las variables regulares son inmutables por defecto
- Para mutabilidad, usa `state` en components/stores con `next`

```mint
// Variables regulares (inmutables)
x = 5
name = "John"

// State (mutable con next)
component Main {
  state count : Number = 0

  fun increment : Promise(Never, Void) {
    next { count = count + 1 }
  }
}
```

### 3. Control Expressions siempre retornan un valor

```mint
// Esto es válido - if es una expresión
result = if (x > 5) { "big" } else { "small" }

// Esto también es válido - case es una expresión
message = case (status) {
  Status::Loading => "Loading..."
  Status::Success => "Done!"
}
```

### 4. Imports son implícitos

- NO necesitas `import` statements
- Todos los módulos, componentes y funciones están disponibles globalmente
- Los nombres deben ser únicos en todo el proyecto

### 5. Promise Type Parameters

```mint
Promise(error, value)

// Promise que nunca falla
Promise(Never, Void)

// Promise con error específico
Promise(Http.ErrorResponse, String)

// Promise con cualquier error
Promise(String, Number)
```

### 6. Field Access con Tipo

En versiones modernas de Mint, el acceso a campos requiere el tipo:

```mint
record User {
  name : String
}

user = { name = "John" }

// Requiere tipo como parámetro
userName = .name(User)
```

---

## Recursos Oficiales

- **Documentación oficial:** https://mint-lang.com/guide/
- **Tutorial interactivo:** https://tutorial.mint-lang.com/
- **GitHub:** https://github.com/mint-lang/mint
- **Mint Realworld (ejemplo completo):** https://github.com/mint-lang/mint-realworld
- **API Reference:** https://mint-lang.com/api/

---

## Resumen de Sintaxis Clave

| Concepto | Sintaxis | Ejemplo |
|----------|----------|---------|
| Record Definition | `record Name { field : Type }` | `record User { name : String }` |
| Record Literal | `{ field = value }` | `{ name = "John" }` |
| Record Update | `{ record \| field = value }` | `{ user \| name = "Jane" }` |
| Function | `fun name (p : T) : R { }` | `fun add (a : Number) : Number { a + 1 }` |
| Lambda | `(p : T) : R { body }` | `(n : Number) : Number { n * 2 }` |
| Enum Variant | `Enum::Variant(args)` | `Status::Success(user)` |
| Pattern Match | `case (x) { Pattern => value }` | `case (status) { Status::Loading => "..." }` |
| If-Else | `if (cond) { a } else { b }` | `if (x > 5) { "yes" } else { "no" }` |
| Pipe | `value \|> function` | `data \|> parse \|> process` |
| Interpolation | `#{expression}` | `"Hello #{name}"` (en JS inline) |
| Try-Catch | `try { } catch Type => e { }` | `try { parse() } catch Error => e { }` |
| Sequence | `sequence { statements }` | `sequence { response = Http.get(...) }` |

---

**Fecha de creación:** 2025-09-30
**Basado en:** Documentación oficial de Mint Lang (mint-lang.com)
**Versión de Mint:** 0.19+ (incluye cambios recientes en field access)
