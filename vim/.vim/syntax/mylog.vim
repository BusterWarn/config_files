if exists("b:current_syntax")
  finish
endif

syn match timeStamp '\d\d:\d\d:\d\d.\d\d\d' " Timestamp test environment
" Timestamp moShell
syn match timeStamp2 '\[\d\d\d\d\-\d\d\-\d\d \d\d:\d\d:\d\d\.*\d*\]'
syn match file '[a-zA-Z0-9]*\.[ch]c*'
syn match file_suffix ':\d\d*'
syn match function '[a-zA-Z][a-zA-Z0-9]*::[a-zA-Z0-9]*'
syn match numbr '\s\d\d*'
hi def link timeStamp Type
hi def link timeStamp2 Type
hi def link file Constant
hi def link file_suffix Statement
hi def link numbr PreProc
hi def link function Identifier
:set ic
:set scs