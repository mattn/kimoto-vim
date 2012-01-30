function! s:KimotoPost()
  call inputsave()
  redraw
  let status = input("Kimoto: ")
  call inputrestore()
  let yesno = confirm("Are you kimoto?", "&Yes\n&No")
  if yesno == 1
    let res = http#post("http://api.ma.la/twitter/", {"status": status, "is_kimoto": 1})
  endif
endfunction

command! Kimoto :call <SID>KimotoPost()
