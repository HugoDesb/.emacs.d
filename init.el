;;
;; declare additionnal repo for downloads
;;
(require 'package) ;; Necessary
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;; packages required for the configuration
(setq package-list
      '(
	magit
	company
	paredit
	rainbow-delimiters
	doom-themes
	nlinum
	git-gutter-fringe
	company
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  CONFIGURATION                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(toggle-frame-maximized)


;;;;;;;;;;;;;;;;;;;;;;;;;
;;     DOOM  THEME 
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'doom-themes)
;;; Settings
(setq doom-enable-bold t    ; if nil, bolding are universally disabled
      doom-enable-italic t  ; if nil, italics are universally disabled
      
      ;; doom-one specific settings
      doom-one-brighter-modeline t
      doom-one-brighter-comments nil
      )
(load-theme 'doom-one t) ;; or doom-dark, etc.
(require 'doom-nlinum)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      () management
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;;;;;;;;;;;;;;;;;
;;    NLINUM
;;;;;;;;;;;;;;;;;;
(require 'nlinum)
(global-nlinum-mode t)


;;;;;;;;;;;;;;;;;;
;;    GUTTER
;;;;;;;;;;;;;;;;;;
(require 'git-gutter-fringe)
(fringe-helper-define 'git-gutter-fr:added nil
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX...")

(fringe-helper-define 'git-gutter-fr:deleted nil
  "........"
  "........"
  "........"
  "..X....."
  "..XX...."
  "..XXX..."
  "..XXXX.."
  "..XXXXX."
  "..XXXX.."
  "..XXX..."
  "..XX...."
  "..X....."
  "........"
  "........"
  "........"
  )

(fringe-helper-define 'git-gutter-fr:modified nil
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX..."
  "...XX...")
(global-git-gutter-mode t)


;;;;;;;;;;;;;;
;;  COMPANY
;;;;;;;;;;;;;
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)




;;
;; system disabling (not possible to do it elsewhere)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(cua-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
