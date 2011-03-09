" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 1
endif


hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#FD971F
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#2F3127
hi DiffChange      guifg=#89807D guibg=#4E4E40
hi DiffDelete      guifg=#2F3127 guibg=#2F3127
hi DiffText                      guibg=#4E4E40 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#BBBBBB guibg=#3E3D32
hi Folded          guifg=#BBBBBB guibg=#4E4E40
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu                         guibg=#000000
hi PmenuSel        guifg=#66D9EF guibg=#222222
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#FFFFFF guibg=#455354
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
hi SpecialKey      guifg=#888A85               gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=bg      guibg=#FD971F

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#75715E guibg=#75715E gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

if s:molokai_original == 1
   hi Normal          guifg=#F8F8F2 guibg=#272822
   hi Comment         guifg=#75715E
   hi CursorLine                    guibg=#3E3D32
   hi CursorColumn                  guibg=#3E3D32
   hi LineNr          guifg=#75715E guibg=#3E3D32 gui=none
   hi NonText         guifg=#75715E guibg=#272822
else
   hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
   hi Comment         guifg=#465457
   hi CursorLine                    guibg=#161718
   hi CursorColumn                  guibg=#293739
   hi LineNr          guifg=#373738 guibg=#1B1D1E
   hi NonText         guifg=#292B2B guibg=#1B1D1E
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=141
   hi Character       ctermfg=186
   hi Number          ctermfg=141
   hi String          ctermfg=186
   hi Conditional     ctermfg=197               cterm=bold
   hi Constant        ctermfg=141               cterm=bold
   hi Cursor          ctermfg=0  ctermbg=15
   hi Debug           ctermfg=248               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=245

   hi DiffAdd                     ctermbg=236
   hi DiffChange      ctermfg=244 ctermbg=238
   hi DiffDelete      ctermfg=89  ctermbg=233
   hi DiffText                    ctermbg=1238  cterm=bold

   hi Directory       ctermfg=148               cterm=bold
   hi Error           ctermfg=89  ctermbg=233
   hi ErrorMsg        ctermfg=187 ctermbg=235   cterm=bold
   hi Exception       ctermfg=148               cterm=bold
   hi Float           ctermfg=141
   hi FoldColumn      ctermfg=239 ctermbg=0
   hi Folded          ctermfg=239 ctermbg=0
   hi Function        ctermfg=148
   hi Identifier      ctermfg=208
   hi Ignore          ctermfg=244
   hi IncSearch       ctermfg=244 ctermbg=0

   hi Keyword         ctermfg=197               cterm=bold
   hi Label           ctermfg=186               cterm=none
   hi Macro           ctermfg=180
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=0   ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=186
   hi MoreMsg         ctermfg=186
   hi Operator        ctermfg=197

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=0
   hi PmenuSel        ctermfg=81  ctermbg=235
   hi PmenuSbar                   ctermbg=0
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=148               cterm=bold
   hi PreProc         ctermfg=148
   hi Question        ctermfg=81
   hi Repeat          ctermfg=197               cterm=bold
   hi Search          ctermfg=15  ctermbg=66

   " marks column
   hi SignColumn      ctermfg=148 ctermbg=235
   hi SpecialChar     ctermfg=197               cterm=bold
   hi SpecialComment  ctermfg=239               cterm=bold
   hi Special         ctermfg=81
   hi SpecialKey      ctermfg=102

   hi Statement       ctermfg=197               cterm=bold
   hi StatusLine      ctermfg=239 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=0
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=197
   hi Title           ctermfg=203
   hi Todo            ctermfg=15                cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=0     cterm=bold
   hi VisualNOS                   ctermbg=237
   hi Visual                      ctermbg=237
   hi WarningMsg      ctermfg=15  ctermbg=236   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=0

   hi Normal          ctermfg=15  ctermbg=234
   hi Comment         ctermfg=239
   hi CursorLine                  ctermbg=233   cterm=none
   hi CursorColumn                ctermbg=236
   hi LineNr          ctermfg=237 ctermbg=234
   hi NonText         ctermfg=235 ctermbg=234
end
