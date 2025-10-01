# Mint Lang Type Definitions - Complete Guide

## The Problem You Were Experiencing

You were getting **"EXPECTED_EOF"** errors when trying to use the `record` keyword to define data structures in Mint.

## The Solution

**Use the `type` keyword instead of `record`.**

Starting from Mint version **0.20.0**, the `record` and `enum` keywords were **REPLACED** by a unified `type` keyword.

---

## Correct Syntax (Mint 0.28.0-devel)

### ✅ CORRECT: Using `type` keyword

```mint
type User {
  id : Number,
  name : String,
  email : String
}
```

### ❌ INCORRECT: Using `record` keyword (old syntax)

```mint
record User {  // ERROR: EXPECTED_EOF
  id : Number,
  name : String,
  email : String
}
```

---

## Where Can Types Be Defined?

### ✅ Top-level in a `.mint` file (RECOMMENDED)

```mint
type User {
  id : Number,
  name : String
}

type Address {
  street : String,
  city : String
}

module UserHelpers {
  fun getName (user : User) : String {
    user.name
  }
}
```

### ❌ Inside a module (NOT SUPPORTED)

```mint
module MyModule {
  type User {  // ERROR: Not allowed
    name : String
  }
}
```

### ❌ Inside a component (NOT SUPPORTED)

```mint
component MyComponent {
  type User {  // ERROR: Not allowed
    name : String
  }
}
```

### ❌ Before a component in the same file (CAUSES ISSUES)

While this technically works, it can cause "EXPECTED_EOF" errors depending on file structure.

---

## Type Definition Examples

### 1. Simple Record-Style Type

```mint
type User {
  id : Number,
  name : String,
  email : String
}
```

### 2. Enum-Style Type (Variants)

```mint
type Status {
  Active
  Inactive
  Pending
}
```

### 3. Generic Type

```mint
type Result(error, value) {
  Ok(value)
  Err(error)
}

type Maybe(a) {
  Just(a)
  Nothing
}
```

### 4. Nested Types

```mint
type Address {
  street : String,
  city : String,
  zipCode : String
}

type Profile {
  user : User,
  address : Address
}
```

---

## Using Types

### In Module Functions

```mint
module UserHelpers {
  /* Access fields with dot notation */
  fun getName (user : User) : String {
    user.name
  }

  /* Return type annotation */
  fun isValidEmail (user : User) : Bool {
    String.contains(user.email, "@")
  }
}
```

### In Components

```mint
component UserCard {
  /* Property with custom type */
  property userId : Number = 0

  /* LIMITATION: Cannot initialize state with multi-line record literals */
  /* This causes errors - use inline instead */

  fun render : Html {
    <div>"User ID: #{Number.toString(userId)}"</div>
  }
}
```

---

## Key Limitations Discovered

### 1. No Default Values in Type Definitions

❌ **INCORRECT:**
```mint
type Settings {
  theme : String = "dark",  // ERROR: Not allowed
  language : String = "en"
}
```

✅ **CORRECT:**
```mint
type Settings {
  theme : String,
  language : String
}

/* Provide defaults when creating instances */
let defaultSettings = { theme = "dark", language = "en" }
```

### 2. Cannot Return Record Literals from Functions Directly

❌ **INCORRECT:**
```mint
fun createUser : User {
  {  // ERROR: FUNCTION_EXPECTED_EXPRESSION
    id = 1,
    name = "Test",
    email = "test@example.com"
  }
}
```

**WORKAROUND:** This appears to be a limitation in the current version.

### 3. Cannot Use Multi-line Record Literals as Default Values

❌ **INCORRECT:**
```mint
state user : User = {
  id = 0,
  name = "",
  email = ""
}
```

**WORKAROUND:** Use inline syntax (though this may still have limitations)

---

## Important Changes from Mint 0.20.0

According to the release notes for version 0.20.0:

1. **`record` and `enum` keywords were replaced by `type`**
2. **Record constructors were removed** - No more `User(name, age)` syntax
3. **Field access syntax changed** - Now requires type parameter: `.name(User)`
4. **Operators `&&` and `||` now only work with booleans**

---

## Sharing Types Across Modules

**Good news:** Mint uses **implicit imports**!

- All top-level types are automatically available throughout your application
- You **don't need to import** types
- Type names must be **unique** across your entire project

```mint
/* In Types.mint */
type User {
  id : Number,
  name : String
}

/* In UserModule.mint - no import needed! */
module UserHelpers {
  fun getName (user : User) : String {  // User type is automatically available
    user.name
  }
}
```

---

## Recommended File Structure

### Option 1: Separate Types File

```
source/
  Types.mint           <- All type definitions
  UserModule.mint      <- Uses types
  UserComponent.mint   <- Uses types
```

**Types.mint:**
```mint
type User {
  id : Number,
  name : String,
  email : String
}

type Address {
  street : String,
  city : String
}

type Profile {
  user : User,
  address : Address
}
```

### Option 2: Types at Top of Files

```mint
/* UserComponent.mint */

type User {
  id : Number,
  name : String
}

component UserCard {
  /* component code */
}
```

---

## Testing Your Type Definitions

To verify your type definitions work:

```bash
# Format check (will fail if syntax is wrong)
mint format YourFile.mint

# Lint check
mint lint YourFile.mint

# Build check
mint build
```

---

## Summary

| What You Want | Solution |
|--------------|----------|
| Define a record | Use `type` keyword at top level |
| Define an enum | Use `type` keyword with variants |
| Share across files | Define at top level (auto-imported) |
| Default values | NOT in type definition, provide when creating instances |
| Nested types | ✅ Fully supported |
| Generic types | ✅ Fully supported with type parameters |

---

## Additional Resources

- **Mint Version:** 0.28.0-devel
- **Breaking Change:** Version 0.20.0 (record/enum → type)
- **Official Docs:** https://mint-lang.com/guide/reference/records
- **GitHub:** https://github.com/mint-lang/mint

---

## Working Example

See `MINIMAL_TYPE_EXAMPLE.mint` in this directory for a verified working example.
