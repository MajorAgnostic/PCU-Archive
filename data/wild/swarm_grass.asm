; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 5, GEODUDE
	db 7, DUNSPARCE
	db 5, ZUBAT
	db 6, ZUBAT
	db 8, DUNSPARCE
	db 8, DUNSPARCE
	db 8, DUNSPARCE
	; day
	db 5, GEODUDE
	db 7, DUNSPARCE
	db 5, ZUBAT
	db 6, ZUBAT
	db 8, DUNSPARCE
	db 8, DUNSPARCE
	db 8, DUNSPARCE
	; nite
	db 5, GEODUDE
	db 7, DUNSPARCE
	db 5, ZUBAT
	db 6, ZUBAT
	db 8, DUNSPARCE
	db 8, DUNSPARCE
	db 8, DUNSPARCE

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 24, YANMA
	db 23, NIDORAN_F
	db 24, YANMA
	db 23, NIDORAN_M
	db 22, PIDGEY
	db 23, DITTO
	db 23, DITTO
	; day
	db 23, NIDORAN_M
	db 24, YANMA
	db 24, YANMA
	db 23, NIDORAN_F
	db 22, PIDGEY
	db 23, DITTO
	db 23, DITTO
	; nite
	db 23, NIDORAN_M
	db 23, NIDORAN_F
	db 24, YANMA
	db 24, YANMA
	db 22, HOOTHOOT
	db 23, DITTO
	db 23, DITTO

	db -1 ; end
