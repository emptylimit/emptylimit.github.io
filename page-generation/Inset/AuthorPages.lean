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

  /--
    The main dictionary (`(key, value)` array) of translations used by `inset` rendering strings.

    Each pair `(key, value)` represents a translation of any substring `s!"{escapeSequence}{key}"` to the value `value`.

    NOTE: When editing this dictionary, ensure all values are fully fleshed-out `KaTeX`.
  -/
  def translations : Array (String × String) :=
    #[  ("", "\\") -- Just `s!"{escapeSequence}"` will get replaced with `"\\"`
        -- Typefaces
    ,   ("cat", "\\mathsf")
    ,   ("cat!", "\\mathbf") -- Concrete category
        -- Standard categories
    ,   ("A", "\\mathsf{C}")
    ,   ("B", "\\mathsf{C}")
    ,   ("C", "\\mathsf{C}")
    ,   ("D", "\\mathsf{C}")
    ,   ("E", "\\mathsf{C}")
    ,   ("Set", "\\mathbf{Set}")
    ,   ("Cat", "\\mathbf{Cat}")
    ,   ("Group", "\\mathbf{Group}")
    ,   ("Monoid", "\\mathbf{Monoid}")
        -- Operators
    ,   ("lim", "\\lim")
    ,   ("colim", "\\mathrm{colim}") -- not `\\DeclareMathOperator`'ed, because `KaTeX` doesn't support that
        -- Relationships
    ,   ("→", "\\to")
    ,   ("⊣", "\\dashv")
    ].qsort (fun (k₁, _) (k₂, _) => k₁ ≥ k₂) -- Replace longer keys first

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
    dictionary.foldl (fun s (key, value) => s.replace s!"{escapeSequence}{key}" value) text

end «authoring defs»
