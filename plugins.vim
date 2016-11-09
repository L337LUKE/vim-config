filetype off                  " required

" Command-T, Run the following if doing this fresh"
" cd ~/.vim/bundle/command-t/ruby/command-t
" ruby extconf.rb
" make
"
" OR you changed ruby versions
"
" cd ~/.vim/bundle/command-t/ruby/command-t
" make clean
" ruby extconf.rb
" make

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Theme
Plugin 'dracula/vim'

" Essential
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neomake/neomake'
Plugin 'Shougo/neocomplete.vim'
Plugin 'skwp/greplace.vim'
Plugin 'mileszs/ack.vim'
Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'stephpy/vim-php-cs-fixer'

" Utiltity
Plugin 'tpope/vim-surround'
Plugin 'mattn/webapi-vim' " dependency of 'mattn/gist-vim'
Plugin 'mattn/gist-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'craigemery/vim-autotag'
Plugin 'mattn/emmet-vim'

" Editing
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kurkale6ka/vim-pairs'
Plugin 'shawncplus/phpcomplete.vim'

" Syntax
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'
Plugin 'StanAngeloff/php.vim'

"HTML
Plugin 'Valloric/MatchTagAlways'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/es.next.syntax.vim'
Plugin 'ternjs/tern_for_vim'

call vundle#end()            " required
filetype plugin indent on    " required
