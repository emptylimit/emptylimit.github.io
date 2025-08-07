/- **FILE:** `Pages/CoinductionInSet.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace CoinductionInSet
  def it : Page :=
    { title :=
        "Coinduction in the Category of Sets"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.NLab.terminalCoalgebra
        ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind := .thm
                , title := "Coinduction in $|Set$"
                , body :=
                    [ .ps "Let $J |→{|des} T| J$ be the terminal coalgebra for an endofunctor $T : |Set → |Set$. Let $∼$ be an equivalence relation on $J$ and denote by $[-] : J → J / {∼}$ the projection onto its quotient. Suppose that for all $x, y ∈ J$ with $x ∼ y$, we have $(T [-] ∘ |des) (x) = (T [-] ∘ |des) (y)$. Then, $∼$ is the equality relation on $J$; i.e. for all $x, y ∈ J$, $x ∼ y ⟹ x = y$."
                    ]
                }
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "The universal property of $J / {∼}$ gives a map $f : J / {∼} → J$ such that the following diagram commutes."
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJKIl0sWzAsMiwiSi97XFxzaW19Il0sWzIsMCwiVFxcIEoiXSxbMiwyLCJUXFwgKEogLyB7XFxzaW19KSJdLFswLDEsIlstXSIsMl0sWzAsMiwiXFxtYXRocm17ZGVzfSJdLFsyLDMsIlRcXCBbLV0iXSxbMSwzLCJmIiwyLHsic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiZGFzaGVkIn19fV1d"
                    , height := some 302
                    }
                , .p
                    [ .s "Thus, $[-]$ is a coalgebra morphism. Since $[-]$ is surjective and composition of coalgebra morphisms is done by taking composites in $|Set$, we see that $[-]$ is an epimorphism in the category of coalgebras for $T$. However, "
                    , .a "./initial-objects-have-no-proper-subobjects.html" "terminal objects have no proper quotient objects"
                    , .s ", so $[-]$ must be bijective; this is only possible if $∼$ is the identity relation. $∎$"
                    ]
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
    , preamble :=
        «authoring defs».translations
        ++  #[  («authoring defs».esc "des", "\\texttt{des}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end CoinductionInSet
