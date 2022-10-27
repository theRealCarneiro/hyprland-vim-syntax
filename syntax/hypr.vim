" Vim syntax file
" Language: Hyprland config file
" Maintainer: Gabriel Carneiro
" Latest Revision: 26 October 2022

if exists("b:current_syntax")
  finish
endif

" Strings
syn match	Path "\(\.\|\~\)\/.*" display
syn match	Symbol "=" skipwhite display nextgroup=Value
syn match	Str "[a-zA-Z _ .-\"\'?]\+$" contained display
syn match	Num "\d\+\(\.\d\+\)\?" contained display
syn match	Num "e[+-]\d\+" contained display
syn match	Num "[+-]\d\+\(\.\d\+\)\?" contained display
syn match	ShellVar "\$\w\+" contained display
syn keyword	Logical on off true false no yes contained display
syn region  HyprSimpleString keepend start='[^ \t]' end='$\|#' contained contains=HyprVar,HyprComment
syn match   HyprQuotedString '"[^"]\+"' contained
syn cluster HyprString contains=HyprSimpleString,HyprQuotedString

" Settings
syn keyword Block input general animations decoration gestures misc dwindle master
syn region OptBlock start="{" end="}" fold transparent display contains=HyprVar,Value,OptBlock,Num,Str,HyprComment,Disp,ShellVar
syn match HyprVar '\s[a-z _ .]\+ ' skipwhite contained display nextgroup=Symbol
syn region Value start="=" end="$\|," transparent display contains=Str,Num,Logical,ShellVar,Path,HyprComment,Disp,Dispatchers
syn match Disp '[a-zA-Z][a-zA-Z0-9 _.]\+,' contained display contains=Num
syn match N ', [a-zA-Z][a-zA-Z0-9 _.]\+,' contained skipwhite

" Commands
syn region Command start='^[a-zA-Z][a-zA-Z_. -]\+ =' end='$' skipwhite transparent contains=HyprKeyModifier,ShellVar,HyprConfigCommand,Dispatchers,HyprComment,Str,Disp,Path,Num
syn keyword HyprKeyModifier SUPER SHIFT CTRL ALT Mod1 Mod2 Mod3 Mod4 Mod5 Mode_switch nextgroup=N
syn keyword HyprConfigCommand bind bindm monitor source windowrule nextgroup=Symbol contained

" Comments
syn keyword HyprTodo contained TODO FIXME XXX NOTE
syn match   HyprComment "\(#\|\/\/\).*$" contains=HyprTodo


highlight link Dispatchers		        Special
highlight link Windowrules		        Special
highlight link Disp				        Special

highlight link Num						Constant
highlight link NumRule					Constant

highlight link HyprVar                  Identifier
highlight link HyprConfigCommand        Identifier

highlight link HyprKeyModifier          Constant
highlight link KeyBind					Constant
highlight link Logical					Constant

highlight link Str						String
highlight link BindCmd					String
highlight link Path						String
highlight link HyprSimpleString         String
highlight link HyprQuotedString         String

highlight link Block					Define

highlight link ShellVar			        Define

highlight link HyprTodo                 Todo
highlight link HyprComment              Comment
