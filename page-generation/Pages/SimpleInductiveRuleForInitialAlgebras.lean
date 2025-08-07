/- **FILE:** `Pages/SimpleInductiveRuleForInitialAlgebras.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- LAUNCH: -/

namespace SimpleInductiveRuleForInitialAlgebras
  def it : Page :=
    { title :=
        "Simple Inductive Rule for Initial Algebras"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.NLab.terminalCoalgebra ]
    , sections :=
        [ .mk
            "Theorem statement"
            [ .block
                { kind := .thm
                , title := "Simple inductive rule for proving that maps out of initial algebras are equal"
                , body :=
                    [ .ps "Let $T| i |→{|cons} i$ be the initial algebra for an endofunctor $T : |C → |C$ and let $f, g : i → a$ be parallel arrows out of $i$. Suppose that the equaliser $ι : e ↣ i$ of $f$ and $g$ exists in $|C$. Then, if $f ∘ |cons ∘ T| ι = g ∘ |cons ∘ T| ι$, we must have $f = g$."
                    , .ps ""
                    ]
                }
            , .body
                [ .ps "The dual result is often more useful. Let $j |→{|des} T| j$ be the terminal coalgebra for $T : |C → |C$ and let $f, g : a → j$ be parallel arrows into $j$. Suppose that the coequaliser $π : j ↠ e$ of $f$ and $g$ exists in $|C$. Then, if $T| π ∘ |des ∘ f = T| π ∘ |des ∘ g$, we must have $f = g$."
                , .cda
                    { href := "https://q.uiver.app/#q=WzAsNSxbMCwxLCJqIl0sWzAsMCwiYSJdLFswLDIsImUiXSxbMiwyLCJUXFwgZSJdLFsyLDEsIlRcXCBqIl0sWzEsMCwiZiIsMix7Im9mZnNldCI6MX1dLFsxLDAsImciLDAseyJvZmZzZXQiOi0xfV0sWzAsMiwiXFxwaSIsMix7InN0eWxlIjp7ImhlYWQiOnsibmFtZSI6ImVwaSJ9fX1dLFswLDQsIlxcbWF0aHJte2Rlc30iXSxbNCwzLCJUXFwgXFxwaSJdLFsyLDMsIiIsMix7InN0eWxlIjp7ImJvZHkiOnsibmFtZSI6ImRhc2hlZCJ9fX1dXQ=="
                    , height := some 302
                    }
                ]
            ]
        , .mk
            "Proof"
            [ .body
                [ .ps "Since the diagram is already drawn above, we prove the dual result. The condition $T| π ∘ |des ∘ f = T| π ∘ |des ∘ g$ guarantees that $T| π ∘ |des$ factors through $π$; that is, there is a unique map $ε : e → T| e$ (occupying the dashed line drawn above) such that $T| π ∘ |des = ε ∘ π$. This map $ε$ gives a coalgebra structure $e |→{ε} T| e$ such that $π$ is a coalgebra morphism from $j |→{|des} T| j$ to $e |→{ε} T| e$."
                , .p
                    [ .s "Since $π$ is an epimorphism in $|C$ and composition of coalgebra morphisms is done by composing maps in $|C$, we see that $π$ is an epimorphism in the category of coalgebras for $T$. Since "
                    , .a "./initial-objects-have-no-proper-subobjects.html" "terminal objects have no proper quotient objects"
                    , .s ", $π$ must be an isomorphism in the category of coalgebras. However, for the coequaliser $π$ of $f$ and $g$ to be an isomorphism, we must have $f = g$ to begin with"
                    , .sn [.s "A worthwhile exercise!"]
                    , .s ". $∎$"
                    ]
                ]
            ]
        , .mk
            "Example Uses"
            [ .body
                [ .p
                    [ .s "Our "
                    , .a "../discussion/coinduction.html" "article on coinduction"
                    , .s " has many example applications of this rule. Consequences of the rule as stated include the structural induction schemas on inductive types. Consequences of the dual include reasoning about addition on the conatural numbers, various properties of functions on colists, and a proof that the \"ZipList\" applicative satisfies the applicative laws."
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
            ,   («authoring defs».esc "des", "\\texttt{des}")
            ]
        |>.qsort «authoring defs».compareTranslations
    }
end SimpleInductiveRuleForInitialAlgebras
