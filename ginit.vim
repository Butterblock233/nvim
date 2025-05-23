" Enable Mouse
set mouse=a

" 检查 GuiFont 命令是否存在
if exists(':GuiFont')
    " 获取 .env 文件中的字体配置
    let gui_font = $NVIM_GUI_FONT
    
    " 确保字体配置不为空
    if !empty(gui_font)
        " 使用 execute 动态执行 GuiFont! 命令
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
