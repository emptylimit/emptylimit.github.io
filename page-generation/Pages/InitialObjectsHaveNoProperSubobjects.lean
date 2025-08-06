/- **FILE:** `Pages/InitialObjectsHaveNoProperSubobjects.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace InitialObjectsHaveNoProperSubobjects
  def it : Page :=
    { title :=
        "Initial Objects Have No Proper Subobjects"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.context ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind := .thm
                , body :=
                    [ .ps "Let $i$ be the initial object in a category $|C$, and let $ι : a ↣ i$ be a monomorphism into $i$. Then, $ι$ is an isomorphism in $|C$."
                    ]
                }
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "Observe the following."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMixbMCwwLCJhIl0sWzIsMCwiaSJdLFswLDEsIlxcaW90YSIsMCx7ImN1cnZlIjotMiwic3R5bGUiOnsidGFpbCI6eyJuYW1lIjoibW9ubyJ9fX1dLFsxLDAsIlxcZXhpc3RzIGYiLDAseyJjdXJ2ZSI6LTIsInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dXQ=="
                          , height := some 151
                          }
                      , text := some
                          [ .s "Since $i$ is initial, there is a map $f : i → a$. We will show that $f = ι^{-1}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMixbMCwwLCJhIl0sWzIsMCwiaSJdLFswLDEsIlxcaW90YSIsMCx7ImN1cnZlIjotMiwic3R5bGUiOnsidGFpbCI6eyJuYW1lIjoibW9ubyJ9fX1dLFsxLDAsImYiLDAseyJjdXJ2ZSI6LTJ9XSxbMSwxLCIxX2kiLDIseyJyYWRpdXMiOi0zLCJhbmdsZSI6LTkwfV1d"
                          , height := some 151
                          }
                      , text := some
                          [ .s "Since $i$ is initial, uniqueness of maps $i → i$ forces $ι ∘ f = 1_i$. It remains to show $f ∘ ι = 1_a$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJhIl0sWzIsMCwiaSJdLFswLDIsImEiXSxbMiwyLCJpIl0sWzAsMSwiXFxpb3RhIiwwLHsic3R5bGUiOnsidGFpbCI6eyJuYW1lIjoibW9ubyJ9fX1dLFsxLDIsImYiLDFdLFsyLDMsIlxcaW90YSIsMix7InN0eWxlIjp7InRhaWwiOnsibmFtZSI6Im1vbm8ifX19XSxbMCwyLCIxX2EiLDJdLFsxLDMsIjFfaSJdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "The outer square and bottom-right triangle commute. Chasing through, we see that $ι ∘ f ∘ ι = ι ∘ 1_a$. Since $ι$ is a monomorphism, this implies $f ∘ ι = 1_a$."
                          ]
                      }
                    ]
                , .ps "Therefore, $ι$ is an isomorphism with inverse $f$. $∎$"
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "../discussion/coinduction.html" "Coinduction"
            ]
        }
    }
end InitialObjectsHaveNoProperSubobjects
