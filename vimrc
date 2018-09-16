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
" :au FocusLost * :wa           "auto save on focus lost
:set autowrite
let mapleader = ','
let maplocalleader = ','
" Center the screen quickly
nnoremap <space> zz

" ================ Better Searching ====================
set ignorecase                "searching is not case sensitive
set smartcase
set hlsearch                  " highlight search
set incsearch                 " highlight as search begins


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

" ================ Folding ======================
set foldmethod=syntax
let javaScript_fold=1

" ================ Editor UI Appearance ======================
set colorcolumn=80         " Highlight the 80th character limit
set background=light	      " dark mode of solarized
colorscheme solarized	      " solarized as color scheme
set relativenumber	      " to display relative line numbers
set number                    " to display line number of just the current line
set numberwidth=5             " width of the number column
set scrolloff=3               " Keep at least 3 lines above/below
set sidescrolloff=5           " Keep at least 5 lines left/right
set showmatch                 " brackets/braces that is
set mat=5                     " duration to show matching brace (1/10 sec)
" set nowrap                  " do not wrap lines
set ruler		      " show the cursor position all the time

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ AutoCommands ==============
" Jump to last cursor position, see :h last-position-jump
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" ==================== VIM-JAVASCRIPT ===================
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

" ==================== VIM-MARKDOWN ====================
let g:vim_markdown_conceal = 0
let g:vim_markdown_toml_frontmatter = 1


" ==================== VIM GO ====================
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_list_height = 5
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ==================== EMMET ====================
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,scss,javascript.jsx,typescript EmmetInstall

" ==================== ALE ====================
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 1
let g:ale_list_window_size = 5
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" ==================== VIM AIRLINE ====================
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

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
let g:ycm_add_preview_to_completeopt = 0
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:ycm_semantic_triggers = {
  \ 'elm' : ['.'],
  \}

" ==================== CTRL.P ====================
let g:ctrlp_custom_ignore = '\v[\/](node_modules|coverage|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" This makes vim act like all other editors, buffers can
" " exist in the background without being in a window.
" " http://items.sjbach.com/319/configuring-vim-right
set hidden

" ==================== javascript-libraries-syntax.vim ====================
let g:used_javascript_libs = 'react, chai'

" ==================== vim node ====================
autocmd User Node
  \ if &filetype == "javascript.jsx" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" ==================== CloseTag ====================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_shortcut = '>'

" ==================== Ack.vim ====================
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ==================== MISC ====================

" Press Space to turn off highlighting and clear any message already displayed.
" source: http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" go back to the previously opened buffer
nnoremap gb <C-^>

" Press // To search for visually selected text
" source: http://vim.wikia.com/wiki/VimTip171
vnoremap // y/\V<C-R>"<CR

" disable backspace in insert mode
inoremap <Del> <nop>
inoremap <BS> <Nop>

" Insert () => with <c-l>
imap <c-l> <space>()<space>=><space>

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

" disable esc in insert mode and use jk instead
" inoremap <esc> <NOP>
inoremap jk <esc>

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

nnoremap <leader>ev :vsplit $MYVIMRC<cr> " edit vimrc
nnoremap <leader>. :source $MYVIMRC<cr> " source vimrc

" noremap  <leader>- ddp                   " delete and paste above
" nnoremap <leader><silent> <Space> za     " toggle fold open/close
" noremap  <leader>_ ddkP                  " delete an paste below
" inoremap <c-d> <esc>ddi                  " delete entire line in insert mode
" inoremap <c-u> <esc>viwUA                " capitalize word in insert mode
" nnoremap <c-u> viwU                      " capitalize word in normal mode
" nnoremap L $                             " eol
" nnoremap H ^                             " start of line
" iabbrev @@ ilerioluwase97@gmail.com
