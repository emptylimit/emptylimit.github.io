/-
  **FILE:** `Inset/Bibliography.lean`
  **PURPOSE:** Define and manage the site-wide bibliography
-/

/- IMPORTS: -/

import Inset.Util.Date
import Inset.Util.Name
import Inset.Util.Url



/- SECTION: Encode bibliography entries -/

/-- A bibliography entry. Information may be missing. -/
structure Bibliography.Entry : Type where
  /-- Date on which resources was accessed. -/
  accessDate : Option Date
  /-- List of authors (perhaps `[]`). -/
  authors : List Name
  /-- Title of item being referenced. -/
  title : Option String
  /-- URL to item being referenced. -/
  url : Option URL

/-- Lexicographic comparison on author lists, with identical lists broken by comparing titles (`none` titles come first). -/
def Bibliography.Entry.ble (b₁ b₂ : Bibliography.Entry) : Bool :=
    if b₁.authors.map Name.toString = b₂.authors.map Name.toString
    then  b₁.title.toList ≤ b₂.title.toList
    else  b₁.authors.map Name.toString
          ≤ b₂.authors.map Name.toString

/-- A bibliography (encoded as a `List Bibliography.Entry`). -/
abbrev Bibliography : Type := List Bibliography.Entry



/- SECTION: Known bibliography entries -/

namespace Bib

  /--
    *Category Theory in Context* by Emily Riehl.

    No access date; override by instead using `{ context with accessDate := some YOURDATEHERE }`.
  -/
  def context : Bibliography.Entry :=
    { accessDate  := none
    , authors     := [.real "Emily" "Riehl"]
    , title       := "Category Theory in Context"
    , url         := "https://emilyriehl.github.io/files/context.pdf"
    }

  /--
    *Basic Category Theory* by Tom Leinster.

    No access date; override by instead using `{ context with accessDate := some YOURDATEHERE }`.
  -/
  def adjointsBeforeLimits : Bibliography.Entry :=
    { accessDate  := none
    , authors     := [.real "Tom" "Leinster"]
    , title       := "Basic Category Theory"
    , url         := "https://arxiv.org/abs/1612.09375"
    }

end Bib
