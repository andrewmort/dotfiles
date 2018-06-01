" Sample .local.vimrc file sets up tags in multiple locations for single
" project


let b:tagroot=[
  \"/proj/ad5562/amort/ad5562/cosim_r0p0",
  \'/proj/ad5562/amort/ad5562_ep151/digital/rev0',
  \'/proj/ad5562/amort/ad5562_redwood40v/digital/rev0',
  \'/proj/ad5562/amort/ad5562_redwood5v/digital/rev0'
  \]

let b:ctags_args='--langmap=SystemVerilog:+.vh'

function! RenewTags()
  for cur in b:tagroot
    let l:cmd=join(['ctags -Rf ',l:cur,'/tags ',b:ctags_args,' ',l:cur],'')
    call system(l:cmd)
    "echo l:cmd
  endfo

  echo 'RenewTags(): created tags!'
endfunction


let &tags='./tags'
for cur in b:tagroot
  let &tags=join([&tags, join([cur, '/tags'],'')],',')
endfo

