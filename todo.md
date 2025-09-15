# Missing content:
  - [ ] More Discussion-family pages
    - [ ] Finish filling out `index.html`'s reading order first
    - [ ] Fill out the commented-out parts of the current glossary
  - [ ] More Proof-family pages
    - [ ] Add relevant proofs for the elements in the glossary

# Missing functionality:
  - [ ] `inset` should really ensure that the translations dictionary is sorted in a prefix-respecting order.
    - [ ] Write a substring searching algorithm to construct the poset described below
      - [ ] We want to do many substring tests on many pairs of patterns and texts, so it'll be beneficial to use one of the pre-processing algorithms
            with great benefits for preprocessed text. Suffix array? KMP? Maybe because everything's likely so short, it just doesn't matter and the
            naive algo will be the fastest.
    - [ ] Obliterate `Inset.AuthorPages`'s `compareTranslationKeys`, and replace it with a sorting algorithm that does a DFS through the list of
          keys of the translation dictionary (regarded as a poset with `x <= y` iff `x` is a substring of `y` or `y` starts with the
          `escapeSequence` but `x` doesn't).
  - [ ] `inset` should manage a known list of URLs in some namespace.
    - [ ] Looking up an Empty Limit URL should be something like `URL.Glossary.yonedaLemma`.
    - [ ] Looking up an external URL (should happen less often) should be something like `URL.Out.wikipedia`.
    - [ ] Put the file declaring the URLs in `/page-generation/Inset/Util/URL.lean`.
    - [ ] Adjust all the current URLs in `/page-generation/Pages/*.lean` to use the namespaced ones
  - [ ] `inset` should update `script/glossary.js`'s list of all pages.
    - This will be slightly easier once the `URL` namespace is set up.
  - [ ] `inset` should automatically generate a list of all hyperlinks to referenced lemmas/etc (stuff with "outlink? \ne none"), and chuck it (nicely)
        onto the end of the "See Also" section.
      [ ] Sort the list. Remove duplicates.
      [ ] Maybe `inset` should also do this automatically for any known `URL` which has been referenced in the article?
  - [ ] `inset` should support some warnings while it builds pages, to echo back to the user. These should include:
    - [ ] An image has no specified `alt` text
    - [ ] A bibliography is empty
    - [ ] A list of authors is empty
    - [ ] etc

# Known missing pages:
  - [ ] "discussion/functor.html" "Functor"
  - [ ] "discussion/isomorphism.html" "Isomorphism"
  - [ ] "discussion/fully-faithful.html" "Fully Faithful"
  - [ ] "discussion/equivalence-of-categories.html" "Equivalence of Categores"
  - [ ] "discussion/yoneda-lemma.html" "Yoneda Lemma"
  - [ ] "proof/yoneda-embedding-is-fully-faithful.html" "Yoneda Embedding is Fully Faithful"
  - [ ] "proof/characterisation-of-equivalences-of-categories.html" "Characterisation of Equivalences of Categories"
  - [ ] "proof/finite-dimensional-vector-spaces-equivalent-to-matrices.html" "Linear Transformations are Equivalent to Matrices"

