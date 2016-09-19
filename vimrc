set nocompatible                        "Get the latest vim settings/options"
so ~/.vim/plugins.vim                   "Load External plugins file for cleaner code"



"----------General Settings----------"
let mapleader=','                       "change leader from backslash to comma to"
set shell=/bin/zsh                      "Tell vim to use the zsh shell"
set backspace=indent,eol,start          "allow backslash to delete characters"
set number                              "Activate line numbers"
set linespace=10                        "macvim specific lineheight"
set nowrap                              "Stop vim wrapping long lines"
set secure                              "Disable unsafe commands in local .vimrc files
set visualbell                          "Disable editor sounds"
set autoread                            "Reload files changed outside automatically



"Auto-backup files and .swp files don't get stored in the current directory
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp	



"Control autocompletion
filetype plugin indent on   
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType css, scss setl ofu=csscomplete#CompleteCSS



" Controlling tabs
set autoindent                          "Copy indentation rule from previous line"
set smarttab
set shiftround
set expandtab                           "On pressing tab, insert 4 spaces
set copyindent                          "Copy last line of indentation"
set tabstop=4                           "show existing tab with 4 spaces width
set shiftwidth=4                        "when indenting with '>', use 4 spaces width
set softtabstop=4
set textwidth=0 wrapmargin=0            "Stops vim auto-wrapping lines



"-------------Visual----------------"
syntax on                               "Enable Syntax Highlighting"
set guifont=Fira_code:h16           	"Set font"
color dracula                           "Set our colourscheme"
set t_CO=256                    	    "Use 256 colours if using terminal vim"
set guioptions-=e                       "Simple/minimal tabs"

"Remove Left/right scrollbars"
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Powerline (Fancy bar at bottom stuff)
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show Unicode glyphs
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)


"----------Split Management----------"
set splitbelow                          "Horizontal splits, splut down"
set splitright                          "Vertial splits, split right"

"abbreviate splits to just ctrl+<key>"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"---------------Search----------------"
set hlsearch                            "highlight search terms"
set incsearch                           "Incremental search"
set ignorecase                          "Ignore case sensitivity when searching
set smartcase                           "Override ignore case if search pattern contains different case
set hidden                              "Handle multiple buffers better.
set wildmenu                            "Enhanced command line completion.
set history=1000                        "Store lots of :cmdline history
set ttimeoutlen=50                      "Make Esc work faster



"--------------Mappings---------------"
" 1. Flips up/down key functions to make more sense
" 2. Down is really the next line
nnoremap j gk
nnoremap k gj

" Open vimrc in new tab"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Removes currently highlighted text from say a search"
nmap <Leader><space> :nohl<cr>

" Use alt+< / alt+> to move between open buffers
map <M-Right> :bn!<CR>
map <M-Left> :bp!<CR>

nmap <Leader>f :tag<space>


"---------------Auto-Commands---------------"

" Autosource vimrc and prevent consecutive lag issue"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Open nerd tree by default when opening editor without specfying a file"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Autocompletion for SCSS files
autocmd BufNewFile,BufRead *.scss   set ft=scss.css

"-------------------Plugins-------------------"
"/
"/ Gist-vim
"/
let g:github_user = 'L337LUKE'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git|svn|hg'                         "Files and folders to ignore"
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'                      "where to load the results when ctrlp instantiates"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']     "Ignore files in .gitignore file"

"Search tags in currentbuffer"
"Search through recent files"
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr> 


"/
"/ NERDTree
"/
let g:NERDTreeWinSize = 40                      "Set NERDTree window size"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"NerdTree toggle"
nmap <D-1> :NERDTreeToggle<cr>

"/
"/ Greplace.vim
"/
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ The Silver Searcher / Ag
"/
let g:ackprg = 'ag --nogroup --nocolor --column'

"/
"/ YouCompleteMe
"/
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"



"-------------- Notes and tips ----------------"

" global ~/.ctags file
" Create ~/.ctags and include all global info in here
" This can be things like ignore node_modules/ or the vendor/ dir


" WINDOW MANAGEMENT"
" `zz`                                          - Vertically center screen to line selected
" `gg`                                          - Go to top of the page
" `G`                                           - Go to bottom of the page


" PANE/TAB MANAGEMENT
" `ctrl+ww`                                     - Switch panes in order
" `ctrl+w_`                                     - Max height of current split
" `ctrl+w|`                                     - Max width of current split
" `ctrl+w=`                                     - Normalize Split size
" `ctrl+wo`                                     - Close all splits bar this one
" `newtab <path>`                               - Open a new tab
" `tab sball`                                   - Open current buffers in new a tab
" `gt`                                          - Next Tab
" `gT`                                          - Previous Tab


" EDITING
" Delete/yank/select within the specified area/braces  
" `[di/vi/yi] []/{}/''/""`
" `[da/va/ya] []/{}/''/""`

" SEARCHING
" `!ctags -R`                                   - Generate tags file in current directory
" `leader f`                                    - Mapping to start searching for a tag
" `ctrl+]`                                      - Goto method under cursor
" `/ {query}`                                   - Search for stuff
" `v {select lines} - :s/query/replacement      - Replace multiple lines from visual select
" `Gsearch`                                     - Search for search term in multiple files
" `Gsearch + change stuff + Greplace + wa`      - Search, change values, Replace, save all files

" PLUGINS

" NERDTreee
" `⇧+a`                                         - Toggle NERDTree between sidebar width and full screen

