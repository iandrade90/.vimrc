set number
set mouse=a
set numberwidth=1 
se clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set foldmethod=manual
set makeprg=javac

call plug#begin('~/.vim/autoload/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'glepnir/oceanic-material'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'metakirby5/codi.vim'
Plug 'digitaltoad/vim-pug'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/taglist.vim'

call plug#end()

let g:airline#extensions#gen_tags#enabled = 1

let mapleader=" "

set background=dark
colorscheme oceanic_material
let g:oceanic_material_allow_italic = 1
let g:oceanic_material_allow_bold = 1
let g:oceanic_material_background = 'dark'
let g:oceanic_material_allow_undercurl = 1


" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'




" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-H>f <Plug>CtrlSFPrompt 
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>



"Config syntastic
"set statusline+=%#warning#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"End syntastic config

"Easymotion keys
nmap <Leader>m <Plug>(easymotion-s2)

let g:rainbow_active = 2
let g:pymode_python = 'python3'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='simple'

map <Leader>g :call RopeGoToDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0 
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0 
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>


set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
	if a:action == 'j'
	    return "\<C-N>"
	elseif a:action == 'k'
	    return "\<C-P>"
	endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

set nofoldenable

"CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <C-p> :CtrlP<CR>


"Insert HTML skeleton
nnoremap <Leader>do :-1read $HOME/.config/.skeleton.html<CR>
"End

"Insert Bootstrap Starter Template in HTML
nnoremap <Leader>te :-1read $HOME/.config/.bootstemplate.html<CR>
"End

"Tab pages
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"Tab creation inside same directory
nmap <Leader>ta :tabe %:h<CR>

"NerdTree
nmap <Leader>nm :NERDTreeFind<CR>
"Config to close NerdTree when the file wanted is opened
let NERDTreeQuitOnOpen=1
"Git nerdTree
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
"Syntax NerdTree
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1


let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
"End NerdTree


nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>r (,r)

" Indentation
vnoremap < <gv
vnoremap > >gv

"Format of paragraph
vmap Q gq
nmap Q gqap


"Indentation
let g:indentLine_char = '|'

"COC CONFIG


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" PUG SYNTAX

" Vim syntax file
" Language: Pug
" Maintainer: Joshua Borton
" Credits: Tim Pope
" Filenames: *.pug

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'pug'
endif

silent! syntax include @htmlCoffeescript syntax/coffee.vim
unlet! b:current_syntax
silent! syntax include @htmlStylus syntax/stylus.vim
unlet! b:current_syntax
silent! syntax include @htmlCss syntax/css.vim
unlet! b:current_syntax
silent! syntax include @htmlMarkdown syntax/markdown.vim
unlet! b:current_syntax

syn case match

syn region  javascriptParenthesisBlock start="(" end=")" contains=@htmlJavascript contained keepend
syn cluster htmlJavascript add=javascriptParenthesisBlock

syn region  pugJavascript matchgroup=pugJavascriptOutputChar start="[!&]\==\|\~" skip=",\s*$" end="$" contained contains=@htmlJavascript keepend
syn region  pugJavascript matchgroup=pugJavascriptChar start="\(^\|\s\)\@<=-" skip=",\s*$" end="$" contained contains=@htmlJavascript keepend

