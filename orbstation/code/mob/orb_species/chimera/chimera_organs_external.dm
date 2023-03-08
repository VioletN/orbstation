// SNOUT

/obj/item/organ/external/snout/chimera
	name = "chimera snout"
	preference = "feature_chimera_snout"

	dna_block = DNA_CHIMERA_SNOUT_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/snout/chimera

/datum/bodypart_overlay/mutant/snout/chimera
	feature_key = "chimera_snout"

/datum/bodypart_overlay/mutant/snout/chimera/get_global_feature_list()
	return GLOB.chimera_snouts_list

/datum/bodypart_overlay/mutant/snout/chimera/colour_inner(mutable_appearance/appearance, obj/item/bodypart/limb)
	appearance.color = COLOR_WHITE

// HORNS (and antlers)

/obj/item/organ/external/horns/chimera
	desc = "What kind of creature are these from?"

	preference = "feature_chimera_horns"
	dna_block = DNA_CHIMERA_HORNS_BLOCK

	bodypart_overlay = /datum/bodypart_overlay/mutant/horns/chimera

/datum/bodypart_overlay/mutant/horns/chimera
	feature_key = "chimera_horns"

/datum/bodypart_overlay/mutant/horns/chimera/get_global_feature_list()
	return GLOB.chimera_horns_list

// TAIL

/obj/item/organ/external/tail/chimera
	name = "chimera tail"
	desc = "A severed chimera tail."
	preference = "feature_chimera_tail"
	dna_block = DNA_CHIMERA_TAIL_BLOCK
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/chimera

/datum/bodypart_overlay/mutant/tail/chimera
	feature_key = "chimera_tail"

/datum/bodypart_overlay/mutant/tail/chimera/get_global_feature_list()
	return GLOB.chimera_tails_list

// SPINES - these don't go over the tail

/obj/item/organ/external/chimera_spines
	name = "chimera spines"
	desc = "Not an actual spine, obviously."
	icon_state = "spines"

	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_EXTERNAL_SPINES

	preference = "feature_chimera_spines"

	dna_block = DNA_CHIMERA_SPINES_BLOCK
	restyle_flags = EXTERNAL_RESTYLE_FLESH

	bodypart_overlay = /datum/bodypart_overlay/mutant/chimera_spines

/datum/bodypart_overlay/mutant/chimera_spines
	layers = EXTERNAL_ADJACENT|EXTERNAL_BEHIND
	feature_key = "chimera_spines"

/datum/bodypart_overlay/mutant/chimera_spines/get_global_feature_list()
	return GLOB.chimera_spines_list

/datum/bodypart_overlay/mutant/chimera_spines/can_draw_on_bodypart(mob/living/carbon/human/human)
	. = ..()
	if(human.wear_suit && (human.wear_suit.flags_inv & HIDEJUMPSUIT))
		return FALSE

// WINGS

/obj/item/organ/external/wings/moth/chimera
	name = "chimera wings"

	preference = "feature_chimera_wings"

	dna_block = DNA_CHIMERA_WINGS_BLOCK

	bodypart_overlay = /datum/bodypart_overlay/mutant/wings/moth/chimera

/datum/bodypart_overlay/mutant/wings/moth/chimera
	feature_key = "chimera_wings"

/datum/bodypart_overlay/mutant/wings/moth/chimera/get_global_feature_list()
	return GLOB.chimera_wings_list

// For chimera wings, the burnt icon is stored in the sprite datum for each wing type, allowing for
// different wings to have different burnt icons.
/datum/bodypart_overlay/mutant/wings/moth/chimera/get_base_icon_state()
	return burnt ? sprite_datum.burnt_icon_state : sprite_datum.icon_state
