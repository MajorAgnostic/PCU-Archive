	object_const_def ; object_event constants
	const FOREST_POKE_BALL1
	const FOREST_POKE_BALL2
	const FOREST_POKE_BALL3

ViridianForest_MapScripts:
	def_scene_scripts

	def_callbacks

ForestFullRestore:
	itemball LEAF_STONE

ForestMaxPotion:
	itemball MAX_POTION
	
ForestBigMushroom:
	itemball BIG_MUSHROOM

ForestHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_2_HIDDEN_MAX_ETHER

ForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ROUTE_2_HIDDEN_FULL_HEAL

ForestHiddenDireHit:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_2_HIDDEN_FULL_RESTORE
	
ForestHiddenBigMushroom:
	hiddenitem BIG_MUSHROOM, EVENT_ROUTE_2_BIGMUSHROOM
	
PewterSign:
	jumptext PewterSignText

PoisonSign:
	jumptext PoisonSignText
	
ForestSign:
	jumptext ForestSignText
	
PewterSignText:
	text "PEWTER CITY lies"
	line "ahead."
	done
	
PoisonSignText:
	text "TRAINER TIPS"

	para "For poison, use"
	line "ANTIDOTE! Get it"
	cont "at #MON MARTs!"
	done

ForestSignText:
	text "Deep, dark VIRI-"
	line "DIAN FOREST."
	done

ViridianForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  3, ROUTE_2_NORTHGATE, 3
	warp_event 19, 49, ROUTE_2_SOUTHGATE, 3
	warp_event 19, 48, ROUTE_2_SOUTHGATE, 4

	def_coord_events

	def_bg_events
	bg_event 27,  4, BGEVENT_ITEM, ForestHiddenMaxEther
	bg_event 10, 13, BGEVENT_ITEM, ForestHiddenFullHeal
	bg_event  3, 43, BGEVENT_ITEM, ForestHiddenDireHit
	bg_event 32, 43, BGEVENT_ITEM, ForestHiddenBigMushroom
	bg_event 17, 43, BGEVENT_READ, ForestSign
	bg_event 25, 41, BGEVENT_READ, PoisonSign
	bg_event  5,  5, BGEVENT_READ, PewterSign

	def_object_events
	object_event 14, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForestFullRestore, EVENT_ROUTE_2_DIRE_HIT
	object_event 27, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForestMaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event  2, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForestBigMushroom, EVENT_ROUTE_2_HIDDEN_BIGMUSHROOM
