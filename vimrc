set nocompatible                        "Get the latest vim settings/options"
so ~/.vim/plugins.vim                   "Load External plugins file for cleaner code"



"----------General Settings----------"
syntax enable                           "Enable Syntax Highlighting"

let macvim_skip_cmd_opt_movement = 1    "Disable default cmd+option key bindings from macvim"
let mapleader=','                       "change leader from backslash to comma to"

set shell=/bin/zsh                      "Tell vim to use the zsh shell"
set backspace=indent,eol,start          "allow backslash to delete characters"
set number                              "Activate line numbers"
set linespace=12                        "macvim specific lineheight"
set nowrap                              "Stop vim wrapping long lines"
set textwidth=0 wrapmargin=0            "Stops vim auto-wrapping lines
set autoindent                          "Copy indentation rule from previous line"
set secure                              "Disable unsafe commands in local .vimrc files
set visualbell                          "Disable editor sounds"
set autoread                            "Reload files changed outside automatically

filetype plugin indent on   
set tabstop=4                           "show existing tab with 4 spaces width
set shiftwidth=4                        "when indenting with '>', use 4 spaces width
set softtabstop=4
set expandtab                           "On pressing tab, insert 4 spaces

"-------------Visual----------------"
set guifont=Fira_code:h20           	"Set font"
colorscheme Tomorrow-Night-Eighties 	"Set our colourscheme"
set t_CO=256                    	    "Use 256 colours if using terminal vim"

"Remove Left/right scrollbars"
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R


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
"global"
"-------------------------------------"
"open vimrc in new tab"
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Simple highlight removal"
nmap <Leader><space> :nohl<cr>

"Scroll viewport faster by 3 lines instead of 1"
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


"CtrlP"
"-------------------------------------"
"Search tags in currentbuffer"
nmap <c-R> :CtrlPBufTag<cr>

"Search through recent files"
nmap <D-e> :CtrlPMRUFiles<cr> 


"NERDTree"
"-------------------------------------"
"NerdTree toggle"
nmap <D-1> :NERDTreeToggle<cr>


"Buffers"
"-------------------------------------"
map <M-Right> :bn!<CR>
map <M-Left> :bp!<CR>



"----------Auto-Commands----------"
augroup autosourcing                        "autosource vimrc and prevent consecutive lag issue"
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

autocmd StdinReadPre * let s:std_in=1       "Open nerd tree by default when opening editor without specfying a file"
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



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

"/
"/ NERDTree
"/
let g:NERDTreeWinSize = 40                      "Set NERDTree window size"
let NERDTreeQuitOnOpen = 1                      "Close nerd tree when opening a file"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

"-------------- Notes and tips ----------------"
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

" SEARCHING
" `/ {query}`                                   - Search for stuff
" `v (select lines) - :s/query/replacement      - Replace multiple lines from visual select
" `Gsearch`                                     - Search for search term in multiple files
" `Gsearch + change stuff + Greplace + wa`      - Search, change values, Replace, save all files

" PLUGINS

" NERDTreee
" `⇧+a`                                         - Toggle NERDTree between sidebar width and full screen

