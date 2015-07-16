" {{{ special characters
"  ➤  ↵  »  ✔  ✗  ➜  ✚  ✹  ✖  ═  ✭  ⚡  ➭  ❮
"  ▍ ♩ & ♫  ♪ ♬  ♭ ♮ ♯ ☺  ☻ ::  ⏎
"  ♥  ♦ ♣  ♠  • ◘ ○ ◙  ♂ ♀
"  ☭  , ⌘  , ☠, ⌥  , ✇ , ⌤  ,
"  ⍜ , ✣ , ⌨   , ⌘, ☕
"  ☮ ☠ ☻ ❀ ☃ ☆ ☄  ☢ ☉ ◎ ⊙ ░ ⍟
"  ￬ ￪ ￫ ￩ ⇧ ⇩ ⇨ ⇦ ↑ ↓ ≠ ∞ ⿻  □  "
"  ☼ ► ◄  ↕
"  }}}
""""""""""""""""""""""""""""""""""""
"basic plugin settings
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
"NERDTree
""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&  b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""""""""
"conque
""""""""""""""""""""""""""""""""""""
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_SendVisKey = '<F9>'
map <F3> <ESC>:ConqueTermSplit zsh<CR>

""""""""""""""""""""""""""""""""""""
"tags
""""""""""""""""""""""""""""""""""""
set tags=./tags,~/commontags

nnoremap <silent> <F4> :TagbarToggle<CR><CR>

if has("cscope")
    set cscopetag
    set csto=1
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set cscopeverbose

    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif


""""""""""""""""""""""""""""""""""""
"airline
""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""
"rainbow_parentheses
""""""""""""""""""""""""""""""""""""
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""""""""
"vim-indent
""""""""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

""""""""""""""""""""""""""""""""""""
"syntastic checker
""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='➜'
let g:syntastic_style_error_symbol='✗'

"pydict
""""""""""""""""""""""""""""""""""""
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height=3

""""""""""""""""""""""""""""""""""""
"ctrl-p
""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Windows

let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
let g:ctrlp_working_path_mode = 'ra'

""""""""""""""""""""""""""""""""""""
"YouCompleteMe
""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_key_invoke_completion = "<S-Space>"
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_show_diagnostics_ui = 0

" "jedi
" let g:jedi#show_call_signatures = "1"
" let g:jedi#usage_command = "<leader>n"

"snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-s>"

""""""""""""""""""""""""""""""""""""
"VimIM
""""""""""""""""""""""""""""""""""""
let g:vimim_map='c-bslash'

""""""""""""""""""""""""""""""""""""
"vim json
""""""""""""""""""""""""""""""""""""
set conceallevel=0
let g:vim_json_syntax_conceal=0
let g:indentLine_noConcealCursor=""

""""""""""""""""""""""""""""""""""""
"vim jsfmt
""""""""""""""""""""""""""""""""""""
let g:js_fmt_fail_silently = 1
let g:js_fmt_auto_save = 1
let g:js_fmt_command = "jsfmt"

""""""""""""""""""""""""""""""""""""
"ctrlsf, ag
""""""""""""""""""""""""""""""""""""
let g:ctrlsf_ackprg = 'ag'
nmap     <C-X>f <Plug>CtrlSFPrompt
vmap     <C-X>f <Plug>CtrlSFVwordPath<CR>
vmap     <C-X>F <Plug>CtrlSFVwordExec<CR>
nmap     <C-X>n <Plug>CtrlSFCwordPath<CR>
nmap     <C-X>p <Plug>CtrlSFPwordPath<CR>
nnoremap <C-X>o :CtrlSFOpen<CR>

""""""""""""""""""""""""""""""""""""
"slime
""""""""""""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name":"default", "target_pane":"1"}

""""""""""""""""""""""""""""""""""""
"javascript-libraries-syntax
""""""""""""""""""""""""""""""""""""
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

""""""""""""""""""""""""""""""""""""
"lexical
""""""""""""""""""""""""""""""""""""
augroup lexical
    autocmd!
    autocmd FileType markdown call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text call lexical#init({'spell':0})
augroup END
let g:lexical#spell = 1
let g:lexical#spelllang = ['en_us', 'en_ca', ]
let g:lexical#dictionary = ["/usr/share/dict/cracklib-small", ]

""""""""""""""""""""""""""""""""""""
"markdown
""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:table_mode_corner = '+'
let g:table_mode_separator = '|'
let g:table_mode_fillchar = '-'
let g:table_mode_always_active = 0
let g:table_mode_delimiter = ','
noremap <F10> <ESC>:TableModeToggle<CR>
inoremap <F10> <ESC>:TableModeToggle<CR>


""""""""""""""""""""""""""""""""""""
"easy-align
""""""""""""""""""""""""""""""""""""
vmap <Space> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

