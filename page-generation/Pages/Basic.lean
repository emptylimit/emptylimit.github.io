/-
  **FILE:** `Pages/Basic.lean`
  **PURPOSE:** Collect together all the pages to be rendered
  **NOTES:**
    Each page identified by some "ShortName" is to be placed in a file named `Pages/ShortName.lean`,
    and the page itself is to be exported as `ShortName.it`.
-/

/- IMPORTS: Discussion-family pages -/

import Pages.Adjunctions
import Pages.Categories
import Pages.GeneralisedElements
-- import Pages.Limits
-- import Pages.Products

/- IMPORTS: Proof-family pages -/

import Pages.FullyFaithfulFunctorsReflectIsomorphisms
import Pages.FunctorsPreserveCommutativeDiagrams
import Pages.FunctorsPreserveIsomorphisms
import Pages.GeneralisedElementsDetermineObjects
import Pages.RightAdjointsPreserveLimits



/- SECTION: `pagesToRender` -/

/--
  The list of pages to render, each paired with a filename.

  The filename is taken as if from the root directory of the website, without a `"./"` prefix.
-/
def pagesToRender : List (Page × System.FilePath) :=
  [ -- Discussion-family
    .mk Adjunctions.it "discussion/adjunctions.html"
  , .mk Categories.it "discussion/categories.html"
  , .mk GeneralisedElements.it "discussion/generalised-elements.html"
  -- , .mk Limits.it "discussion/limits.html"
  -- , .mk Products.it "discussion/product.html"
    -- Proof-family
  , .mk FullyFaithfulFunctorsReflectIsomorphisms.it "proof/fully-faithful-functors-reflect-isomorphisms.html"
  , .mk FunctorsPreserveCommutativeDiagrams.it "proof/functors-preserve-commutative-diagrams.html"
  , .mk FunctorsPreserveIsomorphisms.it "proof/functors-preserve-isomorphisms.html"
  , .mk GeneralisedElementsDetermineObjects.it "proof/generalised-elements-determine-objects.html"
  , .mk RightAdjointsPreserveLimits.it "proof/right-adjoints-preserve-limits.html"
  ]
