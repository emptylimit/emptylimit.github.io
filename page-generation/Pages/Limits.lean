/- **FILE:** `Pages/Limits.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
private def «ℓ⇒D cone» : String := "https://q.uiver.app/#q=WzAsMyxbMSwwLCJcXGVsbCJdLFswLDIsIkRcXCBpIl0sWzIsMiwiRFxcIGoiXSxbMSwyLCJEXFwgZiIsMl0sWzAsMSwiXFxsYW1iZGFfaSIsMl0sWzAsMiwiXFxsYW1iZGFfaiJdXQ=="
private def «a⇒D cone» : String := "https://q.uiver.app/#q=WzAsMyxbMSwwLCJhIl0sWzAsMiwiRFxcIGkiXSxbMiwyLCJEXFwgaiJdLFsxLDIsIkRcXCBmIiwyXSxbMCwxLCJcXGFscGhhX2kiLDJdLFswLDIsIlxcYWxwaGFfaiJdXQ=="
private def «cone factor α → λ» : String := "https://q.uiver.app/#q=WzAsNSxbMSwwLCJhIl0sWzEsMSwiXFxlbGwiXSxbMCwyLCJEXFwgaSJdLFsyLDIsIkRcXCBqIl0sWzMsMSwiXFxmb3JhbGwgYVxcIFxcZm9yYWxsIFxcYWxwaGFcXCBcXGV4aXN0cyAhIHUiXSxbMSwyLCJcXGxhbWJkYV9pIiwxXSxbMSwzLCJcXGxhbWJkYV9qIiwxXSxbMCwyLCJcXGFscGhhX2kiLDJdLFswLDMsIlxcYWxwaGFfaiJdLFsyLDMsIkRcXCBmIiwyXSxbMCwxLCJcXGV4aXN0cyAhIHUiLDFdXQ=="
private def «cocone factor λ → α» : String := "https://q.uiver.app/#q=WzAsNSxbMCwwLCJEXFwgaSJdLFsyLDAsIkRcXCBqIl0sWzEsMSwiXFxlbGwiXSxbMSwyLCJhIl0sWzMsMSwiXFxmb3JhbGwgYVxcIFxcZm9yYWxsIFxcYWxwaGFcXCBcXGV4aXN0cyAhIHUiXSxbMCwxLCJEXFwgZiJdLFsyLDMsIlxcZXhpc3RzICEgdSIsMV0sWzAsMywiXFxhbHBoYV9pIiwyXSxbMSwzLCJcXGFscGhhX2oiXSxbMCwyLCJcXGlvdGFfaSIsMV0sWzEsMiwiXFxpb3RhX2oiLDFdXQ=="
private def «product diagram» : String := "https://q.uiver.app/#q=WzAsNCxbMSwxLCJMIl0sWzAsMSwiQSJdLFsyLDEsIkIiXSxbMSwwLCJaIixbMzAwLDYwLDYwLDFdXSxbMywxLCJhIiwyLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzMsMiwiYiIsMCx7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dLFszLDAsIlxcZWxsIiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbMCwxLCJcXGxhbWJkYV9BIl0sWzAsMiwiXFxsYW1iZGFfQiIsMl1d"
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace Limits
  def it : Page :=
    { title :=
        "Limits"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.context ]
    , sections :=
        [ .mk
            "Definition"
            [ .body
                [ .p
                    [ .s "Common constructions in mathematics summarise the data of multiple objects into one. For examples, take the Cartesian/direct product of sets/groups/etc, or the union of nested sets, or the gluing together of topological spaces"
                    , .sn [.s "E.g. the standard quotient construction of a torus."]
                    , .s ". These constructions come in two dual categorical flavours: <em>limits</em> and <em>colimits</em>, depending respectively on whether the maps <em>into</em> or <em>out of</em> these objects are easily described."
                    ]
                ]
            , .block
                { kind :=
                    .dfn
                , body :=
                    [ .ps "Fix a category $\\mathsf{C}$ and an $\\mathsf{J}$-shaped diagram $D : \\mathsf{J} \\to \\mathsf{C}$ in $\\mathsf{C}$. The <strong>limit</strong> of $D$ is the terminal cone over $D$ (should it exist), and dually the <strong>colimit</strong> of $D$ is the initial cocone under $D$ (should it exist). Explicitly, the limit consists of:"
                    , .ul
                        [ [ .s "An object $\\ell \\in \\mathsf{C}$, often instead denoted $\\lim_{\\mathsf{J}} D$;"
                          ]
                        , [ .s "A collection $(\\lambda_i)_{i \\in \\mathsf{J}}$ of arrows $\\lambda_i : \\ell \\to D i$, one for each object $i$ of $\\mathsf{J}$"
                          , .sn [.s "Unlike $\\lim_{\\mathsf{J}} D$, there seems to be no standard notation for this cone."]
                          , .s ";"
                          ]
                        ]
                    , .ps "Subject to the following constraints:"
                    , .ul
                        [ .s "$\\lambda$ forms a cone; that is, for each $i \\xrightarrow{f} j$ in $\\mathsf{J}$, we require $D f \\circ \\lambda_i = \\lambda_j$:"]
                    , .cda { href := «ℓ⇒D cone», height := some 302 }
                    , .ul
                        [ .s "$\\lambda$ is the terminal such cone; that is, for any other cone $\\alpha : a \\Rightarrow D$, there exists a unique map $u : a \\to \\ell$ such that for all $i \\in \\mathsf{J}$, $\\alpha_i = \\lambda_i \\circ u$:"
                        ]
                    , .cda { href := «cone factor α → λ», height := some 302 }
                    , .ps "The colimit consists of the dual data, obtained by replacing $\\mathsf{C}$ by $\\mathsf{C}^{\\mathrm{op}}$; explicitly:"
                    , .ul
                        [ .s "An object $\\ell \\in \\mathsf{C}$, often instead denoted $\\mathrm{colim}_{\\mathsf{J}} D$;"
                        , .s "A collection $(\\iota_i)_{i \\in \\mathsf{J}}$ of arrows $\\iota_i : D i \\to \\ell$;"
                        ]
                    , .ps "Subject to the following constrants:"
                    , .ul
                        [ .s "$\\iota$ forms a cocone; that is, for each $i \\xrightarrow{f} j$ in $\\mathsf{J}$, we require $\\iota_j \\circ D f = \\iota_i$;"
                        , .s "$\\iota$ is the initial such cocone; that is, for any other cocone $\\alpha : D \\Rightarrow a$, there exists a unique map $u : \\ell \\to a$ such that for all $i \\in \\mathsf{J}$, $\\alpha_i = u \\circ \\lambda_i$:"
                        ]
                    , .cda { href := «cocone factor λ → α», height := some 302 }
                    ]
                }
            , .body
                [ .ps "The category $\\mathsf{J}$ is typically called the <em>indexing category</em> for the limit $\\lim_{\\mathsf{J}} D$."
                ]
            ]
        , .mk
            "Examples: Products and Coproducts"
            [ .block
                { kind :=
                    .exa
                , title :=
                    "Product of sets"
                , body :=
                    [ .ps "FIXME: MOVE THIS DISCUSSION TO A DEDICATED PAGE ON CO/PRODUCTS, AND HAVE THIS PAGE BE MORE FOCUSED ON LIMITS THEMSELVES! Fix $\\mathsf{C} := \\mathbf{Set}$ and let $\\mathsf{J} := (\\bullet\\quad \\bullet)$ be the category with two objects and no non-identity arrows. A diagram (i.e. a functor) $D : (\\bullet\\quad \\bullet) \\to \\mathbf{Set}$ consists of two sets $A$ and $B$ &mdash; the images of the two objects in the indexing category $\\mathsf{J}$. A cone over $D$ consists of the blue data in $\\mathbf{Set}$ displayed below. This cone corresponds to a unique map $u$ (displayed in red) into the limit $L |xRightarrow{|lambda} D$ such that $\\lambda_A \\circ \\textcolor{red}{|ell} = \\textcolor{blue}{a}$ and $\\lambda_B \\circ \\textcolor{red}{|ell} = |textcolor{blue}{b}$. Notice that these equations can also be used to determine the pair $|textcolor{blue}{(f, g)}$ knowing just $|textcolor{red}{|ell}$; thus, the maps $|textcolor{red}{|ell}$ correspond exactly to the pairs $|textcolor{blue}{(f, g)}$."
                    , .cda { href := «product diagram», height := some 200 }
                    , .p
                        [ .s "Recall that elements of a set $X$ are in bijection with functions $1 → X$"
                        , .sn [.s "Here, $1 := |{0|}$ is the singleton set, and the bijection sends an element $x |in X$ to the function $f : 1 → X$ with $f(0) := x$."]
                        , .s ". We can use this to determine the elements of the limit $L$. Setting $|textcolor{magenta}{Z} := 1$, our elements $u : 1 |to L$ of the limit correspond exactly with pairs of elements $1 |xrightarrow{|textcolor{blue}{a}} A$ and $1 |xrightarrow{|textcolor{blue}{b}} B$. So, elements of $L$ could be defined to be pairs of elements of $A$ and $B$; that is, we could set $L := A × B$, with $|textcolor{red}{u} := (|textcolor{blue}{a}, |textcolor{blue}{b})$. Now, the relationship $|textcolor{blue}{a} = |lambda_A |circ |textcolor{red}{u}$ &mdash; read in terms of elements rather than functions as $|textcolor{blue}{a} = |lambda_A (|textcolor{red}{u}) = |lambda_A (|textcolor{blue}{a}, |textcolor{blue}{b})$ &mdash; demands that $|lambda_A : A × B → A$ be the left projection map, and similarly $|lambda_B : A × B → B$ should be right projection map $|lambda_B : (|textcolor{blue}{a}, |textcolor{blue}{b}) |mapsto |textcolor{blue}{b}$."
                        ]
                    ]
                }
            , .block
                { kind :=
                    .exr
                , body :=
                    [ .ps "Take instead $|cat{C}$ as one of the following categories of algebras: $|Monoid$, $|Group$, $|Vect_K$. Verify that the $(|bullet |quad |bullet)$-indexed limits in $|cat{C}$ are the relevant products of algebras (e.g. direct product of groups, or direct sum of vector spaces)."
                    ]
                }
            , .body
                [ .ps "We have found that $(|bullet |quad |bullet)$-indexed limits in $|Set$, $|Group$ etc all generalise the idea of a \"product\" of two objects. Hence, we define the <strong>(categoral) product</strong> of two objects $a, b$ in a category $|cat{C}$ to be the limit of the diagram $D : (|bullet |quad |bullet) → |cat{C}$ sending the left $|bullet$ to $a$ and the right $|bullet$ to $b$."
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            some ("./adjunctions.html", "Adjunctions")
        , links :=
            [ .mk "./diagrams.html" "Diagrams"
            ]
        }
    }
end Limits
