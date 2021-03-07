TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    20
	db 15, SPEAROW,    20
	db 15, LEDIAN,     20
	db 10, AIPOM,      20
	db  5, HERACROSS,  25
	db  5, AIPOM,      20
	db -1
; rare
	db 50, SPEAROW,    20
	db 15, SPEAROW,    20
	db 15, LEDIAN,     20
	db 10, HERACROSS,  25
	db  5, AIPOM,      25
	db  5, AIPOM,      25
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    20
	db 15, EKANS,      20
	db 15, SPEAROW,    20
	db 10, AIPOM,      20
	db  5, HERACROSS,  25
	db  5, AIPOM,      20
	db -1
; rare
	db 50, SPEAROW,    20
	db 15, EKANS,      20
	db 15, EKANS,      20
	db 10, HERACROSS,  25
	db  5, AIPOM,      25
	db  5, AIPOM,      25
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,   25
	db 15, SPINARAK,   25
	db 15, LEDYBA,     25
	db 10, PINECO,     25
	db  5, PINECO,     25
	db  5, PINSIR,     25
	db -1
; rare
	db 50, HOOTHOOT,   25
	db 15, PINECO,     25
	db 15, PINECO,     25
	db 10, LEDIAN,     25
	db  5, PINSIR,     25
	db  5, PINSIR,     25
	db -1

TreeMonSet_Kanto:
; common
	db 50, NOCTOWL,    50
	db 15, ARBOK,      50
	db 15, PINSIR,     50
	db 10, EXEGGCUTE,  50
	db  5, EXEGGUTOR,  55
	db  5, EXEGGUTOR,  55
	db -1
; rare
	db 50, NOCTOWL,    50
	db 15, ARBOK,      50
	db 15, FORRETRESS, 55
	db 10, EXEGGCUTE,  50
	db  5, EXEGGUTOR,  55
	db  5, EXEGGUTOR,  55
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   40
	db 15, VENONAT,    40
	db 15, HOOTHOOT,   40
	db 10, PINECO,     40
	db  5, EXEGGCUTE,  40
	db  5, EXEGGCUTE,  40
	db -1
; rare
	db 50, HOOTHOOT,   40
	db 15, PINECO,     40
	db 15, VENONAT,    40
	db 10, VENONAT,    40
	db  5, EXEGGCUTE,  45
	db  5, EXEGGCUTE,  45
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, NOCTOWL,    20
	db  5, BUTTERFREE, 20
	db  5, BEEDRILL,   20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, NOCTOWL,    25
	db  5, BUTTERFREE, 25
	db  5, BEEDRILL,   25
	db -1

TreeMonSet_Rock:
	db 35, KRABBY,     30
	db 35, GEODUDE,    30
	db 20, SLUGMA,     30
	db 10, SHUCKLE,    30
	db -1
