\ Load file for application-specific Forth extensions
fl ../../cpu/arm/cortex-m3/bitband.fth
fl ../../lib/misc.fth
fl ../../lib/dl.fth
$3000 $5000 npatch load-base

: bitset  ( mask adr -- )  tuck l@ or swap l!  ;
: bitclr  ( mask adr -- )  tuck l@ swap invert and swap l!  ;

\ fetch from FABRIC addr
: F@ 40050000 + l@ ;
\ write to FABRIC addr
: F! 40050000 + l! ;

\ add leading zeros  ( value n -- )
: Z.R >R (U.) R> OVER - 200 MIN 0 MAX 0 ?DO ." 0" LOOP TYPE ;

\ test word
: timertest ." starting up" cr a00000 timer1-init timer1-start timer1-enable ;

: showdate cr ." FPGA Date: "
  fpgadate@
  dup 10 >> 4 decimal Z.R hex ." /"
  dup 8 >> ff and 2 decimal Z.R hex ." /"
  ff and 2 decimal Z.R hex cr
  fpgaversion@
  dup 18 >> dup 1 = if ." FPGA Project: PLASMIC" then 2 = if ." FPGA Project: ACES2" then cr
  dup 10 >> ff and dup ." FPGA Type: " d = if ." DEV" then
  dup e = if ." EM" then f = if ." FM" then cr
   ." FPGA Version: " ffff and 4 Z.R ;

only forth also hidden also definitions
decimal

: x.head  (s addr len -- addr' len' )
   swap   dup -16 and  swap  15 and   ( cr )  adr-width 2+ spaces
   16 0 do  6 spaces  i ?.n  4 +loop rot +  ;

: x-dln   (s addr --- )
   ??cr   dup adr-width u.r   2 spaces
   dup 16 bounds do  i l@ .8  4 +loop  space ;

forth definitions
: xdump  ( addr len -- )
   push-hex
   x.head  ( addr len )
   bounds ?do   i x-dln  exit? ?leave  16 +loop
   pop-base
;

only forth also definitions





\ Replace 'quit' to make CForth auto-run some application code
\ instead of just going interactive.
: app  ." CForth " showdate cr hex quit  ;

\ " ../objs/tester" $chdir drop

" app.dic" save
