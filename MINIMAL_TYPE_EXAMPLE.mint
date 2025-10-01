/*
* MINIMAL WORKING EXAMPLE
 * Mint 0.28.0-devel type definitions
 *
 * THE SOLUTION: Use 'type' keyword instead of 'record'
*/
type User {
  id : Number,
  name : String
}

type Status {
  Active
  Inactive
}

module Example {
  fun getName (user : User) : String {
    user.name
  }
}
