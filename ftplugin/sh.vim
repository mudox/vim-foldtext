" vim: foldmethod=marker

function! ShFoldText() " {{{1
  if &l:foldmethod !=# 'marker'
    return getline(v:foldstart)
  endif

  let foldline = getline(v:foldstart)

  " remove comment marker
  " only remove the first one found.
  let foldline = substitute(foldline, '#', '', '')

  " remove fold marker.
  let foldline = StripFolderMarker(foldline)

  " strip redundant heading space
  let foldline = substitute(foldline, '^\s*', ' ' , '')

  return g:foldline_fancy_symbol . FoldLevelIndent('-') . foldline
endfunction "  }}}1

setlocal foldtext=ShFoldText()
