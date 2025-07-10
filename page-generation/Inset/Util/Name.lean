/-
  **FILE:** `Inset/Util/Name.lean`
  **PURPOSE:** Provide `Name : Type`
-/

/--
  A given name.

  `abbrev GivenName : Type := String`.
-/
abbrev GivenName : Type := String

/--
  A surname.

  `abbrev Surname : Type := String`.
-/
abbrev Surname : Type := String

/-- A name. -/
inductive Name : Type where
  /-- A "real name", given as a pair of (perhaps missing) given names and surnames. -/
  | real (given : Option GivenName) (sur : Option Surname) : Name
  /-- A "pseudonym", given as a single string. -/
  | pseudo : String → Name
