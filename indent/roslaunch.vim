
" Use XML indentation rules

if exists("b:did_indent")
  finish
endif

" load the XML indent rules
runtime! indent/xml.vim
runtime! indent/yaml.vim

" override the vim indent expression (we'll call it ourselves)
setlocal indentexpr=GetRoslaunchIndent(v:lnum)

" Only define the function once.
if exists("*GetRoslaunchIndent")
  finish
endif

" wiki-indent will return vim indent inside a <pre> block,
" and return -1 if not inside a block to trigger auto-indent
function GetRoslaunchIndent(lnum)
  return -1
  if searchpair('<rosparam>','','</rosparam>','bWnm') > 0
    return GetYAMLIndent(lnum)
  else
    return -1
  endif
endfunc


