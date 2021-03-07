	; PokemonCenterPC.WhichPC indexes
	const_def
	const POCKETPCPC_BEFORE_POKEDEX ; 0
	const POCKETPCPC_BEFORE_HOF     ; 1
	const POCKETPCPC_POSTGAME       ; 2

	; PokemonCenterPC.JumpTable indexes
	const_def
	const POCKETPCPCITEM_PLAYERS_PC   ; 0
	const POCKETPCPCITEM_BILLS_PC     ; 1
	const POCKETPCPCITEM_OAKS_PC      ; 2
	const POCKETPCPCITEM_HALL_OF_FAME ; 3
	const POCKETPCPCITEM_TURN_OFF     ; 4

_PocketPC:
	call PocketPC_CheckPartyForPokemon
	ret c
	call PocketPC_PlayBootSound
	ld hl, PocketPokecenterPCTurnOnText
	call PocketPC_DisplayText
	ld hl, PocketPokecenterPCWhoseText
	call PocketPC_DisplayTextWaitMenu
	ld hl, .PocketTopMenu
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call .PocketChooseWhichPCListToUse
	ld [wWhichIndexSet], a
	call DoNthMenu
	jr c, .Pocketshutdown
	ld a, [wMenuSelection]
	ld hl, .PocketJumpTable
	call MenuJumptable
	jr nc, .loop

.Pocketshutdown
	call PocketPC_PlayShutdownSound
	call ExitMenu
	call CloseWindow
	ret

.PocketTopMenu:
	db MENU_BACKUP_TILES | MENU_NO_CLICK_SFX ; flags
	menu_coords 0, 0, 15, 12
	dw .PocketMenuData
	db 1 ; default option

.PocketMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items
	dw .PocketWhichPC
	dw PlaceNthMenuStrings
	dw .PocketJumpTable

.PocketJumpTable:
; entries correspond to PCPCITEM_* constants
	dw PlayersPC,    .PocketString_PlayersPC
	dw BillsPC,      .String_BillsPocketPC
	dw OaksPC,       .PocketString_OaksPC
	dw HallOfFamePC, .PocketString_HallOfFame
	dw TurnOffPC,    .PocketString_TurnOff

.PocketString_PlayersPC:  db "<PLAYER>'s PC@"
.String_BillsPocketPC:    db "BILL's PC@"
.PocketString_OaksPC:     db "PROF.OAK's PC@"
.PocketString_HallOfFame: db "HALL OF FAME@"
.PocketString_TurnOff:    db "TURN OFF@"

.PocketWhichPC:
; entries correspond to PCPC_* constants

	; PCPC_BEFORE_POKEDEX
	db 3
	db POCKETPCPCITEM_BILLS_PC
	db POCKETPCPCITEM_PLAYERS_PC
	db POCKETPCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_BEFORE_HOF
	db 4
	db POCKETPCPCITEM_BILLS_PC
	db POCKETPCPCITEM_PLAYERS_PC
	db POCKETPCPCITEM_OAKS_PC
	db POCKETPCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_POSTGAME
	db 5
	db POCKETPCPCITEM_BILLS_PC
	db POCKETPCPCITEM_PLAYERS_PC
	db POCKETPCPCITEM_OAKS_PC
	db POCKETPCPCITEM_HALL_OF_FAME
	db POCKETPCPCITEM_TURN_OFF
	db -1 ; end

.PocketChooseWhichPCListToUse:
	call CheckReceivedDex
	jr nz, .Pocketgot_dex
	ld a, POCKETPCPC_BEFORE_POKEDEX
	ret

.Pocketgot_dex
	ld a, [wHallOfFameCount]
	and a
	ld a, POCKETPCPC_BEFORE_HOF
	ret z
	ld a, POCKETPCPC_POSTGAME
	ret

