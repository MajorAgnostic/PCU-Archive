ROUTE39FARMHOUSE_MILK_PRICE EQU 1000
ROUTE39FARMHOUSE_DOZEN_MILK_PRICE EQU 11000

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
    writetext FarmerMText_BuyMilk
FarmerMScript_SellMilk_LoopScript:
    special PlaceMoneyTopRight
    loadmenu FarmerMScript_SellMilkMenuHeader
    verticalmenu
    closewindow
    ifequal 1, .OneBottle
    ifequal 2, .OneDozen
    sjump FarmerMScript_NoSale

.OneBottle
    checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
    ifequal HAVE_LESS, FarmerMScript_NoMoney
    giveitem MOOMOO_MILK
    iffalse FarmerMScript_NoRoom
    takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
    special PlaceMoneyTopRight
    sjump FarmerMScript_SellMil_FinishScript

.OneDozen
    checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE
    ifequal HAVE_LESS, FarmerMScript_NoMoney
    giveitem MOOMOO_MILK, 12
    iffalse FarmerMScript_NoRoom
    takemoney YOUR_MONEY, ROUTE39FARMHOUSE_DOZEN_MILK_PRICE
    special PlaceMoneyTopRight
    ; fallthrough
FarmerMScript_SellMil_FinishScript:
    waitsfx
    playsound SFX_TRANSACTION
    writetext FarmerMText_GotMilk
    promptbutton
    itemnotify
    sjump FarmerMScript_SellMilk_LoopScript
	
FarmerMScript_SellMilkMenuHeader:
    db MENU_BACKUP_TILES ; flags
    menu_coords 0, 3, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
    dw .MenuData
    db 1 ; default option

.MenuData:
    db STATICMENU_CURSOR ; flags
    db 3 ; items
    db "ONE BOTTLE  ¥{d:ROUTE39FARMHOUSE_MILK_PRICE}@"
    db "ONE DOZEN  ¥{d:ROUTE39FARMHOUSE_DOZEN_MILK_PRICE}@"
    db "CANCEL@"

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "My MILTANK ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here FARM's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"

	para "feed it a good ol'"
	line "BERRY, I reckon."
	done

FarmerMText_BuyMilk:
	text "How'd you like my"
	line "MOOMOO MILK?"

	para "It's my pride and"
	line "joy, there."

	para "Give it to #MON"
	line "to restore HP!"

	para "Grab a bottle or"
	line "a dozen!"
	done

FarmerMText_GotMilk:
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done

FarmerMText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerMText_NoRoom:
	text "I reckon yer"
	line "PACK's full."
	done

FarmerMText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

FarmerFText_InTrouble:
	text "Our milk even goes"
	line "out to KANTO."

	para "So if our own"
	line "MILTANK won't give"

	para "us any milk, we're"
	line "in trouble."
	done

FarmerFText_HealedMiltank:
	text "You fixed our"
	line "MILTANK, hon. Now"

	para "it gives MOOMOO"
	line "MILK again."

	para "Here's somethin'"
	line "fer your trouble."
	done

Text_ReceivedTM13:
	text "<PLAYER> received"
	line "TM13."
	done

FarmerFText_SnoreSpeech:
	text "That there's"
	line "SNORE."

	para "It's a rare move"
	line "that only works"

	para "while the #MON"
	line "is asleep."

	para "You best think how"
	line "you ought to use"
	cont "it, hon."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
