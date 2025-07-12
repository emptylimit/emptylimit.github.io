/- **FILE:** `Pages/GeneralisedElements.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
private def «product diagram» : String := "https://q.uiver.app/#q=WzAsNCxbMSwxLCJMIl0sWzAsMSwiQSJdLFsyLDEsIkIiXSxbMSwwLCJaIixbMzAwLDYwLDYwLDFdXSxbMywxLCJhIiwyLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzMsMiwiYiIsMCx7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dLFszLDAsIlxcZWxsIiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbMCwxLCJcXGxhbWJkYV9BIl0sWzAsMiwiXFxsYW1iZGFfQiIsMl1d"
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace GeneralisedElements
  def it : Page :=
    { title :=
        "The Philosophy of Generalised Elements"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.context
        , Bib.adjointsBeforeLimits
        ]
    , sections :=
        [ .mk
            "Introduction"
            [ .body
                [ .ps "Objects in an abstract category have no \"elements\" in the way that a set does. Nonetheless, pretending that they do can help develop intuition for various categorical constructions. How can we generalise the idea of an \"element\" of an object in $|Set$ to an arbitrary category?"
                , .p
                    [ .s "Write $1 := |{0|}$ for the singleton set $1 ∈ |Set$. The elements $x ∈ X$ of a set $X$ correspond exactly to the functions $1 → X$:"
                    , .al
                        [ "X &≃ |Set(1, X)"
                        , "&&& |Set(1, X) &≃ X"
                        , .alignBreak
                        , "x &↦ (0 ↦ x)"
                        , "&&& x &↦ x(0)"
                        ]
                    , .s "Abusing language, the elements of a set $X$ \"are\" the functions $1 → X$. Since sets are completely determined by the elements they contain, these functions are enough to characterise a set. How does this generalise to other concerte categories?"
                    ]
                , .ps "Write $1 := |{e|}$ to be the one-element group. For an arbitrary group $G$, there is only one group homomorphism $1 → G$; since homomorphisms must preserve the identity element, the only choice is the map $e ↦ e_G$. So, the functions $1 → G$ do not characterise the elements of the group $G$."
                , .p
                    [ .s "However, the functions $ℤ → G$ <em>do</em> characterise the elements of $G$. Writing $U(G)$ for the underlying set of $G$, we have the bijection"
                    , .al
                        [ "U(G) &≃ |Group(ℤ, G)"
                        , "&&&|Group(ℤ, G) &≃ U(G)"
                        , .alignBreak
                        , "g &↦ (n ↦ g^n)"
                        , "&&&g &↦ g(1)"
                        ]
                    , .s "so the elements of the group $G$ \"are\" the homomorphisms $ℤ → G$."
                    ]
                , .ps "For a generic object $x$ in an arbitrary category $|C$, it is unclear what an \"element of $x$\" should even mean, let alone which object $e ∈ |C$ should represent them via the arrows $e → x$. Instead, we take a more liberal approach. For <em>any</em> object $e ∈ |C$, the arrows $e → x$ in $|C$ are known as the <strong>$e$-shaped elements of $x$</strong>, and $|bigcup_{e ∈ |C} |C(e, x)$ is known as the collection of <strong>generalised elements of $x$</strong>."
                , .ps "Further examples illuminate these ideas. Fix a simple undirected graph $G ∈ |SimpleGraph$. Then:"
                , .ul
                    [ .s "The graph $K_1 = K_1^c$ has one vertex and no edges. The $K_1$-shaped elements of $G$ are the vertices of $G$."
                    , .s "For $n ∈ ℤ_{≥ 0}$, the graph $K_n^c$ has $n$ vertices and no edges. The $K_n^c$-shaped elements of $G$ are pairs of $n$ vertices in $G$."
                    , .s "The graph $K_2$ has two vertices and one edge between them. The $K_2$-shaped elements of $G$ are the edges of $G$."
                    , .s "For $n ∈ ℤ_{≥ 0}$, the graph $K_n$ has $n$ vertices and each pair of distinct vertices is joined by an edge. The $K_n$-shaped elements of $G$ are the cliques of $G$."
                    , .s "For $n ∈ ℤ_{≥ 1}$, the graph $P_n$ has $n$ vertices joined in a single path. The $P_n$-shaped elements of $G$ are the walks in $G$ of length $n$."
                    , .s "For $n ∈ ℤ_{≥ 3}$, the graph $C_n$ has $n$ vertices joined in a single path. The $C_n$-shaped elements of $G$ are the cycles in $G$ of length $n$."
                    ]
                , .ps "Working instead with graphs that need not be simple, we may have \"degenerate\" versions of the generalised elements listed above. For instance, the graph $G$ consisting of a single loop is terminal, and therefore has a $K_3$-shaped element (the degenerate \"triangle\" in $G$)."
                ]
            , .block
                { kind :=
                    .exr
                , body :=
                    [ .ps "Fix a topological space $X$."
                    , .ul
                        [ .s "Endow the singleton set $1$ with its only topology. What are the $1$-shaped elements of $X$?"
                        , .s "Fix $n ∈ ℤ_{≥ 0}$. Identify a topological space $E_n$ for which the $E_n$-shaped elements of $X$ are the pairs of $n$ (not necessarily distinct) elements of $X$."
                        , .s "What are the $[0, 1]$-shaped elements of $X$?"
                        , .s "What are the $𝕊^1$-shaped elements of $X$? Here, $𝕊^1$ denotes the unit circle in $ℝ^2$ (with the subspace topology), which is homeomorphic to a quotient of $[0, 1]$ in which the endpoints $0$ and $1$ are identified."
                        ]
                    ]
                }
            ]
        , .mk
            "Yoneda-style arguments"
            [ .body
                [ .ps "Sets are completely determined by their elements. Similarly, objects in a locally small category are determined by their generalised elements."
                ]
            , .block
                { kind :=
                    .lem
                , title :=
                    "Generalised elements determine objects"
                , body :=
                    [ .ps "Fix a locally small category $|C$ and objects $x, y ∈ |C$. Then, $x ≃ y$ in $|C$ if and only if the functors $|C({-}, x), |C({-}, y) : |C^{|op} → |Set$ are naturally isomorphic."
                    ]
                , outLink? :=
                    some { href := "../proof/generalised-elements-determine-objects.html" }
                }
            , .body
                [ .p
                    [ .s "This enables one to write \"equational\" proofs. The dual result establishes the \"distributive law\" $a × (b + c) ≃ (a × b) + (a × c)$ in any Cartesian closed category $|C$, whenever the coproducts $b + c$ and $(a × b) + (a × c)$ exist:"
                    , .al
                        [ "|C(a × (b + c), z)"
                        , "&≃ |C(b + c, z^a)"
                        , .alignBreak
                        , "&≃ |C(b, z^a) × |C(c, z^a)"
                        , .alignBreak
                        , "&≃ |C(a × b, z) × |C(a × c, z)"
                        , .alignBreak
                        , "|C(a × (b + c), z)"
                        , "&≃ |C( (a × b) + (a × c), z )"
                        ]
                    , .s "Since each of the displayed isomorphisms is natural in $z ∈ |C$, we have that $|C(a × (b + c), {-}) ≃ |C((a × b) + (a × c), {-})$ and hence $a × (b + c) ≃ (a × b) + (a × c)$."
                    ]
                ]
            , .block
                { kind :=
                    .exr
                , body :=
                    [ .p
                        [ .s "Make an \"equational style\" argument that right adjoints preserve limits. For a precise statement, see "
                        , .a "../proof/right-adjoints-preserve-limits.html" "this page"
                        , .s "."
                        ]
                    ]
                }
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "../proof/generalised-elements-determine-objects.html" "Generalised Elements Determine Objects"
            ]
        }
    }
end GeneralisedElements
