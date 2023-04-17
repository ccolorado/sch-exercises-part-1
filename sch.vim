let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Source/learn/smart_contract_hacking/sch-exercises-part-1
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 contracts/erc721-2/OpenOcean.sol
badd +95 test/erc721-2/tests.js
badd +60 Instructions/erc721-2.md
badd +2 contracts/randomness-vulnerabilities-1/AttackGame.sol
badd +3 contracts/randomness-vulnerabilities-2/Game2.sol
badd +45 contracts/utils/DummyERC721.sol
badd +1 ~/configfiles/home/.vim/custom_snippets/javascript.snippets
badd +6 node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol
argglobal
%argdel
$argadd contracts/erc721-2/OpenOcean.sol
set lines=92 columns=490
edit Instructions/erc721-2.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 44 + 46) / 92)
exe 'vert 1resize ' . ((&columns * 163 + 245) / 490)
exe '2resize ' . ((&lines * 44 + 46) / 92)
exe 'vert 2resize ' . ((&columns * 163 + 245) / 490)
exe 'vert 3resize ' . ((&columns * 163 + 245) / 490)
exe '4resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 4resize ' . ((&columns * 162 + 245) / 490)
exe '5resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 5resize ' . ((&columns * 162 + 245) / 490)
exe '6resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 6resize ' . ((&columns * 162 + 245) / 490)
argglobal
balt test/erc721-2/tests.js
setlocal fdm=expr
setlocal fde=StackedMarkdownFolds()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=1
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 60 - ((26 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 60
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/configfiles/home/.vim/custom_snippets/javascript.snippets", ":p")) | buffer ~/configfiles/home/.vim/custom_snippets/javascript.snippets | else | edit ~/configfiles/home/.vim/custom_snippets/javascript.snippets | endif
balt Instructions/erc721-2.md
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 9 - ((8 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("test/erc721-2/tests.js", ":p")) | buffer test/erc721-2/tests.js | else | edit test/erc721-2/tests.js | endif
balt Instructions/erc721-2.md
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 132 - ((59 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 132
normal! 057|
wincmd w
argglobal
if bufexists(fnamemodify("contracts/erc721-2/OpenOcean.sol", ":p")) | buffer contracts/erc721-2/OpenOcean.sol | else | edit contracts/erc721-2/OpenOcean.sol | endif
balt test/erc721-2/tests.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 87 - ((20 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 87
normal! 062|
wincmd w
argglobal
if bufexists(fnamemodify("node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol", ":p")) | buffer node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol | else | edit node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol | endif
balt contracts/utils/DummyERC721.sol
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 135 - ((5 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 135
normal! 04|
wincmd w
argglobal
if bufexists(fnamemodify("contracts/utils/DummyERC721.sol", ":p")) | buffer contracts/utils/DummyERC721.sol | else | edit contracts/utils/DummyERC721.sol | endif
balt node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 42 - ((20 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 42
normal! 05|
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 44 + 46) / 92)
exe 'vert 1resize ' . ((&columns * 163 + 245) / 490)
exe '2resize ' . ((&lines * 44 + 46) / 92)
exe 'vert 2resize ' . ((&columns * 163 + 245) / 490)
exe 'vert 3resize ' . ((&columns * 163 + 245) / 490)
exe '4resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 4resize ' . ((&columns * 162 + 245) / 490)
exe '5resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 5resize ' . ((&columns * 162 + 245) / 490)
exe '6resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 6resize ' . ((&columns * 162 + 245) / 490)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
