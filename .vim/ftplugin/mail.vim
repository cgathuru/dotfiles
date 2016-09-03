
function IsReply()
  if line('$') > 1
   " :%!par w72q
   " :%s/^.\+\ze\n\(>*$\)\@!/\0 /e
   " :%s/^>*\zs\s\+$//e
    :1
    :put! =\"\n\n\"
    :1
  endif
endfunction

augroup mail_filetype
  autocmd!
  autocmd VimEnter ~/dotfiles/.mutt/temp* :call IsReply()
  autocmd VimEnter ~/dotfiles/.mutt/temp* :exe 'startinsert'
augroup END

"setl tw=72
setl fo=aw

