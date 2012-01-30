function! s:KimotoPost()
  call inputsave()
  redraw
  let status = input("Kimoto: ")
  call inputrestore()
  let yesno = confirm("Are you kimoto?", "&Yes\n&No")
  let api = input("mala or ssig33: ")
  if yesno == 1
    if api == 'ssig33'
      let res = http#post("http://kimoto.ssig33.com/twitter", {"status": status, "is_kimoto": 1})
    else
      let res = http#post("http://api.ma.la/twitter/", {"status": status, "is_kimoto": 1})
    endif
  endif
endfunction

command! Kimoto :call <SID>KimotoPost()
