/datum/preference/toggle/human_body_override
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "human_body_override"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	can_randomize = FALSE
	relevant_species_trait = CAN_TOGGLE_HUMAN_BODY

/datum/preference/color/chimera_colors/create_default_value()
	return FALSE

/datum/preference/toggle/human_body_override/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["human_body_override"] = value
	target.dna.species.use_skintones = value

// COLORS

/datum/preference/color/chimera_colors
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/color/chimera_colors/create_default_value()
	return sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]")

/datum/preference/color/chimera_colors/is_valid(value)
	if (!..(value))
		return FALSE

	if (is_color_dark(value))
		return FALSE

	return TRUE

// SECONDARY MUTANT COLOR

/datum/preference/color/chimera_colors/secondary_mutant_color
	savefile_key = "feature_mcolor_alt"
	relevant_species_trait = MUTCOLORS_ALT

/datum/preference/color/chimera_colors/secondary_mutant_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["mcolor_alt"] = value

// EAR COLOR

/datum/preference/color/chimera_colors/ear_color
	savefile_key = "feature_ear_color"
	relevant_species_trait = EARCOLOR

/datum/preference/color/chimera_colors/ear_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["ear_color"] = value

// SNOUT COLOR

/datum/preference/color/chimera_colors/snout_color
	savefile_key = "feature_snout_color"
	relevant_species_trait = SNOUTCOLOR

/datum/preference/color/chimera_colors/snout_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["snout_color"] = value

// TAIL COLOR

/datum/preference/color/chimera_colors/tail_color
	savefile_key = "feature_tail_color"
	relevant_species_trait = TAILCOLOR

/datum/preference/color/chimera_colors/tail_color/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_color"] = value

// SNOUT

/datum/preference/choiced/chimera_snout
	savefile_key = "feature_chimera_snout"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Snout/Beak"
	should_generate_icons = TRUE
	can_randomize = FALSE

/datum/preference/choiced/chimera_snout/init_possible_values()
	return generate_chimera_side_shots(GLOB.chimera_snouts_list, "chimera_snout")

/datum/preference/choiced/chimera_snout/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_snout"] = value

/proc/generate_chimera_side_shots(list/sprite_accessories, key)
	var/list/values = list()

	var/icon/chimera_head = icon('orbstation/icons/mob/species/chimera/bodyparts.dmi', "chimera_head", EAST)
	var/icon/eyes = icon('icons/mob/species/human/human_face.dmi', "eyes", EAST)
	eyes.Blend(COLOR_GRAY, ICON_MULTIPLY)
	chimera_head.Blend(eyes, ICON_OVERLAY)

	for (var/name in sprite_accessories)
		var/datum/sprite_accessory/sprite_accessory = sprite_accessories[name]

		var/icon/final_icon = icon(chimera_head)

		if (sprite_accessory.icon_state != "none")
			var/icon/accessory_icon = icon(sprite_accessory.icon, "m_[key]_[sprite_accessory.icon_state]_ADJ", EAST)
			final_icon.Blend(accessory_icon, ICON_OVERLAY)

		final_icon.Crop(11, 20, 23, 32)
		final_icon.Scale(32, 32)
		final_icon.Blend(COLOR_GRAY, ICON_MULTIPLY)

		values[name] = final_icon

	return values

/datum/preference/choiced/chimera_snout/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "snout_color"

	return data

// HORNS

/datum/preference/choiced/chimera_horns
	savefile_key = "feature_chimera_horns"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Horns/Antlers"
	should_generate_icons = TRUE
	can_randomize = FALSE

/datum/preference/choiced/chimera_horns/init_possible_values()
	return generate_chimera_side_shots(GLOB.chimera_horns_list, "chimera_horns")

/datum/preference/choiced/chimera_horns/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_horns"] = value

// TAILS

/datum/preference/choiced/chimera_tail
	savefile_key = "feature_chimera_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_external_organ = /obj/item/organ/external/tail/chimera
	can_randomize = FALSE

/datum/preference/choiced/chimera_tail/init_possible_values()
	return assoc_to_keys_features(GLOB.chimera_tails_list)

