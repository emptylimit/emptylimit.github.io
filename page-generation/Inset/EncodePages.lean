/-
  **FILE:** `Inset/EncodePages.lean`
  **PURPOSE:** Provide types for representing pages
-/

/- IMPORTS: -/

import Inset.AuthorPages
import Inset.Bibliography
import Inset.Util.Name
import Inset.Util.Url



/- SECTION: Basic type aliases -/

/--
  An single-line display-style `$$ ⋯ $$` equation.

  `abbrev` for a `String` that would go into the `⋯` above.
-/
abbrev Equation : Type := String
/-- Extract the underyling `String` from an `Equation`. -/
def Equation.toString : Equation → String := id

/--
  A display-style `\begin{align*} ⋯ \end{align*}` equation.

  `abbrev` for a `List String`, each element of which is a
  line in the `⋯` above. The lines **should still contain**
  alignment and line-break `TeX` syntax; for example:
  ```lean4
  [ "f(x) &= g(x) + 2 \cdot h(x) \\"
  , "f'(x) &= g'(x) + 2 \cdot h'(x)"
  ] : BigEquation
  ```
  produces the desired output
  ```LaTeX
  \begin{align*}
    f(x) &= g(x) + 2 \cdot h(x) \\
    f'(x) &= g'(x) + 2 \cdot h'(x)
  \end{align*}
  ```
  but
  ```lean4
  [ "f(x) &= g(x) + 2 \cdot h(x)"
  , "f'(x) &= g'(x) + 2 \cdot h'(x)"
  ] : BigEquation
  ```
  produces the bad output
  ```LaTeX
  \begin{align*}
    f(x) &= g(x) + 2 \cdot h(x)
    f'(x) &= g'(x) + 2 \cdot h'(x)
  \end{align*}
  ```
  which contains no line break.
-/
abbrev BigEquation : Type := List String
/-- Extract the underlying list of lines to render in a `BigEquation`. -/
def BigEquation.toList : BigEquation → List String := id
/-- A line-break in `TeX`. -/
def String.alignBreak := " \\\\"



/- SECTION: Text -/

/-- An element appearing in some surrounding text. -/
inductive TextElement : Type where
  /-- A string of raw text. -/
  | s : String → TextElement
  /--
    An single-line display-style `$$ ⋯ $$` equation.
    Provide the string to be placed in `⋯` as an argument.
  -/
  | eqn : Equation → TextElement
  /--
    A display-style `\begin{align*} ⋯ \end{align*}` equation.

    Provide the string to be placed in `⋯` as an argument.
  -/
  | al : BigEquation → TextElement
  /-- A hyperlink. -/
  | a (href : URL) (content : String) : TextElement

/-- Wrap the `content` in `<strong> ⋯ </strong>`. -/
def strong (content : String) : String :=
  s!"<strong>{content}</strong>"

/-- A sidenote. -/
def Sidenote : Type := List TextElement
/-- Extract the underlying `List TextElement` from a `Sidenote`. -/
def Sidenote.toList : Sidenote → List TextElement := id

/-- Content that may be found in the body text.-/
inductive TextContent : Type where
  /-- A text element which is not a sidenote. -/
  | e : TextElement → TextContent
  /-- A sidenote within some body text. -/
  | sn : Sidenote → TextContent

/-- A string of raw text. -/
def TextContent.s : String → TextContent :=
  TextContent.e ∘ TextElement.s
/--
  A displaystyle `$$ ⋯ $$` equation.
  Provide the string to be placed in `⋯` as an argument.
-/
def TextContent.eqn : Equation → TextContent :=
  TextContent.e ∘ TextElement.eqn
/--
  A display-style `\begin{align*} ⋯ \end{align*}` equation.

  Provide the list of lines to be placed in `⋯` as an argument.
-/
def TextContent.al : BigEquation → TextContent :=
  TextContent.e ∘ TextElement.al
/-- A hyperlink. -/
def TextContent.a (href : URL) (content : String) : TextContent :=
  TextContent.e <| TextElement.a href content

