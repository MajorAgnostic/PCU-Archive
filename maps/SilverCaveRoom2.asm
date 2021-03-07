	object_const_def
	const SILVERCAVEROOM2_STEVEN
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3

SilverCaveRoom2_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_SILVERCAVEROOM2_NOTHING
	scene_script .DummyScene1 ; SCENE_SILVERCAVEROOM2_SCENE

	def_callbacks
	
.DummyScene0:
.DummyScene1:
	end
	
NicholasScene:
	turnobject PLAYER, LEFT
	turnobject SILVERCAVEROOM2_STEVEN, RIGHT
	sjump TrainerNicholas

TrainerNicholas:
	faceplayer
	opentext
	checkevent EVENT_BEAT_NICHOLAS
	iftrue .NicholasBeaten
	writetext NicholasSeenText
	waitbutton
	closetext
	winlosstext NicholasBeatenText, 0
	loadtrainer NICHOLAS, NICHOLAS1
	startbattle
	reloadmapafterbattle
	setscene SCENE_FINISHED
	setevent EVENT_BEAT_NICHOLAS
	opentext
	writetext NicholasAfterBattleText
	waitbutton
	closetext
	end 
	
.NicholasBeaten
	writetext NicholasAfterBattleText2
	waitbutton
	closetext
	end

SilverCaveRoom2Calcium:
	itemball FULL_RESTORE

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2PPUp:
	itemball PP_UP

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION
	
NicholasSeenText:
	text "Oh! I'm quite sur-"
	line "prised to see a"

	para "trainer this deep"
	line "in the mountain."

	para "You must be pretty"
	line "strong, then. How-"
	
	para "ever, my friend is"
	line "beyond this point"
	
	para "and he's busy with"
	line "his training. I am"
	
	para "not to let anyone"
	line "beyond this point."
	
	para "Well, unless they"
	line "can defeat me, I"
	cont "should say."
	
	para "Though I must warn"
	line "you that I am the"
	
	para "strongest trainer"
	line "you'll ever face!"
	done

NicholasBeatenText:
	text "Magnificent! You"
	line "may have what it"
	cont "takes."
	done

NicholasAfterBattleText:
	text "I must confess, I"
	line "was lying earlier"
	
	para "about being the"
	line "strongest."

	para "My good friend is"
	line "actually a bit st-"
	cont "ronger than I am!"

	para "However, I think"
	line "you stand a good"
	
	para "chance of giving"
	line "him a run for his"
	
	para "money, so good"
	line "luck, trainer!"
	cont "You'll need it!"
	done
	
NicholasAfterBattleText2:
	text "You know the path"
	line "before you."
	done

SilverCaveRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 31, SILVER_CAVE_ROOM_1, 2
	warp_event 11,  5, SILVER_CAVE_ROOM_3, 1
	warp_event 13, 21, SILVER_CAVE_ITEM_ROOMS, 1
	warp_event 23,  3, SILVER_CAVE_ITEM_ROOMS, 2

	def_coord_events
	coord_event 11,  6, SCENE_SILVERCAVEROOM2_NOTHING, NicholasScene

	def_bg_events
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion

	def_object_events
	object_event 10,  6, SPRITE_STEVEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, TrainerNicholas, -1
	object_event 24, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2Calcium, EVENT_SILVER_CAVE_ROOM_2_CALCIUM
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2PPUp, EVENT_SILVER_CAVE_ROOM_2_PP_UP
