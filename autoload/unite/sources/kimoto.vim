let s:save_cpo = &cpo
set cpo&vim

let s:source = {
\ 'name' : 'kimoto',
\ 'default_action' : 'edit',
\ 'description' : 'candidates for kimoto APIs',
\ }

function! unite#sources#kimoto#define()
  return s:source
endfunction

function! s:source.gather_candidates(args, context)
  return map(copy(g:kimoto_endpoints), "{
  \ 'word': v:val.name, 'abbr': v:val.name, 'action__path': v:val.name,
  \ 'kind': 'command', 'action__command':
  \ printf('call KimotoPost(''%s'')\n', v:val.name),
  \}")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
