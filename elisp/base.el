(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
;;             '("elpy" . "http://jorgenschaefer.github.io/packages/")
	     '("Sunrise commander" . "http://joseito.republika.pl/sunrise-commander/")
	     )

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories")

;; Core settings
;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Emacs customizations
(setq confirm-kill-emacs                  'y-or-n-p
      confirm-nonexistent-file-or-buffer  t
      save-interprogram-paste-before-kill t
      mouse-yank-at-point                 t
      require-final-newline               t
      visible-bell                        nil
      ring-bell-function                  'ignore
      custom-file                         "~/.emacs.d/.custom.el"
      ;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
      minibuffer-prompt-properties
      '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)

      ;; Disable non selected window highlight
      cursor-in-non-selected-windows     nil
      highlight-nonselected-windows      nil
      ;; PATH
      exec-path                          (append exec-path '("/usr/local/bin/"))
      indent-tabs-mode                   nil
      inhibit-startup-message            t
      fringes-outside-margins            t
      x-select-enable-clipboard          t
      use-package-always-ensure          t)

;; Bookmarks
(setq
 ;; persistent bookmarks
 bookmark-save-flag                      t
 bookmark-default-file              (concat temp-dir "/bookmarks"))

;; Backups enabled, use nil to disable
(setq
 history-length                     10000
 backup-inhibited                   nil
 make-backup-files                  t
 auto-save-default                  t
 auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  t
 create-lockfiles                   nil
 backup-directory-alist            `((".*" . ,(concat temp-dir "/backup/")))
 auto-save-file-name-transforms    `((".*" ,(concat temp-dir "/auto-save-list/") t)))

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

;; Disable toolbar & menubar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(show-paren-mode 1)



;;; MINE

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)
(set-face-attribute 'default nil :height 100)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Undo/redo window configuration with C-c <left>/<right>
(use-package winner)
(winner-mode 1)

(use-package ivy)
(ivy-mode 1)

(setq-default
 mode-line-buffer-identification
 '(#("%2b" 0 3
	 (local-map
	  (keymap
	   (header-line keymap
					(mouse-3 . mode-line-next-buffer)
					(down-mouse-3 . ignore)
					(mouse-1 . mode-line-previous-buffer)
					(down-mouse-1 . ignore))
	   (mode-line keymap
				  (mouse-3 . mode-line-next-buffer)
				  (mouse-1 . mode-line-previous-buffer)))
	  mouse-face mode-line-highlight help-echo
	  "Buffer name\nmouse-1: Previous buffer\nmouse-3: Next buffer"
	  face mode-line-buffer-id))))

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

(provide 'base)
;;; base ends here
