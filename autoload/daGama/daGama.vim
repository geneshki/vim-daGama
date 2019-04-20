echom "Autoloading daGama..."

function! ExtractData(isGlobal)
  " mark position
  let l:current_pos = getpos();
  " go to definition
  if a:isGlobal 
    normal gD
  else
    normal gd
  endif
  " extract line under cursor
  let l:lnum = line(".")
  let l:line = getline(l:lnum)
  echom l:line

  " all needed data is extracted, go back to original position
  setpos(".", l:current_pos)

  return l:line
endfunction

function! GetFilename(line)
  " match against predefined patterns
  let l:file=""
  if !exists("g:daGama_patterns")
    echom "daGama Error: no patterns have been set"
    return ""
  endif
  
  if empty(g:daGama_patterns[&ft])
    echom "daGama Error: no patterns for this filetype are set"
    return ""
  endif
  let l:lang_patterns = g:daGama_patterns[&ft] 

  let l:pattern_pairs = items(l:lang_patterns)
  let l:pat, l:fn
  for [l:pat, l:fn] in l:pattern_pairs
    let l:matches = matchlist(a:line, l:pat)
    if  !empty(l:matches)
      " process line to extract file information
      l:file= l:fn(l:matches)
      break
    endif
  endfor
  return l:file
endfunction

function! daGama#daGama#Navigate(isGlobal)
  let l:line = ExtractData(a:isGlobal)

  let l:file = GetFilename(l:line)
  " switch depending on the match to the propper handling

  " navigate to the file
  find l:file
endfunction
