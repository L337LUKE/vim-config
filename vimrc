set nocompatible              		"Get the latest vim settings/options"
so ~/.vim/plugins.vim			"Load External plugins file for cleaner code"



"----------General Settings----------"
syntax enable                    	"Enable Syntax Highlighting"
set backspace=indent,eol,start		"allow backslash to delete characters"
let mapleader=','                	"change leader from backslash to comma to"
set number                    		"Activate line numbers"
set linespace=11                	"macvim specific lineheight"
set nowrap				"Stop vim wrapping long lines"
set textwidth=0 wrapmargin=0		"Stops vim auto-wrapping lines
set autoindent				"Copy indentation rule from previous line"
set smartindent				"Auto indents in various cases"
set secure				"Disable unsafe commands in local .vimrc files



"----------Visual----------"
set guifont=Fira_code:h15           	"Set font"
colorscheme Tomorrow-Night-Eighties 	"Set our colourscheme"
set t_CO=256                    	"Use 256 colours if using terminal vim"

"Remove Left/right scrollbars"
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R



"----------Split Management----------"
set splitbelow				"Horizontal splits, splut down"
set splitright				"Vertial splits, split right"

"abbreviate splits to just ctrl+<key>"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"----------Search----------"
set hlsearch					"highlight search terms"
set incsearch					"Incremental search"
set ignorecase					"Ignore case sensitivity when searching
set smartcase					"Override ignore case if search pattern contains different case
set hidden                			"Handle multiple buffers better.
set wildmenu              			"Enhanced command line completion.
set autoread              			"Reload files changed outside automatically
set history=1000          			"Store lots of :cmdline history
set ttimeoutlen=50     				"Make Esc work faster



"----------Mappings----------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>		"open vimrc in new tab"
nmap <Leader><space> :nohlsearch<cr>		"Simple highlight removal"

"CtrlP"
nmap <c-R> :CtrlPBufTag<cr>			"Search tags in currentbuffer"
nmap <D-e> :CtrlPMRUFiles<cr>			"Search through recent files"

"NerdTree"
nmap <D-1> :NERDTreeToggle<cr>			"Nerd Tree toggle"

"----------Auto-Commands----------"
augroup autosourcing				"autosource vimrc and prevent consecutive lag issue
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END



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
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git|svn|hg'				"Files and folders to ignore"
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'			"where to load the results when ctrlp instantiates"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']	"Ignore files in .gitignore file"


"/
"/ NERDTree
"/
nmap <D-1> :NERDTreeToggle<cr>				"Easier NERDTree toggling"


"/
"/ Greplace.vim
"/
set grepprg=ack						"Use Ack for default search"
let g:grep_cmd_opts = '--noheading'



"-------------- Notes and tips ----------------"
" WINDOW MANAGEMENT
" `zz` 						- Vertically center screen to line selected"
" `gg` 						- Go to top of the page
" `G` 						- Go to bottom of the page


" PANE/TAB MANAGEMENT
" `ctrl+ww`  					- Switch panes in order
" `ctrl+w_`  					- Max height of current split
" `ctrl+w|`  					- Max width of current split
" `ctrl+w=`  					- Normalize Split size
" `ctrl+wo`  					- Close all splits bar this one
" `newtab <path>`				- Open a new tab
" `tab sball`					- Open current buffers in new a tab
" `gt`						- Next Tab
" `gT`						- Previous Tab


" SEARCHING
" `/ {query}`					- Search for stuff
" `v (select lines) - :s/query/replacement  	- Replace multiple lines from visual select
" `Gsearch`     				- Search for search term in multiple files
" `Gsearch + change stuff + Greplace + wa`	- Search, change values, Replace, save all files
