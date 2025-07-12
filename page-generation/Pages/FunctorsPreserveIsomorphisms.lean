/- **FILE:** `Pages/FunctorsPreserveIsomorphisms.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace FunctorsPreserveIsomorphisms
  def it : Page :=
    { title :=
        "Functors Preserve Isomorphisms"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.context
        ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind :=
                    .thm
                , body :=
                    [ .ps "Let $F : |C → |D$ be a functor and let $i : x ≃ y$ be an isomorphism in $|C$. Then, $F| i : F| x ≃ F| y$ is an isomorphism in $|D$."
                    ]
                }
            ]
        , .mk
            "Direct proof"
            [ .body
                [ .ps "One has $F| i ∘ F(i^{-1}) = F(i ∘ i^{-1}) = F(1_y) = 1_{F| y}$ and similarly $F(i^{-1}) ∘ F| i = 1_{F| x}$; hence, $F| i$ is an isomorphism with inverse $F(i)^{-1} = F(i^{-1})$."
                ]
            ]
        , .mk
            "Alternative proof"
            [ .body
                [ .ps "The following two diagrams commute in $|C$:"
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCJjIl0sWzIsMCwiZCJdLFsyLDIsImMiXSxbNCwwLCJkIl0sWzQsMiwiYyJdLFs2LDIsImQiXSxbMCwxLCJpIl0sWzEsMiwiaV57LTF9Il0sWzAsMiwiMV9jIiwyXSxbMyw0LCJpXnstMX0iLDJdLFs0LDUsImkiLDJdLFszLDUsIjFfZCJdXQ=="
                    , height := some 250
                    }
                , .p
                    [ .s "Since "
                    , .a "./functors-preserve-commutative-diagrams.html" "functors preserve commutative diagrams"
                    , .s ", the following diagrams commute in $|D$:"
                    ]
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCJGXFwgYyJdLFsyLDAsIkZcXCBkIl0sWzIsMiwiRlxcIGMiXSxbNCwwLCJGXFwgZCJdLFs0LDIsIkZcXCBjIl0sWzYsMiwiRlxcIGQiXSxbMCwxLCJGXFwgaSJdLFsxLDIsIkZcXCBpXnstMX0iXSxbMCwyLCIxX3tGXFwgY30iLDJdLFszLDQsIkZcXCBpXnstMX0iLDJdLFs0LDUsIkZcXCBpIiwyXSxbMyw1LCIxX3tGXFwgZH0iXV0="
                    , height := some 250
                    }
                , .ps "so $F| i$ is an isomorphism with inverse $F| i^{-1}$."
                , .ps "<em>Note:</em> This style of proof generalises to other contexts. For example, 2-functors preserve equivalences (the 2-categorical analogue of an isomorphism) because they preserve the 2-categorical analogues of commutative diagrams."
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "./functors-preserve-commutative-diagrams.html" "Functors Preserve Commutative Diagrams"
            ]
        }
    }
end FunctorsPreserveIsomorphisms
