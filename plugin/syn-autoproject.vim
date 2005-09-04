" Vim syntax file
" Language:	autoproject
" based on ldif.vim

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn region apDirectory matchgroup=Normal start="^\s*- " end="$" 
syn region apHeader matchgroup=Normal start="^\s*|- " matchgroup=apHeader end="\S*\.h\(\|h\|pp\)\s*$" oneline
syn region apSource matchgroup=Normal start="^\s*|- " matchgroup=apSource end="\S*\.c\(\|c\|pp\)\s*$" oneline 
syn region apProjectFile matchgroup=Normal start="^\s*|- " matchgroup=apProjectFile end="\(configure\(\.in\|\.in\.in\|\.ac\)\|Makefile\.am\)$" oneline

if version >= 508 || !exists("did_ap_syn_inits")
  if version < 508
    let did_ap_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink apDirectory		Type
  HiLink apHeader	Statement	
  HiLink apSource	String
  HiLink apProjectFile Special

  delcommand HiLink
endif

let b:current_syntax = "syn-autoproject"
