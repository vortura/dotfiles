" For whatever reason, gitcommit.vim only wraps at 72 chars if textwidth=0. This
" is annoying, so override it here. 
"
" Taken from:
"   http://stackoverflow.com/questions/15869839/set-textwidth-in-vim-without-overriding-filetype-specific
"
setlocal textwidth=72
let b:undo_ftplugin .= "|setl tw<"
