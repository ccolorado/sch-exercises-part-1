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
badd +86 contracts/erc721-2/OpenOcean.sol
badd +86 test/erc721-2/tests.js
badd +58 Instructions/erc721-2.md
badd +2 contracts/randomness-vulnerabilities-1/AttackGame.sol
badd +3 contracts/randomness-vulnerabilities-2/Game2.sol
badd +43 contracts/utils/DummyERC721.sol
badd +8 ~/configfiles/home/.vim/custom_snippets/javascript.snippets
badd +134 node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol
badd +35 contracts/arithmetic-overflows-1/TimeLock.sol
badd +22 Instructions/arithmetic-overflows-1.md
badd +52 test/arithmetic-overflows-1/tests.js
badd +0 contracts/arithmetic-overflows-1/timelockAttack.sol
badd +0 contracts/arithmetic-overflows-1/TimeLockAttack.sol
badd +34 ~/configfiles/home/.vim/custom_snippets/solidity.snippets
argglobal
%argdel
$argadd contracts/erc721-2/OpenOcean.sol
set lines=92 columns=490
edit Instructions/arithmetic-overflows-1.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
4wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
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
exe 'vert 1resize ' . ((&columns * 31 + 245) / 490)
exe '2resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 2resize ' . ((&columns * 114 + 245) / 490)
exe '3resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 3resize ' . ((&columns * 114 + 245) / 490)
exe '4resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 4resize ' . ((&columns * 114 + 245) / 490)
exe 'vert 5resize ' . ((&columns * 114 + 245) / 490)
exe 'vert 6resize ' . ((&columns * 113 + 245) / 490)
exe 'vert 7resize ' . ((&columns * 114 + 245) / 490)
argglobal
enew
file NERD_tree_1
balt contracts/arithmetic-overflows-1/TimeLock.sol
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
balt contracts/arithmetic-overflows-1/TimeLock.sol
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
let s:l = 22 - ((14 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/configfiles/home/.vim/custom_snippets/solidity.snippets", ":p")) | buffer ~/configfiles/home/.vim/custom_snippets/solidity.snippets | else | edit ~/configfiles/home/.vim/custom_snippets/solidity.snippets | endif
balt ~/configfiles/home/.vim/custom_snippets/javascript.snippets
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 36 - ((22 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 36
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/configfiles/home/.vim/custom_snippets/javascript.snippets", ":p")) | buffer ~/configfiles/home/.vim/custom_snippets/javascript.snippets | else | edit ~/configfiles/home/.vim/custom_snippets/javascript.snippets | endif
balt ~/configfiles/home/.vim/custom_snippets/solidity.snippets
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("contracts/arithmetic-overflows-1/TimeLock.sol", ":p")) | buffer contracts/arithmetic-overflows-1/TimeLock.sol | else | edit contracts/arithmetic-overflows-1/TimeLock.sol | endif
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
let s:l = 25 - ((24 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 25
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("contracts/arithmetic-overflows-1/TimeLockAttack.sol", ":p")) | buffer contracts/arithmetic-overflows-1/TimeLockAttack.sol | else | edit contracts/arithmetic-overflows-1/TimeLockAttack.sol | endif
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
let s:l = 37 - ((36 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 05|
wincmd w
argglobal
if bufexists(fnamemodify("test/arithmetic-overflows-1/tests.js", ":p")) | buffer test/arithmetic-overflows-1/tests.js | else | edit test/arithmetic-overflows-1/tests.js | endif
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
let s:l = 37 - ((29 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 014|
wincmd w
7wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 245) / 490)
exe '2resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 2resize ' . ((&columns * 114 + 245) / 490)
exe '3resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 3resize ' . ((&columns * 114 + 245) / 490)
exe '4resize ' . ((&lines * 29 + 46) / 92)
exe 'vert 4resize ' . ((&columns * 114 + 245) / 490)
exe 'vert 5resize ' . ((&columns * 114 + 245) / 490)
exe 'vert 6resize ' . ((&columns * 113 + 245) / 490)
exe 'vert 7resize ' . ((&columns * 114 + 245) / 490)
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
