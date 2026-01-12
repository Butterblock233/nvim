" Enable Mouse
set mouse=a

if exists(':GuiFont')
	" same as vim.env.NVIM_GUI_FONT
    let gui_font = $NVIM_GUI_FONT
    
    if !empty(gui_font)
        execute 'GuiFont!' gui_font
    endif
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif
" Enable Gui ligature
if exists(':GuiRenderLigature')
    GuiRenderLigature 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
