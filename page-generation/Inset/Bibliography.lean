/-
  **FILE:** `Inset/Bibliography.lean`
  **PURPOSE:** Encode bibliography entries with types, and provide a standard list of referencess
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

/-- A bibliography (encoded as a `List Bibliography.Entry`). -/
abbrev Bibliography : Type := List Bibliography.Entry



/- SECTION: Known bibliography entries -/

namespace Bib

  /-- *Category Theory in Context* by Emily Riehl. No access date; override by instead using `{ context with accessDate := some YOURDATEHERE }`. -/
  def context : Bibliography.Entry :=
    { accessDate  := none
    , authors     := [.real "Emily" "Riehl"]
    , title       := "Category Theory in Context"
    , url         := "https://emilyriehl.github.io/files/context.pdf"
    }

end Bib
