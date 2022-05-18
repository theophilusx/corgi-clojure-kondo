;;; corgi-clojure-kondo.el --- clj-kondo configuration for Corgi -*- lexical-binding: t -*-
;;
;; Filename: corgi-clojure-kondo.el
;; Package-Requires: ((flymake) (flymake-kondor))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Comentary
;;
;; To use this module, you need to install clj-kondo from
;;   https://github.com/clj-kondo/clj-kondo and
;; and enable this module in your init.el file e.g.
;;
;; (use-package corgi-clojure-kondo
;;   :straight (:host github :repo "theophilusx/corgi-clojure-kondo"
;;   :hook ((clojure-mode . (lambda () (flymake-mode +1))))))
;;
;;; Code:

(require 'use-package)

(use-package flymake
  :config
  (remove-hook 'flymake-diagnostic-functions #'flymake-proc-legacy-flymake))

(use-package flymake-kondor
  :after (flymake)
  :config
  (setq *key-files-list* (cons 'corgi-kondo-keys *key-files-list*)
        *signal-files-list* (cons 'corgi-kondo-signals *signal-files-list*))
  (add-hook 'clojure-mode-hook (lambda ()
	                         (flymake-kondor-setup))))

(provide 'corgi-clojure-kondo)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; corgi-clojure-kondo.el ends here
