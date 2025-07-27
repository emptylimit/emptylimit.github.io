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

  /- Various pages from the nLab. -/
  namespace NLab

    /-- nLab article on inductive types. -/
    def inductiveType : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                          [ .pseudo "p"
                          , .real "David" "Corfield"
                          , .pseudo "anqurvanillapy"
                          , .real "Dexter" "Chua"
                          , .real "Colin" "Zwanziger"
                          , .real "Tim" "Porter"
                          , .real "Toby" "Bartels"
                          , .pseudo "dsk"
                          , .real "Mike" "Shulman"
                          , .real "Todd" "Trimble"
                          , .real "Urs" "Schreiber"
                          ]
                        ]
      , title       :=  "inductive type"
      , url         :=  "https://ncatlab.org/nlab/show/inductive+type"
      }

    /-- nLab article on bisimulation. -/
    def bisimulation : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .real "Urs" "Schreiber"
                            , .real "Victor" "Sannier"
                            , .real "Stephan Alexander" "Spahn"
                            , .real "David" "Corfield"
                            , .real "Toby" "Bartels"
                            , .real "Zoran" "Škoda"
                            ]
                        ]
      , title       :=  "bisimulation"
      , url         :=  "https://ncatlab.org/nlab/show/bisimulation"
      }

    /-- nLab article on coinduction. -/
    def coinduction : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .real "Victor" "Sannier"
                            , .pseudo "dusko"
                            , .real "Todd" "Trimble"
                            , .real "Tim" "Porter"
                            , .real "Andrew" "Stacey"
                            , .real "David" "Roberts"
                            , .real "Urs" "Schreiber"
                            , .real "Zoran" "Škoda"
                            , .real "Toby" "Bartels"
                            , .real "David" "Corfield"
                            ]
                        ]
      , title       :=  "coinduction"
      , url         :=  "https://ncatlab.org/nlab/show/coinduction"
      }

    /-- nLab article on corecursion. -/
    def corecursion : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .real "Urs" "Schreiber"
                            , .real "Toby" "Bartels"
                            , .real "David" "Corfield"
                            ]
                        ]
      , title       :=  "coinduction"
      , url         :=  "https://ncatlab.org/nlab/show/corecursion"
      }

    /-- nLab article on polynomial functors. -/
    def polynomialFunctor : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .pseudo "Tomas"
                            , .real "Mike" "Shulman"
                            , .real "Evan" "Cavallo"
                            , .pseudo "p"
                            , .real "David" "Corfield"
                            , .pseudo "valeria.depaiva"
                            , .real "Zoran" "Škoda"
                            , .real "Bryce" "Clarke"
                            , .pseudo "varkor"
                            , .real "David" "Roberts"
                            , .real "Urs" "Schreiber"
                            , .real "Rongmin" "Lu"
                            , .pseudo "NikolajK"
                            , .real "Bartosz" "Milewski"
                            , .real "Noam" "Zeilberger"
                            , .real "Sucharit" "Sarkar"
                            , .real "Stephan Alexander" "Spahn"
                            , .real "Toby" "Bartels"
                            ]
                        ]
      , title       := "polynomial functor"
      , url         := "https://ncatlab.org/nlab/show/polynomial+functor"
      }

    /-- nLab article on Adámek's fixed point theorem. -/
    def adamekFixedPointTheorem : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .real "Max S." "New"
                            , .real "Urs" "Schreiber"
                            ]
                        ]
      , title       := "Adámek's fixed point theorem"
      , url         := "https://ncatlab.org/nlab/show/Ad%C3%A1mek%27s+fixed+point+theorem"
      }

    /-- nLab article on terminal coalgebras. Contains the proof of Adámek's fixed point theorem, for some reason. -/
    def terminalCoalgebra : Bibliography.Entry :=
      { accessDate  :=  some { year := 2025, month := some 7 }
      , authors     :=  [ .nLab
                            [ .real "Urs" "Schreiber"
                            , .real "Bruno" "Gavranović"
                            , .pseudo "Fabian"
                            , .pseudo "varkor"
                            , .real "Todd" "Trimble"
                            , .real "Toby" "Bartels"
                            , .real "David" "Corfield"
                            , .real "Mike" "Schulman"
                            ]
                        ]
      , title       := "terminal coalgebra for an endofunctor"
      , url         := "https://ncatlab.org/nlab/show/terminal+coalgebra+for+an+endofunctor"
      }

  end NLab

end Bib