PocketPC_CheckPartyForPokemon:
	ld a, [wPartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .PocketPokecenterPCCantUseText
	call PocketPC_DisplayText
	scf
	ret

.PocketPokecenterPCCantUseText:
	text_far _PokecenterPCCantUseText
	text_end


	; PlayersPCMenuData.WhichPC indexes
	const_def
	const POCKETPLAYERSPC_NORMAL ; 0
	const POCKETPLAYERSPC_HOUSE  ; 1

	; PlayersPCMenuData.PlayersPCMenuPointers indexes
	const_def
	const POCKETPLAYERSPCITEM_WITHDRAW_ITEM ; 0
	const POCKETPLAYERSPCITEM_DEPOSIT_ITEM  ; 1
	const POCKETPLAYERSPCITEM_TOSS_ITEM     ; 2
	const POCKETPLAYERSPCITEM_MAIL_BOX      ; 3
	const POCKETPLAYERSPCITEM_DECORATION    ; 4
	const POCKETPLAYERSPCITEM_TURN_OFF      ; 5
	const POCKETPLAYERSPCITEM_LOG_OFF       ; 6

PocketBillsPC:
	call PocketPC_PlayChoosePCSound
	ld hl, PocketPokecenterBillsPCText
	call PocketPC_DisplayText
	farcall _BillsPocketPC
	and a
	ret

PocketPlayersPC:
	call PocketPC_PlayChoosePCSound
	ld hl, PocketPokecenterPlayersPCText
	call PocketPC_DisplayText
	ld b, PLAYERSPC_NORMAL
	call Pocket_PlayersPC
	and a
	ret

PocketOaksPC:
	call PocketPC_PlayChoosePCSound
	ld hl, PocketPokecenterOaksPCText
	call PocketPC_DisplayText
	farcall ProfOaksPC
	and a
	ret

PocketHallOfFamePC:
	call PocketPC_PlayChoosePCSound
	call FadeToMenu
	farcall _HallOfFamePC
	call CloseSubmenu
	and a
	ret

PocketTurnOffPC:
	ld hl, PocketPokecenterPCOaksClosedText
	call PrintText
	scf
	ret

PocketPC_PlayBootSound:
	ld de, SFX_BOOT_PC
	jr PocketPC_WaitPlaySFX

PocketPC_PlayShutdownSound:
	ld de, SFX_SHUT_DOWN_PC
	call PocketPC_WaitPlaySFX
	call WaitSFX
	ret

PocketPC_PlayChoosePCSound:
	ld de, SFX_CHOOSE_PC_OPTION
	jr PocketPC_WaitPlaySFX

PocketPC_PlaySwapItemsSound:
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PocketPC_WaitPlaySFX:
	push de
	call WaitSFX
	pop de
	call PlaySFX
	ret

Pocket_PlayersHousePC:
	call PocketPC_PlayBootSound
	ld hl, PlayersPCTurnOnText
	call PocketPC_DisplayText
	ld b, PLAYERSPC_HOUSE
	call Pocket_PlayersPC
	and a
	jr nz, .Pocketasm_156f9
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call PocketPC_PlayShutdownSound
	ld c, FALSE
	ret

.Pocketasm_156f9
	call ClearBGPalettes
	ld c, TRUE
	ret

PocketPlayersPCTurnOnText:
	text_far _PlayersPCTurnOnText
	text_end

Pocket_PlayersPC:
	ld a, b
	ld [wWhichIndexSet], a
	ld hl, PlayersPCAskWhatDoText
	call PocketPC_DisplayTextWaitMenu
	call PocketFunction15715
	call ExitMenu
	ret

PocketFunction15715:
	xor a
	ld [wPCItemsCursor], a
	ld [wPCItemsScrollPosition], a
	ld hl, PlayersPCMenuData
	call LoadMenuHeader
.Pocketasm_15722
	call UpdateTimePals
	call DoNthMenu
	jr c, .Pocketasm_15731
	call MenuJumptable
	jr nc, .Pocketasm_15722
	jr .Pocketasm_15732

.Pocketasm_15731
	xor a

.Pocketasm_15732
	call ExitMenu
	ret

PocketPlayersPCMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 12
	dw .PocketPlayersPCMenuData
	db 1 ; default selected option

.PocketPlayersPCMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; # items?
	dw .PocketWhichPC
	dw PlaceNthMenuStrings
	dw .PocketPlayersPCMenuPointers

.PocketPlayersPCMenuPointers:
; entries correspond to PLAYERSPCITEM_* constants
	dw PlayerWithdrawItemMenu, .PocketWithdrawItem
	dw PlayerDepositItemMenu,  .PocketDepositItem
	dw PlayerTossItemMenu,     .PocketTossItem
	dw PlayerMailBoxMenu,      .PocketMailBox
	dw PlayerDecorationMenu,   .PocketDecoration
	dw PlayerLogOffMenu,       .PocketLogOff
	dw PlayerLogOffMenu,       .PocketTurnOff

.PocketWithdrawItem: db "WITHDRAW ITEM@"
.PocketDepositItem:  db "DEPOSIT ITEM@"
.PocketTossItem:     db "TOSS ITEM@"
.PocketMailBox:      db "MAIL BOX@"
.PocketDecoration:   db "DECORATION@"
.PocketTurnOff:      db "TURN OFF@"
.PocketLogOff:       db "LOG OFF@"

.PocketWhichPC:
; entries correspond to PLAYERSPC_* constants

	; PLAYERSPC_NORMAL
	db 5
	db POCKETPLAYERSPCITEM_WITHDRAW_ITEM
	db POCKETPLAYERSPCITEM_DEPOSIT_ITEM
	db POCKETPLAYERSPCITEM_TOSS_ITEM
	db POCKETPLAYERSPCITEM_MAIL_BOX
	db POCKETPLAYERSPCITEM_TURN_OFF
	db -1 ; end

	; PLAYERSPC_HOUSE
	db 6
	db POCKETPLAYERSPCITEM_WITHDRAW_ITEM
	db POCKETPLAYERSPCITEM_DEPOSIT_ITEM
	db POCKETPLAYERSPCITEM_TOSS_ITEM
	db POCKETPLAYERSPCITEM_MAIL_BOX
	db POCKETPLAYERSPCITEM_DECORATION
	db POCKETPLAYERSPCITEM_LOG_OFF
	db -1 ; end

PocketPC_DisplayTextWaitMenu:
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call MenuTextbox
	pop af
	ld [wOptions], a
	ret

PocketPlayersPCAskWhatDoText:
	text_far _PlayersPCAskWhatDoText
	text_end

PocketPlayerWithdrawItemMenu:
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PocketPCItemsJoypad
	jr c, .quit
	call .PocketSubmenu
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

.PocketSubmenu:
	; check if the item has a quantity
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .Pocketaskquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .Pocketwithdraw

.Pocketaskquantity
	ld hl, .PocketPlayersPCHowManyWithdrawText
	call MenuTextbox
	farcall SelectQuantityToToss
	call ExitMenu
	call ExitMenu
	jr c, .done

.Pocketwithdraw
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a ; quantity
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .PocketPackFull
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumPCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PocketPlayersPCWithdrewItemsText
	call MenuTextbox
	xor a
	ldh [hBGMapMode], a
	call ExitMenu
	ret

.PocketPackFull:
	ld hl, .PocketPlayersPCNoRoomWithdrawText
	call MenuTextboxBackup
	ret

.done
	ret

.PocketPlayersPCHowManyWithdrawText:
	text_far _PlayersPCHowManyWithdrawText
	text_end

.PocketPlayersPCWithdrewItemsText:
	text_far _PlayersPCWithdrewItemsText
	text_end

.PocketPlayersPCNoRoomWithdrawText:
	text_far _PlayersPCNoRoomWithdrawText
	text_end

PocketPlayerTossItemMenu:
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PocketPCItemsJoypad
	jr c, .quit
	ld de, wNumPCItems
	farcall TossItemFromPC
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

PocketPlayerDecorationMenu:
	farcall _PlayerDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret

PocketPlayerLogOffMenu:
	xor a
	scf
	ret

PocketPlayerDepositItemMenu:
	call .PocketCheckItemsInBag
	jr c, .Pocketnope
	call DisableSpriteUpdates
	call LoadStandardMenuHeader
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wPackUsedItem]
	and a
	jr z, .close
	call .PocketTryDepositItem
	farcall CheckRegisteredItem
	jr .loop

