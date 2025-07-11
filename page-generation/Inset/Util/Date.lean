/-
  **FILE:** `Inset/Util/Date.lean`
  **PURPOSE:** Provide `Date : Type` and `Date.toString : Date → String`
-/

namespace Date

  /-- A year. -/
  abbrev Year : Type := Nat

  /-- A month (January = 1, December = 12). These bounds are not checked -/
  abbrev Month : Type := Nat

  /-- A day. Bounds are not checked with respect to a month (e.g. 31st of April) or a year (e.g. 29th of February 2021). -/
  abbrev Day : Type := Nat

  /--
    Predicate checking that the components of a date are valid.
    No bounds are put on years.

    `by simp!` should be able to verify this obligation if concrete values are provided for months and days.
  -/
  private abbrev isValid (year : Year) : Option Month → Option Day → Prop
    | some month, none =>
      1 ≤ month ∧ month ≤ 12
    | some month, some day =>
      1 ≤ month ∧ month ≤ 12
      ∧ 1 ≤ day
      ∧ ( if month = 2 ∧ year % 4 = 0   -- February (leap year)
          then day ≤ 29
          else if month = 2             -- February (not leap year)
          then day ≤ 28
          else if month ∈ [4, 6, 9, 11] -- April, June, September, November
          then day ≤ 30
          else day ≤ 31                 -- Other months
        )
    | none, some _ => false             -- Can't have a day with no month
    | _, _ => true

end Date

/-- A legal date. -/
structure Date : Type where
  /-- The year. -/
  year : Date.Year
  /-- Optionally, the month. -/
  month : Option Date.Month := none
  /-- Optionally, the day. -/
  day : Option Date.Day := none
  /-- Promise that the date entered is valid. -/
  ok : Date.isValid year month day := by simp!

-- Some examples
example : Date := { year := 2000, month := some 1, day := some 3 }
example : Date := { year := 2000, month := some 2, day := some 29 }
example : Date := { year := 2001, month := some 3 }
example : Date := { year := 2001 }

/-- Convert the given `Day` to a two-digit string. -/
private def Date.Day.toString (day : Day) : String :=
  if day < 10 then s!"0{day}" else s!"{day}"

/-- Get the English name of the given `Month`, or `""` if invalid. -/
private def Date.Month.toString : Month → String
  | 1   => "January"
  | 2   => "February"
  | 3   => "March"
  | 4   => "April"
  | 5   => "May"
  | 6   => "June"
  | 7   => "July"
  | 8   => "August"
  | 9   => "September"
  | 10  => "October"
  | 11  => "November"
  | 12  => "December"
  | _   => ""

/-- Write a `Date` to a string, in the format `"dd EnglishMonthName, yyyy"`. -/
def Date.toString (date : Date) : String :=
  match h₁: date.day, h₂: date.month with
  | some day, some month  => s!"{day.toString} {month.toString}, {date.year}"
  | none,     some month  => s!"{month.toString}, {date.year}"
  | none,     none        => s!"{date.year}"
  | some _,   none        =>
    False.elim <| by
      have ok := date.ok
      unfold Date.isValid at ok
      simp only [h₂, h₁, Bool.false_eq_true] at ok
      done
