/*
  NOTE: The following elements MUST be present in the `<head>` to allow `KaTeX` to be
  used on a Discussion-family webpage.
  SOURCE: https://katex.org/docs/browser
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/katex.min.css"
      integrity="sha384-5TcZemv2l/9On385z///+d7MSYlvIEw9FuZTIdZ14vJLqWphw7e7ZPuOiCHJcFCP"
      crossorigin="anonymous"
    >
    <script
      src="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/katex.min.js"
      integrity="sha384-cMkvdD8LoxVzGF/RPUKAcvmm49FQ0oxwDF3BGKtDXcEc+T1b2N+teh/OJfpU0jr6"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/katex@0.16.22/dist/contrib/auto-render.min.js"
      integrity="sha384-hCXGrW6PitJEwbkoStFjeJxv+fSOOQKOPbJxSfM6G5sWZjAyWhXiTIIAmQqnlLlh"
      crossorigin="anonymous"
    ></script>
*/

document.addEventListener("DOMContentLoaded", () => {
  /* SECTION: Jumping around page */

  /**
   * Jump to a section by specifying its ID
   * @param {string} sectionId
   *  `id` of the section to jump to
   */
  function jumpToSection(sectionId) {
    try {
      document.getElementById(sectionId).scrollIntoView({behavior: "auto"}); // SOURCE: https://stackoverflow.com/a/62546650
    } catch (exception) {
      // squash
    }
  }

  /** Jump to the top of the page. */
  function jumpToTop() {
    window.scrollTo(0, 0);
  }



  /* SECTION: Toggle sidebars */

  /** Toggle whether the contents bar is displayed or not. */
  const toggleContentsBar = () => {
    const contentsBar = document.getElementById("contents-bar");
    contentsBar.classList.toggle("hidden");
  }
  
  /** Toggle whether the sidenotes bar is displayed or not. */
  const toggleSidenotesBar = () => {
    const sidenotesBar = document.getElementById("sidenotes-bar");
    sidenotesBar.classList.toggle("hidden");
  }



  /* SECTION: Refresh `<iframe>`s */

  /**
   * Array of all IDs of currently active timeouts for refreshing the `<iframe>`s.
   * This array is wrapped in an object to allow it to be mutated when passed as an argument to a function;
   * i.e. for "fake pass-by-reference".
   */
  let activeRefreshIframeTimeouts = {
    ids: []
  };

  /** Time in milliseconds from window resize until all `<iframe>`s reload their content. */
  const IFRAME_RELOAD_TIMEOUT_DURATION = 100;

  /**
   * Clear all the timeouts in the given array of `timeouts.ids`, and set the array to `[]`.
   * @param {Object} timeouts
   *  Object holding the array of IDs of timeouts to clear as a `.ids` field.
   *  This array will be MUTATED, being set to `[]` on completion of this method.
   */
  const clearTimeouts = (timeouts) => {
    timeouts.ids.forEach(clearTimeout);
    timeouts.ids = [];
  }

  /**
   * Add a timeout to run the `callback` after the given `duration` has elapsed into the array
   * held in `timeouts.ids`.
   * @param {Object} timeouts 
   *  Object holding the array of IDs of timeouts to add to.
   *  This array will be MUTATED.
   * @param {() => void} callback 
   *  Callback to perform once the timeout elapses.
   * @param {number} duration 
   */
  const addTimeout = (timeouts, callback, duration) => {
    timeouts.ids.push(setTimeout(callback, duration));
  }

  /** Refresh all `<iframe>`s on the page. */
  const refreshIframes = () => {
    // We refresh the `<iframe>`s by setting their `.src` attributes to `"about:blank"` and
    // later overriding them with their `.dataset.src` (which contains a constant copy of
    // the desired `.src`.
    // The "later" is `IFRAME_RELOAD_TIMEOUT_DURATION` milliseconds later.
    // Since `refreshIframes` will be called many times when the browser size is dragged
    // around by a user, we will have hundreds of timeouts elapse. To make this not feel
    // nauseating for the user, we `clearTimeout` any of the timeout IDs that haven't
    // elapsed.
    // The "normal" way to do this (`iframe.src = iframe.src`) doesn't seem to work on my
    // copy of Firefox.
    clearTimeouts(activeRefreshIframeTimeouts);
    Array.from(document.getElementsByTagName("iframe")).forEach((iframe) => {
      iframe.src = "about:blank";
      addTimeout(activeRefreshIframeTimeouts, () => {
        iframe.src = iframe.dataset.src;
      }, IFRAME_RELOAD_TIMEOUT_DURATION);
    });
  }



  /* SECTION: Amend `.frame-number` field of some interactive diagram */

  /** 
   * Array of all IDs of currently active timeouts for unfocusing a `.frame-number`. 
   * This array is wrapped in an object to allow it to be mutated when passed as an argument to a function;
   * i.e. for "fake pass-by-reference".
   */
  let activeUnfocusFrameNumberTimeouts = {
    ids: []
  };

  /** Time in milliseconds from last change in a `.frame-number` field until it is unfocused. */
  const UNFOCUS_FRAME_NUMBER_TIMEOUT_DURATION = 1500;

  /**
   * Compute whether the given `element`'s top-left corner is on-screen.
   * @param {Element} element
   *  The element to check for visibility
   * @returns {boolean}
   *  `true` just when the top-left corner of the `element` is on-screen.
   */
  const isOnScreen = (element) => {
    let rect = element.getBoundingClientRect();
    return rect.x >= 0 && rect.y >= 0;
  }

  /**
   * Get an array containing all of the interactive diagrams currently on-screen, sorted top-to-bottom.
   * @returns {Array<Element>}
   *  The array of all interactive diagrams currently on-screen.
   */
  const getOnScreenInteractiveDiagrams = () => {
    return Array.from(document.getElementsByClassName("interactive-diagram-container")).filter(isOnScreen);
  }

  /**
   * Run the given `action` on the topmost interactive diagram currently on screen.
   * Do nothing if there are no such diagrams on screen.
   * @param {(Element) => void} action
   *  The action to perform.
   */
  const withTopmostInteractiveDiagram = (action) => {
    let diagrams = getOnScreenInteractiveDiagrams();
    if (diagrams.length === 0) {
      return;
    }
    const [diagram, ..._] = diagrams;
    action(diagram);
  }

  /**
   * Get the `.frame-number` field of this diagram.
   * Return `null` on failure to find it.
   * @param {Element} diagram 
   *  The `<div class="interactive-diagram-container">` to find the
   *  `.frame-number` field of.
   * @returns {Element}
   *  The `<input class="frame-number">` held within the `diagram`, or
   *  `null` if it could not be found.
   */
  const getFrameNumberField = (diagram) => {
    try {
      return Array
        .from(
          Array.from(
            Array.from(diagram.children)
            [0] // `.interactive-diagram-frame`
            .children
          ).filter((element) => element.classList.contains("controls"))
          [0] // `.controls`
          .children
        ).filter((element) => (element.tagName === "INPUT"))
        [0]
      ;
    } catch (e) {
      return null;
    }
  }

  /**
   * Get the "left button" of the given interactive commutative `diagram`.
   * @param {Element} diagram 
   *  The diagram to get the left button of.
   * @returns {Element | null}
   *  The left button of the diagram, or `null` if it could not be found.
   *  If the HTML is encoded correctly, then this method should never return `null`.
   */
  const getLeftButton = (diagram) => {
    try {
      return Array
        .from(
          Array.from(
            Array.from(diagram.children)
            [0] // `.interactive-diagram-frame`
            .children
          ).filter((element) => element.classList.contains("controls"))
          [0] // `.controls`
          .children
        ).filter((element) => (element.tagName === "BUTTON"))
        [0]
      ;
    } catch (e) {
      return null;
    }
  }

  /**
   * Get the "right button" of the given interactive commutative `diagram`.
   * @param {Element} diagram 
   *  The diagram to get the right button of.
   * @returns {Element | null}
   *  The right button of the diagram, or `null` if it could not be found.
   *  If the HTML is encoded correctly, then this method should never return `null`.
   */
  const getRightButton = (diagram) => {
    try {
      return Array
        .from(
          Array.from(
            Array.from(diagram.children)
            [0] // `.interactive-diagram-frame`
            .children
          ).filter((element) => element.classList.contains("controls"))
          [0] // `.controls`
          .children
        ).filter((element) => (element.tagName === "BUTTON"))
        [1]
      ;
    } catch (e) {
      return null;
    }
  }

  /**
   * Get the `.frame-number` of the given interactive commutative `diagram`, and run
   * the specified `action` on it.
   * Do nothing if the `.frame-number` cannot be found.
   * @param {Element} diagram 
   *  The diagram.
   * @param {(Element) => void} action 
   *  The action to run with the diagram's `.frame-number` field.
   */
  const withFrameNumberField = (diagram, action) => {
    const frameNumber = getFrameNumberField(diagram);
    if (frameNumber === null) {
      return;
    }
    action(frameNumber);
  }

  /**
   * Get the "left button" of the given interactive commutative `diagram`, and run
   * the specified `action` on it.
   * Do nothing if the button cannot be found.
   * @param {Element} diagram 
   *  The diagram.
   * @param {(Element) => void} action 
   *  The action to run with the diagram's left button.
   */
  const withLeftButton = (diagram, action) => {
    const leftButton = getLeftButton(diagram);
    if (leftButton === null) {
      return;
    }
    action(leftButton);
  }

  /**
   * Get the "right button" of the given interactive commutative `diagram`, and run
   * the specified `action` on it.
   * Do nothing if the button cannot be found.
   * @param {Element} diagram 
   *  The diagram.
   * @param {(Element) => void} action 
   *  The action to run with the diagram's right button.
   */
  const withRightButton = (diagram, action) => {
    const rightButton = getRightButton(diagram);
    if (rightButton === null) { 
      return;
    }
    action(rightButton);
  }

  /**
   * Run the given `action` on the `.frame-number` field of the topmost interactive
   * diagram currently on screen.
   * Do nothing if there are no such diagrams on screen.
   * @param {(Element) => void} action
   *  The action to perform on the "frame number" field
   */
  const withTopmostFrameNumberField = (action) => {
    let diagrams = getOnScreenInteractiveDiagrams();
    if (diagrams.length === 0) {
      return;
    }
    const [diagram, ..._] = diagrams;
    const input = getFrameNumberField(diagram);
    if (input === null) {
      return; // Squash
    }
    action(input);
  }

  /**
   * Reload the given `diagram`; i.e. validate the data in the `.frame-number` field and render the frame
   * specified in the `.frame-number` field.
   * @param {Element} diagram 
   *  The diagram to reload.
   */
  const reloadDiagram = (diagram) => {
    // Get the `.frame-number` field, and adjust its `.value` to fall
    // between its `.min` and `.max`.
    const input = getFrameNumberField(diagram);
    input.value = input.value.replace(/\D/g,""); // Strip non-numeric characters; SRC: https://stackoverflow.com/a/1862219
    if (input === null || isNaN(Number(input.value))) {
      return; // Squash
    }
    if (Number(input.value) <= 0) {
      input.value = "1";
    } else if (Number(input.max) < Number(input.value)) {
      input.value = input.max;
    }
    const newFrameNumber = Number(input.value);
    // Get `<iframe>`s and `<span>`s to modify
    const iframes = Array.from(Array.from(Array.from(diagram.children)[0].children)[0].children);
    const spans = Array.from(Array.from(Array.from(diagram.children)[0].children)[1].children);
    if (iframes.length !== spans.length || newFrameNumber <= 0 || iframes.length < newFrameNumber) {
      // There are more `<iframe>`s than `<span>`s (or vice versa),
      // or the `newFrameNumber` is out of bounds. Give up.
      return;
    }
    // Reload the diagram
    iframes.forEach((iframe) => {
      iframe.classList.add("fake-hidden");
    });
    spans.forEach((span) => {
      span.classList.add("fake-hidden");
    });
    iframes[newFrameNumber - 1].classList.remove("fake-hidden");
    spans[newFrameNumber - 1].classList.remove("fake-hidden");
  }

  /**
   * Reload the topmost interactive diagram currently on screen.
   * Do nothing if there are no such diagrams.
   */
  const reloadTopmostInteractiveDiagram = () => {
    withTopmostInteractiveDiagram(reloadDiagram);
  }

  /**
   * Focus the `.frame-number` field of the topmost interactive diagram currently on screen.
   * If there are no such diagrams on screen, then do nothing.
   */
  const focusFrameNumber = () => {
    withTopmostFrameNumberField((input) => {
      if (input !== document.activeElement) {
        input.value = "";
        input.focus();
      }
      // Setup timeout to later unfocus this field
      clearTimeouts(activeUnfocusFrameNumberTimeouts);
      addTimeout(activeUnfocusFrameNumberTimeouts, unfocusFrameNumber, UNFOCUS_FRAME_NUMBER_TIMEOUT_DURATION);
    });
  }

  /** Unfocus any `.frame-number` which currently has focus, and reload the topmost diagram. */
  const unfocusFrameNumber = () => {
    if (document.activeElement.classList.contains("frame-number")) {
      document.activeElement.blur();
    }
    reloadTopmostInteractiveDiagram();
  }

  /**
   * Adjust the `.frame-number` of a diagram by accessing its `<input class="frame-number">`.
   * @param {Number} offset
   *  Amount by which to change the frame number.
   * @param {Element} input 
   *  The `<input class="frame-number">` to modify.
   * @returns 
   */
  const adjustFrameNumber = (offset, input) => {
    if (input === null || isNaN(Number(input.value))) {
      return; // Squash
    }
    input.value = String(Number(input.value) + offset);
  }

  /**
   * Decrement the frame number of the topmost on-screen interactive diagram.
   * Do nothing if there are no such diagrams.
   */
  const decrementOnScreenFrameNumber = () => {
    withTopmostFrameNumberField((input) => {
      adjustFrameNumber(-1, input);
    });
  }

  /**
   * Increment the frame number of the topmost on-screen interactive diagram.
   * Do nothing if there are no such diagrams.
   */
  const incrementOnScreenFrameNumber = () => {
    withTopmostFrameNumberField((input) => {
      adjustFrameNumber(+1, input);
    });
  }



  /* SECTION: Event handlers */

  /**
   * Object tracking the state of which modifier keys are currently being pressed.
   * Each field is stored as a `boolean`: `true` for "currently held down".
   * This is used to disable the `"c"` keyboard shortcut while the user tries to
   * `"CMD+C"` or `"CTRL+C"` (copy) their text on the webpage, for example.
   */
  let modifierKeyState = {
    // Inspired by SRC: https://stackoverflow.com/a/45124140
    Control: false,
    Alt: false,
    Meta: false
  }

  /**
   * Update the `modifierKeyState`.
   * @param {boolean} value
   *  The value to set the appropriate field in the `modifierKeyState` to.
   *  Should be `true` when the key is pressed down; `false` when the key is lifted up.
   * @param {KeyboardEvent} e 
   *  Event with the key to read.
   */
  const updateModifierKeyState = (value, e) => {
    // Inspired by SRC: https://stackoverflow.com/a/45124140
    if (modifierKeyState.hasOwnProperty(e.key)) {
      modifierKeyState[e.key] = value;
    }
  }

  /**
   * Look up whether a modifier key is currently held down.
   * @returns {boolean}
   *  `true` just when a modifier key is currently held down.
   */
  const isModifierKeyDown = () => {
    return modifierKeyState.Control || modifierKeyState.Alt || modifierKeyState.Meta;
  }

  /**
   * Handle keypresses by the user. The following actions are supported:
   *  SHIFT + NUMBER:
   *    ")":  Jump to top
   *    "!":  Jump to the section at `sectionIds[0]`
   *    "@":  Jump to the section at `sectionIds[1]`
   *    "#":  Jump to the section at `sectionIds[2]`
   *    "$":  Jump to the section at `sectionIds[3]`
   *    "%":  Jump to the section at `sectionIds[4]`
   *    "^":  Jump to the section at `sectionIds[5]`
   *    "&":  Jump to the section at `sectionIds[6]`
   *    "*":  Jump to the section at `sectionIds[7]`
   *    "(":  Jump to the section at `sectionIds[secitonIds.length - 1]`
   *  NUMBER:
   *    "0", "1", "2":  If the `.frame-number` input of the topmost on-screen
   *    "3", "4", "5":   interactive diagram does not have focus, then reset its
   *    "6", "7", "8":   value to `""` and give it focus. The overall effect is to
   *    "9"          :   "start typing into the field". Only useful on Proof-family
   *                     pages.
   *    "Escape":       If the `.frame-number` input of some interactive diagram has
   *                     focus, then unfocus it. Only useful on Proof-family pages.
   *  LETTER:
   *    "c":  Toggle contents bar
   *    "s":  Toggle sidenotes bar
   *    "h":  Decrement the `.frame-number` of the topmost on-screen interactive diagram.
   *    "l":  Increment the `.frame-number` of the topmost on-screen interactive diagram.
   * All alphabetic keys are case-insensitive.
   * @param {KeyboardEvent} e
   *  The event triggering this callback
   */
  const handleKeyDown = (e) => {
    updateModifierKeyState(true, e); // Register keypress
    if (isModifierKeyDown()) {
      return; // Take no action while modifier key is held
    }
    // Act on the relevant key press
    // Enclosed in a `try { ... } catch { ... }` because there may not be enough sections to match the key pressed,
    // if the key is one of `"!@#$%^&*()"`. This squashes index-out-of-bounds-errors.
    try {
      switch (e.key.toLowerCase()) {
        // Jump to section
        case "!":
          jumpToSection(sectionIds[0]);
          break;
        case "@":
          jumpToSection(sectionIds[1]);
          break;
        case "#":
          jumpToSection(sectionIds[2]);
          break;
        case "$":
          jumpToSection(sectionIds[3]);
          break;
        case "%":
          jumpToSection(sectionIds[4]);
          break;
        case "^":
          jumpToSection(sectionIds[5]);
          break;
        case "&":
          jumpToSection(sectionIds[6]);
          break;
        case "*":
          jumpToSection(sectionIds[7]);
          break;
        case "(":
          jumpToSection(sectionIds[sectionIds.length - 1]);
          break;
        case ")":
          jumpToTop();
          break;
        // Type into `.frame-number` field
        case "0":
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
          focusFrameNumber();
          setTimeout(reloadTopmostInteractiveDiagram, 0.01); // Allow keypress to gothrough before reloading
          break;
        case "escape": // Not `"Escape"` due to `.toLowerCase()` in `switch`.
          unfocusFrameNumber();
          reloadTopmostInteractiveDiagram();
          break;
        case "h":
          decrementOnScreenFrameNumber();
          setTimeout(reloadTopmostInteractiveDiagram, 0.01); // Allow keypress to gothrough before reloading
          break;
        case "l":
          incrementOnScreenFrameNumber();
          setTimeout(reloadTopmostInteractiveDiagram, 0.01); // Allow keypress to gothrough before reloading
          break;
        // Toggle sidebars
        case "c":
          toggleContentsBar();
          break;
        case "s":
          toggleSidenotesBar();
          break;
        // Squash anything else
        default:
          break;
      }
    } catch (exception) {
      // squash
    }
  }

  /** The current MUTABLE window width. */
  let windowWidth = window.innerWidth;

  /**
   * Handle the window being resized.
   * Has meaningful effects only if the `window.innerWidth` has changed.
   */
  const handleResize = () => {
    if (window.innerWidth !== windowWidth) {
      // On mobile, the window gets resized due to height changing quite often,
      // but width doesn't change so much. This guard limits how often
      // `refreshIframes` is called due to window resizing on mobile.
      refreshIframes()
      windowWidth = window.innerWidth;
    }
  }



  /* LAUNCH: */

  /** Array of all section `id`s. */
  const sectionIds =
    Array.from(
      document
      .getElementById("content")
      .children
    ).filter((child) => (child.tagName === "SECTION"))
    .map((section) => (section.id))
  ;

  /*
    Add the following event listeners:
      `document`: "keydown": `handleKeyDown`
      `document`: "keyup":   clear modifier key
      `window`: "resize": `refreshIframes`
      `.contents-bar-hide`: `.onclick`: toggleContentsBar
      `.sidenotes-bar-hide`: `.onclick`: toggleSidenotesBar
      Each interactive diagram D:
        D's left button [ <- (h) ]: "click":
          decrement D's frame number
        D's right button [ (l) -> ]: "click":
          increment D's frame number
        D's `.frame-number`: "change":
          reload D
  */ 
  document.addEventListener("keydown", handleKeyDown);
  document.addEventListener("keyup", ((e) => updateModifierKeyState(false, e)));
  window.addEventListener("resize", handleResize);
  document.getElementById("contents-bar-hide").onclick = toggleContentsBar;
  document.getElementById("sidenotes-bar-hide").onclick = toggleSidenotesBar;
  Array.from(document.getElementsByClassName("interactive-diagram-container")).forEach((diagram) => {
    // I love functional programming
    withFrameNumberField(diagram, (frameNumber) => {
      frameNumber.addEventListener("change", () => {
        reloadDiagram(diagram);
      });
    });
    withLeftButton(diagram, (button) => {
      button.addEventListener("click", () => {
        adjustFrameNumber(-1, getFrameNumberField(diagram));
        reloadDiagram(diagram);
      });
    });
    withRightButton(diagram, (button) => {
      button.addEventListener("click", () => {
        adjustFrameNumber(+1, getFrameNumberField(diagram));
        reloadDiagram(diagram);
      });
    });
  });

  // Render all `KaTeX` content in the document.
  // SOURCE: https://katex.org/docs/autorender
  renderMathInElement(document.body, {
    delimiters: [
        {left: '$$', right: '$$', display: true},
        {left: '$', right: '$', display: false},
        {left: '\\(', right: '\\)', display: false},
        {left: '\\[', right: '\\]', display: true}
    ],
    throwOnError : false
  });
});
