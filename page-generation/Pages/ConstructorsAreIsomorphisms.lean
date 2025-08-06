/- **FILE:** `Pages/ConstructorsAreIsomorphisms.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace ConstructorsAreIsomorphisms
  def it : Page :=
    { title :=
        "Constructors are Isomorphisms"
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
                    [ .ps "Let $T| i |→{|cons} i$ be the initial algebra for an endofunctor $T : |C → |C$. Then, $|cons : T| i ≃ i$ is an isomorphism in $|C$."
                    ]
                }
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "Observe the following."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgaSJdLFsyLDAsImkiXSxbMiwxLCJUXFwgaSJdLFswLDEsIlReMlxcIGkiXSxbMCwxLCJcXG1hdGhybXtjb25zfSJdLFszLDIsIlRcXCBcXG1hdGhybXtjb25zfSIsMV0sWzEsMiwiXFxleGlzdHMgISBkIiwwLHsic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiZGFzaGVkIn19fV0sWzAsMywiVFxcIGQiLDIseyJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJkYXNoZWQifX19XV0="
                          , height := some 302
                          }
                      , text := some
                          [ .s "$T| |cons$ is an algebra homomorphism and $|cons$ is an initial algebra, so there exists a unique algebra morphism $d$ as displayed above. We will show that $d = |cons^{-1}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCJUXFwgaSJdLFsyLDAsImkiXSxbMiwxLCJUXFwgaSJdLFswLDEsIlReMlxcIGkiXSxbMiwyLCJpIl0sWzAsMiwiVFxcIGkiXSxbMCwxLCJcXG1hdGhybXtjb25zfSJdLFszLDIsIlRcXCBcXG1hdGhybXtjb25zfSIsMV0sWzEsMiwiZCJdLFswLDMsIlRcXCBkIiwyXSxbMiw0LCJcXG1hdGhybXtjb25zfSJdLFszLDUsIlRcXCBcXG1hdGhybXtjb25zfSIsMl0sWzUsNCwiXFxtYXRocm17Y29uc30iLDJdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "$|cons$ itself is an algebra homomorphism from $T^2| i |→{T| |cons} T| i$ to $T| i |→{|cons} i$, so the bottom square commutes. The whole diagram thus commutes, showing that $|cons ∘ d$ is an algebra morphism."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgaSJdLFsyLDAsImkiXSxbMiwyLCJpIl0sWzAsMiwiVFxcIGkiXSxbMCwxLCJcXG1hdGhybXtjb25zfSJdLFszLDIsIlxcbWF0aHJte2NvbnN9IiwyXSxbMSwyLCJcXG1hdGhybXtjb25zfSBcXGNpcmMgZCIsMCx7ImN1cnZlIjotMn1dLFswLDMsIlRcXGxlZnQoIFxcbWF0aHJte2NvbnN9IFxcY2lyYyBkIFxccmlnaHQpIiwyLHsiY3VydmUiOjJ9XSxbMSwyLCIxX2kiLDJdLFswLDMsIlRcXCAxX2kiLDFdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Since $T| i |→{|cons} i$ is initial and $1_i$ is also an algebra morphism to $T| i |→{|cons} i$, we have $1_i = |cons ∘ d$. It remains to show that $d ∘ |cons = 1_{T| i}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgaSJdLFsyLDAsImkiXSxbMiwyLCJUXFwgaSJdLFswLDIsIlReMlxcIGkiXSxbMCwxLCJcXG1hdGhybXtjb25zfSJdLFszLDIsIlRcXCBcXG1hdGhybXtjb25zfSIsMl0sWzEsMiwiZCJdLFswLDMsIlRcXCBkIiwyXSxbMCwyLCJUXFwgXFxtYXRocm17Y29uc30gXFxjaXJjIFRcXCBkIFxcXFw9IFRcXCAxX2kgPSAxX3tUXFwgaX0iLDFdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "The outer square commutes since $d$ is an algebra morphism, so the map along the diagonal is uniquely determined. Taking the left-bottom composite and knowing already that $|cons ∘ d = 1_i$, we see that the diagonal map is $1_{T| i}$. Comparing with the other composite, we get our desired equation $d ∘ |cons = 1_{T| i}$."
                          ]
                      }
                    ]
                , .ps "Therefore, $|cons$ is an isomorphism in $|C$. $∎$"
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
        ++  #[  («authoring defs».esc "cons", "\\texttt{cons}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end ConstructorsAreIsomorphisms
