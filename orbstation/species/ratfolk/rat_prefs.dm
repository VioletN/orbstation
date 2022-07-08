// SNOUT

/datum/preference/choiced/rat_snout
	savefile_key = "feature_rat_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout"
	should_generate_icons = TRUE

/datum/preference/choiced/rat_snout/init_possible_values()
	return generate_rat_side_shots(GLOB.rat_snouts_list, "rat_snout", include_snout = FALSE)

/datum/preference/choiced/rat_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["rat_snout"] = value

/proc/generate_rat_side_shots(list/sprite_accessories, key, include_snout = TRUE)
	var/list/values = list()

	var/icon/rat = icon('orbstation/species/ratfolk/icons.dmi', "rat_head", EAST)
	var/icon/eyes = icon('icons/mob/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	rat.Blend(eyes, ICON_OVERLAY)

	if (include_snout)
		rat.Blend(icon('orbstation/species/ratfolk/icons.dmi', "m_rat_snout_round_ADJ", EAST), ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(rat)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_DARK_BROWN, ICON_MULTIPLY)

		values[name] = final_icon

	return values

// TAIL

/datum/preference/choiced/rat_tail
	savefile_key = "feature_rat_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/rat

/datum/preference/choiced/rat_tail/init_possible_values()
	return assoc_to_keys(GLOB.rat_tails_list)

/datum/preference/choiced/rat_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["rat_tail"] = value

/datum/preference/choiced/rat_tail/create_default_value()
	var/datum/sprite_accessory/tails/rat/smooth/tail = /datum/sprite_accessory/tails/rat/smooth
	return initial(tail.name)

// EARS

/datum/preference/choiced/rat_ears
	savefile_key = "feature_rat_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "rat_ears"

/datum/preference/choiced/rat_ears/init_possible_values()
	var/list/values = list()

	var/icon/rat_head = icon('orbstation/species/ratfolk/icons.dmi', "rat_head")
	rat_head.Blend(icon('icons/mob/human_face.dmi', "eyes"), ICON_OVERLAY)

	for (var/ears_name in GLOB.rat_ears_list)
		var/datum/sprite_accessory/rat_ears = GLOB.rat_ears_list[ears_name]

		var/icon/icon_with_ears = new(rat_head)
		icon_with_ears.Blend(icon(rat_ears.icon, "m_rat_ears_[rat_ears.icon_state]_FRONT"), ICON_OVERLAY)
		icon_with_ears.Scale(64, 64)
		icon_with_ears.Crop(15, 64, 15 + 31, 64 - 31)

		values[rat_ears.name] = icon_with_ears

	return values

/datum/preference/choiced/rat_ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["rat_ears"] = value

/datum/preference/choiced/rat_ears/create_default_value()
	var/datum/sprite_accessory/rat_ears/round/ears = /datum/sprite_accessory/rat_ears/round
	return initial(ears.name)