syn cluster pugTop contains=pugBegin,pugComment,pugHtmlComment,pugJavascript
syn match   pugBegin "^\s*\%([<>]\|&[^=~ ]\)\@!" nextgroup=pugTag,pugClassChar,pugIdChar,pugPlainChar,pugJavascript,pugScriptConditional,pugScriptStatement,pugPipedText
syn match   pugTag "+\?[[:alnum:]_-]\+\%(:\w\+\)\=" contained contains=htmlTagName,htmlSpecialTagName,pugJavascript nextgroup=@pugComponent
syn cluster pugComponent contains=pugAttributes,pugIdChar,pugBlockExpansionChar,pugClassChar,pugPlainChar,pugJavascript,pugTagBlockChar,pugTagInlineText
syn keyword pugCommentTodo  contained TODO FIXME XXX TBD
syn match   pugComment '\(\s\+\|^\)\/\/.*$' contains=pugCommentTodo,@Spell
syn region  pugCommentBlock start="\z(\s\+\|^\)\/\/.*$" end="^\%(\z1\s\|\s*$\)\@!" contains=pugCommentTodo,@Spell keepend
syn region  pugHtmlConditionalComment start="<!--\%(.*\)>" end="<!\%(.*\)-->" contains=pugCommentTodo,@Spell
syn region  pugAngular2 start="(" end=")" contains=htmlEvent
syn region  pugJavascriptString start=+"+  skip=+\\\("\|$\)+  end=+"\|$+ contained
syn region  pugJavascriptString start=+'+  skip=+\\\('\|$\)+  end=+'\|$+ contained
syn region  pugJavascriptString start=+`+  skip=+\\\(`\|$\)+  end=+`\|$+ contains=javascriptInterpolation contained
syn region  pugAttributes matchgroup=pugAttributesDelimiter start="(" end="\(.\zs)\)\|)" contained contains=pugJavascriptString,pugHtmlArg,pugAngular2,htmlArg,htmlEvent,htmlCssDefinition nextgroup=@pugComponent
syn match   pugClassChar "\." containedin=htmlTagName nextgroup=pugClass
syn match   pugBlockExpansionChar ":\s\+" contained nextgroup=pugTag,pugClassChar,pugIdChar
syn match   pugIdChar "#[[{]\@!" contained nextgroup=pugId
syn match   pugClass "\%(\w\|-\)\+" contained nextgroup=@pugComponent
syn match   pugId "\%(\w\|-\)\+" contained nextgroup=@pugComponent
syn region  pugDocType start="^\s*\(!!!\|doctype\)" end="$"
" Unless I'm mistaken, syntax/html.vim requires
" that the = sign be present for these matches.
" This adds the matches back for pug.
syn keyword pugHtmlArg contained href title

syn match   pugPlainChar "\\" contained
syn region  pugInterpolation matchgroup=pugInterpolationDelimiter start="[#!]{" end="}" contains=@htmlJavascript
syn match   pugInterpolationEscape "\\\@<!\%(\\\\\)*\\\%(\\\ze#{\|#\ze{\)"
syn match   pugTagInlineText "\s.*$" contained contains=pugInterpolation,pugTextInlinePug,@Spell
syn region  pugPipedText matchgroup=pugPipeChar start="|" end="$" contained contains=pugInterpolation,pugTextInlinePug,@Spell nextgroup=pugPipedText skipnl
syn match   pugTagBlockChar "\.$" contained nextgroup=pugTagBlockText,pugTagBlockEnd skipnl
syn region  pugTagBlockText start="\%(\s*\)\S" end="\ze\n" contained contains=pugInterpolation,pugTextInlinePug,@Spell nextgroup=pugTagBlockText,pugTagBlockEnd skipnl
syn region  pugTagBlockEnd start="\s*\S" end="$" contained contains=pugInterpolation,pugTextInlinePug nextgroup=pugBegin skipnl
syn region  pugTextInlinePug matchgroup=pugInlineDelimiter start="#\[" end="]" contains=pugTag keepend

syn region  pugJavascriptFilter matchgroup=pugFilter start="^\z(\s*\):javascript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlJavascript
syn region  pugMarkdownFilter matchgroup=pugFilter start=/^\z(\s*\):\%(markdown\|marked\)\s*$/ end=/^\%(\z1\s\|\s*$\)\@!/ contains=@htmlMarkdown
syn region  pugStylusFilter matchgroup=pugFilter start="^\z(\s*\):stylus\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlStylus
syn region  pugPlainFilter matchgroup=pugFilter start="^\z(\s*\):\%(sass\|less\|cdata\)\s*$" end="^\%(\z1\s\|\s*$\)\@!"

syn match  pugScriptConditional "^\s*\<\%(if\|else\|else if\|elif\|unless\|while\|until\|case\|when\|default\)\>[?!]\@!"
syn match  pugScriptStatement "^\s*\<\%(each\|for\|block\|prepend\|append\|mixin\|extends\|include\)\>[?!]\@!"
syn region  pugScriptLoopRegion start="^\s*\(for\|each\)" end="$" contains=pugScriptLoopKeywords
syn keyword  pugScriptLoopKeywords contained for each in

syn region  pugJavascript start="^\z(\s*\)script\%(:\w\+\)\=" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlJavascript,pugJavascriptTag,pugCoffeescriptFilter keepend
syn region javascriptInterpolation start=/${/ end=/}/ contained

syn region  pugCoffeescriptFilter matchgroup=pugFilter start="^\z(\s*\):coffee-\?script\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlCoffeescript contained
syn region  pugJavascriptTag contained start="^\z(\s*\)script\%(:\w\+\)\=" end="$" contains=pugBegin,pugTag
syn region  pugCssBlock        start="^\z(\s*\)style" nextgroup=@pugComponent,pugError  end="^\%(\z1\s\|\s*$\)\@!" contains=@htmlCss keepend

syn match  pugError "\$" contained

hi def link pugPlainChar              Special
hi def link pugScriptConditional      PreProc
hi def link pugScriptLoopKeywords     PreProc
hi def link pugScriptStatement        PreProc
hi def link pugHtmlArg                htmlArg
hi def link pugAttributeString        String
hi def link pugAttributesDelimiter    Identifier
hi def link pugIdChar                 Special
hi def link pugClassChar              Special
hi def link pugBlockExpansionChar     Special
hi def link pugPipeChar               Special
hi def link pugTagBlockChar           Special
hi def link pugId                     Identifier
hi def link pugClass                  Type
hi def link pugInterpolationDelimiter Delimiter
hi def link pugInlineDelimiter        Delimiter
hi def link pugFilter                 PreProc
hi def link pugDocType                PreProc
hi def link pugCommentTodo            Todo
hi def link pugComment                Comment
hi def link pugCommentBlock           Comment
hi def link pugHtmlConditionalComment pugComment
hi def link pugJavascriptString       String
hi def link javascriptInterpolation   Delimiter

let b:current_syntax = "pug"

if main_syntax == "pug"
  unlet main_syntax
endif