/-- Some text, possibly containing sidenotes. -/
def Text : Type := List TextContent
/-- Extract the underlying `List TextContent` from a `Text`. -/
def Text.toList : Text → List TextContent := id
/-- Shorthand for a `Text` consisting of a single string of text. -/
def Text.s : String → Text := ([·]) ∘ TextContent.s



/- SECTION: Diagrams -/

/-- A (static) commutative diagram. -/
structure Diagram : Type where
  /-- URL to diagram to render in an `<iframe>`, *without* the trailing `"&embed"`. -/
  href : URL
  /--
    Height of the `<iframe>` to render.
    If `none`, allow the CSS to determine the width and height. The CSS isn't very good at it, though...

    Default: `some 302`
  -/
  height : Option Nat := some 302

/-- A single frame in an `InteractiveDiagram`. -/
structure IDFrame : Type where
  /-- The static `Diagram` in this frame. -/
  cda : Diagram
  /--
    Optional explanatory text.

    Default: `none`.
  -/
  text : Option Text := none
  /--
    Optional sidenote text.

    Default: `none`.
  -/
  sidenote : Option Text := none

/-- An interactive commutative diagram. -/
def InteractiveDiagram : Type := List IDFrame



/- SECTION: Body -/

/-- An element to render in the `Body` of an `Element` -/
inductive BodyElement : Type where
  /-- A paragraph of `Text`. -/
  | p : Text → BodyElement
  /-- A `<ul>` of `Text`. -/
  | ul : List Text → BodyElement
  /-- A (static) commutative `Diagram`. -/
  | cda : Diagram → BodyElement
  /-- An interactive commutative diagram. -/
  | ida : InteractiveDiagram → BodyElement

/-- Shorthand for including a single `String` as a `<p>` tag. -/
def BodyElement.ps : String → BodyElement := BodyElement.p ∘ ([·]) ∘TextContent.s

/-- Shorthand for including a newline (implemented as an empty paragraph). -/
def BodyElement.nl : BodyElement := .ps ""

/-- The body of an `Element` or a `Block`. -/
def Body : Type := List BodyElement
/-- Extract the underlying `List BodyElement` of a `Body`. -/
def Body.toList : Body → List BodyElement := id



/- SECTION: Block -/

/-- The kind of a `Block`. -/
inductive Block.Kind : Type where
  /-- Designates a **Theorem**. -/
  | thm : Kind
  /-- Designates a **Proposition**. -/
  | pro : Kind
  /-- Designates a **Lemma**. -/
  | lem : Kind
  /-- Designates a **Definition**. -/
  | dfn : Kind
  /-- Designates an **Example**. -/
  | exa : Kind
  /-- Designates a **Remark**. -/
  | rmk : Kind
  /-- Designates an **Exercise**. -/
  | exr : Kind
  /-- Designates something else, to be rendered using the provided `title`. -/
  | other (title : String) : Kind
/-- Extract the title of a `Block` from its `.Kind`. -/
def Block.Kind.toString : Block.Kind → String
  | .thm      => "Theorem"
  | .pro      => "Proposition"
  | .lem      => "Lemma"
  | .dfn      => "Definition"
  | .exa      => "Example"
  | .rmk      => "Remark"
  | .exr      => "Exercise"
  | .other t  => t

/--
  A link at the end of a `Block`.

  Used, for example, to redirect from a theorem to its proof.
-/
structure OutLink where
  /-- The `URL` to redirect to. -/
  href : URL
  /--
    The label to render on the link.

    Default: `"see proof"`
  -/
  label : String := "see proof"

/-- A `Block` element, such as the statement of a theorem. -/
structure Block : Type where
  /-- The `Kind` of a `Block`. -/
  kind : Block.Kind
  /--
    The title of a `Block`.

    Default: `none`.
  -/
  title : Option String := none
  /-- The `Body` of a `Block`. -/
  body : Body
  /--
    Optional link at the end of the `Block`.

    Default: `none`.
  -/
  outLink? : Option OutLink := none



/- SECTION: TitledList -/

/-- A `List β` which has been augmented with a `title : String` field. -/
private structure TitledList (β : Type u) : Type u where
  /-- The title. -/
  title : String
  /--
    The underlying list.

    Default: `[]`
  -/
  list : List β := []



/- SECTION: Element, Section, Page -/

