/*
* Working Example: Type Definitions in Mint
 *
 * This demonstrates the CORRECT way to define types (formerly called "records")
 * in modern Mint (v0.20.0+)
*/

/* User type definition */
type User {
  id : Number,
  name : String,
  email : String
}

/* Status enum type */
type UserStatus {
  Active
  Inactive
  Suspended
}

/* Nested types */
type Address {
  street : String,
  city : String,
  country : String
}

type UserProfile {
  user : User,
  address : Address,
  status : UserStatus
}

/* Generic type */
type Result(error, value) {
  Ok(value)
  Err(error)
}

/* Module using the types */
module UserUtils {
  fun formatUserInfo (user : User) : String {
    "#{user.name} (ID: #{Number.toString(user.id)})"
  }

  fun getEmailDomain (user : User) : String {
    String.split(user.email, "@")
    |> Array.at(1)
    |> Maybe.withDefault("")
  }
}
