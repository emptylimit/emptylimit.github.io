/- **FILE:** `Pages/AlgebrasFormCategory.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace AlgebrasFormCategory
  def it : Page :=
    { title :=
        "Algebras Form a Category"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.NLab.terminalCoalgebra ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind := .thm
                , body :=
                    [ .ps "The algebras for an endofunctor $T : |C → |C$ form a category, equipped with identity arrows $1_{T| a |→{α} a} := 1_a$ and with composition of morphisms given by composition in $|C$."
                    ]
                }
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "It is easy to see that identity arrows in $|C$ are algebra morphisms. We next show that composites of algebra morphisms are again algebra morphisms."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCJUXFwgYSJdLFsyLDAsImEiXSxbMiwxLCJiIl0sWzIsMiwiYyJdLFswLDEsIlRcXCBiIl0sWzAsMiwiVFxcIGMiXSxbMCwxLCJcXGFscGhhIl0sWzEsMiwiZiJdLFsyLDMsImciXSxbMCw0LCJUXFwgZiIsMl0sWzQsNSwiVFxcIGciLDJdLFs1LDMsIlxcZ2FtbWEiLDJdLFs0LDIsIlxcYmV0YSIsMV1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Take algebras and algebra morphisms as displayed."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCJUXFwgYSJdLFsyLDAsImEiXSxbMiwyLCJjIl0sWzAsMiwiVFxcIGMiXSxbMCwxLCJUXFwgYiJdLFsyLDEsImIiXSxbMCwxLCJcXGFscGhhIl0sWzMsMiwiXFxnYW1tYSIsMl0sWzAsNCwiVFxcIGYiLDJdLFs0LDMsIlRcXCBnIiwyXSxbMSw1LCJmIl0sWzUsMiwiZyJdLFs0LDUsIlxcYmV0YSIsMV0sWzEsMiwiZyBcXGNpcmMgZiIsMCx7ImN1cnZlIjotNH1dLFswLDMsIlRcXCBnIFxcY2lyYyBUXFwgZiIsMix7ImN1cnZlIjo0fV1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Because the inner two squares commute, the whole diagram commutes."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgYSJdLFsyLDAsImEiXSxbMiwyLCJjIl0sWzAsMiwiVFxcIGMiXSxbMCwxLCJcXGFscGhhIl0sWzMsMiwiXFxnYW1tYSIsMl0sWzEsMiwiZyBcXGNpcmMgZiJdLFswLDMsIlRcXCBnIFxcY2lyYyBUXFwgZiIsMl1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Thus, $g ∘ f$ is an algebra morphism."
                          ]
                      }
                    ]
                , .ps "Because composition is associative and unital in $|C$, composition of algebra morphisms is associative and unital also. We thus have a category. $∎$"
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
end AlgebrasFormCategory
