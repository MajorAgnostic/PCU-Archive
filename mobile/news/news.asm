; http://forums.glitchcity.info/index.php?topic=7509.msg206449#msg206449

	dab Doll1Script ; related to "My Room" in Stadium 2?

Function1f5d9f:
	ld a, BANK(s6_a000)
	call OpenSRAM
	ld hl, .news_data
	ld de, s6_a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret

.news_data
INCBIN "mobile/news/news_3.bin"
