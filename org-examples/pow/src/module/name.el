;; [[file:../../org/header.setup::module/name.el][module/name.el]]
(setq src "../src/")
(concat src (org-element-property :name (org-element-context)))
;; module/name.el ends here
