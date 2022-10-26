" Vim syntax file
" Language: Hypr-wm config file
" Maintainer: Emanuel Guével
" Latest Revision: 16 October 2012

if exists("b:current_syntax")
  finish
endif

" Symbols
syn match   HyprOperators "+\|→"
syn match   HyprChainDelimiter ";"

syn match   HyprVar "\$\w\+"

" Key modifiers
syn keyword HyprKeyModifier Shift Control Ctrl Mod1 Mod2 Mod3 Mod4 Mod5 Mode_switch

" Strings
syn region  HyprSimpleString keepend start='[^ \t]' end='$\|;' contained contains=HyprChainDelimiter,HyprVar
syn match   HyprQuotedString '"[^"]\+"' contained
syn cluster HyprString contains=HyprSimpleString,HyprQuotedString

" Config commands
syn keyword HyprConfigCommand bind bindcode bindsym assign new_window popup_during_fullscreen font floating_modifier default_orientation workspace_layout for_window focus_follows_mouse bar position colors output tray_output workspace_buttons workspace_auto_back_and_forth binding_mode_indicator debuglog floating_minimum_size floating_maximum_size force_focus_wrapping force_xinerama force_display_urgency_hint hidden_state modifier new_float shmlog socket_path verbose mouse_warping strip_workspace_numbers focus_on_window_activation no_focus
syn match   HyprIpcSocket "ipc[-_]socket" nextgroup=@HyprString skipwhite

" Command keywords
syn keyword HyprCommand exit reload restart kill fullscreen global layout border focus move open split append_layout mark unmark resize grow shrink show nop rename title_format sticky
syn keyword HyprParam 1pixel default stacked tabbed normal none tiling stacking floating enable disable up down horizontal vertical auto up down left right parent child px or ppt leave_fullscreen toggle mode_toggle scratchpad width height top bottom client hide primary yes all active window container to absolute center on off x ms h v smart ignore pixel splith splitv output true
syn match   HyprDashedParam '--\(release\|border\|whole-window\|toggle\)' skipwhite
syn match   HyprNoStartupId '--no-startup-id' contained
syn keyword HyprWsSpecialParam next prev next_on_output prev_on_output back_and_forth current number
syn keyword HyprBordersSpecialParam none vertical horizontal both
syn keyword HyprModeParam dock hide invisible skipwhite
syn keyword HyprGapsCommand gaps smart_gaps smart_borders
syn keyword HyprGapsParam inner outer current all set plus minus no_gaps

" these are not keywords but we add them for consistency
syn keyword HyprPseudoParam no false inactive

" Exec commands
syn region  HyprExecCommand keepend start='[^ \t]' end='$\|;' contained contains=HyprChainDelimiter,HyprVar,HyprNoStartupId
syn match   HyprQuotedExecCommand '"[^"]\+"' contained
syn keyword HyprExecKeyword exec exec_always Hyprbar_command nextgroup=HyprQuotedExecCommand,HyprExecCommand skipwhite

" Status command
syn match   HyprStatusCommand ".*$" contained
syn keyword HyprStatusCommandKeyword status_command nextgroup=HyprStatusCommand skipwhite

" Font statement
syn keyword HyprFontStatement font nextgroup=@HyprString skipwhite

" Separator symbol
syn keyword HyprSeparatorSymbol separator_symbol nextgroup=@HyprString skipwhite

" Set statement
syn match   HyprSetVar "\$\w\+" contained nextgroup=@HyprString skipwhite
syn keyword HyprSetKeyword set set_from_resource nextgroup=HyprSetVar skipwhite

" Workspaces
syn keyword HyprWsKeyword workspace nextgroup=HyprWsSpecialParam,@HyprString skipwhite

" Hide edge borders
syn keyword HyprBordersConfigCommand hide_edge_borders nextgroup=HyprBordersSpecialParam skipwhite

" Mode
syn keyword HyprModeKeyword mode nextgroup=HyprModeParam,@HyprString skipwhite

" Comments
syn keyword HyprTodo contained TODO FIXME XXX NOTE
syn match   HyprComment "^\s*#.*$" contains=HyprTodo

" Error (at end of line)
syn match HyprError ".*$" contained

" Hex color code
syn match HyprColorLast "#[0-9a-fA-F]\{6\}" contained nextgroup=HyprError skipwhite
syn match HyprColor2nd "#[0-9a-fA-F]\{6\}" contained nextgroup=HyprColorLast skipwhite
syn match HyprColor1st "#[0-9a-fA-F]\{6\}" contained nextgroup=HyprColor2nd skipwhite

syn match HyprColorDef1 "client\.background\|statusline\|background\|separator\|statusline" nextgroup=HyprColorLast skipwhite
syn match HyprColorDef3 "client\.\(focused_inactive\|focused\|unfocused\|urgent\)\|inactive_workspace\|urgent_workspace\|focused_workspace\|active_workspace" nextgroup=HyprColor1st skipwhite

highlight link HyprChainDelimiter       Operator
highlight link HyprOperators            Operator

highlight link HyprExecCommand          Special
highlight link HyprQuotedExecCommand    Special
highlight link HyprStatusCommand        Special

highlight link HyprParam                Constant
highlight link HyprPseudoParam          Constant
highlight link HyprDashedParam          Constant
highlight link HyprNoStartupId          Constant
highlight link HyprColor1st             Constant
highlight link HyprColor2nd             Constant
highlight link HyprColorLast            Constant
highlight link HyprWsSpecialParam       Constant
highlight link HyprBordersSpecialParam  Constant
highlight link HyprModeParam            Constant
highlight link HyprGapsParam            Constant

highlight link HyprVar                  Identifier
highlight link HyprSetVar               Identifier

highlight link HyprKeyModifier          Function

highlight link HyprSimpleString         String
highlight link HyprQuotedString         String
highlight link HyprWsName               String
highlight link HyprQuotedWsName         String
highlight link HyprSetValue             String
highlight link HyprFont                 String

highlight link HyprExecKeyword          Keyword
highlight link HyprCommand              Keyword
highlight link HyprWsKeyword            Keyword
highlight link HyprGapsCommand          Keyword

highlight link HyprColorDef1            Define
highlight link HyprColorDef3            Define
highlight link HyprConfigCommand        Define
highlight link HyprIpcSocket            Define
highlight link HyprSetKeyword           Define
highlight link HyprModeKeyword          Define
highlight link HyprFontStatement        Define
highlight link HyprSeparatorSymbol      Define
highlight link HyprStatusCommandKeyword Define
highlight link HyprBordersConfigCommand Define

highlight link HyprTodo                 Todo
highlight link HyprComment              Comment
highlight link HyprError                Error
