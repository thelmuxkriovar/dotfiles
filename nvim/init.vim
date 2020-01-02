"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 																			"
" This is mostly a mix of stuff I found online with a few custom changes. 	"
" 																			"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set backspace=indent,eol,start 	" Allow backspace in insert mode
set number relativenumber
set history=1000
set tabstop=4
set wrap
set ai
set hls " highlight search
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions-=t " Don't change wrapping on existing lines
set formatoptions+=l " Black magic
set shiftwidth=4
set spell
set title
set mouse=a
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set shortmess+=c
set laststatus=2
set foldenable
set background=dark
set laststatus=2
set noruler
set virtualedit=
set guioptions+=a
set clipboard=unnamed
set whichwrap+=h,l,<,>,[,]  " essentially proper movement, why isn't this default
set tags=ctags;/
set wildmode=longest,list,full
set splitbelow splitright
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set cursorline
set updatetime=100
set termguicolors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set cursorcolumn
setlocal wrap linebreak nolist
setlocal display+=lastline

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let mapleader=","
let NERDTreeShowHidden=1
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:online_thesaurus_map_keys = 0
" let g:airline#extensions#wordcount#enabled = 1	"Show word count
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_theme='one'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:lightline = {
	\ 'active': {
		\ 'right': [ [ 'lineinfo' ], [ 'percent', 'wordcount' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ },
	\ 'component_function': {
		\ 'wordcount': 'WordCount'
	\ }
\ }

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
\ }

filetype plugin indent on

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
	" Plug 'beloglazov/vim-online-thesaurus'
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'mboughaba/i3config.vim'
	Plug 'junegunn/vim-easy-align'
	Plug 'baskerville/vim-sxhkdrc'
	Plug 'tpope/vim-surround'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rhysd/vim-crystal'
	Plug 'universal-ctags/ctags'
	Plug 'phpactor/phpactor'
	Plug 'junegunn/goyo.vim'
	Plug 'LukeSmithxyz/vimling'
	Plug 'othree/yajs.vim'
	Plug 'thelmuxkriovar/scrollthroughtime.vim'
	Plug 'mhinz/vim-signify'
	Plug 'sirver/UltiSnips'
	Plug 'vim-syntastic/syntastic'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-repeat'
	Plug 'dhruvasagar/vim-table-mode'
call plug#end()

autocmd CursorHold * silent call CocActionAsync('highlight')

map <leader>g :Goyo<CR>
map <C-n> :NERDTreeToggle<CR>

" noremap <C-k>sudo <Esc>:w    !sudo tee %<CR>
noremap <C-k>sudo <Esc>:w !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null<CR>
noremap <silent>  <Up>       gk
noremap <silent>  <Down>     gj
noremap <silent>  <Home>     g<Home>
noremap <silent>  <End>      g<End>
noremap <silent>  <C-r><C-r> :NERDTreeRefreshRoot<CR>
noremap <silent>  <leader><leader>! :Goyo<CR>

nnoremap <F5> :filetype detect<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" why the heck is it -2, Vim? ... This makes literally no sense
nnoremap <M-Up> mz:m-2<CR>`z==
nnoremap <M-Down> mz:m+<CR>`z==

inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
inoremap <leader><leader> <esc>/<++><cr>"_c4l
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
inoremap <Home> <C-o>g<Home>
inoremap <End> <C-o>g<End>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <C-d> <Plug>(coc-range-select)
nmap ga <Plug>(EasyAlign)

map gwl :call Focus('right', 'l')<CR>
map gwh :call Focus('left', 'h')<CR>
map gwk :call Focus('up', 'k')<CR>
map gwj :call Focus('down', 'j')<CR>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p

vnoremap <M-Up> :m'<-2<CR>gv=`>my`<mzgv`yo`z
vnoremap <M-Down> :m'>+<CR>gv=`<my`>mzgv`yo`z

imap <C-v> <C-r><C-o>+

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
xmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
xmap <silent> <C-d> <Plug>(coc-range-select)

omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nm <leader>ld :call ToggleDeadKeys()<CR>
nm <leader>li :call ToggleIPA()<CR>
nm <leader>stt :call ToggleScrollThroughTime()<CR>

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')



syntax on
syntax enable

colorscheme gruvbox

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
	au BufReadPre  *.srm let &bin=1
	au BufReadPost *.srm if &bin | %!xxd
	au BufReadPost *.srm set ft=xxd | endif
	au BufWritePre *.srm if &bin | %!xxd -r
	au BufWritePre *.srm endif
	au BufWritePost *.srm  if &bin | %!xxd
	au BufWritePost *.srm  set nomod | endif
augroup END

augroup NerdTreeOnStartup
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close nerdtree when it's the only thing open
augroup END

augroup PHPSimpl
	autocmd FileType php imap <leader>nsc namespace <++>;<CR>class <++> {<CR><Tab><++><CR>}<Esc>03<Up>f<i<leader><leader>
	autocmd FileType php imap <leader>cl class <++> {<CR><Tab><++><CR>}<Esc>02<Up>f<i<leader><leader>
	autocmd FileType php imap <leader>fn function <++>(<++>) : <++> {<CR><Tab><++><CR>}<Esc>02<Up>f<i<leader><leader>
	autocmd FileType php imap <leader>pfn public <leader>fn
	autocmd FileType php imap <leader>prfn private <leader>fn
	autocmd FileType php imap <leader>psf public static <leader>fn
	autocmd FileType php imap <leader>afn function(<++>) : <++> {<CR><Tab><++><CR>}<Esc>02<Up>f<i<leader><leader>
	autocmd FileType php imap <leader>vfn $<++> = <leader>afn
	autocmd FileType php imap <leader>? <?php<CR>
	autocmd FileType php imap <leader>= <?= <++> ?><Esc>F<i<leader><leader>
	autocmd FileType php imap <leader>def define('<++>', '<++>');<Esc>0f<i<leader><leader>
	autocmd FileType php nnoremap <Leader>4 m`F4r$``
	autocmd FileType php inoremap <Leader>4 <Esc>m`F4r$``a
	autocmd BufWritePost *.php  silent! !ctags -f ctags --language-force=PHP -R &
augroup END

augroup LatexSimpl
	autocmd FileType tex imap <leader>s \section{<++>}<CR><CR><++><Esc><Up>f<i<leader><leader>
augroup END


" Wordcount function from Pingouin (https://nanowrimo.org/participants/pingouin)
function! WordCount()
	let s:old_status = v:statusmsg
	let position = getpos(".")
	exe ":silent normal g\<C-g>"
	let stat = v:statusmsg
	let s:word_count = 0
	if stat != '--No lines in buffer--'
		let s:word_count = str2nr(split(v:statusmsg)[11])
		let v:statusmsg = s:old_status
	end
	call setpos('.', position)
	return s:word_count
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! Focus(button,vim_button)
	let oldw = winnr()
	silent exe 'wincmd ' . a:vim_button
	let neww = winnr()
	if oldw == neww
		" Use python to invoke the i3-msg command so that vim doesn't need to be
		" redrawn.
		silent echo system("moveCursor --letgo 'focus " . a:button. "'")
	endif
endfunction
