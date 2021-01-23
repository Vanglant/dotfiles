"GuiFont! JetBrainsMono\ Nerd\ Font\:h11
GuiFont! Iosevka \NF:h11
" GuiFont! Iosevka:h11
GuiPopupmenu 0

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
