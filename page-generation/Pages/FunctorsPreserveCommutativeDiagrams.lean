/- **FILE:** `Pages/FunctorsPreserveCommutativeDiagrams.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace FunctorsPreserveCommutativeDiagrams
  def it : Page :=
    { title :=
        "Functors Preserve Commutative Diagrams"
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
                    [ .ps "Let $F : |C → |D$ be a functor and let $D$ be a commutative diagram drawn in $|C$. Then, the diagram $F D$ obtained by replacing:"
                    , .ul
                        [ .s "objects $x$ in $D$ with their images $F x$;"
                        ,  [ .s "arrows $f$ in $D$ with their images $F f$"
                            , .sn [.s "In particular, identity arrows $1_x$ get replaced with $F| 1_x = 1_{F x}$."]
                            , .s ";"
                            ]
                        ]
                    , .ps "commutes in $|D$."
                    ]
                }
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "Consider two paths between two vertices $a, b$ in the diagram $D$:"
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsOCxbMCwxLCJhIl0sWzEsMCwieF8wIl0sWzIsMCwiXFxjZG90cyJdLFszLDAsInhfayJdLFsxLDIsInlfMCJdLFsyLDIsIlxcY2RvdHMiXSxbMywyLCJ5X24iXSxbNCwxLCJiIl0sWzAsMSwiZl8wIl0sWzEsMiwiZl8xIl0sWzIsMywiZl9rIl0sWzAsNCwiZ18wIiwyXSxbNCw1LCJnXzEiLDJdLFs1LDYsImdfbiIsMl0sWzMsNywiZl97ayArIDF9Il0sWzYsNywiZ197biArIDF9IiwyXV0="
                    , height := some 302
                    }
                , .ps "Commutativity of $D$ gives the relationship $f_{k + 1} ∘ ⋯ ∘ f_0 = g_{n + 1} ∘ ⋯ ∘ g_0$. In $F D$, we have the corresponding two paths"
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsOCxbMCwxLCJGYSJdLFsxLDAsIkYgeF8wIl0sWzIsMCwiXFxjZG90cyJdLFszLDAsIkYgeF9rIl0sWzEsMiwiRiB5XzAiXSxbMiwyLCJcXGNkb3RzIl0sWzMsMiwiRiB5X24iXSxbNCwxLCJGIGIiXSxbMCwxLCJGIGZfMCJdLFsxLDIsIkYgZl8xIl0sWzIsMywiRiBmX2siXSxbMCw0LCJGIGdfMCIsMl0sWzQsNSwiRiBnXzEiLDJdLFs1LDYsIkYgZ19uIiwyXSxbMyw3LCJGIGZfe2sgKyAxfSJdLFs2LDcsIkYgZ197biArIDF9IiwyXV0="
                    , height := some 302
                    }
                , .p
                    [ .s "and commutativity of $F D$ requires that $F f_{k + 1} ∘ ⋯ F f_0 = F g_{n + 1} ∘ ⋯ ∘ F g_0$. By functorality,"
                    , .al
                        [ "F f_{k + 1} ∘ ⋯ ∘ F f_0"
                        , "= F|left( f_{k + 1} ∘ ⋯ ∘ f_0 |right)"
                        , "= F|left( g_{n + 1} ∘ ⋯ ∘ g_0 |right)"
                        , "= F g_{n + 1} ∘ ⋯ ∘ F g_0"
                        ]
                    , .s "so the corresponding paths in $F D$ commute with one another."
                    ]
                , .ps "This argument applies for any pair of paths in $D$. Since the pairs of paths in $F D$ correspond exactly to the pairs of paths in $D$, we conclude that $F D$ commutes."
                ]
            ]
        , .mk
            "Example uses"
            [ .body
                [ .p
                    [ .s "In diagram chases, one can recognise images (under functors) of smaller commutative diagrams, which by this result must commute. Sometimes, this is even the entire diagram chase; for instance, the fact that "
                    , .a "./functors-preserve-isomorphisms.html" "functors preserve isomorphisms"
                    , .s " can be established using this method."
                    ]
                , .p
                    [ .s "Generalisations arise in higher category theory. For example, "
                    , .a "../discussion/adjunctions.html" "adjunctions"
                    , .s " can be characterised by commutative diagrams of functors and natural transformations (the triangle identities); 2-functors between 2-categories preserves these, so images under 2-functors of adjunctions are also adjunctions."
                    ]
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "./functors-preserve-isomorphisms.html" "Functors Preserve Isomorphisms"
            ]
        }
    }
end FunctorsPreserveCommutativeDiagrams