.close
	call CloseSubmenu

.Pocketnope
	xor a
	ret

.PocketCheckItemsInBag:
	farcall HasNoItems
	ret nc
	ld hl, .PocketPlayersPCNoItemsText
	call MenuTextboxBackup
	scf
	ret

.PocketPlayersPCNoItemsText:
	text_far _PlayersPCNoItemsText
	text_end

.PocketTryDepositItem:
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .Pocketdw
	rst JumpTable
	pop af
	ld [wSpriteUpdatesEnabled], a
	ret

.Pocketdw
; entries correspond to ITEMMENU_* constants
	dw .tossable ; ITEMMENU_NOUSE
	dw .no_toss
	dw .no_toss
	dw .no_toss
	dw .tossable ; ITEMMENU_CURRENT
	dw .tossable ; ITEMMENU_PARTY
	dw .tossable ; ITEMMENU_CLOSE

.no_toss
	ret

.tossable
	ld a, [wBuffer1]
	push af
	ld a, [wBuffer2]
	push af
	call .PocketDepositItem
	pop af
	ld [wBuffer2], a
	pop af
	ld [wBuffer1], a
	ret

.PocketDepositItem:
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .PocketAskQuantity
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .PocketContinueDeposit

.PocketAskQuantity:
	ld hl, .PocketPlayersPCHowManyDepositText
	call MenuTextbox
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .PocketDeclinedToDeposit

