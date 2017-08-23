" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" pathogen
execute pathogen#infect()

"turn on syntax highlighting and prevents unnecessary execution of code when you source your .vimrc
if !exists("g:syntax_on")
	syntax enable
endif

" ================ General Config ====================
set visualbell                "No sounds
set history=1000              "Store lots of :cmdline history
filetype plugin indent on
set gcr=a:blinkon0            "Disable cursor blink
set autoread                  "Reload files changed outside vim
set cursorline                "highlight the line containing the cursor

" ================ Better Searching ====================
set ignorecase                "searching is not case sensitive
set smartcase         



" ================ Splits/Windows ====================
" let winwidth=104
" let winheight=5
" let winminheight=5
" set winheight=999
" autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

" remaps changing focus between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set expandtab               " expand tabs to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100

" ================ Editor UI Appearance ======================
" set colorcolumn=100          " Highlight the 80th character limit
set background=light	        " dark mode of solarized
colorscheme solarized		      " solarized as color scheme
set relativenumber		        " to display relative line numbers
set number                    " to display line number of just the current line
set numberwidth=5             " width of the number column
set scrolloff=3               " Keep at least 3 lines above/below
set sidescrolloff=5           " Keep at least 5 lines left/right
set hlsearch                  " highlight search
set showmatch                 " brackets/braces that is
set mat=5                     " duration to show matching brace (1/10 sec)
" set nowrap                    " do not wrap lines
set ruler		                  " show the cursor position all the time

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ==================== VIM-JAVASCRIPT ==================== 
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" ==================== EDITORConfig ==================== 
let g:EditorConfig_exclude_patterns = ['fugitive://.*']         " ensures that the plugin works well with figitve

" ==================== HTML5.VIM ==================== 
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

" ==================== NERDCommenter ====================
let g:NERDSpaceDelims = 1

" ==================== NERDTree  ====================
" starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeShowHidden=1                  " show hidden files be default
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen = 1              " close nerdtree when i open a new file
let NERDTreeMinimalUI = 1                 " makes nerdtree look minimal
let NERDTreeDirArrows = 1
let g:NERDTreeIgnore=['\.git', 'node_modules'] " ignore node_module folder and .git folder

"  ==================== VIM-JSX ==================== 
let g:jsx_ext_required = 0                " allow the syntax higlightin to work for .js file also

" ==================== VIM AIRLINE ==================== 
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

" ==================== EMMET ==================== 
let g:user_emmet_install_global = 0
" let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall

" ==================== SYNTASTIC ====================
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" ==================== STATUSLINE ==================== 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ==================== UltiSnips ==================== 
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsSnippetsDir="~/dotfiles/vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['~/dotfiles/vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" ==================== YouCompleteMe ==================== 
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" ==================== CTRL.P ====================
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'               "ignore directories while searching

" This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
set hidden

" ==================== MISC ====================
let mapleader = ','
let maplocalleader = ','

" Press Space to turn off highlighting and clear any message already displayed.
" source: http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Press // To search for visually selected text
" source: http://vim.wikia.com/wiki/VimTip171
vnoremap // y/\V<C-R>"<CR

" disable backspace in insert mode
inoremap <Del> <nop>
inoremap <Del> <nop>

" disable arrow keys in both insert and normal mode
  " normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <<
noremap <Right> >>

  " visual mode
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <gv           " indent and still stay in viual mode
vnoremap <Right> >gv

  " insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <c-d>
inoremap <Right> <c-t>

" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" noremap   <Up>     <NOP>
" noremap   <Down>   <NOP>
" noremap   <Left>   <NOP>
" noremap   <Right>  <NOP>

" disable esc in insert mode and use jk instead
" inoremap <esc> <NOP>
inoremap jk <esc>

" let mapleader = ","
" noremap  <leader>- ddp                   " delete and paste above
" nnoremap <leader><silent> <Space> za     " toggle fold open/close
" noremap  <leader>_ ddkP                  " delete an paste below
" inoremap <c-d> <esc>ddi                  " delete entire line in insert mode
" inoremap <c-u> <esc>viwUA                " capitalize word in insert mode
" nnoremap <c-u> viwU                      " capitalize word in normal mode
" nnoremap <leader>ev :vsplit $MYVIMRC<cr> " edit vimrc
" nnoremap <leader>sv :source $MYVIMRC<cr> " source vimrc
" nnoremap L $                             " eol
" nnoremap H ^                             " start of line
" iabbrev @@ ilerioluwase97@gmail.com