/-- An element to render within a `Section`. -/
inductive Element : Type where
  /-- The `Body` of an `Element`. -/
  | body : Body → Element
  /-- The `Block` held by an `Element`. -/
  | block : Block → Element

/-- A section within a `Page`. -/
def Section := TitledList Element
/--
  Construct a `Section`.

  **Parameter `(title : String)`:**
    The title of the section.

  **Parameter `(elements : List Element := [])`:**
    The underlying list of elements.
-/
def Section.mk (title : String) (elements : List Element := []) : Section :=
  { title := title, list := elements }
/-- Extract the list of `Element`s held in a `Section`. -/
def Section.elements : Section → List Element := TitledList.list
/-- Extract the title of a `Section`. -/
def Section.title : Section → String := TitledList.title

/-- The "see also" section. -/
structure SeeAlso : Type where
  /--
    A `URL` and a `String` label to the next article to read.

    Default: `none`
  -/
  readNext : Option (URL × String) := none
  /-- A list of pairs: a `URL` and a `String` label to related articles. -/
  links : List (URL × String)

/-- A Discussion- or Proof-family webpage. -/
structure Page : Type where
  /-- The title of the `Page`. -/
  title : String
  /-- The authors. -/
  authors : List Name
  /-- The sections within a `Page`. -/
  sections : List Section
  /-- The "see also" section. -/
  seeAlso : SeeAlso
  /-- The "bibliography" section. -/
  bibliography : Bibliography
  /--
    The list of `inset`-to-`KaTeX` translations to perform.

    NOTE: This dictionary MUST BE SORTED by `(·.qsort (fun (k₁, _) (k₂, _) => k₁ ≥ k₂))` prior to being passed as
    an argument to this function. So, for example, one should not pass `t := #[("Set", "\\mathbf{Set}")] ++ translations`,
    but should instead pass `t.qsort (fun (k₁, _) (k₂, _) => k₁ ≥ k₂)`.

    **Default**: `«authoring defs».translations`, found in `Inset.AuthorPages`.
  -/
  preamble : Array (String × String) := «authoring defs».translations

/--
  Do all `inset`-to-`KaTeX` translations on a `Page`, using its `.preamble` to do so.

  This recursively calls `«authoring defs».unescape` on all appropriate `String`s that make up the given `Page`.
-/
def Page.unescape (page : Page) : Page :=
  let TextElement.unescape (te : TextElement) : TextElement :=
        match te with
        | .s s            => .s («authoring defs».unescape s)
        | .a href content => .a href («authoring defs».unescape content)
        | .al al          => .al (al.map «authoring defs».unescape)
        | .eqn e          => .eqn («authoring defs».unescape e)
  let Sidenote.unescape (sn : Sidenote) : Sidenote :=
        sn.map TextElement.unescape
  let TextContent.unescape (tc : TextContent) : TextContent :=
        match tc with
        | .e e => .e (TextElement.unescape e)
        | .sn s => .sn (Sidenote.unescape s)
  let Text.unescape (t : Text) : Text :=
        t.map TextContent.unescape
  let IDFrame.unescape (f : IDFrame) : IDFrame :=
        { f
        with  text      := f.text.map Text.unescape
        ,     sidenote  := f.sidenote.map Text.unescape
        }
  let InteractiveDiagram.unescape (d : InteractiveDiagram) : InteractiveDiagram :=
        d.map IDFrame.unescape
  let BodyElement.unescape (be : BodyElement) : BodyElement :=
        match be with
        | .p t =>
          .p (Text.unescape t)
        | .ul ts =>
          .ul (ts.map Text.unescape)
        | .cda d =>
          .cda d
        | .ida d =>
          .ida (InteractiveDiagram.unescape d)
  let Element.unescape (e : Element) : Element :=
        match e with
        | .body b =>
          .body (b.map BodyElement.unescape)
        | .block b =>
          .block
            { b
            with  title := b.title.map «authoring defs».unescape
            ,     body  := b.body.map BodyElement.unescape
            }
  let Section.unescape (s : Section) : Section :=
        { s with
          title := «authoring defs».unescape s.title
          list := s.elements.map Element.unescape
        }
  { page with sections := page.sections.map Section.unescape }
