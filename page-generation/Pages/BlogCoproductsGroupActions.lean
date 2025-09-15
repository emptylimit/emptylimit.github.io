/- **FILE:** `Pages/BlogCoproductsGroupActions.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: image sub-folder
private def imageRoot : String := "coproducts-via-group-actions"
-- NOTE: `q.uiver` URLs
-- NOTE: `$$ ⋯ $$` contents

/-- Prepend the specified `imageRoot` onto a filepath. -/
private def imgPath : String → String := (imageRoot ++ "/" ++ ·)



/- LAUNCH: -/

namespace BlogCoproductsGroupActions
  def it : Page :=
    { title :=
        "Blog: Coproducts via Group Actions"
    , authors :=
        [ Name.gabe ]
    , bibliography :=
        [ Bib.context ]
    , sections :=
        [ .mk
            "Goal (and prerequisite knowledge)"
            [ .body
                [ .ps "I want to motivate coproducts in $|Group$ (also known as free products) using the idea of group actions. As an essential prerequisite knowledge checklist:"
                , .ul
                  [ [ .s "The categories $|Group$ and $|Set$;" ]
                  , [ .s "Group actions (on a set)." ]
                  ]
                , .ps "And some stuff that I'll assume you know later in the article, but which isn't essential for understanding:"
                , .ul
                  [ [ .s "The category $|Top_{*}$ of based topological spaces and continuous based maps;" ]
                  , [ .s "The product topology." ]
                  , [ .s "The wedge sum operation." ]
                  ]
                ]
            ]
        , .mk
            "Why coproducts?"
            [ .body
                [ .ps "Imagine a group $G$ acting on a set $X$. For example, $G$ could be the dihedral group $G := D_{2 ⬝ 5}$ acting on the pentagon $X$ by its symmetries:"
                , .img
                    { src := imgPath "stock.jpg"
                    , alt := some "Amogus"
                    }
                    (some
                      [ .s "Gaming" ]
                    )
                ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            none
        , links :=
            [
            ]
        }
    }
end BlogCoproductsGroupActions
