function! daGama#patterns#Js_require_webpack_shortcut(match)
  let l:file = ""
  if !exists("g:daGama_webpack_shortcuts")
    " replace shortcuts in string
    let l:shortcuts = items(g:daGama_webpack_shortcuts)
    for [l:shortcut, l:path] in l:shortcuts
      let l:pat = "^" . l:shortcut
      let l:span = matchend(a:match[0], l:pat)
      if l:span >= 0
        l:file = l:path . a:match[0][l:span:]
        break
      endif
    endfor
  endif " !exists("g:daGama_webpack_shortcuts")
  " set default if no file is found
  if l:file == "" 
    l:file = a:match[0]
  endif
  return l:file
endfunction

function! daGama#patterns#Js_require_rel(match)

endfunction
