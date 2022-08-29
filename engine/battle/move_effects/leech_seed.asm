BattleCommand_LeechSeed:
; leechseed
	call CheckSubstituteOpp
	jr nz, .evaded
	ld a, [wAttackMissed]
	and a
	jr nz, .missed

	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok

	ld a, [de]
	cp GRASS
	jr z, .grass
	inc de
	ld a, [de]
	cp GRASS
	jr z, .grass

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .alreadyseeded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
	jp StdBattleTextbox

.grass
	call AnimateFailedMove
	jp PrintDoesntAffect

.evaded
	call AnimateFailedMove
	ld hl, DidntAffect1Text
	jp StdBattleTextbox
	
.missed
	call AnimateFailedMove
	ld hl, AttackMissedText
	jp StdBattleTextbox
	
.alreadyseeded
	call AnimateFailedMove
	ld hl, AlreadySeededText
	jp StdBattleTextbox
