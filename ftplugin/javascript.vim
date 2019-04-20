echom "daGama loaded for JS"
if !exists("g:daGama_patterns")
  let g:daGama_patterns = {}
endif
if empty(g:daGama_patterns[&ft])
  g:daGama["javascript"] = {}
endif

g:daGama_patterns["javascript"]["^.*require([\"']\(!\.\)\(.*\)[\"'])"] = function("daGama#patterns#Js_require_webpack_shortcut")
g:daGama_patterns["javascript"]["^.*require([\"']\(\.\)\(.*\)[\"'])"] = function("daGama#patterns#Js_require_rel")

nnoremap <buffer> <localleader>q :call daGama#daGama#Navigate(0)<cr>
nnoremap <buffer> <localleader>Q :call daGama#daGama#Navigate(1)<cr>
