#!/usr/bin/env racket

#lang racket/base

(require racket/system)
(require racket/list)

;Form bspc command string
(define
 (form-bspc-string com)
 (cons (find-executable-path "bspc") com))

;Execute a command using bspc
;(define
; (do-bspc-command com)
; (system (form-bspc-string com)))

;Execute a command using bspc, taking a list of arguments
(define
 (do-bspc-command com)
 (apply process* (form-bspc-string com)))

;Set a string-valued configuration option using bspc
(define
 (bspc-config-string setting value)
 (do-bspc-command
  (list "config" setting value)))

;Set a boolean-valued configuration option using bspc
(define
 (bspc-config-bool setting value)
 (bspc-config-string setting (if value "true" "false")))

;Set a numeric-valued configuration option using bspc
(define
 (bspc-config setting value)
 (do-bspc-command
  (list "config" setting (number->string value))))

;Add window rule
(define
 (bspc-rule program rule)
 (do-bspc-command
  (list "rule" "--add" program rule)))

;Reset window rules
(define
 (reset-window-rules program)
 (do-bspc-command
  (list "rule" "--remove" program)))

;Set up colors
;For some reason color values have to be double-quoted. No idea why, will fix asap.
(define
 (setup-colors
  normal-border-color
  focused-border-color
  presel-feedback-color)
 (bspc-config-string "normal_border_color" normal-border-color)
 (bspc-config-string "focused_border_color" focused-border-color)
 (bspc-config-string "presel_feedback_color" presel-feedback-color))

;Add desktop
(define
 (add-desktop name)
 (do-bspc-command
 	(list "monitor" "--add-desktops" name)))

;Reset desktops
(define
 (setup-desktops names)
 (do-bspc-command
 	(append '("monitor" "--reset-desktops") names)))

;Run .xinitrc
(define (xinitrc) (system "~/.xinitrc"))

;Start sxhkd
(define
 (start-sxhkd)
 (process* (find-executable-path "sxhkd") "-m" "-1"))

;Set up config options
(define
 (setup-configs)
 (start-sxhkd)

 (setup-desktops (list "web" "chat" "♫" "λ" ">_" "etc"))

 (bspc-config "border_width" 0)
 (bspc-config "window_gap" 24)
 (bspc-config "split_ratio" 0.55)
 (bspc-config "bottom_padding" 72)

 (bspc-config-bool "borderless_monocle" #t)
 (bspc-config-bool "gapless_monocle" #t)
 (bspc-config-bool "focus_follows_pointer" #t)

 (setup-colors "'#282828'" "'#458588'" "'#98971A'")

 (reset-window-rules "plasmashell")

 (bspc-rule "plasmashell" "state=floating")
 (bspc-rule "plasmashell" "focus=on")

 (xinitrc))

;Run the script
(setup-configs)