/datum/preference/choiced/chimera_tail/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_tail"] = value

/datum/preference/choiced/chimera_tail/create_default_value()
	var/datum/sprite_accessory/tails/chimera/none/tail = /datum/sprite_accessory/tails/chimera/none
	return initial(tail.name)

/datum/preference/choiced/chimera_tail/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "tail_color"

	return data

// WINGS

/datum/preference/choiced/chimera_wings
	savefile_key = "feature_chimera_wings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Wings"
	should_generate_icons = TRUE
	can_randomize = FALSE

/datum/preference/choiced/chimera_wings/init_possible_values()
	return possible_values_for_sprite_accessory_list_for_body_part(
		GLOB.chimera_wings_list,
		"chimera_wings",
		list("BEHIND", "FRONT"),
	)

/datum/preference/choiced/chimera_wings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_wings"] = value

// EARS

/datum/preference/choiced/chimera_ears
	savefile_key = "feature_chimera_ears"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Ears"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "chimera_ears"
	can_randomize = FALSE

/datum/preference/choiced/chimera_ears/init_possible_values()
	var/list/values = list()

	var/icon/chimera_head = icon('orbstation/icons/mob/species/chimera/bodyparts.dmi', "chimera_head")
	chimera_head.Blend(icon('icons/mob/species/human/human_face.dmi', "eyes"), ICON_OVERLAY)

	for (var/ears_name in GLOB.chimera_ears_list)
		var/datum/sprite_accessory/chimera_ears = GLOB.chimera_ears_list[ears_name]

		var/icon/icon_with_ears = new(chimera_head)
		icon_with_ears.Blend(icon(chimera_ears.icon, "m_chimera_ears_[chimera_ears.icon_state]_FRONT"), ICON_OVERLAY)
		icon_with_ears.Scale(64, 64)
		icon_with_ears.Crop(15, 64, 15 + 31, 64 - 31)

		values[chimera_ears.name] = icon_with_ears

	return values

/datum/preference/choiced/chimera_ears/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_ears"] = value

/datum/preference/choiced/chimera_ears/create_default_value()
	var/datum/sprite_accessory/chimera_ears/none/ears = /datum/sprite_accessory/chimera_ears/none
	return initial(ears.name)

/datum/preference/choiced/chimera_ears/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "ear_color"

	return data

// BODY MARKINGS

/datum/preference/choiced/chimera_body_markings
	savefile_key = "feature_chimera_body_markings"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Body markings"
	should_generate_icons = TRUE
	relevant_mutant_bodypart = "chimera_body_markings"
	can_randomize = FALSE

/datum/preference/choiced/chimera_body_markings/init_possible_values()
	var/list/values = list()

	var/icon/chimera_chest = icon('orbstation/icons/mob/species/chimera/bodyparts.dmi', "chimera_chest_m")

	for (var/name in GLOB.body_markings_list)
		var/datum/sprite_accessory/sprite_accessory = GLOB.body_markings_list[name]

		var/icon/final_icon = icon(chimera_chest)

		if (sprite_accessory.icon_state != "none")
			var/icon/body_markings_icon = icon(
				'orbstation/icons/mob/species/chimera/body_markings.dmi',
				"m_chimera_body_markings_[sprite_accessory.icon_state]_ADJ",
			)

			final_icon.Blend(body_markings_icon, ICON_OVERLAY)

		final_icon.Blend(COLOR_GRAY, ICON_MULTIPLY)
		final_icon.Crop(10, 8, 22, 23)
		final_icon.Scale(26, 32)
		final_icon.Crop(-2, 1, 29, 32)

		values[name] = final_icon

	return values

/datum/preference/choiced/chimera_body_markings/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_body_markings"] = value

/datum/preference/choiced/chimera_body_markings/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "mcolor_alt"

	return data

// SPINES

/datum/preference/choiced/chimera_spines
	savefile_key = "feature_chimera_spines"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_mutant_bodypart = "chimera_spines"

/datum/preference/choiced/chimera_spines/init_possible_values()
	return assoc_to_keys_features(GLOB.chimera_spines_list)

/datum/preference/choiced/chimera_spines/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["chimera_spines"] = value
