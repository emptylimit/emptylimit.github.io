/-
  **FILE:** `Inset/AuthorPages.lean`
  **PURPOSE:**
    Provide useful definitions for writing pages in a pain-free way.
    In particular, avoid the need to type `\\mathrm{ob}\\ \\mathsf{C}`, or `\\` in a string.
    This is all exported by `namespace «authoring defs»`.
-/

namespace «authoring defs»

  /-- The string used instead of TeX's `\` by `inset` rendering strings. -/
  private def escapeSequence : String := "|"

  /-- Prepend the escape sequence to a string. -/
  private def esc : String → String := (escapeSequence ++ ·)

  /--
    The main dictionary (`(key, value)` array) of translations used by `inset` rendering strings.

    Each pair `(key, value)` represents a translation of any substring `s!"{key}"` to the value `value`.

    NOTE: When editing this dictionary, ensure all values are fully fleshed-out `KaTeX`.

    NOTE: When editing this dictionary, it'd be nice to sort by values alphabetically. The order of things in
          the dictionary is overridden later anyway, so this shouldn't cause problems (but will make it easier
          to find problematic bindings later).
  -/
  def translations : Array (String × String) :=
    #[  -- [1.] Manually escaped sequences
        (esc "", "\\") -- Just `s!"{escapeSequence}"` will get replaced with `"\\"`
        -- Accents/Decorations
    ,   (esc "tl", "\\tilde")
    ,   (esc "wtl", "\\widetilde")
        -- Delimiters
    ,   (esc "given", "\\;\\middle\\vert\\;")
        -- Letters
    ,   (esc "yo", "よ")
        -- Operators
    ,   (esc "colim", "\\mathrm{colim}") -- not `\\DeclareMathOperator`'ed, because `KaTeX` doesn't support that
    ,   (esc "Im", "\\mathrm{Im}") -- not `\\DeclareMathOperator`'ed, because `KaTeX` doesn't support that
    ,   (esc "op", "\\mathrm{op}")
        -- Standard categories
    ,   (esc "A", "\\mathsf{A}")
    ,   (esc "B", "\\mathsf{B}")
    ,   (esc "C", "\\mathsf{C}")
    ,   (esc "D", "\\mathsf{D}")
    ,   (esc "E", "\\mathsf{E}")
    ,   (esc "Cat", "\\mathbf{Cat}")
    ,   (esc "Graph", "\\mathbf{Graph}")
    ,   (esc "Group", "\\mathbf{Group}")
    ,   (esc "Monoid", "\\mathbf{Monoid}")
    ,   (esc "Set", "\\mathbf{Set}")
    ,   (esc "SimpleGraph", "\\mathbf{SimpleGraph}")
    ,   (esc "Top", "\\mathbf{Top}")
    ,   (esc "Vect", "\\mathbf{Vect}")
        -- Typefaces
    ,   (esc "cat!", "\\mathbf") -- Concrete category
    ,   (esc "cat", "\\mathsf")
        -- Relationships
    ,   (esc "→", "\\xrightarrow")
        -- [2.] Unicode symbols
        -- Binary operators
    ,   ("∘", "\\circ")
    ,   ("×", "\\times")
        -- Letters (Greek)
    ,   ("α", "\\alpha")
    ,   ("β", "\\beta")
    ,   ("γ", "\\gamma")
    ,   ("δ", "\\delta")
    ,   ("ε", "\\varepsilon")
    ,   ("φ", "\\varphi")
    ,   ("κ", "\\kappa")
    ,   ("λ", "\\lambda")
    ,   ("μ", "\\mu")
    ,   ("ν", "\\nu")
    ,   ("π", "\\pi")
    ,   ("ρ", "\\rho")
    ,   ("σ", "\\sigma")
    ,   ("τ", "\\tau")
    ,   ("θ", "\\theta")
    ,   ("ζ", "\\zeta")
    ,   ("ξ", "\\xi")
    ,   ("ω", "\\omega")
        -- Letters (Japanese)
    ,   ("¥", "よ")
        -- Letters (`\mathbb`)
    ,   ("ℕ", "\\mathbb{N}")
    ,   ("ℝ", "\\mathbb{R}")
    ,   ("𝕊", "\\mathbb{S}")
    ,   ("ℤ", "\\mathbb{Z}")
        -- Relationships
    ,   ("⊣", "\\dashv")
    ,   ("≥", "\\geq")
    ,   ("∈", "\\in")
    ,   ("←", "\\leftarrow")
    ,   ("≤", "\\leq")
    ,   ("↦", "\\mapsto")
    ,   ("∼", "\\sim")
    ,   ("≃", "\\simeq")
    ,   ("⊆", "\\subseteq")
    ,   ("→", "\\to")
        -- Stand-ins
    ,   ("⋯", "\\cdots")
    ].qsort (fun (k₁, _) (k₂, _) => k₁.length ≥ k₂.length) -- Replace superstrings first

  /--
    Turn `inset`-escaped text into `KaTeX`-ready text.

    **Parameter `(text : String)`**:
      The text to un-escape.

    **Parameter `(dictionary : Array (String × String) := «authoring defs».translations)`**:
      The dictionary to use when un-escaping text.
      By default, this is the global dictionary maintained in `Inset/AuthorPages.lean`.

      * NOTE: This dictionary MUST BE SORTED by `(·.qsort (fun (k₁, _) (k₂, _) => k₁ ≥ k₂))` prior to being passed as
      an argument to this function. So, for example, one should not pass `t := #[("Set", "\\mathbf{Set}")] ++ translations`,
      but should instead pass `t.qsort (fun (k₁, _) (k₂, _) => k₁ ≥ k₂)`.

    **Returns `: String`**:
      The un-escaped text.
  -/
  def unescape (text : String) (dictionary : Array (String × String) := translations) : String :=
    dictionary.foldl (fun s (key, value) => s.replace s!"{key}" value) text

end «authoring defs»
