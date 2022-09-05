;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

;; Resources
;; https://noelwelsh.com/posts/doom-emacs/
;; https://www.reddit.com/r/DoomEmacs/comments/wxqyyy/custom_keybindings_in_doom/
;; https://vxlabs.com/2022/06/12/typescript-development-with-emacs-tree-sitter-and-lsp-in-2022/


(eval-after-load "org"
  '(require 'ox-gfm nil t))

(setq org-babel-exp-code-template "#+begin_src-name\n%name\n#+end_src-name\n#+begin_src %lang%switches%flags\n%body\n#+end_src")

;; TREEMACS
(setq treemacs--width-is-locked nil)
(setq treemacs-width 24)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 150)

(setq default-frame-alist '((width . 126) (height . 50)))
;; (add-to-list 'default-frame-alist '(alpha . (90 . 90)))
(add-to-list 'default-frame-alist '(alpha . (100 . 100)))

;; Custom org colors
(custom-theme-set-faces 'user
                        `(org-level-1 ((t (:foreground "#c8c8c8" :bold t))))
                        `(org-level-2 ((t (:foreground "#c8c8c8":bold t))))
                        `(org-level-3 ((t (:foreground "#c8c8c8":bold t))))
                        `(org-level-4 ((t (:foreground "#c8c8c8":bold t))))
                        `(org-document-title ((t (:foreground "#c8c8c8"))))
                        `(org-document-info ((t (:foreground "#c8c8c8"))))
                        `(org-todo ((t (:foreground "#bd3737" :bold t))))
                        `(org-done ((t (:foreground "#4286e6" :bold t))))
                        `(org-headline-done ((t (:foreground "#c8c8c8" :bold t))))
                        )

;; DITAA
(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.11.0_1/libexec/ditaa-0.11.0-standalone.jar")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates dita

(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse t)
(setenv "DICTIONARY" "en_US")
(setq ispell-dictionary "en_US")

;; PYTHON
(setq python-shell-completion-native-enable nil)



;; DOOM
(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       (company + tng)           ; the ultimate code completion backend
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       ;;ivy               ; a search engine for love and life
       vertico           ; the search engine of the future

       :ui
       ;;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       ;;doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;(emoji +unicode)  ; 🙂
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;; indent-guides     ; highlighted indent columns
       ;;ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ;;nav-flash         ; blink cursor line after big motions
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       ;;tabs              ; a tab bar for Emacs
       (treemacs +lsp)          ; a project drawer, like neotree but cooler
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       ;;fold              ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy             ; vim for lisp, for people who don't like vim
       multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ;;ibuffer         ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;(spell +hunspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       (debugger +lsp)          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       ;; editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       (magit +forge)   ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       tree-sitter       ; syntax and parsing, sitting in a tree...
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       (cc +lsp +tree-sitter)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       (go +lsp)         ; the hipster dialect
       ;;(graphql +lsp)    ; Give queries a REST
       ;;(haskell +lsp)    ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       json              ; At least it ain't XML
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       (javascript +tree-sitter)        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       (latex +fold)       ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       lua               ; one-based indices? one-based indices
       markdown           ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org +pretty +lsp)  ; organize your plain life in plain text
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python +tree-sitter +lsp +pyenv +pyright + poetry) ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       (sh +tree-sitter)   ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       web               ; the tubes
       yaml              ; JSON, but readable
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       ;;literate
       (default +bindings +smartparens))


;; https://github.com/emacs-t@variableree-sitter/tree-sitter-langs
;;/Users/albertovaldez/.emacs.d/.local/straight/repos/elisp-tree-sitter/langs/queries/python

(face-spec-set 'tree-sitter-hl-face:function '(
    (t (:italic nil
        :foreground "#d9ce96"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:function.call '(
    (t (:italic nil
        :foreground "#d9ce96"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:function.macro '(
    (t (:italic nil
        :foreground "#d9ce96"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:function.special '(
    (t (:italic nil
        :foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:function.macro '(
    (t (:italic nil
        :foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:function.builtin '(
    (t (:foreground "#C586C0"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:property '(
    (t (:foreground "#a9dbfa"
        :italic nil
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:label '(
    (t (:foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:variable.parameter '(
    (t (:foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:variable '(
    (t (:foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:variable.special '(
    (t (:foreground "#a9dbfa"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:string '(
    (t (:foreground "#c5937c"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:constant '(
    (t (:foreground "#d8d8d8"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:constant.builtin '(
    (t (:foreground "#339CDB"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:number '(
    (t (:foreground "#BBCCAA"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:operator '(
    (t (:foreground "#d0d0d0"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:type '(
    (t (:foreground "#35CDAF"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:type.argument '(
    (t (:foreground "#35CDAF"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:type.builtin '(
    (t (:foreground "#35CDAF"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:type.super '(
    (t (:foreground "#35CDAF"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:escape '(
    (t (:foreground "#339CDB"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:keyword '(
    (t (:foreground "#339CDB"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:doc '(
    (t (:foreground "#c5937c"
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:punctuation.delimiter '(
    (t (:foreground "#d0d0d0"
        :background "#252525"
        :alpha 0
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:punctuation.bracket '(
    (t (:foreground "#d0d0d0"
        :background "#252525"
        :alpha 0
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:punctuation.special '(
    (t (:background "#252525"
        :alpha 0
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:punctuation '(
    (t (:background "#252525"
        :alpha 0
        :bold nil))))
(face-spec-set 'tree-sitter-hl-face:embedded '(
    (t (:foreground "#a9dbfa"
        :background "#252525"
        :alpha 0
        :bold nil))))
;; HTMLIZE
