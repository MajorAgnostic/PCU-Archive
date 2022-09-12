prob: MACRO
prob_total = prob_total + (\1)
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
prob_total = 0
; Pichu
	prob 10
	prob 5
; Cleffa
	prob 10
	prob 5
; Igglybuff
	prob 10
	prob 5
; Smoochum
	prob 10
	prob 5
; Magby
	prob 10
	prob 5
; Elekid
	prob 10
	prob 5
; Tyrogue
	prob 7
	prob 3

OddEggs:

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 02048 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 30, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 26 ; Max HP
	bigdw 15 ; Atk
	bigdw 10 ; Def
	bigdw 19 ; Spd
	bigdw 14 ; SAtk
	bigdw 14 ; SDef
	db "EGG@@@@@@@@"

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 30, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 26 ; Max HP
	bigdw 15 ; Atk
	bigdw 10 ; Def
	bigdw 19 ; Spd
	bigdw 14 ; SAtk
	bigdw 14 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 35, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 32 ; Max HP
	bigdw 12 ; Atk
	bigdw 12 ; Def
	bigdw 10 ; Spd
	bigdw 16 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 35, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 32 ; Max HP
	bigdw 12 ; Atk
	bigdw 13 ; Def
	bigdw 10 ; Spd
	bigdw 16 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 15, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 40 ; Max HP
	bigdw 13 ; Atk
	bigdw 10 ; Def
	bigdw 10 ; Spd
	bigdw 15 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 15, 20, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 40 ; Max HP
	bigdw 13 ; Atk
	bigdw 10 ; Def
	bigdw 10 ; Spd
	bigdw 15 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 03584 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 35, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 13 ; Atk
	bigdw 10 ; Def
	bigdw 20 ; Spd
	bigdw 24 ; SAtk
	bigdw 20 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 35, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 13 ; Atk
	bigdw 10 ; Def
	bigdw 20 ; Spd
	bigdw 24 ; SAtk
	bigdw 20 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 25, 10, 0, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 22 ; Atk
	bigdw 14 ; Def
	bigdw 23 ; Spd
	bigdw 21 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00512 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 25, 10, 0, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 22 ; Atk
	bigdw 15 ; Def
	bigdw 24 ; Spd
	bigdw 21 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 30, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 19 ; Atk
	bigdw 14 ; Def
	bigdw 26 ; Spd
	bigdw 20 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 30, 30, 10, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 31 ; Max HP
	bigdw 20 ; Atk
	bigdw 15 ; Def
	bigdw 26 ; Spd
	bigdw 20 ; SAtk
	bigdw 18 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 11, 11, 11, 11 ; DVs
	db 35, 10, 0, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 29 ; Max HP
	bigdw 14 ; Atk
	bigdw 14 ; Def
	bigdw 14 ; Spd
	bigdw 14 ; SAtk
	bigdw 14 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 00256 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 14, 14, 14, 14 ; DVs
	db 35, 10, 0, 0 ; PP
	db 10 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 29 ; Max HP
	bigdw 14 ; Atk
	bigdw 14 ; Def
	bigdw 14 ; Spd
	bigdw 14 ; SAtk
	bigdw 14 ; SDef
	db "EGG@@@@@@@@"
