let s:vgdiff_result_buffer_name = 'VGDIFF'


function! vgdiff#Exec(...) abort
    let target = a:0 > 1 ? a:1 : "$(git rev-parse HEAD)"
    let cmd = "git show " . target .  ":" . expand('%') 
    let res = system(cmd)
    call vgdiff#PrintResult(res)
endfunction

" 結果を別windowで表示します
function! vgdiff#PrintResult(res) abort
  setlocal splitright

  let current_win_id = win_getid()
  execute "vnew" s:vgdiff_result_buffer_name . "." . expand('%:e') 
  call append(0, split(a:res, "\n"))
  execute 'normal dd'
  execute 'windo diffthis'
  execute 'windo diffupdate'

  setlocal foldlevel=1
  setlocal buftype=nowrite  
  setlocal bufhidden=wipe 
  setlocal nowrap
  call win_gotoid(current_win_id)
endfunction

