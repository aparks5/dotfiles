(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t) 
(setq x-select-enable-clipboard t)

;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;;(setq py-autopep8-options '("--aggressive"))

(global-set-key (kbd "C-x C-;") 'comment-region)
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/groovy-emacs-modes-master")
(load "groovy-mode")

(setq auto-mode-alist (append '(("\\.groovy$" . groovy-mode))
      auto-mode-alist))
(setq auto-mode-alist (append '(("\\.template$" . groovy-mode))
      auto-mode-alist))



;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
;; (require) your ELPA packages, configure them as normal
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
;; Any add to list for package-archives (to add marmalade or melpa) goes here, e.g.:

;; ELPY python IDE
(elpy-enable)

(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-local-mode)

;;customize theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme/")
(add-to-list 'load-path "~/.emacs.d/moe-theme/")
(require 'moe-theme)
(load-theme 'moe-light t)

;;spaceline
(require 'spaceline-config)
(spaceline-emacs-theme)

(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(setq tags-table-list '"path/po/TAGS")
(global-set-key "\M-|" 'etags-select-find-tag)

(add-hook 'python-mode
  (lambda ()
    (setq company-backends '(company-etags))))


(global-set-key [C-tab] 'company-etags)

;; my-log-mode
(setq my-highlights
      '(("INFO" . font-lock-keyword-face)
	("WARNING" . font-lock-function-name-face)
	("DEBUG\\|PASS" . font-lock-builtin-face)
	("STOP\\|ERROR\\|FAIL\\|CRITICAL" . font-lock-warning-face)))

(define-derived-mode my-log-mode fundamental-mode
  (setq font-lock-defaults '(my-highlights))
  (setq mode-name "My Special Log"))

(add-to-list 'auto-mode-alist '("\\.log\\'" . my-log-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules (quote (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-project-root "/my/special/path")
 '(elpy-rpc-backend "rope")
 '(fringe-mode 1 nil (fringe))
 '(password-cache-expiry 3600)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 143 :width normal :foundry "adobe" :family "Source Code Pro")))))

