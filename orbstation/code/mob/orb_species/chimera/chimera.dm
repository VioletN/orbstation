/datum/species/chimera
	name = "\improper Chimera"
	plural_form = "Chimeras"
	id = SPECIES_CHIMERA
	species_traits = list(
		EYECOLOR,
		HAIR,
		FACEHAIR,
		LIPS,
		MUTCOLORS,
		MUTCOLORS_ALT,
		TAILCOLOR,
		CAN_TOGGLE_HUMAN_BODY,
	)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_LITERATE,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/chimera

	// Chimeras are neutral towards basically all food due to how variable they are...
	// It'd be cool if you could select likes/dislikes but that'd probably be overcomplicating things.
	disliked_food = CLOTH

	external_organs = list(
		/obj/item/organ/external/snout/chimera = "None", // also beaks
		/obj/item/organ/external/horns/chimera = "None", // also antlers
		/obj/item/organ/external/tail/chimera = "None",
		/obj/item/organ/external/chimera_spines = "None",
		/obj/item/organ/external/wings/moth/chimera = "None",
		/obj/item/organ/external/frills = "None", // accessories shared with lizardpeople
		/obj/item/organ/external/antennae = "None" // accessories shared with mothpeople
	)
	mutant_bodyparts = list("chimera_ears" = "None", "chimera_body_markings" = "None")
	mutantears = /obj/item/organ/internal/ears/chimera

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/chimera,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/chimera,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/chimera,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/chimera,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/chimera,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/chimera,
	)

/datum/species/chimera/get_species_description()
	return "Chimeras are not necessarily one distinct species in themselves, but rather a category \
	of humanoids who have gained animal parts through various means, such as genetic modification, \
	surgical splicing, magic, or ancestry. They are highly diverse in appearance but do not have any \
	standout qualities."

/datum/species/chimera/get_species_lore()
	return list(
		"People from all parts of the galaxy have always held a certain level of fascination for \
		animals, envying their myriad of physical features, at times even identifying with them on a \
		mental or spiritual level. It is only natural, then, that with the advance of science, as soon as \
		the possibility of hybridization presented itself, many would leap at the chance to modify their \
		bodies to take on a more animalistic appearance. Chimeras are the result of this trend. Although \
		at first there were groups of body purists who rejected this type of modification, by the present \
		day chimeras have become so common that in some places they even outnumber other species; they \
		are simply a fact of life.",

		"Chimeras vary greatly in appearance, with some looking very similar to humans, while others are \
		much more obviously nonhuman. Because of this huge amount of variation, there are also tons of \
		different cultures which have arisen in chimera societies. They do not have any specific homeworld, \
		but there are settlements which have been formed by and primarily for chimeras. Not every chimera \
		intentionally decided to become one; some are merely the descendants of people who did.",
		)

/mob/living/carbon/human/species/chimera
	race = /datum/species/chimera

/datum/language_holder/chimera
	understood_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
								/datum/language/uncommon = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/common = list(LANGUAGE_ATOM),
							/datum/language/uncommon = list(LANGUAGE_ATOM))
