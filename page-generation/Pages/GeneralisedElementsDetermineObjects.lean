/- **FILE:** `Pages/GeneralisedElementsDetermineObjects.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace GeneralisedElementsDetermineObjects
  def it : Page :=
    { title :=
        "Generalised Elements Determine Objects"
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
                    [ .ps "Fix a locally small category $|C$ and objects $x, y ∈ |C$. Then, $x ≃ y$ in $|C$ if and only if the functors $|C({-}, x), |C({-}, y) : |C^{|op} → |Set$ are naturally isomorphic."
                    , .ps "Dually, $x ≃ y$ in $|C$ if and only if $|C(x, {-}) ≃ |C(y, {-})$."
                    ]
                }
            , .body
                [ .p
                    [ .s "This result is often also referred to as the "
                    , .a "../discussion/yoneda-lemma.html" "Yoneda lemma"
                    , .s ", despite the Yoneda lemma being a more general statement."
                    ]
                ]
            ]
        , .mk
            "Proof"
            [ .body
                [ .p
                    [ .s "The Yoneda embedding is the functor $¥ : |C → |Cat(|C^{|op}, |Set)$ given by $
                            |left( c |xrightarrow{f} d |right)
                            |xmapsto{¥} |left(
                              |C({-}, c)
                              |xrightarrow{f ∘ {-}}
                              |C({-}, d)
                            |right)
                          $. "
                    , .a "./functors-preserve-isomorphisms.html" "Functors preserve isomorphisms"
                    , .s ", so if $c ≃ d$, then $¥| c ≃ ¥| d$. Furthermore, "
                    , .a "./yoneda-embedding-is-fully-faithful.html" "the Yoneda embedding is fully faithful"
                    , .s " and "
                    , .a "./fully-faithful-functors-reflect-isomorphisms.html" "fully faithful functors reflect isomorphisms"
                    , .s ", so $¥| c ≃ ¥| d$ implies $c ≃ d$."
                    ]
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "../discussion/generalised-elements.html" "Generalised Elements"
            , .mk "../discussion/yoneda-lemma.html" "Yoneda Lemma"
            , .mk "./functors-preserve-isomorphisms.html" "Functors Preserve Isomorphisms"
            , .mk "./fully-faithful-functors-reflect-isomorphisms.html" "Fully Faithful Functors Reflect Isomorphisms"
            ]
        }
    }
end GeneralisedElementsDetermineObjects