.PocketContinueDeposit:
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumPCItems
	call ReceiveItem
	jr nc, .PocketNoRoomInPC
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PocketPlayersPCDepositItemsText
	call PrintText
	ret

.PocketNoRoomInPC:
	ld hl, .PocketPlayersPCNoRoomDepositText
	call PrintText
	ret

.PocketDeclinedToDeposit:
	and a
	ret

.PocketPlayersPCHowManyDepositText:
	text_far _PlayersPCHowManyDepositText
	text_end

.PocketPlayersPCDepositItemsText:
	text_far _PlayersPCDepositItemsText
	text_end

.PocketPlayersPCNoRoomDepositText:
	text_far _PlayersPCNoRoomDepositText
	text_end

PocketPlayerMailBoxMenu:
	farcall _PlayerMailBoxMenu
	xor a
	ret

PocketPCItemsJoypad:
	xor a
	ld [wSwitchItem], a
.loop
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	ld hl, .PocketPCItemsMenuData
	call CopyMenuHeader
	hlcoord 0, 0
	ld b, 10
	ld c, 18
	call Textbox
	ld a, [wPCItemsCursor]
	ld [wMenuCursorBuffer], a
	ld a, [wPCItemsScrollPosition]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wPCItemsScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wPCItemsCursor], a
	pop af
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSwitchItem]
	and a
	jr nz, .Pocketmoving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .Pocketb_1
	cp A_BUTTON
	jr z, .Pocketa_1
	cp SELECT
	jr z, .Pocketselect_1
	jr .Pocketnext

.Pocketmoving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .Pocketb_2
	cp A_BUTTON
	jr z, .Pocketa_select_2
	cp SELECT
	jr z, .Pocketa_select_2
	jr .Pocketnext

.Pocketb_2
	xor a
	ld [wSwitchItem], a
	jr .Pocketnext

.Pocketa_select_2
	call PocketPC_PlaySwapItemsSound
.Pocketselect_1
	farcall SwitchItemsInBag
.Pocketnext
	jp .loop

.Pocketa_1
	farcall ScrollingMenu_ClearLeftColumn
	call PlaceHollowCursor
	and a
	ret

.Pocketb_1
	scf
	ret

.PocketPCItemsMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 1, 18, 10
	dw .PocketMenuData
	db 1 ; default option

.PocketMenuData:
	db SCROLLINGMENU_ENABLE_SELECT | SCROLLINGMENU_ENABLE_FUNCTION3 | SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, wNumPCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

PocketPC_DisplayText:
	call MenuTextbox
	call ExitMenu
	ret

PocketPokecenterPCTurnOnText:
	text_far _PokecenterPCTurnOnText
	text_end

PocketPokecenterPCWhoseText:
	text_far _PokecenterPCWhoseText
	text_end

PocketPokecenterBillsPCText:
	text_far _PokecenterBillsPCText
	text_end

PocketPokecenterPlayersPCText:
	text_far _PokecenterPlayersPCText
	text_end

PocketPokecenterOaksPCText:
	text_far _PokecenterOaksPCText
	text_end

PocketPokecenterPCOaksClosedText:
	text_far _PokecenterPCOaksClosedText
	text_end
	
	; PokemonCenterPC.WhichPC indexes
	const_def
	const PCPC_BEFORE_POKEDEX ; 0
	const PCPC_BEFORE_HOF     ; 1
	const PCPC_POSTGAME       ; 2

	; PokemonCenterPC.JumpTable indexes
	const_def
	const PCPCITEM_PLAYERS_PC   ; 0
	const PCPCITEM_BILLS_PC     ; 1
	const PCPCITEM_OAKS_PC      ; 2
	const PCPCITEM_HALL_OF_FAME ; 3
	const PCPCITEM_TURN_OFF     ; 4

PokemonCenterPC:
	call PC_CheckPartyForPokemon
	ret c
	call PC_PlayBootSound
	ld hl, PokecenterPCTurnOnText
	call PC_DisplayText
	ld hl, PokecenterPCWhoseText
	call PC_DisplayTextWaitMenu
	ld hl, .TopMenu
	call LoadMenuHeader
.loop
	xor a
	ldh [hBGMapMode], a
	call .ChooseWhichPCListToUse
	ld [wWhichIndexSet], a
	call DoNthMenu
	jr c, .shutdown
	ld a, [wMenuSelection]
	ld hl, .JumpTable
	call MenuJumptable
	jr nc, .loop

.shutdown
	call PC_PlayShutdownSound
	call ExitMenu
	call CloseWindow
	ret

.TopMenu:
	db MENU_BACKUP_TILES | MENU_NO_CLICK_SFX ; flags
	menu_coords 0, 0, 15, 12
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; items
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .JumpTable

.JumpTable:
; entries correspond to PCPCITEM_* constants
	dw PlayersPC,    .String_PlayersPC
	dw BillsPC,      .String_BillsPC
	dw OaksPC,       .String_OaksPC
	dw HallOfFamePC, .String_HallOfFame
	dw TurnOffPC,    .String_TurnOff

.String_PlayersPC:  db "<PLAYER>'s PC@"
.String_BillsPC:    db "BILL's PC@"
.String_OaksPC:     db "PROF.OAK's PC@"
.String_HallOfFame: db "HALL OF FAME@"
.String_TurnOff:    db "TURN OFF@"

.WhichPC:
; entries correspond to PCPC_* constants

	; PCPC_BEFORE_POKEDEX
	db 3
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_BEFORE_HOF
	db 4
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_OAKS_PC
	db PCPCITEM_TURN_OFF
	db -1 ; end

	; PCPC_POSTGAME
	db 5
	db PCPCITEM_BILLS_PC
	db PCPCITEM_PLAYERS_PC
	db PCPCITEM_OAKS_PC
	db PCPCITEM_HALL_OF_FAME
	db PCPCITEM_TURN_OFF
	db -1 ; end

.ChooseWhichPCListToUse:
	call CheckReceivedDex
	jr nz, .got_dex
	ld a, PCPC_BEFORE_POKEDEX
	ret

