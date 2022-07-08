// BODYPARTS

/obj/item/bodypart/head/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	limb_id = SPECIES_RAT
	uses_mutcolor = TRUE
	is_dimorphic = FALSE

/obj/item/bodypart/chest/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_RAT
	is_dimorphic = TRUE

/obj/item/bodypart/l_arm/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_RAT

/obj/item/bodypart/r_arm/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_RAT

/obj/item/bodypart/l_leg/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_RAT

/obj/item/bodypart/r_leg/rat
	icon_greyscale = 'orbstation/species/ratfolk/icons.dmi'
	uses_mutcolor = TRUE
	limb_id = SPECIES_RAT

// EXTERNAL ORGANS

// SNOUT

/obj/item/organ/external/snout_rat
	zone = BODY_ZONE_HEAD
	slot = ORGAN_SLOT_EXTERNAL_SNOUT
	layers = EXTERNAL_ADJACENT

	feature_key = "rat_snout"
	preference = "feature_rat_snout"
	external_bodytypes = BODYTYPE_SNOUTED

	color_source = ORGAN_COLOR_OVERRIDE

	dna_block = DNA_RAT_SNOUT_BLOCK

/obj/item/organ/external/snout_rat/can_draw_on_bodypart(mob/living/carbon/human/human)
	if(!(human.wear_mask?.flags_inv & HIDESNOUT) && !(human.head?.flags_inv & HIDESNOUT))
		return TRUE
	return FALSE

/obj/item/organ/external/snout_rat/get_global_feature_list()
	return GLOB.rat_snouts_list

/obj/item/organ/external/snout_rat/override_color(rgb_value)
	if(sprite_datum && sprite_datum.color_src == FACEHAIR && ishuman(owner))
		var/mob/living/carbon/human/H = owner
		return H.facial_hair_color

	return rgb_value

// TAIL

/obj/item/organ/external/tail/rat
	name = "rat tail"
	desc = "A severed rat tail."

	feature_key = "rat_tail"
	preference = "feature_rat_tail"

// INTERNAL ORGANS

#define LIGHTING_PLANE_ALPHA_RAT 220
#define CHEESE_RUSH_TIMER_MAX 30 // number of ticks before cheese rush wears off
#define CHEESE_RUSH_MODIFIER -0.35 // speed modifier while under the effects of cheese rush

// EARS

/obj/item/organ/internal/ears/rat
	name = "rat ears"
	icon = 'orbstation/species/ratfolk/icons.dmi'
	icon_state = "detached_ears"
	visual = TRUE
	damage_multiplier = 2
	var/ears_pref = "Round"

/obj/item/organ/internal/ears/rat/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		ear_owner.dna.features["rat_ears"] = ear_owner.dna.species.mutant_bodyparts["rat_ears"] = ears_pref
		ear_owner.dna.update_uf_block(DNA_RAT_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/rat/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		ear_owner.dna.species.mutant_bodyparts -= "rat_ears"
		ear_owner.update_body()

// EYES - better darkvision, sensitive to flash, lower health

/obj/item/organ/internal/eyes/rat
	maxHealth = 0.35 * STANDARD_ORGAN_THRESHOLD // more fragile than normal eyes
	flash_protect = FLASH_PROTECTION_SENSITIVE
	lighting_alpha = LIGHTING_PLANE_ALPHA_RAT
	see_in_dark = NIGHTVISION_FOV_RANGE

// STOMACH - increases movespeed temporarily when you consume cheese reagent (found in raw cheese)

/obj/item/organ/internal/stomach/rat
	var/cheese_rush_timer = 0

/obj/item/organ/internal/stomach/rat/on_life(delta_time, times_fired)
	var/datum/reagent/consumable/cheese/cheese = locate(/datum/reagent/consumable/cheese) in owner.reagents.reagent_list
	if(cheese) // if there is cheese reagent in the stomach
		if(!cheese_rush_timer) // and the cheese rush timer is inactive
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.physiology.hunger_mod /= 0.8 // hunger increases faster in cheese rush mod
			to_chat(owner, span_notice("The cheese gives you a sudden burst of energy!"))
		cheese_rush_timer = CHEESE_RUSH_TIMER_MAX // cheese reagent resets cheese rush timer to max
		owner.add_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	else if(cheese_rush_timer) // no cheese reagent, but cheese rush timer is active
		cheese_rush_timer -= 1 // decrease the timer
		if(!cheese_rush_timer) // the timer is at 0!
			owner.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush) // get rid of speed boost
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.physiology.hunger_mod *= 0.8 // hunger returns to normal
			to_chat(owner, span_warning("You feel the effects of your cheese rush wear off."))
	return ..()

/obj/item/organ/internal/stomach/rat/Remove(mob/living/carbon/carbon, special = 0)
	if(cheese_rush_timer)
		to_chat(owner, span_warning("You feel the effects of your cheese rush wear off."))
		cheese_rush_timer = 0
		carbon.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	return ..()

/datum/movespeed_modifier/cheese_rush
	multiplicative_slowdown = CHEESE_RUSH_MODIFIER

#undef LIGHTING_PLANE_ALPHA_RAT
#undef CHEESE_RUSH_TIMER_MAX
#undef CHEESE_RUSH_MODIFIER
