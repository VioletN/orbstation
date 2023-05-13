// SNOUTS (and beaks)

/datum/sprite_accessory/chimera_snouts
	icon = 'orbstation/icons/mob/species/chimera/snouts.dmi'
	em_block = TRUE
	color_src = SNOUTCOLOR

/datum/sprite_accessory/chimera_snouts/reptile_sharp
	name = "Reptile - Sharp"
	icon_state = "reptile_sharp"

/datum/sprite_accessory/chimera_snouts/reptile_round
	name = "Reptile - Round"
	icon_state = "reptile_round"

/datum/sprite_accessory/chimera_snouts/rodent_round
	name = "Rodent - Round"
	icon_state = "rodent_round"
	hasinner = TRUE

/datum/sprite_accessory/chimera_snouts/rodent_sharp
	name = "Rodent - Sharp"
	icon_state = "rodent_sharp"
	hasinner = TRUE

/datum/sprite_accessory/chimera_snouts/possum
	name = "Possum (white)"
	icon_state = "possum"
	hasinner = TRUE
	color_src = NONE

// HORNS (and antlers)

/datum/sprite_accessory/chimera_horns
	icon = 'orbstation/icons/mob/species/chimera/horns.dmi'
	em_block = TRUE
	color_src = HORNCOLOR

/datum/sprite_accessory/chimera_horns/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/chimera_horns/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/chimera_horns/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/chimera_horns/ram
	name = "Ram"
	icon_state = "ram"

/datum/sprite_accessory/chimera_horns/angler
	name = "Angler"
	icon_state = "angler"

// TAILS

/datum/sprite_accessory/tails/chimera
	icon = 'orbstation/icons/mob/species/chimera/tails.dmi'
	color_src = TAILCOLOR

/datum/sprite_accessory/tails/chimera/feline_standard
	name = "Feline - Standard"
	icon_state = "feline_standard"

/datum/sprite_accessory/tails/chimera/feline_short
	name = "Feline - Short"
	icon_state = "feline_short"

/datum/sprite_accessory/tails/chimera/feline_fluffy
	name = "Feline - Fluffy"
	icon_state = "feline_fluffy"

/datum/sprite_accessory/tails/chimera/reptile_smooth
	name = "Reptile - Smooth"
	icon_state = "reptile_smooth"

/datum/sprite_accessory/tails/chimera/reptile_dtiger
	name = "Reptile - Dark Tiger"
	icon_state = "reptile_dtiger"

/datum/sprite_accessory/tails/chimera/reptile_ltiger
	name = "Reptile - Light Tiger"
	icon_state = "reptile_ltiger"

/datum/sprite_accessory/tails/chimera/reptile_spikes
	name = "Reptile - Spikes"
	icon_state = "reptile_spikes"

/datum/sprite_accessory/tails/chimera/rodent_high
	name = "Rodent - High"
	icon_state = "rodent_high"
	color_src = null

/datum/sprite_accessory/tails/chimera/rodent_low
	name = "Rodent - Low"
	icon_state = "rodent_low"
	color_src = null

// EARS

/datum/sprite_accessory/chimera_ears
	icon = 'orbstation/icons/mob/species/chimera/ears.dmi'
	em_block = TRUE
	color_src = EARCOLOR

/datum/sprite_accessory/chimera_ears/feline_standard
	name = "Feline - Standard"
	icon_state = "feline_standard"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/feline_big
	name = "Feline - Big"
	icon_state = "feline_big"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/feline_miqo
	name = "Feline - Coeurl"
	icon_state = "feline_miqo"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/feline_fold
	name = "Feline - Fold"
	icon_state = "feline_fold"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/feline_lynx
	name = "Feline - Lynx"
	icon_state = "feline_lynx"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/feline_round
	name = "Feline - Round"
	icon_state = "feline_round"
	hasinner = TRUE

/datum/sprite_accessory/chimera_ears/fox_standard
	name = "Fox - Standard"
	icon_state = "fox_standard"
	hasinner = TRUE

// BODY MARKINGS

/datum/sprite_accessory/chimera_body_markings
	icon = 'orbstation/icons/mob/species/chimera/body_markings.dmi'
	color_src = MUTCOLORS_ALT

