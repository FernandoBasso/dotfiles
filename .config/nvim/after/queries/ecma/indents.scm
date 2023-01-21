;;
;; Check:
;;
;; • https://github.com/nvim-treesitter/nvim-treesitter/issues/1167
;; • https://github.com/nvim-treesitter/nvim-treesitter/pull/2545
;;
;; Treesitter has to have `indent` enabled and JSDoc comments have to
;; be in the form:
;;
;;   /**
;;    *
;;    */
;;
;; An unfinished (unclosed) JSDoc will cause the indentantion to
;; behave incorrectly.
;;
(comment) @auto
; [
;   (comment)
;   (template_string)
; ] @auto
