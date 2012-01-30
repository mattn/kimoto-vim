let s:kimoto_endpoints = [
\ { "name" : "mala",   "url" : "http://api.ma.la/twitter/"         },
\ { "name" : "ssig33", "url" : "http://kimoto.ssig33.com/twitter/" },
\]

function! s:KimotoPost()
  try
    call inputsave()
    redraw
    let status = input("Kimoto: ")
    if len(status) == 0 | return | endif
    let yesno = confirm("Are you kimoto?", "&Yes\n&No")
    if yesno != 1 | return | endif
    let endpoint = get(g:, 'default_kimoto_endpoint', '')
    if len(endpoint) == 0
      let item = inputlist(["Choose endpoint: "]
      \ + map(range(1, len(s:kimoto_endpoints)),
      \ 'v:val . " " . s:kimoto_endpoints[v:val-1].name'))
      let endpoint = s:kimoto_endpoints[item-1].name
    endif
    let items = filter(copy(s:kimoto_endpoints), 'v:val.name==endpoint')
    let res = http#post(items[0].url, {"status": status, "is_kimoto": 1})
  catch
  finally
    call inputrestore()
  endtry
endfunction

command! Kimoto :call <sid>KimotoPost()
nnoremap <silent> <plug>(kimoto) :<c-u>Kimoto<cr>
silent! map <unique> <leader>kimoto <plug>(kimoto)

" vim:set et:
