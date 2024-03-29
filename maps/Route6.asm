	object_const_def
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3
	const ROUTE6_PICNICKER
	const ROUTE6_BUG_CATCHER
	const ROUTE6_YOUNGSTER

Route6_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerPokefanmRex:
	trainer POKEFANM, REX, EVENT_BEAT_POKEFANM_REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer POKEFANM, ALLAN, EVENT_BEAT_POKEFANM_ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAllanAfterBattleText
	waitbutton
	closetext
	end
	
TrainerPicnickerSelina:
	trainer PICNICKER, SELINA, EVENT_BEAT_SELINA, SelinaSeenText, SelinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SelinaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerBugCatcherDay:
	trainer BUG_CATCHER, DAY_T, EVENT_BEAT_DAY, DaySeenText, DayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DayAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCamperVergil:
	trainer CAMPER, VERGIL, EVENT_BEAT_VERGIL, VergilSeenText, VergilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext VergilAfterBattleText
	waitbutton
	closetext
	end

Route6PokefanMScript:
	jumptextfaceplayer Route6PokefanMText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6PokefanMText:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is resolved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "My PHANPY is the"
	line "cutest in the"
	cont "world."
	done

PokefanmRexBeatenText:
	text "My PHANPY!"
	done

PokefanmRexAfterBattleText:
	text "Look how adorable"
	line "my PHANPY acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

PokefanmAllanSeenText:
	text "My TEDDIURSA is"
	line "the cutest in the"
	cont "world."
	done

PokefanmAllanBeatenText:
	text "My TEDDIURSA!"
	done

PokefanmAllanAfterBattleText:
	text "Look how adorable"
	line "my TEDDIURSA acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done
	
SelinaSeenText:
	text "I'm headed out on"
	line "a picnic. Do you"
	cont "know why?"
	done

SelinaBeatenText:
	text "You are pretty"
	line "good!"
	done

SelinaAfterBattleText:
	text "I'm going on a"
	line "picnic because…"

	para "I really want to"
	line "smell the fresh"
	cont "air…"
	
	para "Do you know what I"
	line "mean?"
	done
	
DaySeenText:
	text "I'll knock you"
	line "flat!"
	done

DayBeatenText:
	text "Waah!"
	done

DayAfterBattleText:
	text "Looks like I got"
	line "bounced."
	done
	
VergilSeenText:
	text "Walking along with"
	line "luggage and your"
	
	para "companion #MON"
	line "gives you a great"
	cont "feeling of outdoor"
	cont "life!"
	done

VergilBeatenText:
	text "Yaha! I lost!"
	done

VergilAfterBattleText:
	text "Are you also on a"
	line "solo journey?"
	
	para "I hope to see you"
	line "again sometime."
	cont "Bye for now!"
	done

Route6_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	def_object_events
	object_event 17,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, Route6PokefanMScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 11,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	object_event 12,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerSelina, -1
	object_event 18, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBugCatcherDay, -1
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperVergil, -1
