/- **FILE:** `Pages/AdamekFixedPointTheorem.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace AdamekFixedPointTheorem
  def it : Page :=
    { title :=
        "Adámek's Fixed Point Theorem"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.NLab.adamekFixedPointTheorem
        , Bib.NLab.terminalCoalgebra
        ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind := .thm
                , title := "Adámek's fixed point theorem"
                , body :=
                    [ .p
                        [ .s "Let $T : |C → |C$ be an endofunctor. Suppose that $|C$ contains an initial object $0$ and the colimit of the sequence"
                        , .al
                            [ "0"
                            , "|→{!} T| 0"
                            , "|→{T !} T^2| 0"
                            , "|→{T^2 !} T^3| 0"
                            , "|→{T^3 !} ⋯"
                            ]
                        , .s "and suppose furthermore that $T$ preserves this colimit. Then, the composite isomorphism $T(|colim_{i ∈ ω} T^i 0) ≃ |colim_{i ∈ ω} T^{i + 1} 0 ≃ |colim_{i ∈ ω} T^i 0$"
                        , .sn -- NOTE: This sidenote is too long to appear in the main `proof/coinduction.html` article
                          [ .s "The first isomorphism is because $T$ preserves the colimit. The second isomorphism is obtained by re-indexing the term in the colimit; adding $0 → T| 0$ to the diagram does not impose extra requirements on the colimit cocone."
                          ]
                        , .s " gives $|colim_{i ∈ ω} T^i 0$ an algebra structure for $T$. Furthermore, $T(|colim_{i ∈ ω} T^i 0) ≃ |colim_{i ∈ ω} T^i 0$ is an initial algebra."
                        ]
                    , .ps "Here, we write $|colim_{i ∈ ω} T^i 0$ for the colimit of the above sequence. The sequence obtained by applying $T$ to every object and arrow displayed above has its colimit denoted by $|colim_{i ∈ ω} T^{i + 1} 0$ (and we show in our proof that this colimit exists)."
                    , .p
                        [ .s "The statement of this result was adapted from "
                        , .a "https://ncatlab.org/nlab/show/Ad%C3%A1mek%27s+fixed+point+theorem" "this nLab article"
                        , .s "."
                        ]
                    ]
                }
            , .body
                [ .ps "The dual result can also be used to construct terminal coalgebras, and provides useful intuition for them."
                ]
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "We first argue that $|colim_{i ∈ ω} T^{i + 1} 0$ exists."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgMCJdLFsyLDAsIlReMiAwIl0sWzQsMCwiVF4zIDAiXSxbNiwwLCJcXGNkb3RzIl0sWzAsMSwiVFxcICEiXSxbMSwyLCJUXjJcXCAhIl0sWzIsMywiVF4zXFwgISJdXQ=="
                          , height := some 151
                          }
                      , text := some
                          [ .s "We wish to find the colimit of this diagram. Equivalently, we wish to characterise the cocones under it."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMiwwLCJUXFwgMCJdLFs0LDAsIlReMiAwIl0sWzYsMCwiVF4zIDAiXSxbOCwwLCJcXGNkb3RzIl0sWzIsMiwiYSJdLFswLDAsIjAiLFszMDAsNjAsNjAsMV1dLFswLDEsIlRcXCAhIl0sWzEsMiwiVF4yXFwgISJdLFsyLDMsIlReM1xcICEiXSxbMCw0LCJcXGFscGhhXzEiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbMSw0LCJcXGFscGhhXzIiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbMiw0LCJcXGFscGhhXzMiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbNSwwLCIhIiwwLHsiY29sb3VyIjpbMzAwLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoiZGFzaGVkIn19fSxbMzAwLDYwLDYwLDFdXSxbNSw0LCJcXGFscGhhXzAiLDEseyJjb2xvdXIiOlszMDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJkYXNoZWQifX19LFszMDAsNjAsNjAsMV1dXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Any cocone (drawn in solid blue) under the diagram can be uniquely extended by adding the unique arrow $α_0 : 0 → a$ (drawn in dashed magenta). Conversely, any cocone $α$ under the extended diagram $0 → T| 0 → ⋯$ restricts to a cocone under $T| 0 → ⋯$ by ignoring $α_0$. That is, the cocones under the extended diagram are the same as the cocones under the diagram of interest."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNyxbMiwwLCJUXFwgMCJdLFs0LDAsIlReMiAwIl0sWzYsMCwiVF4zIDAiXSxbOCwwLCJcXGNkb3RzIl0sWzIsMiwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX0gVF57aSArIDF9IDAiXSxbMCwwLCIwIl0sWzAsMiwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX0gVF5pIDAiXSxbMCwxLCJUXFwgISJdLFsxLDIsIlReMlxcICEiXSxbMiwzLCJUXjNcXCAhIl0sWzUsMCwiISJdLFs1LDZdLFs2LDQsIlxcc2ltZXEiLDFdLFswLDRdLFsxLDRdLFsyLDRdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Since the cocones under $0 → T| 0 → ⋯$ and under $T| 0 → ⋯$ are the same and the colimit $|colim_{i ∈ ω} T^i|, 0$ exists, the colimit $|colim_{i ∈ ω} T^{i + 1}|, 0$ must exist and be are isomorphic to $|colim_{i ∈ ω} T^i|, 0$ (via an isomorphism commuting with the colimit cocones). Alternatively, one could <em>define</em> $|colim_{i ∈ ω} T^{i + 1}|, 0 := |colim_{i ∈ ω} T^i|, 0$."
                          ]
                      }
                    ]
                , .ps "For simplicity, we take the approach of putting $|colim_{i ∈ ω} T^{i + 1}|, 0 := |colim_{i ∈ ω} T^i|, 0$. We next construct an algebra structure on $|colim_{i ∈ ω} T^i|, 0$."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMyxbMCwyLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFRee2kgKyAxfVxcIDAiXSxbMiwyLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcIDAgXFxyaWdodCkiXSxbMSwwLCJUXntpICsgMX1cXCAwIl0sWzAsMSwiZiIsMix7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dLFsyLDAsIlxcaW90YV97aSArIDF9IiwyXSxbMiwxLCJUXFwgXFxpb3RhX2kiXV0="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Denote by $ι$ the colimit cocone under $0 → T| 0 → ⋯$. Then, $T ι$ is a cocone under $T| 0 → T^2| 0 → ⋯$. Hence, there is a unique map $f$ as displayed above such that for all $i ∈ ℤ_{≥ 0}$, the above diagram commutes."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwyLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcIDAgXFxyaWdodCkiXSxbMiwyLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFRee2kgKyAxfVxcIDAiXSxbMywyLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcIDAiXSxbMCwwLCJUXntpICsgMX1cXCAwIl0sWzAsMSwiZl57LTF9Il0sWzEsMiwiPSIsMSx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6Im5vbmUifSwiaGVhZCI6eyJuYW1lIjoibm9uZSJ9fX1dLFszLDAsIlRcXCBcXGlvdGFfaSIsMl0sWzMsMiwiXFxpb3RhX3tpICsgMX0iXV0="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Since $T$ preserves the colimit of $0 → T| 0 → ⋯$, the map $f$ is an isomorphism. Thus, $f^{-1}$ is an algebra for $T$, such that the above diagram commutes for all $i ∈ ℤ_{≥ 0}$."
                          ]
                      }
                    ]
                , .ps "It remains to show that this is algebra is initial. Fix an algebra $T| a |→{α} a$, and suppose we have an algebra morphism $u : |colim_{i ∈ ω} T^i|, 0 → a$ into it. We will show that $u$ is uniquely determined."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMyxbMiwwLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIl0sWzIsMiwiYSJdLFswLDAsIlReaVxcIDAiXSxbMCwxLCJ1Il0sWzIsMCwiXFxpb3RhX2kiXSxbMiwxLCJ1X2kiLDIseyJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJkYXNoZWQifX19XV0="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Since $u$ is an arrow out of a colimit, it is determined by its restrictions $u_i := u ∘ ι_i$. Our goal will be to show that each of these restrictions is uniquely determined. We will show that $(u_i)_{i ∈ ℤ_{≥ 0}}$ satisfies a recurrence relation, so it is uniquely determined"
                          , .sn [ .s "I.e. by induction/recursion from $ℕ$, which is very on-brand here!" ]
                          , .s "."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMyxbMiwwLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIl0sWzIsMiwiYSJdLFswLDAsIjAiXSxbMCwxLCJ1Il0sWzIsMCwiXFxpb3RhXzAgPSB7IX0iXSxbMiwxLCJ1XzAgPSB7IX0iLDJdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "The starting restriction $u_0 : 0 → a$ is uniquely determined in $|C$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzIsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDIsIlRcXCBhIl0sWzIsMiwiYSJdLFszLDAsIlRee2kgKyAxfVxcIDAiXSxbMCwwLCJUXntpKzF9XFwgMCJdLFsyLDMsIlxcYWxwaGEiLDJdLFsxLDMsInUiLDJdLFswLDIsIlRcXCB1Il0sWzEsMCwiZiIsMl0sWzQsMSwiXFxpb3RhX3tpICsgMX0iLDFdLFs1LDQsIjEiXSxbNCwzLCJ1X3tpICsgMX0iLDAseyJjdXJ2ZSI6LTN9XSxbNSwwLCJUXFwgXFxpb3RhX2kiXSxbNSwyLCJUXFwgdV9pIiwyLHsiY3VydmUiOjJ9XV0="
                          , height := some 302
                          }
                      , text := some
                          [ .s "We next show that $u_{i + 1}$ is uniquely determined by $u_i$. The above diagram commutes (as the reader should check). Using the trick $f^{-1} ∘ f = 1$, we can see that $u_{i + 1} = α ∘ T| u_i$. Thus, $u_{i + 1}$ is uniquely determined by $u_i$."
                          ]
                      }
                    ]
                , .ps "Thus, $u$ is uniquely determined, and we have a recursive formula for the restrictions $u ∘ ι_i$."
                , .ps "It remains to actually construct an arrow $u : |colim_{i ∈ ω} T^i|, 0 → a$ which is a morphism of algebras. Being an arrow out of a colimit in $|C$, we can construct $u$ by specifying a cocone $(u_i : T^i| 0 → a)_{i ∈ ω}$; our previous work suggests a recursive formula for this cocone: take $u_0 : 0 → a$ to be the unique such arrow, and for each $i ∈ ℤ_{≥ 0}$, set $u_{i + 1} : T^{i + 1}| 0 → a$ to be the composite $T^{i + 1} |→{T| u_i} T| a |→{α} a$. We verify that this is a genuine cocone; i.e. that $u_i = u_{i + 1} ∘ T^i| {!}$ for all $i ∈ ℤ_{≥ 0}$."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMixbMCwwLCIwIl0sWzAsMiwiYSJdLFswLDEsInVfMCIsMl1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "We will iteratively describe $u_0, u_1, …$. The first term $u_0$ is rather trivial to picture."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCIwIl0sWzAsMiwiYSJdLFsyLDAsIlRcXCAwIl0sWzIsMiwiVFxcIGEiXSxbMCwxLCJ1XzAiLDJdLFswLDIsIiEiXSxbMiwzLCJUXFwgdV8wIl0sWzMsMSwiXFxhbHBoYSJdLFsyLDEsInVfMSIsMSx7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "We add $u_1 := α ∘ T| u_0$ to the picture; it occupies the displayed diagonal. Since arrow out of $0$ are unique, the outer square commutes, and so $u_1 = u_0 ∘ {!}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCIwIl0sWzAsMiwiYSJdLFsyLDAsIlRcXCAwIixbMzAwLDYwLDYwLDFdXSxbMiwyLCJUXFwgYSIsWzMwMCw2MCw2MCwxXV0sWzQsMCwiVF4yXFwgMCIsWzMwMCw2MCw2MCwxXV0sWzQsMiwiVF4yXFwgYSIsWzMwMCw2MCw2MCwxXV0sWzAsMSwidV8wIiwyXSxbMCwyLCIhIl0sWzIsMywiVFxcIHVfMCIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFszLDEsIlxcYWxwaGEiXSxbMiwxLCJ1XzEiLDFdLFsyLDQsIlRcXCAhIiwwLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzQsNSwiVF4yXFwgdV8wIiwwLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzUsMywiVFxcIFxcYWxwaGEiLDAseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbNCwzLCJUXFwgdV8xIiwxLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Applying $T$ to our previous diagram, we obtain the magenta sub-diagram above (the rightmost square), which we can paste to the right of our previous diagram. Being the image of a commutative diagram under a functor, the magenta sub-diagram commutes; therefore, the whole diagram displayed above commutes."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCIwIl0sWzAsMiwiYSIsWzMwMCw2MCw2MCwxXV0sWzIsMCwiVFxcIDAiXSxbMiwyLCJUXFwgYSIsWzMwMCw2MCw2MCwxXV0sWzQsMCwiVF4yXFwgMCIsWzMwMCw2MCw2MCwxXV0sWzQsMiwiVF4yXFwgYSIsWzMwMCw2MCw2MCwxXV0sWzAsMSwidV8wIiwyXSxbMCwyLCIhIl0sWzIsMywiVFxcIHVfMCIsMV0sWzMsMSwiXFxhbHBoYSIsMCx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFsyLDQsIlRcXCAhIl0sWzQsNSwiVF4yXFwgdV8wIiwwLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzUsMywiVFxcIFxcYWxwaGEiLDAseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbNCwzLCJUXFwgdV8xIiwxXSxbMiwxLCJ1XzEiLDFdXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "The arrow $u_2 = α ∘ T| u_1$ is then given by any of the composite paths $T^2| 0 → ⋯ → a$ displayed above. This is easiest to see by first taking the diagonal $T| u_1$ and then taking $α$, but it will be useful to instead think of $u_2$ as the path $α ∘ T| α ∘ T^2| u_0$ highlighted in magenta above."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNixbMCwwLCIwIl0sWzAsMiwiYSJdLFsyLDAsIlRcXCAwIl0sWzIsMiwiVFxcIGEiXSxbNCwwLCJUXjJcXCAwIl0sWzQsMiwiVF4yXFwgYSJdLFswLDEsInVfMCIsMl0sWzAsMiwiISJdLFsyLDMsIlRcXCB1XzAiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbMywxLCJcXGFscGhhIiwwLHsib2Zmc2V0IjotMSwiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzIsNCwiVFxcICEiXSxbNCw1LCJUXjJcXCB1XzAiLDAseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbNSwzLCJUXFwgXFxhbHBoYSIsMCx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFszLDEsIlxcYWxwaGEiLDIseyJvZmZzZXQiOjEsImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dXQ=="
                          , height := some 302
                          }
                      , text := some
                          [ .s "Similarly, it is useful to think of $u_1$ as the path $α ∘ T| u_0$ displayed above. Since the diagram commutes, it is evident that $|textcolor{blue}{u_1} = |textcolor{magenta}{u_2} ∘ T| {!}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMCwwLCIwIl0sWzAsMiwiYSJdLFsyLDAsIlRcXCAwIl0sWzIsMiwiVFxcIGEiXSxbNCwwLCJUXjJcXCAwIl0sWzQsMiwiVF4yXFwgYSJdLFs2LDAsIlReM1xcIDAiXSxbNiwyLCJUXjNcXCBhIl0sWzAsMSwidV8wIiwyXSxbMCwyLCIhIl0sWzIsMywiVFxcIHVfMCIsMV0sWzMsMSwiXFxhbHBoYSIsMCx7Im9mZnNldCI6LTEsImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFsyLDQsIlRcXCAhIl0sWzQsNSwiVF4yXFwgdV8wIiwxLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzUsMywiVFxcIFxcYWxwaGEiLDAseyJvZmZzZXQiOi0xLCJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbMywxLCJcXGFscGhhIiwyLHsib2Zmc2V0IjoxLCJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbNSwzLCJUXFwgXFxhbHBoYSIsMix7Im9mZnNldCI6MSwiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzQsNiwiVF4yXFwgISJdLFs2LDcsIlReM1xcICEiLDAseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbNyw1LCJUXjJcXCBcXGFscGhhIiwwLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Extend the diagram further, adding the composite path $|textcolor{blue}{u_3} = α ∘ T| α ∘ T^2| α ∘ T^3| {!}$ depicted above. The added square commutes because it is the image of the middle commutative square under $T$. Since the diagram commutes, it is evident that $|textcolor{magenta}{u_2} = |textcolor{blue}{u_3} ∘ T^2| {!}$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsMTAsWzAsMCwiMCJdLFswLDIsImEiXSxbMiwwLCJUXFwgMCJdLFsyLDIsIlRcXCBhIl0sWzQsMCwiVF4yXFwgMCJdLFs0LDIsIlReMlxcIGEiXSxbNiwwLCJUXjNcXCAwIl0sWzYsMiwiVF4zXFwgYSJdLFs4LDAsIlxcY2RvdHMiXSxbOCwyLCJcXGNkb3RzIl0sWzAsMSwidV8wIiwyXSxbMCwyLCIhIl0sWzIsMywiVFxcIHVfMCIsMV0sWzMsMSwiXFxhbHBoYSJdLFsyLDQsIlRcXCAhIl0sWzQsNSwiVF4yXFwgdV8wIiwxXSxbNSwzLCJUXFwgXFxhbHBoYSJdLFs0LDYsIlReMlxcICEiXSxbNiw3LCJUXjNcXCAhIiwxXSxbNyw1LCJUXjJcXCBcXGFscGhhIl0sWzYsOCwiVF4zXFwgeyF9Il0sWzcsOSwiVF4zXFwgXFxhbHBoYSIsMl1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Continuing inductively, we verify that $(u_i : T^i| 0 → a)_{i ∈ ω}$ is a cocone under $0 → T| 0 → ⋯$."
                          ]
                      }
                    ]
                , .ps "The universal property of $|colim_{i ∈ ω} T^i|, 0$ yields the desired arrow $u : |colim_{i ∈ ω} T^i|, 0 → a$ with $u_i = u ∘ ι_i$ for all $i$. We next verify that $u$ is an algebra morphism."
                , .ida
                    [ { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzIsMCwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFswLDIsIlRcXCBhIl0sWzIsMiwiYSJdLFswLDEsImZeey0xfSJdLFswLDIsIlRcXCB1IiwyXSxbMiwzLCJcXGFscGhhIiwyXSxbMSwzLCJ1Il1d"
                          , height := some 302
                          }
                      , text := some
                          [ .s "Our goal is to show that this diagram commutes."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsNSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbMCwxLCJmXnstMX0iXSxbMCwyLCJUXFwgdSIsMl0sWzIsMywiXFxhbHBoYSIsMl0sWzEsMywidSJdLFs0LDAsIlRcXCBcXGlvdGFfaSIsMV1d"
                          , height := some 400
                          }
                      , text := some
                          [ .s "Because $T$ preserves the colimit $|colim_{i ∈ ω} T^i|, 0$, the cocone $(T| ι_i)_{i ∈ ω}$ is a colimit cocone. Applying the universal property, it suffices to show that $u ∘ f^{-1} ∘ T| ι_i = α ∘ T| u ∘ T| ι_i$ for each $i ∈ ℤ_{≥ 0}$."
                          , .sn [ .s "One could alternatively use the universal property of $|colim_{i ∈ ω} T^i|, 0$, but then a special case for $ι_0$ must be made (albeit a trivial one). The formulation I've presented here makes the most sense to me." ]
                          , .s "."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMCwxLCJmXnstMX0iLDFdLFswLDIsIlRcXCB1IiwxXSxbMiwzLCJcXGFscGhhIiwxXSxbMSwzLCJ1IiwxXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDFdLFs0LDUsIjEiXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMV0sWzUsNiwiVF57aSArIDF9XFwgeyF9Il0sWzQsNywiVF57aSArIDF9XFwgeyF9IiwyXSxbNyw2LCIxIiwyXSxbNiwzLCJcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXSxbNywyLCJUXFwgXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMV0sWzUsMywidV97aSArIDF9IiwxXSxbNCwyLCJUXFwgdV9pIiwxXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "Fixing $i$, we can fill out the diagram as above. We will identify parts of this diagram which commute."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMCwxLCJmXnstMX0iLDFdLFswLDIsIlRcXCB1IiwxLHsiY29sb3VyIjpbMzAwLDYwLDYwXX0sWzMwMCw2MCw2MCwxXV0sWzIsMywiXFxhbHBoYSIsMV0sWzEsMywidSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs0LDAsIlRcXCBcXGlvdGFfaSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs0LDUsIjEiXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs1LDYsIlRee2kgKyAxfVxcIHshfSJdLFs0LDcsIlRee2kgKyAxfVxcIHshfSIsMl0sWzcsNiwiMSIsMl0sWzYsMywiXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMV0sWzcsMiwiVFxcIFxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDFdLFs1LDMsInVfe2kgKyAxfSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs0LDIsIlRcXCB1X2kiLDEseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "The upper-left and upper-right triangles (displayed in magenta) commute by definition of $u$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMCwxLCJmXnstMX0iLDFdLFswLDIsIlRcXCB1IiwxXSxbMiwzLCJcXGFscGhhIiwxXSxbMSwzLCJ1IiwxXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDFdLFs0LDUsIjEiXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMV0sWzUsNiwiVF57aSArIDF9XFwgeyF9IiwwLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzQsNywiVF57aSArIDF9XFwgeyF9IiwyLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzcsNiwiMSIsMl0sWzYsMywiXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dLFs3LDIsIlRcXCBcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzUsMywidV97aSArIDF9IiwxLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzQsMiwiVFxcIHVfaSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dXQ=="
                          , height := some 500
                          }
                      , text := some
                          [ .s "The lower-left and lower-right triangles (displayed in blue) also commute. We saw this in our construction of the $u_i$."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMCwxLCJmXnstMX0iLDEseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbMCwyLCJUXFwgdSIsMV0sWzIsMywiXFxhbHBoYSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFsxLDMsInUiLDFdLFs0LDAsIlRcXCBcXGlvdGFfaSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs0LDUsIjEiLDAseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs1LDYsIlRee2kgKyAxfVxcIHshfSJdLFs0LDcsIlRee2kgKyAxfVxcIHshfSIsMl0sWzcsNiwiMSIsMix7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs2LDMsIlxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDEseyJjb2xvdXIiOlszMDAsNjAsNjBdfSxbMzAwLDYwLDYwLDFdXSxbNywyLCJUXFwgXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMSx7ImNvbG91ciI6WzMwMCw2MCw2MF19LFszMDAsNjAsNjAsMV1dLFs1LDMsInVfe2kgKyAxfSIsMV0sWzQsMiwiVFxcIHVfaSIsMV1d"
                          , height := some 500
                          }
                      , text := some
                          [ .s "The upper and lower trapezoids (displayed in magenta) obviously commute."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOCxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMCwxLCJmXnstMX0iLDFdLFswLDIsIlRcXCB1IiwxXSxbMiwzLCJcXGFscGhhIiwxXSxbMSwzLCJ1IiwxXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDFdLFs0LDUsIjEiLDAseyJjb2xvdXIiOlsyNDAsNjAsNjBdfSxbMjQwLDYwLDYwLDFdXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMV0sWzUsNiwiVF57aSArIDF9XFwgeyF9IiwwLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzQsNywiVF57aSArIDF9XFwgeyF9IiwyLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzcsNiwiMSIsMix7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dLFs2LDMsIlxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDFdLFs3LDIsIlRcXCBcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXSxbNSwzLCJ1X3tpICsgMX0iLDFdLFs0LDIsIlRcXCB1X2kiLDFdXQ=="
                          , height := some 500
                          }
                      , text := some
                          [ .s "The outer square obviously commutes."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSJdLFswLDAsIlRee2kgKyAxfVxcIDAiXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiXSxbMiwyLCJcXHRleHR7bm9wZX0iLFswLDYwLDYwLDFdXSxbMCwxLCJmXnstMX0iLDEseyJjb2xvdXIiOlswLDYwLDYwXX0sWzAsNjAsNjAsMV1dLFswLDIsIlRcXCB1IiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbMiwzLCJcXGFscGhhIiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbMSwzLCJ1IiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDFdLFs0LDUsIjEiXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMV0sWzUsNiwiVF57aSArIDF9XFwgeyF9Il0sWzQsNywiVF57aSArIDF9XFwgeyF9IiwyXSxbNyw2LCIxIiwyXSxbNiwzLCJcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXSxbNywyLCJUXFwgXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMV0sWzUsMywidV97aSArIDF9IiwxXSxbNCwyLCJUXFwgdV9pIiwxXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "To summarise, every shape in the diagram commutes, except for the middle square (displayed in red, containing the $|text{``|textcolor{red}{nope}''}$)."
                          ]
                      }
                    -- Diagram chase
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIixbMjQwLDYwLDYwLDFdXSxbMywxLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIixbMjQwLDYwLDYwLDFdXSxbMSwzLCJUXFwgYSJdLFszLDMsImEiLFsyNDAsNjAsNjAsMV1dLFswLDAsIlRee2kgKyAxfVxcIDAiLFsyNDAsNjAsNjAsMV1dLFs0LDAsIlRee2kgKyAxfVxcIDAiXSxbNCw0LCJUXntpICsgMX1cXCBhIl0sWzAsNCwiVF57aSArIDF9XFwgYSJdLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbMCwyLCJUXFwgdSIsMV0sWzIsMywiXFxhbHBoYSIsMV0sWzEsMywidSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzQsNSwiMSJdLFs1LDEsIlxcaW90YV97aSArIDF9IiwxXSxbNSw2LCJUXntpICsgMX1cXCB7IX0iXSxbNCw3LCJUXntpICsgMX1cXCB7IX0iLDJdLFs3LDYsIjEiLDJdLFs2LDMsIlxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDFdLFs3LDIsIlRcXCBcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "We now chase the composite $u ∘ f^{-1} ∘ T| ι_i$ around the diagram, displayed in blue squiggly lines."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCIsWzI0MCw2MCw2MCwxXV0sWzEsMywiVFxcIGEiXSxbMywzLCJhIixbMjQwLDYwLDYwLDFdXSxbMCwwLCJUXntpICsgMX1cXCAwIixbMjQwLDYwLDYwLDFdXSxbNCwwLCJUXntpICsgMX1cXCAwIixbMjQwLDYwLDYwLDFdXSxbNCw0LCJUXntpICsgMX1cXCBhIl0sWzAsNCwiVF57aSArIDF9XFwgYSJdLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMV0sWzAsMiwiVFxcIHUiLDFdLFsyLDMsIlxcYWxwaGEiLDFdLFsxLDMsInUiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzQsMCwiVFxcIFxcaW90YV9pIiwxXSxbNCw1LCIxIiwwLHsiY29sb3VyIjpbMjQwLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoic3F1aWdnbHkifX19LFsyNDAsNjAsNjAsMV1dLFs1LDEsIlxcaW90YV97aSArIDF9IiwxLHsiY29sb3VyIjpbMjQwLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoic3F1aWdnbHkifX19LFsyNDAsNjAsNjAsMV1dLFs1LDYsIlRee2kgKyAxfVxcIHshfSJdLFs0LDcsIlRee2kgKyAxfVxcIHshfSIsMl0sWzcsNiwiMSIsMl0sWzYsMywiXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMV0sWzcsMiwiVFxcIFxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDFdXQ=="
                          , height := some 500
                          }
                      , text := some
                          [ .s "We now chase the composite $u ∘ f^{-1} ∘ T| ι_i$ around the diagram, displayed in blue squiggly lines."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSIsWzI0MCw2MCw2MCwxXV0sWzAsMCwiVF57aSArIDF9XFwgMCIsWzI0MCw2MCw2MCwxXV0sWzQsMCwiVF57aSArIDF9XFwgMCIsWzI0MCw2MCw2MCwxXV0sWzQsNCwiVF57aSArIDF9XFwgYSIsWzI0MCw2MCw2MCwxXV0sWzAsNCwiVF57aSArIDF9XFwgYSJdLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMV0sWzAsMiwiVFxcIHUiLDFdLFsyLDMsIlxcYWxwaGEiLDFdLFsxLDMsInUiLDFdLFs0LDAsIlRcXCBcXGlvdGFfaSIsMV0sWzQsNSwiMSIsMCx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbNSwxLCJcXGlvdGFfe2kgKyAxfSIsMV0sWzUsNiwiVF57aSArIDF9XFwgeyF9IiwwLHsiY29sb3VyIjpbMjQwLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoic3F1aWdnbHkifX19LFsyNDAsNjAsNjAsMV1dLFs0LDcsIlRee2kgKyAxfVxcIHshfSIsMl0sWzcsNiwiMSIsMl0sWzYsMywiXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbNywyLCJUXFwgXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMV1d"
                          , height := some 500
                          }
                      , text := some
                          [ .s "We now chase the composite $u ∘ f^{-1} ∘ T| ι_i$ around the diagram, displayed in blue squiggly lines."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIl0sWzMsMywiYSIsWzI0MCw2MCw2MCwxXV0sWzAsMCwiVF57aSArIDF9XFwgMCIsWzI0MCw2MCw2MCwxXV0sWzQsMCwiVF57aSArIDF9XFwgMCJdLFs0LDQsIlRee2kgKyAxfVxcIGEiLFsyNDAsNjAsNjAsMV1dLFswLDQsIlRee2kgKyAxfVxcIGEiLFsyNDAsNjAsNjAsMV1dLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMV0sWzAsMiwiVFxcIHUiLDFdLFsyLDMsIlxcYWxwaGEiLDFdLFsxLDMsInUiLDFdLFs0LDAsIlRcXCBcXGlvdGFfaSIsMV0sWzQsNSwiMSJdLFs1LDEsIlxcaW90YV97aSArIDF9IiwxXSxbNSw2LCJUXntpICsgMX1cXCB7IX0iXSxbNCw3LCJUXntpICsgMX1cXCB7IX0iLDIseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzcsNiwiMSIsMix7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbNiwzLCJcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxLHsiY29sb3VyIjpbMjQwLDYwLDYwXSwic3R5bGUiOnsiYm9keSI6eyJuYW1lIjoic3F1aWdnbHkifX19LFsyNDAsNjAsNjAsMV1dLFs3LDIsIlRcXCBcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "We now chase the composite $u ∘ f^{-1} ∘ T| ι_i$ around the diagram, displayed in blue squiggly lines."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIl0sWzMsMSwiXFxtYXRocm17Y29saW19X3tpIFxcaW4gXFxvbWVnYX1cXCBUXmlcXCwgMCJdLFsxLDMsIlRcXCBhIixbMjQwLDYwLDYwLDFdXSxbMywzLCJhIixbMjQwLDYwLDYwLDFdXSxbMCwwLCJUXntpICsgMX1cXCAwIixbMjQwLDYwLDYwLDFdXSxbNCwwLCJUXntpICsgMX1cXCAwIl0sWzQsNCwiVF57aSArIDF9XFwgYSJdLFswLDQsIlRee2kgKyAxfVxcIGEiLFsyNDAsNjAsNjAsMV1dLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMV0sWzAsMiwiVFxcIHUiLDFdLFsyLDMsIlxcYWxwaGEiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzEsMywidSIsMV0sWzQsMCwiVFxcIFxcaW90YV9pIiwxXSxbNCw1LCIxIl0sWzUsMSwiXFxpb3RhX3tpICsgMX0iLDFdLFs1LDYsIlRee2kgKyAxfVxcIHshfSJdLFs0LDcsIlRee2kgKyAxfVxcIHshfSIsMix7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbNyw2LCIxIiwyXSxbNiwzLCJcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXSxbNywyLCJUXFwgXFxhbHBoYSBcXGNpcmMgXFxjZG90cyBcXGNpcmMgVF5pXFwgXFxhbHBoYSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "We now chase the composite $u ∘ f^{-1} ∘ T| ι_i$ around the diagram, displayed in blue squiggly lines."
                          ]
                      }
                    , { cda :=
                          { href := "https://q.uiver.app/#q=WzAsOSxbMSwxLCJUXFxsZWZ0KCBcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIFxccmlnaHQpIixbMjQwLDYwLDYwLDFdXSxbMywxLCJcXG1hdGhybXtjb2xpbX1fe2kgXFxpbiBcXG9tZWdhfVxcIFReaVxcLCAwIl0sWzEsMywiVFxcIGEiLFsyNDAsNjAsNjAsMV1dLFszLDMsImEiLFsyNDAsNjAsNjAsMV1dLFswLDAsIlRee2kgKyAxfVxcIDAiLFsyNDAsNjAsNjAsMV1dLFs0LDAsIlRee2kgKyAxfVxcIDAiXSxbNCw0LCJUXntpICsgMX1cXCBhIl0sWzAsNCwiVF57aSArIDF9XFwgYSJdLFsyLDIsIlxcdGV4dHtub3BlfSIsWzAsNjAsNjAsMV1dLFswLDEsImZeey0xfSIsMV0sWzAsMiwiVFxcIHUiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzIsMywiXFxhbHBoYSIsMSx7ImNvbG91ciI6WzI0MCw2MCw2MF0sInN0eWxlIjp7ImJvZHkiOnsibmFtZSI6InNxdWlnZ2x5In19fSxbMjQwLDYwLDYwLDFdXSxbMSwzLCJ1IiwxXSxbNCwwLCJUXFwgXFxpb3RhX2kiLDEseyJjb2xvdXIiOlsyNDAsNjAsNjBdLCJzdHlsZSI6eyJib2R5Ijp7Im5hbWUiOiJzcXVpZ2dseSJ9fX0sWzI0MCw2MCw2MCwxXV0sWzQsNSwiMSJdLFs1LDEsIlxcaW90YV97aSArIDF9IiwxXSxbNSw2LCJUXntpICsgMX1cXCB7IX0iXSxbNCw3LCJUXntpICsgMX1cXCB7IX0iLDJdLFs3LDYsIjEiLDJdLFs2LDMsIlxcYWxwaGEgXFxjaXJjIFxcY2RvdHMgXFxjaXJjIFReaVxcIFxcYWxwaGEiLDFdLFs3LDIsIlRcXCBcXGFscGhhIFxcY2lyYyBcXGNkb3RzIFxcY2lyYyBUXmlcXCBcXGFscGhhIiwxXV0="
                          , height := some 500
                          }
                      , text := some
                          [ .s "Our diagram chase shows $u ∘ f^{-1} ∘ T| ι_i = α ∘ T| u ∘ T| ι_i$. Since this holds for all $i$, the universal property of $T|left( |colim_{i ∈ ω} T^i|, 0 |right)$ guarantees that $u ∘ f^{-1} = α ∘ T| u$."
                          ]
                      }
                    ]
                , .ps "Therefore, $u$ is an algebra morphism, so $T|left( |colim_{i ∈ ω} T^i|, 0 |right) |→{f^{-1}} |colim_{i ∈ ω} T^i|, 0$ is an initial algebra for $T$. $∎$"
                ]
            ]
        , .mk
            "Example Uses"
            [ .body
                [ .ps "One can construct initial algebras and terminal coalgebras for the following functors $T : |Set → |Set$ this way:"
                , .ul
                    [ [ .s "$T : X ↦ 1 + X$ (initial algebra: $ℕ$; terminal coalgebra: $|coℕ = ℕ + |{∞|}$)" ]
                    , [ .s "$T : X ↦ A × X$ for fixed $A ∈ |Set$ (initial algebra: $∅$; terminal coalgebra: $|Stream| A = A^{ℕ}$)" ]
                    , [ .s "$T : X ↦ 1 + A × X$ for fixed $A ∈ |Set$ (initial algebra: $|List| A$; terminal coalgebra: $|coList| A = |List| A + |Stream| A$)" ]
                    , [ .s "$T : X ↦ 1 + A × X^2$ for fixed $A ∈ |Set$ (initial algebra: finite-height binary trees over $A$; terminal coalgebra: finite-or-infinite-height binary trees over $A$)" ]
                    ]
                , .p
                    [ .s "This construction also works for $T : X ↦ 1 + X$ regarded as a functor $T : |Top → |Top$; the initial algebra is $ℕ$ with the discrete topology, whilst the terminal coalgebra is $|coℕ$ with a topology such that $0, 1, … → ∞$"
                    , .sn [ .s "Precisely describing this topology is a worthwhile exercise in understanding the topology on a limit in $|Top$." ]
                    , .s "."
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
        ++  #[  («authoring defs».esc "cons", "\\texttt{cons}")
            ,   («authoring defs».esc "co", "\\mathrm{co}")
            ,   («authoring defs».esc "List", "\\texttt{List}")
            ,   («authoring defs».esc "coList", "\\texttt{coList}")
            ,   («authoring defs».esc "Stream", "\\texttt{Stream}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end AdamekFixedPointTheorem
