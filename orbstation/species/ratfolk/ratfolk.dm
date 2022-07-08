/datum/species/rat
	name = "\improper Ratkin"
	plural_form = "Ratfolk"
	id = SPECIES_RAT
	say_mod = "squeaks"
	species_traits = list(EYECOLOR, HAIR, HAS_BONE, HAS_FLESH, LIPS, MUTCOLORS, TRAIT_RAT_BUILD)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/rat

	//meat = /obj/item/food/meat/slab/human/mutant/rat
	//skinned_type = /obj/item/stack/sheet/animalhide/rat

	attack_verb = "slash"
	attack_effect = ATTACK_EFFECT_CLAW
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	liked_food = FRUIT | NUTS | DAIRY
	disliked_food = CLOTH | BUGS

	siemens_coeff = 0.75 // slightly resistant to shocks, but not as much as Ethereals
	brutemod = 1.3 // more vulnerable to brute damage than humans

	external_organs = list(
		/obj/item/organ/external/snout_rat = "Round",
		/obj/item/organ/external/tail/rat = "Smooth",
	)
	mutant_bodyparts = list("rat_ears" = "Round")
	mutanteyes = /obj/item/organ/internal/eyes/rat
	mutantstomach = /obj/item/organ/internal/stomach/rat
	mutantears = /obj/item/organ/internal/ears/rat

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/rat,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/rat,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/rat,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/rat,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/rat,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/rat,
	)

/datum/species/rat/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		var/obj/item/organ/internal/ears/rat/ears = new
		ears.ears_pref = H.dna.features["rat_ears"]
		ears.Insert(H, drop_if_replaced = FALSE)
	return ..()

/datum/species/rat/prepare_human_for_preview(mob/living/carbon/human/human)
	human.dna.features["mcolor"] = COLOR_DARK_BROWN

/datum/species/rat/get_species_description()
	return "The crafty, darkness-loving Ratfolk hail from vast underground cities beneath the frozen, \
	snow-swept surface of Engira. Their knack for construction and repair makes them ideal engineers, \
	and they are adept at quickly navigating through tight corridors and passageways."

/datum/species/rat/get_species_lore()
	return list(
		"Rats, rats, we're the rats",

		"We stalk at night, we prey at night",

		"We're the rats!",
	)

/datum/species/rat/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "eye",
			SPECIES_PERK_NAME = "Darkvision",
			SPECIES_PERK_DESC = "Centuries of living underground have given Ratfolk superior vision in the dark.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "cheese",
			SPECIES_PERK_NAME = "Cheese Rush",
			SPECIES_PERK_DESC = "The taste of raw cheese gives Ratfolk a temporary burst of speed. However, this also drains their hunger faster.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "wrench",
			SPECIES_PERK_NAME = "Quick Builder",
			SPECIES_PERK_DESC = "Ratfolk have nimble hands which allow them to build things from sheets of materials faster.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "lightbulb",
			SPECIES_PERK_NAME = "Photosensitive",
			SPECIES_PERK_DESC = "Ratfolk eyes are sensitive to flashes, and will go blind faster as a result of eye damage.",
		),
	)

	return to_add
