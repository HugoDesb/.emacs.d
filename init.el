;;
;; declare additionnal repo for downloads
;;
(require 'package) ;; Necessary
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;; packages required for the configuration
(setq package-list
      '(dash
	magit
	company
	paredit
	rainbow-delimiters
	autopair
	))

;;
;; Install packages if not
;; 
; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))