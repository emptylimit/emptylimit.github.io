/- **FILE:** `Pages/FullyFaithfulFunctorsReflectIsomorphisms.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace FullyFaithfulFunctorsReflectIsomorphisms
  def it : Page :=
    { title :=
        "Fully Faithful Functors Reflect Isomorphisms"
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
                    [ .ps "Let $F : |C → |D$ be a functor and let $x |→{i} y$ be an arrow in $|C$. Suppose that $F$ is fully faithful and $F i : F x ≃ F y$ is an isomorphism in $|D$. Then, $i : x ≃ y$ is an isomorphism in $|C$."
                    ]
                }
            ]
        , .mk
            "Direct Proof"
            [ .body
                [ .p
                    [ .s "We next prove the main result. The isomorphism $F i : F x ≃ F y$ has an inverse $|left(F i|right)^{-1} ∈ |D(F y, F x)$. $F : |C(y, x) → |D(F y, F x)$ is surjective (because $F$ is full), so there exists $j ∈ |C(y, x)$ with $F j = |left(F i|right)^{-1}$. By injectivity of $F : |C(x, x) → |D(F x, F x)$, establishing $1_x = j ∘ i$ is equivalent to establishing $F 1_x = F (j ∘ i)$. Indeed,"
                    , .al
                        [ "F 1_x"
                        , "= 1_{F x}"
                        , "= F j ∘ F i"
                        , "= F (j ∘ i)"
                        ]
                    , .s "and similarly, $1_y = i ∘ j$. Thus, $i$ has inverse $j$."
                    ]
                ]
            ]
        , .mk
            "Alternative Proof"
            [ .body
                [ .ps "$F$ being fully faithful asserts that for all $a, b ∈ |C$, the function $F : |C(a, b) ≃ |D(F a, F b)$ is an isomorphism. In essence, it says that $|C$ is \"the same\" as those parts of $|D$ whose objects lie in the image of $F$."
                , .p
                    [ .s "Let's make this precise. Let $|E$ be the full subcategory of $|D$ spanned by collection of objects $|left|{F c |given c ∈ |C |right|}$. Construct a functor $F^{-1} : |E → |C$ as follows. For each object $|tl{x} ∈ |E$, choose an object $c ∈ |C$ such that $F c = |tl{x}$, and assign $F^{-1} (|tl{x}) := c$. In particular, choose $F^{-1} (F x) := x$ and $F^{-1} (F y) := y$. Now, define the maps $
                      F^{-1}
                      : |E(|tl{x}, |tl{y})
                      = |D( F|left( F^{-1} |tl{x} |right), F|left( F^{-1} |tl{x} |right) )
                      → |C(F^{-1} |tl{x}, F^{-1} |tl{y})
                    $ to be the inverse functions to each $
                      F
                      : |C(F^{-1} |tl{x}, F^{-1} |tl{y})
                      → |D( F|left( F^{-1} |tl{x} |right), F|left( F^{-1} |tl{x} |right) )
                      = |E(|tl{x}, |tl{y})
                    $. It is easy to verify that $F^{-1}$ is a functor; in fact, it is a special case of the inverse-equivalence functor constructed in our "
                    , .a "./characterisation-of-equivalences-of-categories.html" "proof that fully faithful and essentially surjective functors are equivalences of categories"
                    , .s "."
                    ]
                , .p
                    [ .s "The main proof is now easy. $F^{-1}$ is a functor, and "
                    , .a "./functors-preserve-isomorphisms.html" "functors preserve isomorphisms"
                    , .s ", so $F^{-1}$ maps the isomorphism $F i$ to an isomorphism in $|C$. By construction, this isomorphism is $i$."
                    ]
                , .ps "This proof underscores the \"real meat\" of what is happening here. The fully fathful functor $F : |C → |D$ is like an injective function $f : C → D$; like an injective function is a bijection onto its image $f : C ≃ |Im(f) ⊆ D$, a fully faithful functor defines an equivalence onto its image $F : C ≃ |E$. Equivalent categories exhibit the same categorical features, so we should expect the isomorphism $F i$ in the image of $F$ to correspond to an <em>isomorphism</em> $i$."
                ]
            ]
        , .mk
            "Example Uses"
            [ .body
                [ .ul
                    [ [ .s "The "
                      , .a "./yoneda-embedding-is-fully-faithful.html" "Yoneda Embedding is Fully Faithful"
                      , .s ", which enables \"equational style\" proofs of isomorphisms, relating them to isomorphisms in $|Set$."
                      ]
                    , [ .s "Any "
                      , .a "./characterisation-of-equivalences-of-categories.html" "equivalence of categories is fully faithful"
                      , .s ". Hence, one can identify isomorphisms in one category by recognising isomorphisms in an equivalent category. For example, since the "
                      , .a "./finite-dimensional-vector-spaces-equivalent-to-matrices.html" "category of finite-dimensional vector spaces is equivalent to the category of matrices"
                      , .s " (via a \"matrix representation\" functor), one can identify isomorphisms of vector spaces by recognising invertible matrices, which can often be done by computing determinants."
                      ]
                    ]
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "../discussion/functor.html" "Functor"
            , .mk "../discussion/isomorphism.html" "Isomorphism"
            , .mk "../discussion/fully-faithful.html" "Fully Faithful"
            , .mk "../discussion/equivalence-of-categories.html" "Equivalence of Categores"
            , .mk "./yoneda-embedding-is-fully-faithful.html" "Yoneda Embedding is Fully Faithful"
            , .mk "./characterisation-of-equivalences-of-categories.html" "Characterisation of Equivalences of Categories"
            , .mk "./finite-dimensional-vector-spaces-equivalent-to-matrices.html" "Linear Transformations are Equivalent to Matrices"
            ]
        }
    }
end FullyFaithfulFunctorsReflectIsomorphisms
