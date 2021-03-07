	object_const_def
	const SILVERCAVEROOM3_RED
	const SILVERCAVEROOM3_MEW

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Mew
	
.Mew:
	checkevent EVENT_FOUGHT_MEW
	iftrue .NoAppear
	checkitem CLEAR_BELL
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear SILVERCAVEROOM3_MEW
	endcallback

.NoAppear:
	disappear SILVERCAVEROOM3_MEW
	endcallback

Mew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEW, 90
	loadvar VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	disappear SILVERCAVEROOM3_MEW
	reloadmapafterbattle
	end

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end
	
MewText:
	text "Myuuuu!"
	done

RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "Look after MEW…"
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 12, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
	object_event  9, 10, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Mew, EVENT_MEW_IN_MT_SILVER