.got_dex
	ld a, [wHallOfFameCount]
	and a
	ld a, PCPC_BEFORE_HOF
	ret z
	ld a, PCPC_POSTGAME
	ret

PC_CheckPartyForPokemon:
	ld a, [wPartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .PokecenterPCCantUseText
	call PC_DisplayText
	scf
	ret

.PokecenterPCCantUseText:
	text_far _PokecenterPCCantUseText
	text_end


	; PlayersPCMenuData.WhichPC indexes
	const_def
	const PLAYERSPC_NORMAL ; 0
	const PLAYERSPC_HOUSE  ; 1

	; PlayersPCMenuData.PlayersPCMenuPointers indexes
	const_def
	const PLAYERSPCITEM_WITHDRAW_ITEM ; 0
	const PLAYERSPCITEM_DEPOSIT_ITEM  ; 1
	const PLAYERSPCITEM_TOSS_ITEM     ; 2
	const PLAYERSPCITEM_MAIL_BOX      ; 3
	const PLAYERSPCITEM_DECORATION    ; 4
	const PLAYERSPCITEM_TURN_OFF      ; 5
	const PLAYERSPCITEM_LOG_OFF       ; 6

BillsPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterBillsPCText
	call PC_DisplayText
	farcall _BillsPC
	and a
	ret

PlayersPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterPlayersPCText
	call PC_DisplayText
	ld b, PLAYERSPC_NORMAL
	call _PlayersPC
	and a
	ret

OaksPC:
	call PC_PlayChoosePCSound
	ld hl, PokecenterOaksPCText
	call PC_DisplayText
	farcall ProfOaksPC
	and a
	ret

HallOfFamePC:
	call PC_PlayChoosePCSound
	call FadeToMenu
	farcall _HallOfFamePC
	call CloseSubmenu
	and a
	ret

TurnOffPC:
	ld hl, PokecenterPCOaksClosedText
	call PrintText
	scf
	ret

PC_PlayBootSound:
	ld de, SFX_BOOT_PC
	jr PC_WaitPlaySFX

PC_PlayShutdownSound:
	ld de, SFX_SHUT_DOWN_PC
	call PC_WaitPlaySFX
	call WaitSFX
	ret

PC_PlayChoosePCSound:
	ld de, SFX_CHOOSE_PC_OPTION
	jr PC_WaitPlaySFX

PC_PlaySwapItemsSound:
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PC_WaitPlaySFX:
	push de
	call WaitSFX
	pop de
	call PlaySFX
	ret

_PlayersHousePC:
	call PC_PlayBootSound
	ld hl, PlayersPCTurnOnText
	call PC_DisplayText
	ld b, PLAYERSPC_HOUSE
	call _PlayersPC
	and a
	jr nz, .asm_156f9
	call OverworldTextModeSwitch
	call ApplyTilemap
	call UpdateSprites
	call PC_PlayShutdownSound
	ld c, FALSE
	ret

.asm_156f9
	call ClearBGPalettes
	ld c, TRUE
	ret

PlayersPCTurnOnText:
	text_far _PlayersPCTurnOnText
	text_end

_PlayersPC:
	ld a, b
	ld [wWhichIndexSet], a
	ld hl, PlayersPCAskWhatDoText
	call PC_DisplayTextWaitMenu
	call Function15715
	call ExitMenu
	ret

Function15715:
	xor a
	ld [wPCItemsCursor], a
	ld [wPCItemsScrollPosition], a
	ld hl, PlayersPCMenuData
	call LoadMenuHeader
.asm_15722
	call UpdateTimePals
	call DoNthMenu
	jr c, .asm_15731
	call MenuJumptable
	jr nc, .asm_15722
	jr .asm_15732

.asm_15731
	xor a

.asm_15732
	call ExitMenu
	ret

PlayersPCMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 12
	dw .PlayersPCMenuData
	db 1 ; default selected option

.PlayersPCMenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 0 ; # items?
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .PlayersPCMenuPointers

.PlayersPCMenuPointers:
; entries correspond to PLAYERSPCITEM_* constants
	dw PlayerWithdrawItemMenu, .WithdrawItem
	dw PlayerDepositItemMenu,  .DepositItem
	dw PlayerTossItemMenu,     .TossItem
	dw PlayerMailBoxMenu,      .MailBox
	dw PlayerDecorationMenu,   .Decoration
	dw PlayerLogOffMenu,       .LogOff
	dw PlayerLogOffMenu,       .TurnOff

.WithdrawItem: db "WITHDRAW ITEM@"
.DepositItem:  db "DEPOSIT ITEM@"
.TossItem:     db "TOSS ITEM@"
.MailBox:      db "MAIL BOX@"
.Decoration:   db "DECORATION@"
.TurnOff:      db "TURN OFF@"
.LogOff:       db "LOG OFF@"

.WhichPC:
; entries correspond to PLAYERSPC_* constants

	; PLAYERSPC_NORMAL
	db 5
	db PLAYERSPCITEM_WITHDRAW_ITEM
	db PLAYERSPCITEM_DEPOSIT_ITEM
	db PLAYERSPCITEM_TOSS_ITEM
	db PLAYERSPCITEM_MAIL_BOX
	db PLAYERSPCITEM_TURN_OFF
	db -1 ; end

	; PLAYERSPC_HOUSE
	db 6
	db PLAYERSPCITEM_WITHDRAW_ITEM
	db PLAYERSPCITEM_DEPOSIT_ITEM
	db PLAYERSPCITEM_TOSS_ITEM
	db PLAYERSPCITEM_MAIL_BOX
	db PLAYERSPCITEM_DECORATION
	db PLAYERSPCITEM_LOG_OFF
	db -1 ; end

PC_DisplayTextWaitMenu:
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call MenuTextbox
	pop af
	ld [wOptions], a
	ret

PlayersPCAskWhatDoText:
	text_far _PlayersPCAskWhatDoText
	text_end

PlayerWithdrawItemMenu:
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PCItemsJoypad
	jr c, .quit
	call .Submenu
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

.Submenu:
	; check if the item has a quantity
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .askquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .withdraw

.askquantity
	ld hl, .PlayersPCHowManyWithdrawText
	call MenuTextbox
	farcall SelectQuantityToToss
	call ExitMenu
	call ExitMenu
	jr c, .done

.withdraw
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a ; quantity
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .PackFull
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumPCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PlayersPCWithdrewItemsText
	call MenuTextbox
	xor a
	ldh [hBGMapMode], a
	call ExitMenu
	ret

.PackFull:
	ld hl, .PlayersPCNoRoomWithdrawText
	call MenuTextboxBackup
	ret

.done
	ret

.PlayersPCHowManyWithdrawText:
	text_far _PlayersPCHowManyWithdrawText
	text_end

.PlayersPCWithdrewItemsText:
	text_far _PlayersPCWithdrewItemsText
	text_end

.PlayersPCNoRoomWithdrawText:
	text_far _PlayersPCNoRoomWithdrawText
	text_end

PlayerTossItemMenu:
	call LoadStandardMenuHeader
	farcall ClearPCItemScreen
.loop
	call PCItemsJoypad
	jr c, .quit
	ld de, wNumPCItems
	farcall TossItemFromPC
	jr .loop

.quit
	call CloseSubmenu
	xor a
	ret

PlayerDecorationMenu:
	farcall _PlayerDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret

PlayerLogOffMenu:
	xor a
	scf
	ret

PlayerDepositItemMenu:
	call .CheckItemsInBag
	jr c, .nope
	call DisableSpriteUpdates
	call LoadStandardMenuHeader
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wPackUsedItem]
	and a
	jr z, .close
	call .TryDepositItem
	farcall CheckRegisteredItem
	jr .loop

