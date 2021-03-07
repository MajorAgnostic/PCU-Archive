	object_const_def
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MEWTWO
	iftrue .GotMewtwo
	writetext CeladonMansionRoofHousePharmacistIntroText
	promptbutton
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2, .CompletePokedex ; all except Mewtwo
	writetext CeladonMansionRoofHousePharmacistNotCompleteText
	waitbutton
	closetext
	end

.CompletePokedex:
	writetext CeladonMansionRoofHousePharmacistStoryText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedMewtwoText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke MEWTWO, 10, GORGEOUS_BOX
	setevent EVENT_GOT_MEWTWO
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
	closetext
	end
	
.GotMewtwo:
	writetext CeladonMansionRoofHousePharmacistEndText
	waitbutton
	closetext
	end
	
.NoRoom:
	writetext PharmacistPartyFullText
	waitbutton
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Let me recount a"
	line "terrifying tale…"
	done

CeladonMansionRoofHousePharmacistNotCompleteText:
	text "Then again, maybe"
	line "you should come"

	para "back once you've"
	line "caught some more"
	cont "#MON."

	para "That should prove"
	line "that you have the"
	
	para "heart to stomach"
	line "the terror of my"
	cont "harrowing tale…"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "Once upon a time,"
	line "there was a little"

	para "boy who was given"
	line "a new BICYCLE…"

	para "He wanted to try"
	line "it right away…"

	para "He was having so"
	line "much fun that he"

	para "didn't notice the"
	line "sun had set…"

	para "While riding home"
	line "in the pitch-black"

	para "night, the bike"
	line "suddenly slowed!"

	para "The pedals became"
	line "heavy!"

	para "When he stopped"
	line "pedaling, the bike"

	para "began slipping"
	line "backwards…"

	para "It was as if the"
	line "bike were cursed"

	para "and trying to drag"
	line "him into oblivion!"

	para "…"

	para "…"

	para "SHRIEEEEK!"

	para "The boy had been"
	line "riding uphill on"
	cont "CYCLING ROAD!"

	para "…"
	line "Ba-dum, tss!"

	para "For listening so"
	line "patiently, you may"
	
	para "take this--"
	line "MEWTHREE!"
	done
	
PharmacistPartyFullText:
	text "Oh, it seems that"
	line "you have no room"
	cont "for this #MON."
	
	para "If only we had"
	line "portable PCs!"
	done
	
ReceivedMewtwoText:
	text "<PLAYER> received"
	line "MEWTWO!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "Nah, just kidding;"
	line "it's a regular"
	cont "ol' MEWTWO."

	para "I bet you thought"
	line "I would give you"
	cont "TM03, huh?"
	
	para "Anyway, you might"
	line "be wondering how"

	para "I got my hands on"
	line "such a #MON."
	
	para "Or why I made it a"
	line "point to examine"
	cont "your collection."
	
	para "Well, let's just"
	line "say that I go way"
	
	para "back with OAK and"
	line "TEAM ROCKET, hehe."
	
	para "Now don't you have"
	line "a diploma to pick"
	cont "up?"
	done
	
CeladonMansionRoofHousePharmacistEndText:
	text "Maybe we'll meet"
	line "again, young tr-"

	para "ainer! Perhaps…"
	line "in the past…"
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
