(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org//u")))
(package-initialize)

(defvar my/packages '(
                      all-the-icons
                      evil-leader
                      company
                      dap-mode
                      dashboard
                      doom-themes
                      doom-modeline
                      evil
                      evil-nerd-commenter
                      flycheck
                      ;helm-lsp
                      helm
                      ivy
                      ;lsp-ivy
                      lsp-pyright
                      lsp-python-ms
                      rust-mode
                      lsp-mode
                      lsp-treemacs
                      lsp-ui
                      magit
                      monokai-theme
                      projectile
                      undo-fu
                      undo-tree
                      use-package
                      vimrc-mode
                      which-key
                      ))
(setq package-selected-packages my/packages)
;(add-to-list 'my/packages 'monokai-theme)

;(defun my/packages-installed-p ()
  ;(cl-loop for pkg in my/packages
           ;when (not (package-installed-p pkg)) do (cl-return nil)
           ;finally (cl-return t)))
(defun my/packages-installed-p ()
  (cl-every 'package-installed-p my/packages))

(unless (my/packages-installed-p)
  (message "%s" "refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------


;; -------- normal default --------
(setq make-backup-files nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
;(scroll-bar-mode -1)
(electric-pair-mode 1)

;; -------- startup --------
(dashboard-setup-startup-hook)

;; -------- key binding --------
(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "ff" 'find-file
    "bb" 'switch-to-buffer
    "bk" 'kill-buffer
    "p"  'projectile-command-map)
  :ensure t
  :hook (after-init . (lambda ()
                        (global-evil-leader-mode)
                        (evil-mode 1))))
;(projectile-mode 1)
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") `projectile-command-map)
  :ensure t
  :hook (after-init . projectile-mode))

(use-package helm
  :ensure t
  :hook (after-init . (lambda() (helm-mode 1))))

(use-package lsp-mode
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-rust-sysroot 1)
  :ensure t)

;; -------- themes --------
;(load-theme 'monokai 1)
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  ;;(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  ;;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; -------- ui --------
(use-package lsp-ui
  :config
  (setq lsp-ui-doc-enable nil)
  :ensure t)

;; -------- key mapping --------
;; We should put it at the last to avoud bug
;; Allow C-h to trigger which-key before it is done automatically
(use-package which-key
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 1)
  :ensure t
  :hook (after-init . (lambda ()
                        (which-key-setup-minibuffer)
                        (which-key-mode)
                        )))

;; -------- lsp --------
(global-company-mode 1)
(add-hook 'c++-mode-hook #'lsp-deferred)
;(add-hook 'rust-mode-hook #'lsp-deferred)
(use-package rust-mode
  :ensure t
  :hook (rust-mode . (lambda ()
                       (require 'rust-mode)
                       (lsp))))
;(require 'lsp-pyright)
;(add-hook 'python-mode-hook #'lsp-deferred)
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;(require 'lsp-python-ms)
;(setq lsp-python-ms-auto-install-server t)
;(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred
;(use-package lsp-python-ms
  ;:ensure t
  ;:init (setq lsp-python-ms-auto-install-server t)
  ;:hook (python-mode . (lambda ()
                          ;(require 'lsp-python-ms)
                          ;(lsp))))  ; or lsp-deferred

;(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
                                           ;(lsp-format-buffer))))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (defvar treemacs-no-load-time-warnings t)
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;;(use-package treemacs-icons-dired
;;  :after treemacs dired
;;  :ensure t
;;  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp ;;treemacs-persective if you use perspective.el vs. persp-mode
  :after treemacs persp-mode ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))
;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers (quote relative))
 '(inhibit-startup-screen t)
 '(lsp-ui-sideline-actions-icon nil)
 '(package-selected-packages (quote (lsp-mode monokai-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