/datum/sprite_accessory/chimera_body_markings/dtiger
	name = "Reptile - Dark Tiger Body"
	icon_state = "dtiger"
	gender_specific = 1

/datum/sprite_accessory/chimera_body_markings/ltiger
	name = "Reptile - Light Tiger Body"
	icon_state = "ltiger"
	gender_specific = 1

/datum/sprite_accessory/chimera_body_markings/lbelly
	name = "Reptile - Light Belly"
	icon_state = "lbelly"
	gender_specific = 1

// SPINES

/datum/sprite_accessory/chimera_spines
	icon = 'orbstation/icons/mob/species/chimera/spines.dmi'
	em_block = TRUE
	color_src = MUTCOLORS

/datum/sprite_accessory/chimera_spines/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/chimera_spines/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/chimera_spines/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/chimera_spines/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/chimera_spines/aqautic
	name = "Aquatic"
	icon_state = "aqua"

// WINGS

/datum/sprite_accessory/chimera_wings
	icon = 'orbstation/icons/mob/species/chimera/wings.dmi'
	color_src = null
	em_block = TRUE
	/// The icon used by the wings once they're burnt off.
	var/burnt_icon_state = "burnt_off" // using the moth ones as the default because there's so many

/datum/sprite_accessory/chimera_wings/burnt_off
	name = "Moth - Burnt Off"
	icon_state = "burnt_off"
	locked = TRUE

/datum/sprite_accessory/chimera_wings/plain
	name = "Moth - Plain"
	icon_state = "plain"

/datum/sprite_accessory/chimera_wings/monarch
	name = "Moth - Monarch"
	icon_state = "monarch"

/datum/sprite_accessory/chimera_wings/luna
	name = "Moth - Luna"
	icon_state = "luna"

/datum/sprite_accessory/chimera_wings/atlas
	name = "Moth - Atlas"
	icon_state = "atlas"

/datum/sprite_accessory/chimera_wings/reddish
	name = "Moth - Reddish"
	icon_state = "redish"

/datum/sprite_accessory/chimera_wings/royal
	name = "Moth - Royal"
	icon_state = "royal"

/datum/sprite_accessory/chimera_wings/gothic
	name = "Moth - Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/chimera_wings/lovers
	name = "Moth - Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/chimera_wings/whitefly
	name = "Moth - White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/chimera_wings/firewatch
	name = "Moth - Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/chimera_wings/deathhead
	name = "Moth - Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/chimera_wings/poison
	name = "Moth - Poison"
	icon_state = "poison"

/datum/sprite_accessory/chimera_wings/ragged
	name = "Moth - Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/chimera_wings/moonfly
	name = "Moth - Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/chimera_wings/snow
	name = "Moth - Snow"
	icon_state = "snow"

/datum/sprite_accessory/chimera_wings/oakworm
	name = "Moth - Oak Worm"
	icon_state = "oakworm"

/datum/sprite_accessory/chimera_wings/jungle
	name = "Moth - Jungle"
	icon_state = "jungle"

/datum/sprite_accessory/chimera_wings/witchwing
	name = "Moth - Witch Wing"
	icon_state = "witchwing"

/datum/sprite_accessory/chimera_wings/rosy
	name = "Moth - Rosy"
	icon_state = "rosy"

/datum/sprite_accessory/chimera_wings/feathery
	name = "Moth - Feathery"
	icon_state = "feathery"

/datum/sprite_accessory/chimera_wings/brown
	name = "Moth - Brown"
	icon_state = "brown"

/datum/sprite_accessory/chimera_wings/plasmafire
	name = "Moth - Plasmafire"
	icon_state = "plasmafire"

/datum/sprite_accessory/chimera_wings/moffra
	name = "Moth - Moffra"
	icon_state = "moffra"

/datum/sprite_accessory/chimera_wings/tarantulahawk
	name = "Tarantula Hawk"
	icon_state = "tarantula"

/datum/sprite_accessory/chimera_wings/bee
	name = "Bee"
	icon_state = "bee"

/datum/sprite_accessory/chimera_wings/wasp
	name = "Wasp"
	icon_state = "wasp"

/datum/sprite_accessory/chimera_wings/clearwing
	name = "Clearwing"
	icon_state = "clearwing"
