/-
  **FILE:** `Inset/Util/Name.lean`
  **PURPOSE:** Provide `Name : Type`, `Name.toString : Name → String`, `Name.writeNames : List Name → String`, and a record of known names
-/

/- SECTION: `Name : Type` -/

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



/- SECTION: `Name.toString : Name → String` -/

/-- Write a name to a string. A `real` name is in the format "GivenName Surname"; a `pseudo`nym is quoted verbatim. -/
def Name.toString : Name → String
  | real none     none      => "Unnamed"
  | real none     (some s)  => s
  | real (some g) none      => g
  | real (some g) (some s)  => g ++ " " ++ s
  | pseudo p                => p



/- SECTION: `Name.writeNames : List Name → String` -/

/--
  Examples:
  * `[]                                   ↦ ""`
  * `["Sonic"]                            ↦ "Sonic"`
  * `["Sonic", "Tails"]                   ↦ "Sonic, and Tails"`
  * `["Sonic", "Tails", "Doctor Eggman"]  ↦ "Sonic, Tails, and Doctor Eggman"`
-/
private def flattenWithCommas (xs : List String) : String :=
  match h: xs with
  | [] => ""
  | [a] => a
  | (a::b::cs) =>
    (xs.dropLast.map (· ++ ", ") |>.foldr (· ++ ·) "")
    ++ "and "
    ++ (xs.getLast (by simp only [h, ne_eq, reduceCtorEq, not_false_eq_true]))

/--
  Flatten a list of names, separated appropriately with commas and the word "and".

  See also: `flattenWithCommas`.
-/
def Name.writeNames : List Name → String := flattenWithCommas ∘ (Name.toString <$> ·)



/- SECTION: Recorded names -/
-- NOTE: Add your name here if you author an article on Empty Limit.

namespace Name

  /-- `avg-lebesgue-enjoyer` on GitHub -/
  def gabe : Name := .real "Gabriel" "Field"

end Name
