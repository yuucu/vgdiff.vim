if exists('g:loaded_vgdiff')
  finish
endif
let g:loaded_vgdiff  = 1

command! -nargs=? Vgdiff call vgdiff#Exec(<f-args>)
