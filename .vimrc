"source $VIMRUNTIME/mswin.vim

execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

set ts=4 sts=4 sw=4 expandtab
set nu
set incsearch
set hlsearch
set backspace=2

set background=dark
colorscheme seti

" Show Invisible characters
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:»\ ,eol:¬
set list
"Invisible character colors 
highlight NonText guifg=#232c2d guibg=#151718
highlight SpecialKey guifg=#232c2d guibg=#151718

" JSHint
autocmd! BufWritePost,BufReadPost *.js JSHint

" Force.com / mavensmate
autocmd! BufWritePost *.cls,*.component,*.page !mavensmate compile-metadata <afile>
autocmd FileType visualforce setlocal noexpandtab

" Unite
if has('gui_win32')
    let g:unite_source_rec_async_command = ['C:\\Users\\scott.bachman\\vimfiles\\ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

if has('gui_running')
    set guioptions-=T
    "set lines=50 columns=120
    "winpos 400 100
    if has('gui_win32')
        au GUIEnter * simalt ~x " maximize window
        set guifont=Consolas:h11:cANSI
    endif
    if has('gui_macvim')
        set guifont=Monaco:h14
    endif
endif	