.close
	call CloseSubmenu

.nope
	xor a
	ret

.CheckItemsInBag:
	farcall HasNoItems
	ret nc
	ld hl, .PlayersPCNoItemsText
	call MenuTextboxBackup
	scf
	ret

.PlayersPCNoItemsText:
	text_far _PlayersPCNoItemsText
	text_end

.TryDepositItem:
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	pop af
	ld [wSpriteUpdatesEnabled], a
	ret

.dw
; entries correspond to ITEMMENU_* constants
	dw .tossable ; ITEMMENU_NOUSE
	dw .no_toss
	dw .no_toss
	dw .no_toss
	dw .tossable ; ITEMMENU_CURRENT
	dw .tossable ; ITEMMENU_PARTY
	dw .tossable ; ITEMMENU_CLOSE

.no_toss
	ret

.tossable
	ld a, [wBuffer1]
	push af
	ld a, [wBuffer2]
	push af
	call .DepositItem
	pop af
	ld [wBuffer2], a
	pop af
	ld [wBuffer1], a
	ret

.DepositItem:
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .AskQuantity
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .ContinueDeposit

.AskQuantity:
	ld hl, .PlayersPCHowManyDepositText
	call MenuTextbox
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .DeclinedToDeposit

.ContinueDeposit:
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumPCItems
	call ReceiveItem
	jr nc, .NoRoomInPC
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .PlayersPCDepositItemsText
	call PrintText
	ret

