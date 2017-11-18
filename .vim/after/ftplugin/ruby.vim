inoremap <buffer> <silent> . .<esc>:call <sid>electric_dot()<cr>a

function! s:electric_dot()
  let lnum = line('.')
  if getline(lnum) !~ '^\s*\.$'
    return
  endif

  let pat = '^\s*\.'
  let start = s:until(pat, 'b')
  execute lnum

  if start == 0 || getline(start-1) !~ '^\s*\w.*\.\w'
    normal! ^
    return
  endif

  let end = s:until(pat, '')
  let indent = len(matchstr(getline(start-1), '.*\ze\.'))

  execute start.','.end.'left'.indent
  execute lnum
  normal! ^
endfunction

function! s:until(pat, flags)
  let lnum = line('.')
  let [temp,_] = searchpos(a:pat, a:flags.'W')
  while abs(temp - lnum) == 1
    let lnum = temp
    let [temp,_] = searchpos(a:pat, a:flags.'W')
  endwhile
  return lnum
endfunction
