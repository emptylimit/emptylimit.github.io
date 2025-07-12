/- **FILE:** `Pages/Products.lean` -/

/- IMPORTS: -/

import Inset.EncodePages



/- SECTION: Helper definitions -/

-- NOTE: `q.uiver` URLs:
private def «product diagram» : String := "https://q.uiver.app/#q=WzAsNCxbMSwxLCJMIl0sWzAsMSwiQSJdLFsyLDEsIkIiXSxbMSwwLCJaIixbMzAwLDYwLDYwLDFdXSxbMywxLCJhIiwyLHsiY29sb3VyIjpbMjQwLDYwLDYwXX0sWzI0MCw2MCw2MCwxXV0sWzMsMiwiYiIsMCx7ImNvbG91ciI6WzI0MCw2MCw2MF19LFsyNDAsNjAsNjAsMV1dLFszLDAsIlxcZWxsIiwxLHsiY29sb3VyIjpbMCw2MCw2MF19LFswLDYwLDYwLDFdXSxbMCwxLCJcXGxhbWJkYV9BIl0sWzAsMiwiXFxsYW1iZGFfQiIsMl1d"
-- NOTE: `$$ ⋯ $$` contents
-- NOTE: `$$\begin{align*} ⋯ \end{align*}$$` contents



/- LAUNCH: -/

namespace Products
  def it : Page :=
    { title :=
        "Products"
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
                [ .ps "The <em>(categorical) product</em> generalises the Cartesian product of sets, the product topology, the direct product of groups etc, whilst the <em>coproduct</em> generalises the disjoint union of sets and topological spaces, and the free product of groups. FIXME: Finish!" ]
            ]
        ]
    , seeAlso :=
        { readNext :=
            some ("./limits.html", "Limits")
        , links :=
            [ .mk "./diagrams.html" "Diagrams"
            , .mk "./limits.html" "Limits"
            ]
        }
    }
end Products
