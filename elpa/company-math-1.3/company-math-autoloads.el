;;; company-math-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (company-math-symbols-unicode company-math-symbols-latex
;;;;;;  company-latex-commands) "company-math" "company-math.el"
;;;;;;  (24657 63267 555795 28000))
;;; Generated autoloads from company-math.el

(autoload 'company-latex-commands "company-math" "\
Company backend for latex commands.
COMMAND and ARG is as required by company backends.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-math-symbols-latex "company-math" "\
Company backend for LaTeX mathematical symbols.
COMMAND and ARG is as required by company backends.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-math-symbols-unicode "company-math" "\
Company backend for insertion of Unicode mathematical symbols.
COMMAND and ARG is as required by company backends.
See the unicode-math page [1] for a list of fonts that have a
good support for mathematical symbols. Unicode provides only a
limited range of sub(super)scripts; see the wikipedia page [2]
for details.

 [1] http://ftp.snt.utwente.nl/pub/software/tex/help/Catalogue/entries/unicode-math.html
 [2] https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil nil ("company-math-pkg.el") (24657 63267 558720
;;;;;;  946000))

;;;***

(provide 'company-math-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; company-math-autoloads.el ends here
