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
	dt 125 ; Exp
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
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
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
	bigdw 17 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
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
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 7 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
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
	bigdw 20 ; Max HP
	bigdw 7 ; Atk
	bigdw 8 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 125 ; Exp
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
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 9 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 125 ; Exp
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
	bigdw 24 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 03584 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 6 ; Def
	bigdw 11 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 8 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 14 ; SAtk
	bigdw 12 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 8 ; Def
	bigdw 13 ; Spd
	bigdw 12 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 12 ; Atk
	bigdw 9 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 8 ; Def
	bigdw 14 ; Spd
	bigdw 11 ; SAtk
	bigdw 10 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 125 ; Exp
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
	bigdw 19 ; Max HP
	bigdw 11 ; Atk
	bigdw 9 ; Def
	bigdw 15 ; Spd
	bigdw 12 ; SAtk
	bigdw 11 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 125 ; Exp
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
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 8 ; Def
	bigdw 8 ; Spd
	bigdw 8 ; SAtk
	bigdw 8 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 00256 ; OT ID
	dt 125 ; Exp
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
	bigdw 18 ; Max HP
	bigdw 8 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "EGG@@@@@@@@"
