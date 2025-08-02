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
private def hrefs.conatCorecursion := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJBIl0sWzIsMCwiXFx7XFx0ZXh0e25vfVxcfSArIEEiXSxbMCwyLCJcXG1hdGhybXtjb31cXG1hdGhiYntOfSJdLFsyLDIsIlxce1xcdGV4dHtub31cXH0gKyBcXG1hdGhybXtjb31cXG1hdGhiYntOfSJdLFswLDEsIlxcYWxwaGEiXSxbMCwyLCJmIiwyXSxbMiwzLCJcXG1hdGhybXtwcmVkfSIsMl0sWzEsMywiMV97XFx7XFx0ZXh0e25vfVxcfX0gKyBmIl1d"
private def hrefs.colistCorecursion := "https://q.uiver.app/#q=WzAsNCxbMCwwLCJYIl0sWzIsMCwiXFx7XFx0ZXh0e25vfVxcfSArIEEgXFx0aW1lcyBYIl0sWzAsMiwiXFx0ZXh0dHR7Y29MaXN0fVxcIEEiXSxbMiwyLCJcXHtcXHRleHR7bm99XFx9ICsgQSBcXHRpbWVzIChcXHRleHR0dHtjb0xpc3R9XFwgQSkiXSxbMCwxLCJcXGFscGhhIl0sWzAsMiwiXFx0ZXh0dHR7Y29yZWN9XFwgXFxhbHBoYSIsMl0sWzIsMywiXFxtYXRocm17cG9wfSIsMl0sWzEsMywiMV97XFx7XFx0ZXh0e25vfVxcfX0gKyAxX0EgXFx0aW1lcyAoXFx0ZXh0dHR7Y29yZWN9XFwgXFxhbHBoYSkiXV0="
private def hrefs.simpleCoinduction := "https://q.uiver.app/#q=WzAsNSxbMCwxLCJqIl0sWzAsMCwiYSJdLFswLDIsImUiXSxbMiwyLCJUXFwgZSJdLFsyLDEsIlRcXCBqIl0sWzEsMCwiZiIsMix7Im9mZnNldCI6MX1dLFsxLDAsImciLDAseyJvZmZzZXQiOi0xfV0sWzAsMiwiXFxwaSIsMix7InN0eWxlIjp7ImhlYWQiOnsibmFtZSI6ImVwaSJ9fX1dLFswLDQsIlxcbWF0aHJte2Rlc30iXSxbNCwzLCJUXFwgXFxwaSJdLFsyLDMsIiIsMix7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dXQ=="
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
        , { accessDate  :=  some { year := 2025, month := some 8 }
          , authors     :=  [ .pseudo "Wikibooks authors"
                            ]
          , title       :=  "Haskell/Applicative functors"
          , url         :=  "https://en.wikibooks.org/wiki/Haskell/Applicative_functors"
          }
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
                [ .ps "The natural numbers $ℕ$ famously come with an <em>induction principle</em>: to establish that a subset $A ⊆ ℕ$ is in fact all of $ℕ$, one proves that $0 ∈ A$ and $A$ is closed under $|text{Succ}$. In our framework, this is to say that the constructors $(0, |text{Succ})$ form an algebra on $A$. Taking a more categorical focus, it is to say that we have an algebra structure $1 + A |→{α} A$ which is a sub-object of $ℕ$ (in the category of algebras); i.e. we have an injection $ι : A |hookrightarrow ℕ$ such that"
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
                    [ .ps "Let $T| i |→{|cons} i$ be the initial algebra for an endofunctor $T : |C → |C$ and let $f, g : i → a$ be parallel arrows out of $i$. Suppose that the equaliser $ι : e ↣ i$ of $f$ and $g$ exists in $|C$. Then, if $f ∘ |cons ∘ T| ι = g ∘ |cons ∘ T| ι$, we must have $f = g$."
                    , .ps "Note that $a$ is not required to have an algebra structure $T| a → a$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Let $T : X ↦ 1 + X$ be the endofunctor $|Set → |Set$ with initial algebra $ℕ$, and let $f, g : ℕ → A$ be two parallel functions out of $ℕ$. Identify the requirements for proving that $f ∘ |cons ∘ T| ι = g ∘ |cons ∘ T| ι$ in the previous lemma, and explain why this lemma is not of interest for initial algebras."
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
                [ .ps "We saw previously that the recursion principle for the natural numbers was encoded by the fact that $1 + ℕ |→{(0, |tt{Succ})} ℕ$ is an initial algebra for $X ↦ 1 + X$. Duality allows us to define a <strong>corecursion principle</strong> for the conatural numbers, useful for constructing maps into $|coℕ$."
                ]
            , .block
                { kind := .other "Corecursion principle for $|coℕ$"
                , body :=
                    [ .ps "Let $A$ be a set. To define a function $f : A → |coℕ$, it suffices to define a map $α : A → |No + A$. The defined map $f$ is the unique function $A → |coℕ$ such that"
                    , .cda
                        { href := hrefs.conatCorecursion, height := some 302 }
                    , .p
                        [ .s "commutes; i.e."
                        , .al
                            [ "|pred| (f| a)"
                            , "&= |tt{case}| α| a| |tt{of}"
                            , .alignBreak
                            , "&|quad|quad |tt{Left}| |no"
                            , "→ |tt{Left}| |no"
                            , .alignBreak
                            , "&|quad|quad |tt{Right}| b"
                            , "→ |tt{Right}| (f| b)"
                            ]
                        , .s "for all $a ∈ A$. Importantly, the only way to have $|pred| (f| a) = |no$ is to have $α| a = |no$."
                        ]
                    , .p
                        [ .s "When we wish to define a function into $|coℕ$ corecursively in this article, we will write $f := |tt{corec}| α$. A Haskell implementation of $|tt{corec}$ is"
                        , .al
                            [ "&|tt{corec} :: (A → |tt{Either}| |No| A) → A → |coℕ"
                            , .alignBreak
                            , "&|tt{corec}| α| a ="
                            , .alignBreak
                            , "&|quad|quad|tt{case}| α| a| |tt{of}"
                            , .alignBreak
                            , "&|quad|quad|quad|quad |tt{Left}| |no → 0"
                            , .alignBreak
                            , "&|quad|quad|quad|quad |tt{Right}| b → |tt{Right}| (|tt{Succ}| (f| b))"
                            ]
                        , .s "where, thanks to Haskell's laziness, one may use the type $|tt{data CoNat = Zero } |vert| |tt{ Succ| CoNat}$ in place of $|coℕ$ (albeit computation of the term $∞$ will never terminate)."
                        ]
                    ]
                }
            , .block
                { kind := .exa
                , title := "Defining $0 ∈ |coℕ$ corecursively"
                , body :=
                    [ .ps "The element $|tt{Zero} ∈ |coℕ$ is given by $|tt{Zero} := |tt{corec}| (λ| |tt{|textunderscore} → |no)| 0$. In the above diagram, we have taken $α : 1 → |No + 1$ by setting $α| 0 := |no$. We will henceforth write $0$ instead of $|tt{Zero}$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Check that $0$ is the unique element of $|coℕ$ with $|pred| 0 = |no$."
                    ]
                }
            , .block
                { kind := .exa
                , title := "Defining $∞ ∈ |coℕ$ corecursively"
                , body :=
                    [ .ps "The only other choice for a function $α : 1 → |No + 1$ is given by setting $α| 0 := 0$. The element $x := |corec| (λ| |tt{|textunderscore} → 0)| 0$ of $|coℕ$ is the unique element satisfying $|pred| x = x$, which is $x = ∞$."
                    ]
                }
            , .body
                [ .ps "We saw earlier that $|coℕ = ℕ + |{|infty|}$, and have been able to construct the elements $0, ∞ ∈ |coℕ$. We now show how to corecursively identify all the elements of $|coℕ$ which lie in $|coℕ$."
                ]
            , .block
                { kind := .exr
                , title := "Identifying $ℕ$ within $|coℕ$"
                , body :=
                    [ .ps "The constructors of $ℕ$ are a bijection $(0, |Succ) : 1 + ℕ ≃ ℕ$, whose inverse is the <em>predecessor</em> map $|pred : ℕ → |No + ℕ$ (with $|pred| 0 := |no$). Define $ι : ℕ → |coℕ$ by $ι := |corec| |pred$. Show that $ι$ is an injection, and it maps the elements of $ℕ$ to the corresponding elements of $|coℕ$ (i.e. $|pred| (ι| 0) = |no$, $|pred| (ι| 1) = 0$, $|pred| (ι| 2) = 1$, etc.)."
                    ]
                }
            , .body
                [ .p
                    [ .s "To conclude this section, we return to our example on using coalgebras for $X ↦ |No + X$ to model memoryless maze-solving strategies. We saw that a strategy $α : V → |No + V$ generates a chain"
                    , .al
                        [ "V"
                        , "|longrightarrow |{0|} + V"
                        , "|longrightarrow |{0, 1|} + V"
                        , "|longrightarrow |{0, 1, 2|} + V"
                        , "|longrightarrow |{0, 1, 2, 3|} + V"
                        , "|longrightarrow ⋯"
                        ]
                    , .s "and various starting vertices $u_0, v_0, w_0 ∈ V$ evolved through the chain, perhaps arriving at the exit vertex $v_{|text{exit}}$:"
                    , .eqn
                        " |begin{array}{ccccccccc}
                            V
                            & |longrightarrow
                            & |{0|} + V
                            & |longrightarrow
                            & |{0, 1|} + V
                            & |longrightarrow
                            & |{0, 1, 2|} + V
                            & |longrightarrow
                            & |{0, 1, 2, 3|} + V
                            & |longrightarrow
                            & ⋯
                            ||
                            u_0 = v_{|text{exit}}
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & ⋯
                            ||
                            v_0
                            & |longmapsto
                            & |Right| v_1
                            & |longmapsto
                            & |Right| v_{|text{exit}}
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & |Left| |no
                            & |longmapsto
                            & ⋯
                            ||
                            w_0
                            & |longmapsto
                            & |Right| w_1
                            & |longmapsto
                            & |Right| w_2
                            & |longmapsto
                            & |Right| w_3
                            & |longmapsto
                            & |Right| w_4
                            & |longmapsto
                            & ⋯
                          |end{array}
                        "
                    ]
                , .p
                    [ .s "What is the corresponding function $f := |corec| α : V → |coℕ$? For a chain $⋯ |xmapsto{α} x_2 |xmapsto{α} x_1 |xmapsto{α} v_{|text{exit}} |xmapsto{α} |no$, we have"
                    , .al
                        [ " |begin{array}{lcccr}"
                        , "   α| v_{|text{exit}}"
                        , "   = |no"
                        , "   &|implies"
                        , "   & |pred| (f| v_{|text{exit}})"
                        , "   = |no"
                        , "   &|implies"
                        , "   & f| v_{|text{exit}}"
                        , "   = 0"
                        ,     .alignBreak
                        , "   α| x_1"
                        , "   = v_{|text{exit}}"
                        , "   &|implies"
                        , "   & |pred| (f| x_1)"
                        , "   = f| v_{|text{exit}}"
                        , "   = 0"
                        , "   & |implies"
                        , "   & f| x_1"
                        , "   = 1"
                        ,     .alignBreak
                        , "   α| x_2"
                        , "   = x_1"
                        , "   & |implies"
                        , "   & |pred| (f| x_2)"
                        , "   = f| x_1"
                        , "   = 1"
                        , "   & |implies"
                        , "   & f| x_2"
                        , "   = 2"
                        , " |end{array}"
                        ]
                    , .s "which suggests that $f| x_i = i$ measures the number of steps $α$ takes to find the exit from the vertex $x_i$. For an endless chain $y_0 |xmapsto{α} y_1 |xmapsto{α} ⋯$ which never finds the exit, we must have"
                    , .al
                        [ "f| y_0"
                        , "|xmapsto{|pred} f| y_1| |textcolor{gray}{(≠ |no)}"
                        , "|xmapsto{|pred} f| y_2| |textcolor{gray}{(≠ |no)}"
                        , "|xmapsto{|pred} f| y_2| |textcolor{gray}{(≠ |no)}"
                        , "|xmapsto{|pred} ⋯"
                        ]
                    , .s "This implies that $f| y_0 = f| y_1 = ⋯ = ∞$, also correctly measuring the number of steps which $α$ takes to find the exit."
                    ]
                ]
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Let $A |→{α} |No + A$ be a coalgebra, and consider the map $|corec| α : A → |coℕ$. Convince yourself that for all $a ∈ A$, the value $|corec| α| a$ is the index in the sequence $a |xmapsto{α} ⋯$ at which $α$ \"fails\", returning $|no$ rather than an element of $A$."
                    ]
                }
            ]
        , .mk
            "Terminal Coalgebras and Coinductive Types: Further Examples"
            [ .body
                [ .ps "The natural numbers measure the lengths of (finite) lists, where $1 + A × |List| A |→{([],|, (:))} |List| A$ is the initial algebra for $X ↦ 1 + A × X$ (for a fixed set $A$). In fact, $ℕ ≃ |List| 1$. We now generalise this, defining <strong>colists</strong> and investigating their relationship with the conatural numbers."
                ]
            , .block
                { kind := .dfn
                , title := "Colists"
                , body :=
                    [ .ps "Fix a set $A$. The terminal coalgebra $|coList| A |→{|pop} |No + A × (|coList| A)$ for $X ↦ 1 + A × X$ consists of the set $|coList| A$ of <strong>colists over $A$</strong>, together with the <strong>destructor</strong> $|pop$."
                    , .p
                        [ .s "We can construct $|coList| A$ analogously to how we constructed $|coℕ$. Tracing through the details, we find that"
                        , .sn
                            [ .s "We could have used round parentheses rather than square brackets here, but I've chosen to stick closer the Haskell list notation."
                            ]
                        , .al
                            [ " |coList| A"
                            , " := |left|{"
                            , "   [], [a_0], [a_0, a_1], |dots"
                            , "   |given"
                            , "   a_0, a_1, |dots ∈ A"
                            , " |right|}"
                            , " ∪ |left|{"
                            , "   [a_0, a_1, |dots]"
                            , "   |given"
                            , "   a_0, a_1, |dots ∈ A"
                            , " |right|}"
                            ]
                        , .s "Thus, the set of colists over $A$ consists not only of the finite-length lists, but also the infinite <strong>streams</strong> $[a_0, a_1, |dots]$ over $A$."
                        ]
                    , .p
                        [ .s "The destructor $|pop$ acts by removing an element from the head of a colist, if possible. Explicitly,"
                        , .al
                            [ "& |pop| []"
                            , ":= |no"
                            , .alignBreak
                            , "& |pop| [a_0]"
                            , ":= (a_0, [])"
                            , .alignBreak
                            , "& |pop| [a_0, a_1]"
                            , ":= (a_0, [a_1])"
                            , .alignBreak
                            , "& |pop| [a_0, a_1, a_2]"
                            , ":= (a_0, [a_1, a_2])"
                            , .alignBreak
                            , "& ⋯"
                            , .alignBreak
                            , "& |pop| [a_0, a_1, a_2, |dots]"
                            , ":= (a_0, [a_1, a_2, a_3, |dots])"
                            ]
                        , .s "which has an evident Haskell implementation."
                        ]
                    ]
                }
            , .block
                { kind := .other "Constructing $|coList| A$"
                , body :=
                    [ .p
                        [ .s "We can play a similar game to construct $|coList| A$ as to our construction of $|coℕ$. Elements of the limit of the sequence"
                        , .al
                            [ "|?"
                            , "|longleftarrow |No + A × |?"
                            , "|longleftarrow |No + A × (|No + A × |?)"
                            , "|longleftarrow |No + A × (|No + A × (|No + A × |?))"
                            , "|longleftarrow ⋯"
                            ]
                        , .s "can be thought of as sequences constructed as follows. The first element of the sequence is an initial \"play token\" $`?|text{'} ∈ |?$. To get the next element of the sequence, spend the token and replace it with an element of $|No + A × |?$; that is, yield either the value $|no$, or a pair of an element $(a_0, {?}) ∈ A × |?$. If you no longer have a $`?|text{'}$ token (because you got the element $|no$), then you have completed your sequence. If you still have a $`?|text{'}$ token (because you got a pair $(a_0, {?})$), then record the pair $a_0$ in your sequence, and play again. Here are some example elements of the limit constructed in this way (with $A := |left|{ |text{|textcolor{red}{red}}, |text{|textcolor{blue}{blue}} |right|}$):"
                        , .al
                            [ " &|left("
                            , "   {?},"
                            , "   |no"
                            , " |right)"
                            , .alignBreak
                            , " &|left("
                            , "   {?},"
                            , "   (|text{|textcolor{blue}{blue}}, {?}), "
                            , "   |no"
                            , " |right)"
                            , .alignBreak
                            , " &|left("
                            , "   {?},"
                            , "   (|text{|textcolor{red}{red}}, {?}), "
                            , "   (|text{|textcolor{blue}{blue}}, {?}), "
                            , "   |no"
                            , " |right)"
                            , .alignBreak
                            , " &|left("
                            , "   {?},"
                            , "   (|text{|textcolor{red}{red}}, {?}), "
                            , "   (|text{|textcolor{blue}{blue}}, {?}), "
                            , "   (|text{|textcolor{red}{red}}, {?}), "
                            , "   (|text{|textcolor{blue}{blue}}, {?}), "
                            , "   |dots"
                            , " |right)"
                            ]
                        , .s "Hiding the $`?|text{'}$ tokens and the $|no$'s, and swapping to square brackets, we get exactly the elements of $|coList| |left|{ |text{|textcolor{red}{red}}, |text{|textcolor{blue}{blue}} |right|}$ as described before:"
                        , .al
                            [ "& []"
                            , .alignBreak
                            , "& [ |text{|textcolor{blue}{blue}} ]"
                            , .alignBreak
                            , "& [ |text{|textcolor{red}{red}}, |text{|textcolor{blue}{blue}} ]"
                            , .alignBreak
                            , "& [ |text{|textcolor{red}{red}}, |text{|textcolor{blue}{blue}}, |text{|textcolor{red}{red}}, |text{|textcolor{blue}{blue}}, |dots ]"
                            ]
                        ]
                    , .ps "To summarise, an element of $|coList| A$ is a \"continually evolving trace\". One starts with a $`?|text{'}$ token and spends it to get an \"observed value\" in $|No + A × |?$; any observed $?$ token must then be spent again, potentially ad infinitum, generating a sequence of observations. This interpretation generalises to construct elements of many terminal coalgebras."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "The set $|tt{BinTree}$ of binary trees (with nodes storing no meaningful data) is the initial algebra of $T : |Set → |Set$ given by $T : X ↦ |No + X^2$. Use the previous construction to describe the set $|tt{coBinTree}$ of \"co-binary trees\". What does the destructor $|tt{coBinTree} → |No + |tt{coBinTree}^2$ do?"
                    , .ps "If you're curious, do the same exercise with $T : X ↦ |No + A × X^2$, for a fixed set $A$."
                    ]
                }
            , .body
                [ .ps "As a terminal coalgebra, $|coList| A$ also has a corecursion principle."
                ]
            , .block
                { kind := .other "Corecursion principle for $|coList$"
                , body :=
                    [ .ps "Fix sets $A$ and $X$. To define a function $X → |coList| A$, it suffices to define a map $α : X → |No + A × X$. The defined map $|corec| α$ the unique function $X → |coList| A$ such that"
                    , .cda
                        { href := hrefs.colistCorecursion, height := some 302 }
                    , .p
                        [ .s "commutes; i.e."
                        , .al
                            [ "& |pop| (f| x)"
                            , "= |case| α| x| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad|quad"
                            , " |Left| |no → |Left| |no"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad|quad"
                            , " |Right| (a, x') → |Right| (a, f| x')"
                            ]
                        , .s "for all $x ∈ X$."
                        ]
                    , .ps "The functions defined by this universal property assemble into a higher-order function $|corec : (X → |No + A × X) → X → |coList| A$."
                    ]
                }
            , .block
                { kind := .exa
                , title := "Corecursive definitions of certain colists"
                , body :=
                    [ .ps "The empty colist $[] ∈ |coList| A$ is the unique colist with $|pop| [] = |no$. It can be defined by $[] := |corec| (λ| |tt{|textunderscore} → |no)| 0$; the lambda function has type $1 → |No + A × 1$."
                    , .ps "The only other choices of functions of type $1 → |No + A × 1$ are the $α_a := λ| |tt{|textunderscore} → (a, 0)$, for each $a ∈ A$. The colists $|repeat| a := |corec| α_a| 0$ satisfy $|pop| (|repeat| a) = (a, |repeat| a)$, which indicates that $|repeat| a = [a, a, |dots]$."
                    , .ps "The list constructors $1 + A × (|List| A) |→{(0, |Succ)} |List| A$ are an isomorphism, with inverse $|pop : |List| A → |No + A × (|List| A)$ giving a coalgebra. This defines a function $ι := |corec| |pop : |List| A → |coList| A$ which recognises each list as a colist."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Check that $ι$ defined in the previous example is an injection $|List| A |hookrightarrow |coList| A$."
                    ]
                }
            , .body
                [ .ps "There are a number of familiar functions involving colists and conatural numbers which we can define corecursively. We will show how to reason about these corecursive definitions in the next section."
                ]
            , .block
                { kind := .exa
                , body :=
                    [ .ul
                        [ [ .s "The function $|tt{length} : |coList| A → |coℕ$ is defined using corecursion into $|coℕ$ by"
                          , .al
                              [ "&|tt{length}"
                              , " := |corec| (λ| |rm{xs} →"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad"
                              , "   |case| |pop| |rm{xs}| |of|"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |Left| |no → |Left| |no"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |Right| (x, |rm{ys}) → |Right| |rm{ys}"
                              , " )"
                              ]
                          ]
                        , [ .s "The function $|tt{map} : (A → B) → |coList| A → |coList| B$ is defined using corecursion into $|coList| B$ by"
                          , .al
                              [ "&|tt{map}| f"
                              , " := |corec| (λ| |rm{as} →"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad"
                              , "   |case| |pop| |rm{as}| |of|"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |Left| |no → |Left| |no"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |Right| (a, |rm{as}') → |Right| (f| a, |rm{as}')"
                              , " )"
                              ]
                          ]
                        , [ .s "The function $|tt{zip} : |coList| A → |coList| B → |coList| (A × B)$ can be defined by instead defining the curried function $|tt{zip}' : (|coList| A) × (|coList| B) → |coList| (A × B)$ as follows:"
                          , .al
                              [ "&|tt{zip}'"
                              , " := |corec| (λ| (|rm{as}, |rm{bs}) →"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad"
                              , "   |case| |pop| |rm{as}, |pop| |rm{bs}| |of"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |Right| (a, |rm{as}'),| |Right| (b, |rm{bs}') →"
                              , "       ((a, b), (|rm{as}', |rm{bs}'))"
                              , .alignBreak
                              , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                              , "     |tt{|textunderscore}, |tt{|textunderscore} → |Left| |no"
                              , ")"
                              ]
                          ]
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Convince yourself that each of the definitions given above agrees with the computation that would be performed in Haskell (i.e. check that the definitions are sensible). For example, you could check that $|tt{length}| [3, 3, |dots] = ∞$, and check that $|tt{zip}| [1, 2, 3]| [9, 10, 11, |dots] = [(1, 9), (2, 10), (3, 11)]$ (though please do be more thorough than this)."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Using corecursion, define an isomorphism $i : |coℕ ≃ |coList| 1$, and define its inverse function $i^{-1} : |coList| 1 ≃ |coℕ$. Using the universal property of terminal coalgebras, verify that $i^{-1} ∘ i = |rm{id}$ and $i ∘ i^{-1} = |rm{id}$."
                    ]
                }
            , .body
                [ .ps "An interesting terminal coalgebra with no interesting analogous initial algebra is the set of <strong>streams</strong>."
                ]
            , .block
                { kind := .dfn
                , body :=
                    [ .ps "Fix a set $A$. The terminal coalgebra $|Stream| A |→{|pop} A × (|Stream| A)$ for $X ↦ A × X$ consists of the set $|Stream| A$ of <strong>streams over $A$</strong>, together with the <strong>destructor</strong> $|pop$."
                    , .p
                        [ .s "The streams are precisely the colists of infinite length. That is,"
                        , .al
                            [ " |Stream| A"
                            , " = |left|{"
                            , "   [a_0, a_1, |dots]"
                            , "   |given"
                            , "   a_0, a_1, |dots ∈ A"
                            , " |right|}"
                            ]
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Using corecursion, define a function $|Stream| A → |coList| A$ which regards a stream as a colist of infinite length. Check that this function is an injection."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "What is the initial algebra for $X ↦ A × X$?"
                    ]
                }
            , .body
                [ .ps "Whilst an element of $|Stream| A$ may be encoded by a mathematical function $ℕ → A$, this is not a useful computational interpretation of this type. Rather, one should think of streams as \"observed behaviours evolving over time\"; only finitely much of the whole stream can ever be known at once."
                ]
            ]
        , .mk
            "Terminal Coalgebras and Coinduction: The Results"
            [ .body
                [ .ps "The results we have developed for initial algebras dualise. Here are a few such results."
                ]
            , .block
                { kind := .rmk
                , title := "Terminal coalgebras are uniquely determined"
                , body :=
                    [ .ps "Up to isomorphism of coalgebras, each endofunctor has at most one terminal coalgebra."
                    ]
                }
            , .block
                { kind := .lem
                , title := "Destructors are isomorphisms"
                , outLink? :=
                    some { href := "../proof/constructors-are-isomorphisms.html" }
                , body :=
                    [ .ps "Let $j |→{|des} T| j$ be the terminal coalgebra for an endofunctor $T : |C → |C$. Then, $|des : j ≃ T| j$ is an isomorphism in $|C$."
                    ]
                }
            , .block
                { kind := .thm
                , title := "Adámek's fixed point theorem, dual"
                , outLink? :=
                    some { href := "../proof/adamek-fixed-point-theorem.html" }
                , body :=
                    [ .p
                        [ .s "Let $T : |C → |C$ be an endofunctor. Suppose that $|C$ contains a terminal object $1$ and the limit of the sequence"
                        , .al
                            [ "1"
                            , "|xleftarrow{!} T| 1"
                            , "|xleftarrow{T !} T^2| 1"
                            , "|xleftarrow{T^2 !} T^3| 1"
                            , "|xleftarrow{T^3 !} ⋯"
                            ]
                        , .s "and suppose furthermore that $T$ preserves this limit. Then, the composite isomorphism $|lim_{i ∈ ω^{|op}} T^i 1 ≃ |lim_{i ∈ ω^{|op}} T^{i + 1} 1 ≃ T(|lim_{i ∈ ω^{|op}} T^i 1)$ gives $|lim_{i ∈ ω^{|op}} T^i 1$ a coalgebra structure for $T$. Furthermore, $|lim_{i ∈ ω^{|op}} T^i 1 ≃ T(|lim_{i ∈ ω^{|op}} T^i 1)$ is a terminal coalgebra."
                        ]
                    , .p
                        [ .s "The statement of this result was adapted from "
                        , .a "https://ncatlab.org/nlab/show/Ad%C3%A1mek%27s+fixed+point+theorem" "this nLab article"
                        , .s "."
                        ]
                    ]
                }
            , .block
                { kind := .rmk
                , title := "Initial algebras map into terminal coalgebras"
                , body :=
                    [ .ps "Let $T : |C → |C$ be an endofunctor with initial algebra $T| i |→{|cons} i$ and terminal coalgebra $j |→{|des} T| j$. Because $|cons$ is an isomorphism, we have a coalgebra $i |→{|cons^{-1}} T| i$. The universal property of the terminal coalgebra (i.e. corecursion) asserts the existence of a unique map $u := |corec| |cons^{-1}$ such that $|des ∘ u = T| u ∘ |cons^{-1}$. Equivalently, $T| u = |des ∘ u ∘ |cons$. This map has thus far shown us how to include $ℕ ↪ |coℕ$ and $|List| A ↪ |coList| A$."
                    ]
                }
            , .block
                { kind := .lem
                , title := "Terminal objects have no proper quotient objects"
                , outLink? :=
                    some { href := "../proof/initial-objects-have-no-proper-subobjects.html" }
                , body :=
                    [ .ps "Let $j$ be the terminal object in a category $|C$, and let $π : j ↠ a$ be an epimorphism out of $j$. Then, $π$ is an isomorphism in $|C$."
                    ]
                }
            , .body
                [ .ps "The (dual of the) latter lemma, when specialised to initial algebras, described the corresponding structural induction schemas for inductive types. The specialisation to coinductive types should therefore be called <strong>coinduction</strong>. We will do a full specialisation to $|C := |Set$ soon, but first we will explore a simple (and useful!) special case."
                ]
            , .block
                { kind := .lem
                , title := "Simple coinductive rule for proving that maps into terminal coalgebras are equal"
                , outLink? :=
                    some { href := "../proof/simple-inductive-rule-for-initial-algebras.html" }
                , body :=
                    [ .ps "Let $j |→{|des} T| j$ be the terminal coalgebra for an endofunctor $T : |C → |C$ and let $f, g : a → j$ be parallel arrows into $j$. Suppose that the coequaliser $π : j ↠ e$ of $f$ and $g$ exists in $|C$. Then, if $T| π ∘ |des ∘ f = T| π ∘ |des ∘ g$, we must have $f = g$."
                    , .cda
                        { href := hrefs.simpleCoinduction, height := some 302 }
                    , .ps "Note that $a$ is not required to have a coalgebra structure $a → T| a$. Note also that this lemma works in an arbitrary category $|C$."
                    ]
                }
            , .block
                { kind := .exa
                , title := "Simple coinductive rule for $|coℕ$"
                , body :=
                    [ .ps "Let $f, g : A → |coℕ$, and denote the coequaliser of $f$ and $g$ by $[-] : |coℕ ↠ (|coℕ / f = g)$. The assumption $T [-] ∘ |des ∘ f = T [-] ∘ |des ∘ g$ in the previous lemma can be unpacked as follows:"
                    , .ul
                        [ [ .s "Equivalently, show that for any $x ∈ |coℕ$, we have $((1_{|No} + [-]) ∘ |pred ∘ f) (x) = ((1_{|No} + [-]) ∘ |pred ∘ g) (x)$."
                          ]
                        , [ .s "Equivalently, show that for any $x ∈ |coℕ$, both of the following hold: $|pred| (f| x) = |no$ iff $|pred| (g| x) = |no$; if instead $|pred| (f| x) =: y ≠ |no$ and $|pred| (g| x) =: z ≠ |no$, then $[y] = [z]$."
                          ]
                        , [ .s "Equivalently, show that for any $x ∈ |coℕ$, both of the following hold: $|pred| (f| x) = |no$ iff $|pred| (g| x) = |no$; if instead $|pred| (f| x) =: y ≠ |no$ and $|pred| (g| x) =: z ≠ |no$, then $y$ is related to $z$ under the equivalence relation defining the quotient $(|coℕ / f = g)$."
                          ]
                        ]
                    , .p
                        [ .s "The final part of the last bullet point above is interesting. The equivalence relation $|sim$ defining the quotient $(|coℕ / f = g)$ is freely generated by the relationships $f| a |sim g| a$ for $a ∈ A$. Hence, showing that $y |sim z$ can effectively be done by working in a context where one <em>assumes</em> that $f| a = g| a$ for all $a ∈ A$ (thereby implicitly working in the quotient $(|coℕ / f = g)$) and demonstrating that in this context, we must have $y = z$"
                        , .sn [.s "This is not a very precise statement. The precise version is to genuinely work in the quotient; draw the commutative diagram displayed above to help you remember the details you're working with!"]
                        , .s ". In analogy to induction (where inputs to constructors come from an equaliser), one could call this a <strong>coinductive hypothesis</strong>."
                        ]
                    , .ps "We will give example applications of this proof method in an upcoming section on example coinductive proofs."
                    ]
                }
            , .body
                [ .ps "We now specialise the \"terminal objects have no proper quotient objects\" lemma to terminal coalgebras of endofunctors $|Set → |Set$. Since quotients of sets are characterised by equivalence relations, the statement gives a rule for judging when an equivalence relation on a terminal coalgebra is the equality relation, and hence provides a way to prove that two elements of a terminal coalgebra are equal."
                ]
            , .block
                { kind := .lem
                , title := "Coinduction in $|Set$"
                , outLink? :=
                    some { href := "../proof/coinduction-in-set.html" }
                , body :=
                    [ .ps "Let $J |→{|des} T| J$ be the terminal coalgebra for an endofunctor $T : |Set → |Set$. Let $∼$ be an equivalence relation on $J$ and denote by $[-] : J → J / {∼}$ the projection onto its quotient. Suppose that for all $x, y ∈ J$ with $x ∼ y$, we have $(T [-] ∘ |des) (x) = (T [-] ∘ |des) (y)$. Then, $∼$ is the equality relation on $J$; i.e. for all $x, y ∈ J$, $x ∼ y ⟹ x = y$."
                    ]
                }
            , .block
                { kind := .exa
                , title := "Bisimulation of streams"
                , body :=
                    [ .ps "Fix a set $A$, and let $∼$ be an equivalence relation on $|Stream| A$ satisfying the assumptions of the previous lemma (with $T : X ↦ A × X$). Fix arbitrary $|rm{as}, |rm{bs} ∈ |Stream| A$, and write $|pop| |rm{as} = (a, |rm{as}')$ and $|pop| |rm{bs} = (b, |rm{bs}')$. The assumption on $∼$ is that if $|rm{as} ∼ |rm{bs}$, then $(a, [|rm{as}']) = (b, [|rm{bs}'])$; i.e. $a = b$ and $|rm{as}' ∼ |rm{bs}'$. Such a relation $∼$ is called a <strong>bisimulation</strong> on $|Stream| A$, and the lemma guarantees that the only bisimulation is the equality relation. Thus, to prove that two streams are equal, it suffices to construct a bisimulation which identifies them."
                    , .ps "Bisimulations identify streams exhibiting the \"same behaviour\" &mdash; two streams have the same behaviour just when their heads are the same and their tails have the same behaviour. The lemma can be read as the statement that <em>streams with the same behaviour are equal</em>."
                    , .ps "We will give an example application of this proof method in an upcoming section on example coinductive proofs."
                    ]
                }
            , .body
                [ .ps "We stress that coinduction is not the only proof method for terminal coalgebras. In particular, non-equality predicates are difficult to prove in this way. Much like how many statements about natural numbers have direct, non-inductive proofs, some statements about conatural numbers also have direct, non-coinductive proofs."
                ]
            ]
        , .mk
            "Example Coinductive Proofs: Addition on Conatural Numbers"
            [ .body
                [ .p
                    [ .s "In this section, we demonstrate some basic coinductive proofs on $|coℕ$, taking addition as an example function to reason about. Many of these proofs could instead be done by a case-split on whether the input is $∞$ or whether it lies in $ℕ$. This style of proof does not generalise to other terminal coalgebras, so we avoid it where necessary."
                    -- , .s " However, it is useful to have one lemma done in this non-coinductive manner:"
                    ]
                ]
            -- , .block
            --     { kind := .lem
            --     , body :=
            --         [ .ps "The only element $x ∈ |coℕ$ with $|pred| x = x$ is $x = ∞$."
            --         ]
            --     }
            , .body
                [ .ps "<strong>Proof.</strong> Suppose (for contradiction) that $x ∈ ℕ$. Then, an inductive argument shows that $|pred| x$ is strictly smaller than $x$, so $|pred| x ≠ x$. $∎$"
                ]
            , .body
                [.ps "To begin, we define addition on $|coℕ$ in analogy to addition on $ℕ$. Fix conatural numbers $x, y ∈ |coℕ$. If $y = 0$ then we should ensure $x + 0 = x$. If instead $y ≠ 0$ has a predecessor, then we should have $|pred| (x + y) = x + (|pred| y)$."
                ]
            , .block
                { kind := .dfn
                , title := "Addition on $|coℕ$"
                , body :=
                    [ .p
                        [ .s "Define a function $({-} + {-}) : |coℕ × |coℕ → |coℕ$ by"
                        , .al
                            [ "({-} + {-})"
                            , "&:= |corec| (λ| (x, y) →"
                            , .alignBreak
                            , "&|quad|quad"
                            , "|case| |pred| y| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad"
                            , "|Right| y' → |Right| (x, y')"
                            , .alignBreak
                            , "&|quad|quad|quad|quad"
                            , "|Left| |no →"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad|quad"
                            , "|case| |pred| x| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                            , "|Right| x' → |Right| (x', 0)"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad|quad|quad|quad"
                            , "|Left| |no → |Left| |no"
                            , ")"
                            ]
                        ]
                    ]
                }
            , .body
                [ .ps "The following proofs investigate the behaviour of $x + y$ based on whether $y = 0$, $y$ is the successor of a natural number, or $y = ∞$."
                ]
            , .block
                { kind := .exa
                , title := "$∀ x ∈ |coℕ, x + 0 = x$"
                , body :=
                    [ .ps "We use simple coinduction to prove this. Define functions $|lhs, |rhs : |coℕ → |coℕ$ to be left-hand and right-hand sides of this equation; i.e. $|lhs| x := x + 0$ and $|rhs| x := x$. Let $[-] : |coℕ → (|coℕ / |lhs = |rhs)$ be the projection onto the quotient where outputs $|lhs| x$ and $|rhs| x$ are identified. The simple coinductive rule states that to argue $|lhs = |rhs$, it suffices to show that $(1_{|No} + [-]) ∘ |pred ∘ |lhs = (1_{|No} + [-]) ∘ |pred ∘ |rhs$."
                    , .p
                        [ .s "Fix $x ∈ |coℕ$. In the case where $|pred| x = |no$, we have by the definition of $+$ that"
                        , .al
                            [ "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= (1_{|No} + [-])| (|pred| (x + 0))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| |no"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| x)"
                            , .alignBreak
                            , "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= |left( (1_{|No} + [-]) ∘ |pred ∘ |rhs |right)| x"
                            ]
                        ]
                    , .p
                        [ .s "If instead we are in the case where $|pred| x = x' ≠ |no$, we refer to the definition of $+$ to verify that"
                        , .al
                            [ "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= (1_{|No} + [-])| (|pred| (x + 0))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (x' + 0)"
                            , .alignBreak
                            , "&= [x' + 0]"
                            , .alignBreak
                            , "&= [|lhs| x']"
                            , .alignBreak
                            , "&= [|rhs| x']"
                            , .alignBreak
                            , "&= [x']"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| x'"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| x)"
                            , .alignBreak
                            , "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= |left( (1_{|No} + [-]) ∘ |pred ∘ |rhs |right)| x"
                            ]
                        , .s "The equality $[|lhs| x'] = [|rhs| x']$ holds because this equation is in the quotient of $|coℕ$ where each $|lhs| y$ is identified with $|rhs| y$. This step is analogous to an inductive hypothesis."
                        ]
                    , .ps "Our two cases verify that $(1_{|No} + [-]) ∘ |pred ∘ |lhs = (1_{|No} + [-]) ∘ |pred ∘ |rhs$. The simple coinductive rule then asserts that $|lhs = |rhs$; i.e. $x + 0 = x$ for all $x ∈ |coℕ$. $∎$"
                    , .ps "The main takeaway from this example is the proof structure:"
                    , .ul
                        [ [.s "Define functions capturing the left-hand and right-hand sides of the equation;"]
                        , [.s "Identify the goal the simple coinductive lemma provides;"]
                        , [.s "Splitting into cases when necessary, verify that arbitrary inputs to each of the two functions yield the same outputs;"]
                        , [.s "Conclude coinductively that the left-hand and right-hand sides of the equation are equal."]
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , title := "$∀ x, y ∈ |coℕ,|, x + (|Succ| y) = |Succ| (x + y)$"
                , body :=
                    [ .ps "Use a similar style of proof to argue that $∀ x, y ∈ |coℕ,|, x + (|Succ| y) = |Succ| (x + y)$. Here, $|Succ| y$ is the unique conatural number such that $|pred| (|Succ| y) = y ≠ |no$."
                    , .ps "The previous example and this exercise together demonstrate that our definition of $+$ on $|coℕ$ restricts to the usual definition of $+$ on $ℕ$."
                    ]
                }
            , .block
                { kind := .exa
                , title := "$∀ x ∈ |coℕ,|, x + ∞ = ∞$"
                , body :=
                    [ .ps "Let $|lhs, |rhs : |coℕ → |coℕ$ be the left-hand and right-hand sides of this equation, and denote by $[-] : |coℕ → (|coℕ / |lhs = |rhs)$ the projection onto their quotient. In particular, $|rhs : x ↦ ∞$ is a constant function. The simple coinductive rule provides us with the goal $(1_{|No} + [-]) ∘ |pred ∘ |lhs = (1_{|No} + [-]) ∘ |pred ∘ |rhs$, which we now verify."
                    , .p
                        [ .s "Fix $x ∈ |coℕ$. Then, appealing to the definition of $+$ and the fact that $|pred| ∞ = ∞ ≠ |no$, we have"
                        , .al
                            [ "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= (1_{|No} + [-])| (|pred| (x + ∞))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (x + ∞)"
                            , .alignBreak
                            , "&= [x + ∞]"
                            , .alignBreak
                            , "&= [∞]"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| ∞"
                            , .alignBreak
                            , "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| x"
                            , "&= |left( (1_{|No} + [-]) ∘ |pred ∘ |rhs |right)| x"
                            ]
                        , .s "This verifies the goal. Therefore, $∀ x ∈ |coℕ,|, x + ∞ = ∞$. $∎$"
                        ]
                    , .ps "The main takeaway of this example is that the functions capturing the left-hand and right-hand sides of the equation may seem a little stupid."
                    ]
                }
            , .body
                [ .ps "We now investigate the behaviour of $x + y$ based on the behaviour of $x$."
                ]
            , .block
                { kind := .exa
                , title := "$∀ y ∈ |coℕ,|, 0 + y = y$"
                , body :=
                    [ .ps "We don't immediately jump into coinduction yet. This is because we can dispense with a simple case first, avoiding an ugly case split in the middle of our coinductive proof. This simple case is when $|pred| y = |no$; i.e. $y = 0$. We have $0 + 0 = 0$ by a previous lemma, so we do not need to verify this as part of our coinduction. This leaves only one case to coinduct with: the case where $|pred| y ≠ |no$."
                    , .ps "We coinduct. Set $A := |left|{ y ∈ |coℕ |given |pred| y ≠ |no |right|}$. Define functions $|lhs, |rhs : A → |coℕ$ to be the left-hand and right-hand sides of the target equation, and let $[-] : |coℕ → (|coℕ / |lhs = |rhs)$ be the corresponding quotient map. Our goal is to verify $(1_{|No} + [-]) ∘ |pred ∘ |lhs = (1_{|No} + [-]) ∘ |pred ∘ |rhs$."
                    , .p
                        [ .s "Fix $y ∈ A$. Put $y' := |pred| y ∈ |coℕ$. Then,"
                        , .al
                            [ "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| y"
                            , "&= (1_{|No} + [-])| (|pred| (0 + y))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (0 + y')"
                            , .alignBreak
                            , "&= [0 + y']"
                            , .alignBreak
                            , "&= [y']"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| y'"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| y)"
                            , .alignBreak
                            , "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| y"
                            , "&= |left( (1_{|No} + [-]) ∘ |pred ∘ |rhs |right)| y"
                            ]
                        , .s "Here, the equality $[0 + y'] = [y']$ is justified depending on whether $|pred| y' = |no$. If $|pred| y' ≠ |no$, then $y' ∈ A$ is a valid input to $|lhs$ and $|rhs$, so the equality is justified by the equality $[|lhs| y'] = [|rhs| y']$. If instead $|pred| y' = |no$, then the equality is justified by previous work: $[0 + y'] = [0 + 0] = [0] = [y']$."
                        ]
                    , .ps "By coinduction, we have $|lhs = |rhs$, and the result is proven. $∎$"
                    , .ps "The takeaway of this example is that simple cases can be dispensed with prior to coinduction, minimising case splits done in the more messy coinductive context."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Show that $∀ x, y ∈ |coℕ, (|Succ| x) + y = |Succ| (x + y)$."
                    , .ps "Show that $∀ y ∈ |coℕ, ∞ + y = ∞$."
                    ]
                }
            , .body
                [ .ps "We are prepared to show that $+$ is commutative and associative."
                ]
            , .block
                { kind := .exa
                , title := "Commutativity of $+$"
                , body :=
                    [ .ps "We already have $x + 0 = x = 0 + x$ for all $x ∈ |coℕ$, so we need only show that $x + y = y + x$ for $x, y ∈ |coℕ$ with $|pred| x ≠ |no$ and $|pred| y ≠ |no$."
                    , .p
                        [ .s "Set $A := |left|{ a ∈ |coℕ |given |pred| a ≠ |no |right|}$. Let $|lhs, |rhs : A^2 → |coℕ$ be the left-hand and right-hand sides of the commutativity equation, and denote by $[-] : |coℕ → (|coℕ / |lhs = |rhs)$ their quotient map. For arbitrary $x, y ∈ A$, with predecessors $x' := |pred| x ≠ |no$ and $y' := |pred| y ≠ |no$, we have"
                        , .al
                            [ "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| (x, y)"
                            , "&= (1_{|No} + [-])| (|pred| (x + y))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (x + y')"
                            , .alignBreak
                            , "&= [x + y']"
                            , .alignBreak
                            , "&= [y' + x]"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (y' + x)"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| (|Succ| (y' + x)))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| (|Succ| y' + x))"
                            , .alignBreak
                            , "&= (1_{|No} + [-])| (|pred| (y + x))"
                            , .alignBreak
                            , "|left( (1_{|No} + [-]) ∘ |pred ∘ |lhs |right)| (x, y)"
                            , "&= |left( (1_{|No} + [-]) ∘ |pred ∘ |rhs |right)| (x, y)"
                            ]
                        , .s "in which $[x + y'] = [y' + x]$ should be justified carefully by the reader, and $|Succ| (y' + x) = |Succ| y' + x$ is due to an earlier exercise. By coinduction, $+$ is commutative. $∎$"
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , title := "Associativity of $+$"
                , body :=
                    [ .ps "Prove that $+$ is associative. Try to minimise the number of case-splits in your coinductive proof by front-loading any easy cases."
                    ]
                }
            ]
        , .mk
            "Example Coinductive Proofs: Inequality of Conatural Numbers"
            [ .body
                [ .ps "A binary relation on a set $R$ is, from an inductive standpoint, easiest understood as a map $R × R → |tt{Bool}$. From a coinductive standpoint, it is easiest regarded as a subset of $R × R$."
                ]
            , .block
                { kind := .dfn
                , title := "Inequality on $|coℕ$"
                , body :=
                    [ .ps "The inequality relation $({-} ≤ {-})$ on $|coℕ$ is the image of the functions $|coℕ × |coℕ → |coℕ × |coℕ$ which maps $(x, δ) ↦ (x, x + δ)$. That is, for conatural numbers $x, y$, we have $x ≤ y$ iff $∃ δ ∈ |coℕ.|, y = x + δ$."
                    ]
                }
            , .body
                [ .ps "As one would hope, this relation is a partial order."
                ]
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Give proofs that $≤$ is reflexive and transitive. Since the goals to be proven are not equality relationships, coinduction is not helpful here."
                    ]
                }
            , .block
                { kind := .exr
                , title := "Antisymmetry of $≤$"
                , body :=
                    [ .ps "We wish to prove that for all $x, y ∈ |coℕ$, if $x ≤ y$ and $y ≤ x$, then $x = y$. This goal is equality, so we can attempt a proof by coinduction."
                    , .ps "Set $A := |left|{ (x, y) ∈ |coℕ^2 |given x ≤ y |text{ and } y ≤ x |right|}$. Let $|lhs, |rhs : A → |coℕ$ be given by $|lhs : (x, y) ↦ x$ and $|rhs : (x, y) ↦ y$, and denote their quotient map by $[-] : |coℕ → (|coℕ / |lhs = |rhs)$. Complete a coinductive proof that $|lhs = |rhs$, and conclude that $≤$ is antisymmetric."
                    , .ps "The important takeaway here is that the domain of the maps $|lhs, |rhs$ may be a complicated set, to account for assumptions required by a result."
                    ]
                }
            , .body
                [ .ps "Because we have proven these properties without appealing to a case split on $|coℕ = ℕ + |{∞|}$, these proofs do not depend on any knowledge of addition on $ℕ$. If one can prove that $({-} + {-}) : |coℕ × |coℕ → |coℕ$ restricts to a function $ℕ × ℕ → ℕ$, then all of the proofs provided in the previous sections yield the corresponding property on $ℕ$ for free."
                ]
            ]
        , .mk
            "Example Coinductive Proofs: Functions on Colists"
            [ .body
                [ .ps "In this section, we describe some functions on $|coList$s and prove some of their properties."
                ]
            , .block
                { kind := .dfn
                , title := "Mapping over $|coList$s"
                , body :=
                    [ .p
                        [ .s "Fix sets $A$ and $B$. The function $|map : (A → B) → |coList| A → |coList| B$ is defined as follows:"
                        , .al
                            [ "|map| f"
                            , "&:= |corec| (λ| |rm{as} →"
                            , .alignBreak
                            , "&|quad|quad|quad |case| |pop| |rm{as}| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|Left| |no → |Left| |no"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|Right| (a, |rm{as}') → |Right| (f| a, |rm{as}')"
                            , ")"
                            ]
                        ]
                    , .ps "Here, $|corec : (|coList| A → |No + B × |coList| A) → |coList| A → |coList| B$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Fix $f : A → B$, fix $a ∈ A$ and fix $|rm{as} ∈ |coList| A$. Prove that $|map| f| [] = []$ and that $|map| f| (a :: |rm{as}) = f a :: |map| f| |rm{as}$."
                    , .ps "Here, $[]$ is the unique colist with $|pop| [] = |no$, having type $|coList| A$ or $|coList| B$ as is necessary for typechecking. Similarly, the colist $(a :: |rm{as})$ is uniquely determined by $|pop| (a :: |rm{as}) = (a, |rm{as})$."
                    ]
                }
            , .body
                [ .ps "As one would hope, $|map$ gives a functor instance for $|coList$."
                ]
            , .block
                { kind := .exa
                , title := "First functor law: $|map| 1_A = 1_{|coList| A}$ for any set $A$"
                , body :=
                    [ .ps "Let $|lhs, |rhs : |coList| A → |coList| A$ be $|lhs := |map| 1_A$ and $|rhs := 1_{|coList| A}$. Denote their quotient map by $[-] : |coList| A → (|coList| A / |lhs = |rhs)$. The simple coinductive lemma asks us to verify the goal $(1_{|No} + 1_A × [-]) ∘ |pop ∘ |lhs = (1_{|No} + 1_A × [-]) ∘ |pop ∘ |rhs$."
                    , .p
                        [ .s "Fix $|rm{as} ∈ |coList| A$. In the case where $|pop| |rm{as} = |no$, we have $|pop| (|map| 1_A| |rm{as}) = |no$ and hence"
                        , .al
                            [ "|left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |lhs |right)| |rm{as}"
                            , "&= (1_{|No} + 1_A × [-])| (|pop| (|map| 1_A| |rm{as}))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| |no"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| (|pop| |rm{as})"
                            , .alignBreak
                            , "|left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |lhs |right)| |rm{as}"
                            , "&= |left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |rhs |right)| |rm{as}"
                            ]
                        , .s "In the case where $|pop| |rm{as} = (a, |rm{as}')$, we have $|pop| (|map| 1_A| |rm{as}) = (1_A| a, |map| 1_A| |rm{as}')$ and hence"
                        , .al
                            [ "|left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |lhs |right)| |rm{as}"
                            , "&= (1_{|No} + 1_A × [-])| (|pop| (|map| 1_A| |rm{as}))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| (1_A| a, |map| 1_A| |rm{as}')"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| (a, |map| 1_A| |rm{as}')"
                            , .alignBreak
                            , "&= (a, [|map| 1_A| |rm{as}'])"
                            , .alignBreak
                            , "&= (a, [1_{|coList| A}| |rm{as}'])"
                            , .alignBreak
                            , "&= (a, [|rm{as}'])"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| (a, |rm{as}')"
                            , .alignBreak
                            , "&= (1_{|No} + 1_A × [-])| (|pop| |rm{as})"
                            , .alignBreak
                            , "|left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |lhs |right)| |rm{as}"
                            , "&= |left( (1_{|No} + 1_A × [-]) ∘ |pop ∘ |rhs |right)| |rm{as}"
                            ]
                        , .s "This completes the coinduction. $∎$"
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , title := "Second functor law for $|coList$"
                , body :=
                    [ .ps "Prove that for any $A |→{f} B |→{g} C$ in $|Set$, we have $|map| (g ∘ f) = |map| g ∘ |map| f$."
                    , .ps "This is an instance of a general phenomenon. Whenever $T : |C × |D → |D$ is a functor for which each $T (c, -) : |D → |D$ has an initial algebra, the mapping $c ↦ (|text{initial algebra for } T (c, -))$ defines the action on objects of a functor $|C → |D$."
                    ]
                }
            , .body
                [ .ps "We can use conatural numbers to measure the lengths of colists. Whereas one defines $|length : |List| A → ℕ$ by recursion from $|List| A$, one defines $|length : |coList| A → |coℕ$ by corecursion into $|coℕ$."
                ]
            , .block
                { kind := .dfn
                , title := "Lengths of $|coList$s"
                , body :=
                    [ .p
                        [ .s "Fix a set $A$. The function $|length : |coList| A → |coℕ$ can be defined corecursively by"
                        , .al
                            [ "|length|"
                            , "&:= |corec| (λ| |rm{as} →"
                            , .alignBreak
                            , "&|quad|quad|quad"
                            , "|case| |pop| |rm{as}| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|Left| |no → |Left| |no"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|Right| (a, |rm{as}') → |Right| |rm{as}'"
                            , ")"
                            ]
                        , .s "Here, $|corec : (|coList| A → |No + |coList| A) → |coList| A → |coℕ$."
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Convince yourself that this is a sensible definition for $|length$. You may wish, for example, to show that this definition restricts to the usual length function $|List| A → ℕ$, or to verify that $|length| (|repeat| a) = ∞$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Prove that for all $A |→{f} B$ in $|Set$ and all $|rm{as} ∈ |coList| A$, we have $|length| (|map| f| |rm{as}) = |length| |rm{as}$. Your proof should be by coinduction into $|coℕ$."
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Show that $|length : |coList| 1 → |coℕ$ is an isomorphism in $|Set$."
                    , .ps "If you did not do so already, ensure that your proof uses only abstract nonsense; i.e. ensure your proof could be performed in any category with a terminal object. In particular, you may verify that $|coList| 1$ and $|coℕ$ satisfy the same universal property; alternatively, you may construct a corecursive function $|length^{-1} : |coℕ → |coList| 1$ and verify the isomorphism equations $|length ∘ |length^{-1} = 1_{|coℕ}$ and $|length^{-1} ∘ |length = 1_{|coList| 1}$ by coinduction."
                    ]
                }
            , .body
                [ .ps "One can also define concatenation of colists."
                ]
            , .block
                { kind := .exr
                , title := "Concatenating colists"
                , body :=
                    [ .ps "Fix a set $A$. Define a (polymorphic) corecursive function $({-} |mathbin{++} {-}) : |coList| A × |coList| A → |coList| A$ which concatenates the second colist after the first colist. Ensure that for all $A |→{f} B$ in $|Set$ and all $|rm{xs}, |rm{ys}, |rm{zs} ∈ |coList| A$, the following properties are satisfied:"
                    , .ul
                        [ [ .s "${++}$ restricts to the usual concatenation function $|List| A × |List| A → |List| A$;"
                          ]
                        , [ .s "$(|rm{xs} |mathbin{++} |rm{ys}) |mathbin{++} |rm{zs} = |rm{xs} |mathbin{++} (|rm{ys} |mathbin{++} |rm{zs})$;"
                          ]
                        , [ .s "$|length| (|rm{xs} |mathbin{++} |rm{ys}) = |length| |rm{xs} + |length| |rm{ys}$;"
                          ]
                        , [ .s "$|map| f| (|rm{xs} |mathbin{++} |rm{ys}) = |map| f| |rm{xs} |mathbin{++} |map| f| |rm{ys}$."
                          ]
                        ]
                    ]
                }
            ]
        , .mk
            "Example Coinductive Proofs: \"ZipList\" Applicative on Colists"
            [ .body
                [ .ps "In Haskell, (lazy) lists carry two famous applicative structures. The usual applicative (which $|tt{Prelude}$ defines for $|tt{[]} :: {*} → {*}$) essentially corresponds to list comprehension. The second applicative (applied to $|tt{Control.Applicative}$'s $|tt{ZipList} :: {*} → {*}$) corresponds to zipping lists together. The first applicative keeps finite lists finite, and so can be defined on the inductive $|List$s. The second applicative makes use of laziness in an essential way, since it puts $|pure := |repeat$; hence, it must be defined on $|coList$s rather than mere $|List$s."
                , .ps "In this section, we construct the $|tt{ZipList}$ applicative (modelled on $|coList$s), and prove that it is an $|tt{Applicative}$ functor. Note that we have already provided $|map : (A → B) → |coList| A → |coList| B$ to give a $|tt{Functor}$ on $|coList$."
                ]
            , .block
                { kind := .dfn
                , title := "$|tt{ZipList}$ applicative"
                , body :=
                    [ .p
                        [ .s "Fix sets $A$ and $B$. Define the polymorphic function $|pure : A → |coList| A$ by $|pure := |repeat$. Define the polymorphic function $({-} |<*> {-}) : |coList| (A → B) × |coList| A → |coList| B$ corecursively by"
                        , .al
                            [ "({-} |<*> {-})"
                            , "&:= |corec| (λ| (|rm{fs}, |rm{as}) →"
                            , .alignBreak
                            , "&|quad|quad|quad |case| |pop| |rm{fs},| |pop| |rm{as}| |of"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|Right| (f, |rm{fs}'),| |Right| (a, |rm{as}') →"
                            , "|Right| (f| a, (|rm{fs}', |rm{as}'))"
                            , .alignBreak
                            , "&|quad|quad|quad|quad|quad"
                            , "|tt{|text{|textunderscore}}, |tt{|text{|textunderscore}} → |Left| |no"
                            , ")"
                            ]
                        , .s "Here, $|corec : |coList| (A → B) × |coList| A → |No + B × (|coList| (A → B) × |coList| A)$. The universal property guarantees that:"
                        ]
                    , .ul
                        [ [ .s "$[] |<*> |rm{as} = []$ for all $|rm{as} ∈ |coList| A$;"
                          ]
                        , [ .s "$|rm{fs} |<*> [] = []$ for all $|rm{fs} ∈ |coList| (A → B)$;"
                          ]
                        , [ .s "$(f :: |rm{fs}) |<*> (a :: |rm{as}) = f| a :: (|rm{fs} |<*> |rm{as})$ for all $f : A → B$, $|rm{fs} ∈ |coList| (A → B)$, $a ∈ A$, $|rm{as} ∈ |coList| A$."
                          ]
                        ]
                    ]
                }
            , .body
                [ .ps "The following proof is a great example of coinduction, because it does not \"feel inductive\" in any way that might be misleading."
                ]
            , .block
                { kind := .exa
                , title := "Second applicative law: for all sets $A, B$, all $f : A → B$ and all $a ∈ A$, we have $|pure| f |<*> |pure| a = |pure| (f| a)$"
                , body :=
                    [ .ps "We prove this coinductively. Denote by $B^A$ the set of functions $A → B$, and define functions $|lhs, |rhs : B^A × A → |coList| B$ to capture the left-hand and right-hand sides of the goal equation. Denote by $[-] : |coList| B → (|coList| B / |lhs = |rhs)$ their quotient map. The simple coinductive lemma asks us to verify the goal $(1_{|No} + 1_B × [-]) ∘ |pop ∘ |lhs = (1_{|No} + 1_B × [-]) ∘ |pop ∘ |lhs$."
                    , .p
                        [ .s "Fix $(f, a) ∈ B^A × A$. Since $|repeat| x = x :: |repeat| x$ for all $x$, we have"
                        , .al
                            [ "|left( (1_{|No} + 1_B × [-]) ∘ |pop ∘ |lhs |right)| (f, a)"
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (|pure| f |<*> |pure| a))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (|repeat| f |<*> |repeat| a))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| ((f :: |repeat| f) |<*> (a :: |repeat| a)))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (f| a :: (|repeat| f |<*> |repeat| a)))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (f| a, |repeat| f |<*> |repeat| a)"
                            , .alignBreak
                            , "&= (f| a, [|repeat| f |<*> |repeat| a])"
                            , .alignBreak
                            , "&= (f| a, [|pure| f |<*> |pure| a])"
                            , .alignBreak
                            , "&= (f| a, [|pure| (f| a)])"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (f| a, |pure| (f| a))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (f| a :: |pure| (f| a)))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (f| a :: |repeat| (f| a)))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (|repeat| (f| a)))"
                            , .alignBreak
                            , "&= (1_{|No} + 1_B × [-])| (|pop| (|pure| (f| a)))"
                            , .alignBreak
                            , "|left( (1_{|No} + 1_B × [-]) ∘ |pop ∘ |lhs |right)| (f, a)"
                            , "&= |left( (1_{|No} + 1_B × [-]) ∘ |pop ∘ |rhs |right)| (f, a)"
                            ]
                        , .s "which completes the coinduction. $∎$"
                        ]
                    ]
                }
            , .block
                { kind := .exr
                , body :=
                    [ .ps "Verify that the remaining three applicative laws are satisfied:"
                    , .ul
                        [ [ .s "$|pure| 1_A |<*> |rm{as} = |rm{as}$ for all $|rm{as} ∈ |coList| A$;"
                          ]
                        , [ .s "$|rm{fs} |<*> |pure| a = |pure| (λ| f → f| a) |<*> |rm{fs}$ for all $a ∈ A$;"
                          ]
                        , [ .s "$|pure| ({-} ∘ {-}) |<*> |rm{gs} |<*> |rm{fs} |<*> |rm{as} = |rm{gs} |<*> (|rm{fs} |<*> |rm{as})$ for all $|rm{as} ∈ |coList| A$, all $|rm{fs} ∈ |coList| (A → B)$ and all $|rm{gs} ∈ |coList| (B → C)$."
                          ]
                        ]
                    , .ps "Here, $A, B, C$ are arbitrary sets. Note that $|<*>$ is left-associative: $|rm{xs} |<*> |rm{ys} |<*> |rm{zs} := (|rm{xs} |<*> |rm{ys}) |<*> |rm{zs}$."
                    ]
                }
            ]
        -- TODO: Section `"Further Results"`, including:
          -- Whenever $F : |C × |D → |D$ is a functor for which each $F (c, -) : |D → |D$ has an initial algebra, the mapping $c ↦ (|text{initial algebra for } F (c, -))$ defines the action on objects of a functor $|C → |D$.
        -- TODO: Section `"Terminal Coalgebras: Categories Other Than $|Set$"`, including:
          -- Natural and conatural numbers in $|Top$
        -- TODO: Section `"Corecursion is not Laziness"`
        -- TODO: Section `"Summary"`
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [ .mk "" "TODO: Fill out the list of links! Go dig up all of the results you've catalogued."
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
            ,   («authoring defs».esc "pop", "\\mathrm{pop}")
            ,   («authoring defs».esc "corec", "\\texttt{corec}")
            ,   («authoring defs».esc "Succ", "\\texttt{Succ}")
            ,   («authoring defs».esc "Left", "\\texttt{Left}")
            ,   («authoring defs».esc "Right", "\\texttt{Right}")
            ,   («authoring defs».esc "case", "\\texttt{case}")
            ,   («authoring defs».esc "of", "\\texttt{of}")
            ,   («authoring defs».esc "List", "\\texttt{List}")
            ,   («authoring defs».esc "coList", "\\texttt{coList}")
            ,   («authoring defs».esc "repeat", "\\texttt{repeat}")
            ,   («authoring defs».esc "Stream", "\\texttt{Stream}")
            ,   («authoring defs».esc "lhs", "\\mathrm{lhs}")
            ,   («authoring defs».esc "rhs", "\\mathrm{rhs}")
            ,   («authoring defs».esc "map", "\\texttt{map}")
            ,   («authoring defs».esc "length", "\\texttt{length}")
            ,   («authoring defs».esc "pure", "\\texttt{pure}")
            ,   («authoring defs».esc "<*>", "\\mathbin{\\texttt{<*>}}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end Coinduction
