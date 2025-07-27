/- **FILE:** `Pages/Coinduction.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs
private def hrefs.algebraMorphism := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgYSJdLFsyLDAsImEiXSxbMiwyLCJiIl0sWzAsMiwiVFxcIGIiXSxbMCwxLCJcXGFscGhhIl0sWzEsMiwiZiJdLFswLDMsIlRcXCBmIiwyXSxbMywyLCJcXGJldGEiLDJdXQ=="
private def hrefs.recursionFromNat := "https://q.uiver.app/#q=WzAsNCxbMCwwLCIxICsgXFxtYXRoYmJ7Tn0iXSxbMiwwLCJcXG1hdGhiYntOfSJdLFsyLDIsIlgiXSxbMCwyLCIxICsgWCJdLFswLDEsIigwLCBcXHRleHR0dHtTdWNjfSkiXSxbMSwyLCJmIl0sWzAsMywiMV8xICsgZiIsMl0sWzMsMiwiKHhfMCwgdSkiLDJdXQ=="
private def hrefs.initialAlgebraUniversalProperty := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJUXFwgaSJdLFsyLDAsImkiXSxbMiwyLCJhIl0sWzAsMiwiVFxcIGEiXSxbMCwxLCJcXHRleHR7Y29uc30iXSxbMSwyLCJmIl0sWzAsMywiVFxcIGYiLDJdLFszLDIsIlxcYWxwaGEiLDJdXQ=="
private def hrefs.subobjectOfNat := "https://q.uiver.app/#q=WzAsNCxbMCwwLCIxICsgQSJdLFsyLDAsIkEiXSxbMiwyLCJcXG1hdGhiYntOfSJdLFswLDIsIjEgKyBcXG1hdGhiYntOfSJdLFswLDEsIlxcYWxwaGEiXSxbMSwyLCJcXGlvdGEiLDAseyJzdHlsZSI6eyJ0YWlsIjp7Im5hbWUiOiJob29rIiwic2lkZSI6InRvcCJ9fX1dLFswLDMsIjFfMSArIFxcaW90YSIsMix7InN0eWxlIjp7InRhaWwiOnsibmFtZSI6Imhvb2siLCJzaWRlIjoidG9wIn19fV0sWzMsMiwiKDAsIFxcdGV4dHR0e1N1Y2N9KSIsMl1d"
private def hrefs.coalgebraMorphism := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJhIl0sWzIsMCwiVFxcIGEiXSxbMCwyLCJiIl0sWzIsMiwiVFxcIGIiXSxbMCwxLCJcXGFscGhhIl0sWzAsMiwiZiIsMl0sWzIsMywiXFxiZXRhIiwyXSxbMSwzLCJUXFwgZiJdXQ=="
private def hrefs.terminalCoalgebraUniversalProperty := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJhIl0sWzIsMCwiVFxcIGEiXSxbMCwyLCJqIl0sWzIsMiwiVFxcIGoiXSxbMCwxLCJcXGFscGhhIl0sWzAsMiwiZiIsMl0sWzIsMywiXFx0ZXh0e2Rlc30iLDJdLFsxLDMsIlRcXCBmIl1d"
-- NOTE: `$$ ⋯ $$` contents



/- LAUNCH: -/

namespace Coinduction
  def it : Page :=
    { title :=
        "Coinduction"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.NLab.bisimulation
        , Bib.NLab.coinduction
        , Bib.NLab.corecursion
        , Bib.NLab.inductiveType
        , Bib.NLab.adamekFixedPointTheorem
        , Bib.NLab.terminalCoalgebra
        ]
    , sections :=
        [ .mk
            "Introduction"
            [ .body
                [ .p
                  [ .s "We aim to give a <em>simple</em> introduction to coinductive types and how to prove equality statements on them. We assume the reader is familiar with inductive types"
                  , .sn [.s "Also known as \"algebraic data types\" in some programming languages."]
                  , .s ". This article is programming-language agnostic, but we will write code in a Haskell-ish way when code is required. This article will include many exercises and proofs. They are all within reach; try to do them without having them spoiling them first!"
                  ]
                , .ps "This article is designed to be read linearly. Later sections depend on prior ones in essential ways, so skipping ahead may leave the reader confused."
                , .ps "Throughout, $0$ denotes either the number $0$ or the empty set, and $1 := |{0|}$ denotes the singleton set. The operator $+$ is used for disjoint union of sets and for addition of numbers."
                ]
            ]
        , .mk
            "Initial Algebras and Inductive Types: The Intuition and Construction"
            [ .body
                [ .ps "Coinductive types are dual to inductive types, so we first present a categorical view on induction."
                ]
            , .block
                { kind := .dfn
                , title := "Algebra"
                , body :=
                    [ .ps "Fix an endofunctor $T : |C → |C$ on a category $|C$. An <strong>algebra</strong> for $T$ consists of:"
                    , .ul
                        [ [.s "An object $a ∈ |C$;"]
                        , [.s "An arrow $α : T| a → a$ in $|C$."]
                        ]
                    , .ps "A <strong>morphism</strong> from an algebra $T| a |→{α} a$ to another algebra $T| b |→{β} b$ is a map $f : a → b$ in $|C$ such that"
                    , .cda { href := hrefs.algebraMorphism, height := some 302 }
                    , .ps "commutes."
                    ]
                }
            , .block
                { kind := .lem
                , title := "Algebras form a category"
                , outLink? :=
                    some { href := "../proofs/algebras-form-a-category.html" }
                , body :=
                    [ .ps "The algebras for an endofunctor $T : |C → |C$ form a category, equipped with identity arrows $1_{T| a |→{α} a} := 1_a$ and with composition of morphisms given by composition in $|C$."
                    ]
                }
            , .body
                [ .ps "Consider an algebra $T| A |→{α} A$ for an endofunctor $T : |Set → |Set$. To a programmer, the set $A$ may be the type of some data of interest. The map $α : T| A → A$ describes how to form data of that type, given other data from a transformed data type $T| A$."
                ]
            , .block
                { kind := .exa
                , body :=
                    [ .ps "Specialise $T : X ↦ 1 + X$. An algebra $T| A |→{α} A$ consists of two maps $1 |→{x_0} A$ and $A |→{u} A$; an element $x_0 ∈ A$ and a function $u$ to \"update\" an element of $A$ into another one. A famously chaotic example involves setting $A := [0, 1]$ and $u := x ↦ 2x |bmod 1$. For various values of $x_0$, the sequences $x_{i + 1} := u (x_i)$ behave vastly differently."
                    ]
                }
            , .body
                [ .ps "The functional programmer may see this as a setting to describe recursive functions. The transformed type $T| A$ describes the input to a recursive function &mdash; in the $T| A = 1 + A$ case, it is either a \"base case\" $0 ∈ 1$ or a \"recursive input\" from $A$ &mdash; and the function $α$ evaluates its input. The previous example illustrates this. However, one must take care to define recursive functions to ensure they always terminate."
                , .p
                  [ .s "A particularly \"nice\" type for recursion using $T$ would be one which is \"completely defined using this kind of recursion\" in the following sense. Consider forming a chain"
                  , .al
                      [ "&0"
                      , "|→{!} T| 0"
                      , "|→{T| !} T^2| 0"
                      , "|→{T^2| !} T^3| 0"
                      , "|→{T^3| !} ⋯"
                      ]
                  , .s "where $! : 0 → T| 0$ is the unique map recognising that the empty set is a subset of $T| 0$. One can think of this as \"starting with nothing, and freely adding elements that $T$ requires\". In our example, we have"
                  , .al
                      [ "&∅"
                      , "⊆ 1 + ∅"
                      , "⊆ 1 + (1 + ∅)"
                      , "⊆ 1 + (1 + (1 + ∅))"
                      , "⊆ ⋯"
                      , .alignBreak
                      , "|text{up to isomorphism:}|quad"
                      , "&∅"
                      , "⊆ ∅ ∪ |{0|}"
                      , "⊆ ∅ ∪ |{0|} ∪ |{1|}"
                      , "⊆ ∅ ∪ |{0|} ∪ |{1|} ∪ |{2|}"
                      , "⊆ ⋯"
                      , .alignBreak
                      , "|text{equivalently:}|quad"
                      , "&∅"
                      , "⊆ |{0|}"
                      , "⊆ |{0, 1|}"
                      , "⊆ |{0, 1, 2|}"
                      , "⊆ ⋯"
                      ]
                  , .s "Taking the colimit of this diagram, which in our example corresponds to taking the union of these nested sets, we arrive at the desired type. In our example, we do indeed have a natural map $T|left( |colim_{i ∈ ω} T^i 0 |right) → |colim_{i ∈ ω} T^i 0$ to make this into an algebra; it is the map $1 + ℕ → ℕ$ given by $1 → ℕ$ picking out the element $0$, and $ℕ → ℕ$ taking the successor of a natural number. The functional programmer would recognise these as the two <em>constructors</em> for the inductive type $ℕ$, and immediately recall the following <strong>recursion principle</strong>:"
                  ]
                ]
            , .block
                { kind := .other "Recursion principle for $ℕ$"
                , body :=
                    [ .ps "Fix a type $X$. To define a function $f : ℕ → X$, one needs only define a value $x_0 ∈ X$ to represent $f| 0$ and a function $u : X → X$ to update a value $f| n$ to the value of its successor $f| (|texttt{Succ}| n)$. The defined function then satisfies:"
                    , .ul
                        [ [.s "$f| 0 = x_0$;"]
                        , [.s "$f| (|texttt{Succ}| n) = u| (f| n)$ for all $n ∈ ℕ$;"]
                        ]
                    , .ps "and is the unique function with these properties."
                    ]
                }
            , .body
                [ .ps "The categorical framework is illuminating here. Foremost, the value $x_0 ∈ X$ and $u : X → X$ together define an algebra $1 + X |→{α} X$ for $T$. Next, the requirements on $f$ say exactly that it is an algebra morphism; i.e. the diagram"
                , .cda
                    { href := hrefs.recursionFromNat, height := some 302 }
                , .ps "commutes. Taken together, the recursion principle is exactly the statement that $1 + ℕ |→{(0, |texttt{Succ})} ℕ$ is an <strong>initial algebra</strong> for $T$."
                ]
            , .block
                { kind := .dfn
                , title := "Initial algebra"
                , body :=
                    [ .ps "An <strong>initial algebra</strong> for an endofunctor $T : |C → |C$ is an initial object in the category of algebras for $T$. Explicitly, it consists of an object $i ∈ |C$ and an arrow $T| i |→{|text{cons}} i$ in $|C$ with the following universal property: for any other object $a ∈ |C$ and map $T| a |→{α} a$, there is a unique map $f : i → a$ such that"
                    , .cda
                        { href := hrefs.initialAlgebraUniversalProperty, height := some 302 }
                    , .ps "commutes."
                    , .p
                      [ .s "In type theory and various programming languages, an initial algebra for a "
                      , .a "https://ncatlab.org/nlab/show/polynomial+functor" "polynomial endofunctor"
                      , .s " $T : |Type → |Type$ is often called its associated <strong>inductive type</strong> or <strong>algebraic data type</strong>. The map $|text{cons} : T| i → i$ can be thought of as providing the <strong>constructors</strong> for this type."
                      ]
                    ]
                }
            , .block
                { kind := .exr
                , title := "Initial algebras"
                , body :=
                    [ .ps "Play the same game as for our $T := X ↦ 1 + X$ example to identify the initial algebras of the following endofunctors $T : |Set → |Set$. Here, $A$ is a fixed set."
                    , .ul
                        [ [.s "$T := X ↦ A$ (i.e. a constant functor);"]
                        , [.s "$T := X ↦ 1 + A × X$;"]
                        , [.s "$T := X ↦ 1 + A × X^2$;"]
                        , [.s "$T := X ↦ X$."]
                        ]
                    , .p
                        [ .s "Check that your answers agree with the inductive type you would be forming in your functional programming language of choice"
                        , .sn [.s "Haskell's laziness is problematic here. Ignore the non-terminating terms you could form using Haskell's laziness, and consider only the terms whose computation will terminate."]
                        , .s "."
                        ]
                    , .ps "What does the use of the variable $X$ in the output of $T$ represent for the associated initial algebra?"
                    ]
                }
            , .body
                [ .ps "To the functional programmer, the universal property of an initial algebra may be thought of as its recursion principle."
                ]
            ]
        , .mk
            "Initial Algebras and Induction: The Results"
            [ .body
                [ .ps "As the programmer would hope, initial algebras are uniquely determined."
                ]
            , .block
                { kind := .rmk
                , title := "Initial algebras are uniquely determined"
                , body :=
                    [ .ps "Up to isomorphism of algebras, each endofunctor $T : |C → |C$ has at most one initial algebra. That is, any two initial algebras $T| i |→{ι} i$ and $T| i' |→{ι'} i'$ share a unique isomorphism $f : i ≃ j$ for which $f ∘ ι = ι' ∘ T| f$."
                    , .ps "The proof is trivial: initial objects in any category are uniquely determined."
                    ]
                }
            , .body
                [ .ps "The constructors $(0, |texttt{Succ}) : 1 + ℕ → ℕ$ are a bijection. This is not a coincidence:"
                ]
            , .block
                { kind := .lem
                , title := "Constructors are isomorphisms"
                , outLink? :=
                    some { href := "../proof/constructors-are-isomorphisms.html" }
                , body :=
                    [ .ps "Let $T| i |→{|text{cons}} i$ be the initial algebra for an endofunctor $T : |C → |C$. Then, $|text{cons} : T i ≃ i$ is an isomorphism in $|C$."
                    ]
                }
            , .block
                { kind := .exa
                , body :=
                    [ .ps "The constructors $(0, |texttt{Succ}) : 1 + ℕ ≃ ℕ$ express that <em>every</em> natural number is either zero or the successor of another natural number."
                    ]
                }
            , .body
                [ .ps "The natural numbers $ℕ$ famously come with an <em>induction principle</em>: to establish that a subset $A ⊆ ℕ$ is in fact all of $ℕ$, one proves that $0 ∈ A$ and $A$ is closed under $|text{Succ}$. In our framework, this is to say that the constructors $(0, |text{Succ})$ form an algebra on $A$. Taking an even more categorical focus, it is to say that we have an algebra structure $1 + A |→{α} A$ which is a sub-object of $ℕ$ (in the category of algebras); i.e. we have an injection $ι : A → ℕ$ such that"
                , .cda
                    { href := hrefs.subobjectOfNat, height := some 302 }
                , .ps "commutes. In this language, the induction principle states that <em>$ℕ$ has no proper subalgebras</em>. This generalises:"
                ]
            , .block
                { kind := .lem
                , title := "Initial objects have no proper subobjects"
                , outLink? :=
                    some { href := "../proof/initial-objects-have-no-proper-subobjects.html" }
                , body :=
                    [ .ps "Let $i$ be the initial object in a category $|C$, and let $ι : a ↣ i$ be a monomorphism into $i$. Then, $ι$ is an isomorphism in $|C$."
                    ]
                }
            , .block
                { kind := .exa
                , body :=
                    [ .ps "Take $|C$ in the previous lemma to be the category of algebras for upcoming choices of endofunctors $T : |Set → |Set$. The initial object $i$ in the previous lemma will then be the associated initial algebra for $T$."
                    , .ul
                        [ [.s "For $T : X ↦ 1 + X$, the lemma recovers the induction principle of $ℕ$ described before. Identifying a subset $X ⊆ ℕ$ with its predicate $P : ℕ → |texttt{Bool}$ (which assigns $|texttt{true}$ to the elements of $X$ and $|texttt{false}$ to everything in $ℕ |setminus X$), we get the more familiar induction rule: to prove $∀ n ∈ ℕ,|, P| n$, we need only prove $P| 0$ and $∀ n ∈ ℕ,|, P| n ⟹ P| (|texttt{Succ}| n)$."
                          ]
                        , [.s "For $T : X ↦ 1 + A × X$ (with $A$ a fixed set), the lemma recovers the induction principle of its initial algebra $|texttt{List}| A$. Translating from subsets  of $|texttt{List}| A$ to characteristic predicates $P : ℕ → |tt{Bool}$, we have the familiar structural induction rule: to prove $∀ |rm{xs} ∈ |tt{List}| A,|, P| |rm{xs}$, we need only prove $P| []$ and $∀ |rm{xs} ∈ |tt{List}| A, ∀ a ∈ {A},|, P| |rm{xs} ⟹ P| (a :: |rm{xs})$."
                          ]
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Play the same game to determine the induction rules for the initial algebras of the following endofunctors $T : |Set → |Set$. Here, $A$ is a fixed set."
                    , .ul
                        [ [.s "$T : X ↦ 1 + A × X^2$;"]
                        , [.s "$T : X ↦ A$;"]
                        , [.s "$T : X ↦ X$."]
                        ]
                    , .ps "Check that the first two agree with the relevant structural induction schemas, and explain why the third is useless."
                    ]
                }
            , .body
                [ .ps "The previous lemma has another use case which will seem trivial now, but will be a key example when we move to explain coinduction. It can be used to prove that two maps out from an initial algebra are equal, even if the target is not equipped with an algebra structure."
                ]
            , .block
                { kind := .lem
                , title := "Simple inductive rule for proving that maps out of initial algebras are equal"
                , outLink? :=
                    some { href := "../proof/simple-inductive-rule-for-initial-algebras.html" }
                , body :=
                    [ .ps "Let $T| i |→{|cons} i$ be the initial algebra for an endofunctor $T : |C → |C$ and let $f, g : i → a$ be parallel arrows out of $i$. Suppose that the equaliser $ι : e ↣ i$ of $f$ and $g$ exists in $|C$. Suppose that $f ∘ |cons ∘ T| ι = g ∘ |cons ∘ T| ι$. Then, $f = g$."
                    , .ps "Note that $a$ is not required to have an algebra structure $T| a → a$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Let $T : X ↦ 1 + X$ be the endofunctor $|Set → |Set$ with initial algebra $ℕ$, and let $f, g : ℕ → A$ be two parallel functions out of $ℕ$. Identify the requirements for proving that $f ∘ |cons ∘ T| ι = g |cons ∘ T| ι$ in the previous lemma, and explain why this lemma is not of interest for initial algebras."
                    , .ps "The dual result, which we will comment on in a coming section, <em>is</em> interesting."
                    ]
                }
            , .body
                [ .ps "We stress that induction is not the <em>only</em> way to prove results about initial algebras."
                ]
            , .body
                [ .ps "In the previous section, we gave a construction of inductive types which worked for every stated exercise. Unfortunately, this construction does not always work. Under the following circumstances, it does:"
                ]
            , .block
                { kind := .thm
                , title := "Adámek's fixed point theorem"
                , outLink? :=
                    some { href := "../proof/adamek-fixed-point-theorem.html" }
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
                        -- , .sn -- NOTE: This sidenote is too long, and clashes with the next one. Include it on the dedicated `Adámek's Fixed Point Theorem` page, but not here.
                        --   [ .s "The first isomorphism is because $T$ preserves the colimit. The second isomorphism is obtained by re-indexing the term in the colimit; adding $0 → T| 0$ to the diagram does not impose extra requirements on the colimit cocone."
                        --   ]
                        , .s " gives $|colim_{i ∈ ω} T^i 0$ an algebra structure for $T$. Furthermore, $T(|colim_{i ∈ ω} T^i 0) ≃ |colim_{i ∈ ω} T^i 0$ is an initial algebra."
                        ]
                    , .p
                        [ .s "The statement of this result was adapted from "
                        , .a "https://ncatlab.org/nlab/show/Ad%C3%A1mek%27s+fixed+point+theorem" "this nLab article"
                        , .s "."
                        ]
                    ]
                }
            , .body
                [ .p
                    [ .s "One can think of this result as constructing the initial algebra by looking at how the various recursively constructed $T^i 0$ \"sit inside\" one another, and \"closing the gaps $T^i 0 → T^{i + 1} 0$ at infinity\""
                    , .sn [.s "The same idea appears in the proof of Theorem 5.6.12 in <em>Category Theory in Context</em>."]
                    , .s ". The assumption that $T$ preserves the constructed colimit can be thought of as a \"finiteness\" condition on $T$."
                    ]
                ]
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Let $n$ be a (finite) natural number. Verify that the assumptions of the previous theorem are satisfied for $T : X ↦ 1 + X^n$, and thereby construct the set of $n$-ary trees."
                    , .ps "Now take $n := |aleph_0 ≃ ℕ$ to be infinite. Show that the construction in the previous theorem does not yield an initial algebra for $T : X ↦ 1 + X^n$. (It may help to open a functional programming language and construct various terms of the type $|tt{data}| |tt{Thing} = |tt{Empty} |mathbin{|vert} |tt{Sequence}| (|tt{Nat} → |tt{Thing})$.)"
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "We have not concerned ourselves with <em>terminal</em> algebras for an endofunctor $T : |C → |C$. Take any endofunctor $T$ on $|C := |Set$ and construct its terminal algebra. Why is it uninteresting? How can you generalise to an arbitrary category $|C$?"
                    ]
                }
            ]
        , .mk
            "Terminal Coalgebras and Coinductive Types: A First Example"
            [ .body
                [ .ps "As with any abstract nonsense, our discussion thus far can be dualised, yielding coalgebras, corecursion and coinduction. In this section, we will construct the <em>conatural numbers</em>, dual to the natural numbers."
                ]
            , .block
                { kind := .dfn
                , title := "Coalgebra"
                , body :=
                    [ .ps "Fix an endofunctor $T : |C → |C$. A <strong>coalgebra</strong> for $T$ is an algebra in $|C^{|op}$ for $T : |C^{|op} → |C^{|op}$. Explicitly, it consists of:"
                    , .ul
                        [ [ .s "An object $a ∈ |C$;" ]
                        , [ .s "An arrow $α : a → T| a$ in $|C$." ]
                        ]
                    , .ps "A <strong>morphism</strong> from a coalgebra $a |→{α} T| a$ to another coalgebra $b |→{β} T| b$ is a map $f : a → b$ in $|C$ such that"
                    , .cda
                        { href := hrefs.coalgebraMorphism, height := some 302 }
                    , .ps "commutes. Equivalently, it is a morphism from the algebra $T| b |→{β} b$ in $|C^{|op}$ to the algebra $T| a |→{α} a$ in $|C^{|op}$."
                    ]
                }
            , .block
                { kind := .exr
                , title := "Coalgebras form a category"
                , body :=
                    [ .ps "Dualise the relevant lemma to show that coalgebras form a category. What are the identity morphisms and composites?"
                    ]
                }
            , .body
                [ .p
                    [ .s "An algebra $A |→{α} T| A$ for an endofunctor $T : |Set → |Set$ can be thought of programmatically as follows. The set $A$ represents a data type of interest, and $T| A$ represents a different type of \"observations\" that could be made about $A$. The map $α : A → T| A$ specifies a way of observing $A$ in $T| A$. By continually applying $α$ to the occurances of $A$ which appear in $T| A$, one could form a chain of observations"
                    , .al
                        [ "A"
                        , "|→{α} T| A"
                        , "|→{T| α} T^2| A"
                        , "|→{T^2| α} T^3| A"
                        , "|→{T^3| α} ⋯"
                        ]
                    , .s "which could be interpreted as describing the \"evolution\" of a starting element of $A$ over time."
                    ]
                ]
            , .block
                { kind := .exa
                , body :=
                    [ .p
                        [ .s "Specialise to $T : X ↦ |{|no|} + X$ (here $|no$ is a special symbol, whose name will be useful later). Let $V$ be the vertex set of a maze, equipped with a special vertex $v_{|text{exit}}$ marking the exit of the maze. We can model a simple strategy for solving the maze as follows. Construct a function $α : V → T| V$ by setting $α| v_{|text{exit}} := |no$, and letting $α| v$ be any element of $V$ with an edge connecting $v$ to $α| v$, for $v ≠ v_{|text{exit}}$. A strategy of this kind has no memory. From a starting vertex $v_{0} ∈ V$, the trace"
                        , .al
                            [ "v_{0}"
                            , "∈ V"
                            , "|→{α} |No + V"
                            , "|→{T| α} |No + (|No + V)"
                            , "|→{T^2| α} |No + (|No + (|No + V))"
                            , "|→{T^3| α} ⋯"
                            ]
                        , .s "illustrates how this strategy evolves over time. If $α$ finds $v_{|text{end}}$ from $v_{|text{start}}$ in exactly two moves, we would have"
                        , .al
                            [ "v_{0}"
                            , "↦ |tt{Right}| v_1"
                            , "↦ |tt{Right}| (|tt{Right}| v_{|text{end}})"
                            , "↦ |tt{Left}| |no"
                            , "↦ |tt{Right}| (|tt{Left}| |no)"
                            , "↦ |tt{Right}| (|tt{Right}| (|tt{Left}| |no))"
                            , "↦ ⋯"
                            ]
                        , .s "We can re-cast this as follows. The sequence $V → |No + V → ⋯$ of sets is isomorphic to a sequence"
                        , .al
                            [ "V"
                            , "→ |{0|} + V"
                            , "→ |{0, 1|} + V"
                            , "→ |{0, 1, 2|} + V"
                            , "→ |{0, 1, 2, 3|} + V"
                            , "→ ⋯"
                            ]
                        , .s "The first arrow sends $v ∈ V$ to $|tt{Left}| 0$ if $v = v_{|text{end}}$, or to $|tt{Right}| (α| v)$ otherwise. The second arrow maps $|tt{Left}| 0$ to $|tt{Left}| 0$, it maps $|tt{Right}| v_{|text{end}}$ to $|tt{Left}| 1$, and it maps $|tt{Right}| v$ to $|tt{Right}| (α| v)$ for $v ≠ v_{|text{end}}$. The third arrow operates similarly, sending $|tt{Left}| i$ to $|tt{Left}| i$, sending $|tt{Right}| v_{|text{end}}$ to $|tt{Left}| 2$, and sending $|tt{Right}| v$ to $|tt{Right}| (α| v)$ for $v ≠ v_{|text{end}}$; etc. In this light, the evolution of our starting vertex $v_0$ would be"
                        , .al
                            [ "v_0"
                            , "↦ |tt{Right}| v_1"
                            , "↦ |tt{Right}| v_{|text{end}}"
                            , "↦ |tt{Left}| 2"
                            , "↦ |tt{Left}| 2"
                            , "↦ |tt{Left}| 2"
                            , "↦ ⋯"
                            ]
                        , .s "The \"settled down\" part of the sequence $|tt{Left}| 2 ↦ ⋯$ identifies that $α$ found the exit at index $2$ in the sequence. If $α$ never finds the exit (i.e. if the strategy gets caught in a cycle of the maze), we instead see a trace"
                        , .al
                            [ "v_0"
                            , "↦ |tt{Right}| v_1"
                            , "↦ |tt{Right}| v_2"
                            , "↦ |tt{Right}| v_3"
                            , "↦ |tt{Right}| v_4"
                            , "↦ ⋯"
                            ]
                        , .s "There is no \"settled down\" or \"terminated\" part of this sequence."
                        ]
                    ]
                }
            , .body
                [ .ps "Let's turn our attention to terminal coalgebras."
                ]
            , .block
                { kind := .dfn
                , title := "Terminal coalgebra"
                , body :=
                    [ .ps "A <strong>terminal coalgebra</strong> for an endofunctor $T : |C → |C$ is a terminal object in the category of coalgebras for $T$. Explicitly, it consists of an object $j ∈ |C$ and an arrow $j |→{|des} T| j$ with the following universal property: for any other object $a ∈ |C$ and map $a |→{α} T| a$, there is a unique map $f : a → j$ such that"
                    , .cda
                        { href := hrefs.terminalCoalgebraUniversalProperty, height := some 302 }
                    ]
                }
            , .body
                [ .ps "We saw that the initial algebra for $T : X ↦ 1 + X$ is the natural numbers with their constructors $1 + ℕ |→{(0, |tt{Succ})} ℕ$. This algebra measures the depth of recursive computations of algebras $1 + A → A$, and is \"freely generated by recursion\". One could guess that the dual <em>terminal coalgebra</em> for $T$ would measure the length of a continual evolution along a coalgebra $A → |No + A$. In fact, the dual construction to Adámek's fixed point theorem works for this terminal coalgebra."
                ]
            , .block
                { kind := .exa
                , title := "Constructing the conatural numbers"
                , body :=
                    [ .p
                        [ .s "Dual to the natural numbers, the terminal coalgebra for $T : X ↦ |No + X$ is known as the set of <strong>conatural numbers</strong>. Let $?$ be a symbol not appearing in $ℕ$. The conatural numbers can be constructed as the limit of the sequence"
                        , .eqn -- The first two cells in the `array` environment are supposed to be blank here. The second column is supposed to be blank
                            " |begin{array}{lllllllllll}
                                &
                                &⋯
                                & |→{T^3| !}
                                & T^3| |?
                                & |→{T^2| !}
                                & T^2| |?
                                & |→{T| !}
                                & T| |?
                                & |→{!}
                                & |?
                                ||
                                =
                                &
                                &⋯
                                & |longrightarrow
                                & |No + (|No + (|No + |?))
                                & |longrightarrow
                                & |No + (|No + |?)
                                & |longrightarrow
                                & |No + |?
                                & |longrightarrow
                                & |?
                                ||
                                ≃
                                &
                                &⋯
                                & |longrightarrow
                                & |{2|} + (|{1|} + (|{0|} + |?))
                                & |longrightarrow
                                & |{1|} + (|{0|} + |?)
                                & |longrightarrow
                                & |{0|} + |?
                                & |longrightarrow
                                & |?
                                ||
                                ≃
                                &
                                &⋯
                                & |longrightarrow
                                & |{2, 1, 0|} + |?
                                & |longrightarrow
                                & |{1, 0|} + |?
                                & |longrightarrow
                                & |{0|} + |?
                                & |longrightarrow
                                & |?
                              |end{array}
                            "
                        , .s "In the bottom sequence, the final arrow is the unique map $|{0|} + |? → |?$, which sends $|tt{Left}| 0 ↦ {?}$ and $|tt{Right}| ? ↦ {?}$. The second-last arrow is the map which sends $|tt{Left}| 1 ↦ |tt{Left}| 0$ and maps the other two values to $|tt{Right}| ?$. The third-last arrow maps $|tt{Left}| 2 ↦ |tt{Left}| 1$, maps $|tt{Left}| 1 ↦ |tt{Left}| 0$, and maps the other two values to $|tt{Right}| ?$."
                        ]
                    , .p
                        [ .s "The limit of the bottom sequence is the set"
                        , .eqn
                            " |lim_{i ∈ ω^{|op}} T^i |?
                              ≃ |left|{
                                |left(
                                |dots,
                                x_2,
                                x_1,
                                x_0
                                |right)
                                |given
                                |text{each } x_i ∈ |{i - 1, |dots, 0|} + |?
                                |text{ and each } x_{i + 1} ↦ x_i |text{ in the sequence}
                              |right|}
                            "
                        , .s "and the limit cone consists of the projection maps onto each $x_i ∈ |{i - 1, |dots, 0|} + |?$. For example, the limit contains the following elements:"
                        , .al
                            [ "(|dots, 3, 2, 1, 0, ?)"
                            , "&& (|dots, 2, 1, 0, ?, ?)"
                            , "&& (|dots, 1, 0, ?, ?, ?)"
                            , "&& (|dots, 0, ?, ?, ?, ?)"
                            ]
                        , .s "We can think of these elements as starting on the right with a \"play token\" $`?|text{'}$, and moving left. Whenever we have a $`?|text{'}$ token, we can choose to swap it out for a $0$ (and thereafter begin counting up), or to retain the $`?|text{'}$ token. There is also a special element"
                        , .al
                            [ "(|dots, ?, ?, ?, ?, ?)"
                            ]
                        , .s "given by always choosing to retain the token. This suggests a bijection"
                        , .al
                            [ "(|dots, 3, 2, 1, 0, ?) &↔ 0 ,"
                            , "& (|dots, 2, 1, 0, ?, ?) &↔ 1,"
                            , "& (|dots, 1, 0, ?, ?, ?) &↔ 2,"
                            , "& ⋯ & ,"
                            , "& (|dots, ?, ?, ?, ?, ?) &↔ ∞"
                            ]
                        , .s "which assigns to an element of the limit to the index, counted from the right, of its last $`?|text{'}$ token. This bijection identifies the limit"
                        , .al
                            [ "|lim_{i ∈ ω^{|op}} T^i |?"
                            , "≃ |coℕ"
                            , ":= ℕ + |{∞|}"
                            ]
                        , .s "with the set of <em>conatural numbers</em>."
                        ]
                    , .p
                        [ .s "The dual to Adámek's fixed point theorem asserts that this construction forms the terminal coalgebra of $T$ so long as $T$ preserves this limit. Indeed, the function"
                        , .al
                            [ "|pred"
                            , ": |coℕ"
                            , "&|longrightarrow"
                            , "|No + |coℕ"
                            , .alignBreak
                            , "0"
                            , "&|longmapsto"
                            , "|no"
                            , .alignBreak
                            , "n + 1"
                            , "&|longmapsto"
                            , "n"
                            , .alignBreak
                            , "∞"
                            , "&|longmapsto"
                            , "∞"
                            ]
                        , .s "which maps a conatural number to its predecessor is an isomorphism. Some careful checking, left as an exercise to the reader, that this map commutes with the relevant limit cones indeed verifies that $T$ preserves the limit. Therefore $|coℕ |→{|pred} |No + |coℕ$ is the coalgebra of $T : X ↦ |No + X$."
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Verify that $|pred$ commutes with the relevant limit cones, so that $T : X ↦ |No + X$ preserves the limit $|lim_{i ∈ ω^{|op}} T^i |?$ constructed above. Alternatively, verify directly that $|coℕ |→{|pred} |No + |coℕ$ satisfies the universal property of the terminal coalgebra."
                    ]
                }
            , .body
                [ .ps "FIXME: The rest of the owl! Simple corecursion! Show how the conatural numbers measure non-terminating evolutions (i.e. \"colists\", without saying that word)!"
                ]
            ]
        -- FIXME: Section `"Terminal Coalgebras and Coinductive Types: Further Examples"`
        -- FIXME: Section `"Terminal Coalgebras and Coinduction: The Results"`
        -- FIXME: Section `"Terminal Coalgebras and Coinduction: Example Proofs"`
        -- FIXME: Section `"Summary"`
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "" "FIXME: Fill out the list of links! Go dig up all of the results you've catalogued."
            ]
        }
    , preamble :=
        «authoring defs».translations
        ++  #[  («authoring defs».esc "cons", "\\texttt{cons}")
            ,   («authoring defs».esc "des", "\\texttt{des}")
            ,   («authoring defs».esc "no", "\\text{no}")
            ,   («authoring defs».esc "No", "\\{\\text{no}\\}")
            ,   («authoring defs».esc "co", "\\mathrm{co}")
            ,   («authoring defs».esc "?", "\\{?\\}")
            ,   («authoring defs».esc "pred", "\\mathrm{pred}")
            ,   («authoring defs».esc "pop", "\\mathrm{pop}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end Coinduction
