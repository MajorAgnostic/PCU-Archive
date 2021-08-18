ItemPocketNames:
; entries correspond to item type constants
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	dw .Med

.Item: db "ITEM POCKET@"
.Key:  db "KEY POCKET@"
.Ball: db "BALL POCKET@"
.TM:   db "TM POCKET@"
.Med:  db "MED POCKET@"