.NoRoomInPC:
	ld hl, .PlayersPCNoRoomDepositText
	call PrintText
	ret

.DeclinedToDeposit:
	and a
	ret

.PlayersPCHowManyDepositText:
	text_far _PlayersPCHowManyDepositText
	text_end

.PlayersPCDepositItemsText:
	text_far _PlayersPCDepositItemsText
	text_end

.PlayersPCNoRoomDepositText:
	text_far _PlayersPCNoRoomDepositText
	text_end

PlayerMailBoxMenu:
	farcall _PlayerMailBoxMenu
	xor a
	ret

PCItemsJoypad:
	xor a
	ld [wSwitchItem], a
.loop
	ld a, [wSpriteUpdatesEnabled]
	push af
	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	ld hl, .PCItemsMenuData
	call CopyMenuHeader
	hlcoord 0, 0
	ld b, 10
	ld c, 18
	call Textbox
	ld a, [wPCItemsCursor]
	ld [wMenuCursorBuffer], a
	ld a, [wPCItemsScrollPosition]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wPCItemsScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wPCItemsCursor], a
	pop af
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSwitchItem]
	and a
	jr nz, .moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_1
	cp A_BUTTON
	jr z, .a_1
	cp SELECT
	jr z, .select_1
	jr .next

.moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_2
	cp A_BUTTON
	jr z, .a_select_2
	cp SELECT
	jr z, .a_select_2
	jr .next

.b_2
	xor a
	ld [wSwitchItem], a
	jr .next

.a_select_2
	call PC_PlaySwapItemsSound
.select_1
	farcall SwitchItemsInBag
.next
	jp .loop

.a_1
	farcall ScrollingMenu_ClearLeftColumn
	call PlaceHollowCursor
	and a
	ret

.b_1
	scf
	ret

.PCItemsMenuData:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 1, 18, 10
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_ENABLE_SELECT | SCROLLINGMENU_ENABLE_FUNCTION3 | SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 8 ; rows, columns
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dbw 0, wNumPCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

PC_DisplayText:
	call MenuTextbox
	call ExitMenu
	ret

PokecenterPCTurnOnText:
	text_far _PokecenterPCTurnOnText
	text_end

PokecenterPCWhoseText:
	text_far _PokecenterPCWhoseText
	text_end

PokecenterBillsPCText:
	text_far _PokecenterBillsPCText
	text_end

PokecenterPlayersPCText:
	text_far _PokecenterPlayersPCText
	text_end

PokecenterOaksPCText:
	text_far _PokecenterOaksPCText
	text_end

PokecenterPCOaksClosedText:
	text_far _PokecenterPCOaksClosedText
	text_end
