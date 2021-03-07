time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	dbwww \1, \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     15
.Shore_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     KRABBY,     35
	db  90 percent + 1, SHELLDER,   35
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KINGLER,    70
	db  70 percent,     time_group 1
	db  90 percent + 1, CLOYSTER,   70
	db 100 percent,     KINGLER,    70

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  15
.Ocean_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     CHINCHOU,   35
	db  90 percent + 1, TENTACOOL,  35
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     LANTURN,    70
	db  70 percent,     time_group 3
	db  90 percent + 1, TENTACRUEL, 70
	db 100 percent,     LANTURN,    70

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    15
.Lake_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     GOLDEEN,    35
	db  90 percent + 1, GOLDEEN,    35
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     SEAKING,    70
	db  70 percent,     time_group 5
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     SEAKING,    70

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    15
.Pond_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     POLIWHIRL,  35
	db  90 percent + 1, POLIWHIRL,  35
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLIWHIRL,  65
	db  70 percent,     time_group 7
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     POLIWHIRL,  65

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     MAGIKARP,   15
	db  90 percent + 1, MAGIKARP,   15
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     GYARADOS,   70
	db  70 percent,     time_group 9
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     DRAGONAIR,  70

.Qwilfish_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     QWILFISH,   15
.Qwilfish_Swarm_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     QWILFISH,   35
	db  90 percent + 1, QWILFISH,   35
	db 100 percent,     time_group 10
.Qwilfish_Swarm_Super:
	db  40 percent,     QWILFISH,   70
	db  70 percent,     time_group 11
	db  90 percent + 1, QWILFISH,   70
	db 100 percent,     QWILFISH,   70

.Remoraid_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     REMORAID,   15
.Remoraid_Swarm_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     REMORAID,   35
	db  90 percent + 1, REMORAID,   35
	db 100 percent,     time_group 12
.Remoraid_Swarm_Super:
	db  40 percent,     OCTILLERY,  70
	db  70 percent,     time_group 13
	db  90 percent + 1, OCTILLERY,  70
	db 100 percent,     OCTILLERY,  70

.Gyarados_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Gyarados_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     MAGIKARP,   15
	db  90 percent + 1, MAGIKARP,   15
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  40 percent,     GYARADOS,   70
	db  70 percent,     time_group 15
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     GYARADOS,   70

.Dratini_2_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_2_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     MAGIKARP,   15
	db  90 percent + 1, MAGIKARP,   15
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     GYARADOS,   70
	db  70 percent,     time_group 17
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     DRAGONAIR,  70

.WhirlIslands_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     15
.WhirlIslands_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     KRABBY,     35
	db  90 percent + 1, KRABBY,     35
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     KINGLER,    70
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGLER,    70
	db 100 percent,     SEADRA,     70

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  15
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     QWILFISH,   35
	db  90 percent + 1, TENTACOOL,  35
	db 100 percent,     time_group 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	db  40 percent,     TENTACRUEL, 70
	db  70 percent,     time_group 21
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     QWILFISH,   70

.Remoraid_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    15
.Remoraid_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     REMORAID,   35
	db  90 percent + 1, POLIWHIRL,  35
	db 100 percent,     time_group 6
.Remoraid_Super:
	db  40 percent,     POLIWHIRL,  65
	db  70 percent,     time_group 7
	db  90 percent + 1, GYARADOS,   70
	db 100 percent,     OCTILLERY,  70

TimeFishGroups:
	;  day              nite
	db STARYU,     35,  STARYU,     35 ; 0
	db STARMIE,    70,  STARMIE,    70 ; 1
	db SHELLDER,   35,  SHELLDER,   35 ; 2
	db CLOYSTER,   70,  CLOYSTER,   70 ; 3
	db GOLDEEN,    35,  GOLDEEN,    35 ; 4
	db SEAKING,    70,  SEAKING,    70 ; 5
	db POLIWHIRL,  35,  POLIWHIRL,  35 ; 6
	db POLITOED,   70,  POLIWRATH,  70 ; 7
	db DRATINI,    25,  DRATINI,    25 ; 8
	db DRATINI,    65,  DRATINI,    65 ; 9
	db QWILFISH,   35,  QWILFISH,   35 ; 10
	db QWILFISH,   70,  QWILFISH,   70 ; 11
	db REMORAID,   35,  REMORAID,   35 ; 12
	db OCTILLERY,  70,  OCTILLERY,  70 ; 13
	db GYARADOS,   35,  GYARADOS,   35 ; 14
	db GYARADOS,   70,  GYARADOS,   70 ; 15
	db DRATINI,    25,  DRATINI,    25 ; 16
	db DRATINI,    65,  DRATINI,    65 ; 17
	db HORSEA,     35,  HORSEA,     35 ; 18
	db SEADRA,     70,  SEADRA,     70 ; 19
	db TENTACOOL,  35,  TENTACOOL,  35 ; 20
	db TENTACRUEL, 70,  TENTACRUEL, 70 ; 21
