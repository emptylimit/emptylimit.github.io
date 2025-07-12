# Missing content:
  - [ ] More Discussion-family pages
    - [ ] Finish filling out `index.html`'s reading order first
    - [ ] Fill out the commented-out parts of the current glossary
  - [ ] More Proof-family pages
    - [ ] Add relevant proofs for the elements in the glossary

# Missing functionality:
  - [ ] `inset` should manage a known list of URLs in some namespace.
    - [ ] Looking up an Empty Limit URL should be something like `URL.Glossary.yonedaLemma`.
    - [ ] Looking up an external URL (should happen less often) should be something like `URL.Out.wikipedia`.
    - [ ] Put the file declaring the URLs in `/page-generation/Inset/Util/URL.lean`.
    - [ ] Adjust all the current URLs in `/page-generation/Pages/*.lean` to use the namespaced ones
  - [ ] `inset` should update `script/glossary.js`'s list of all pages.
    - This will be slightly easier once the `URL` namespace is set up.

# Known missing pages:
  - [ ] "discussion/functor.html" "Functor"
  - [ ] "discussion/isomorphism.html" "Isomorphism"
  - [ ] "discussion/fully-faithful.html" "Fully Faithful"
  - [ ] "discussion/equivalence-of-categories.html" "Equivalence of Categores"
  - [ ] "discussion/yoneda-lemma.html" "Yoneda Lemma"
  - [ ] "proof/yoneda-embedding-is-fully-faithful.html" "Yoneda Embedding is Fully Faithful"
  - [ ] "proof/characterisation-of-equivalences-of-categories.html" "Characterisation of Equivalences of Categories"
  - [ ] "proof/finite-dimensional-vector-spaces-equivalent-to-matrices.html" "Linear Transformations are Equivalent to Matrices"
