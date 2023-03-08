// EARS

/obj/item/organ/internal/ears/chimera
	name = "chimera ears"
	icon = 'icons/obj/clothing/head/costume.dmi'
	worn_icon = 'icons/mob/clothing/head/costume.dmi'
	icon_state = "kitty"
	visual = TRUE
	var/ears_pref = null

/obj/item/organ/internal/ears/chimera/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		if(ears_pref) // copy the ear shape from the old owner of the ears if there was one
			ear_owner.dna.features["chimera_ears"] = ear_owner.dna.species.mutant_bodyparts["chimera_ears"] = ears_pref
		else if(ear_owner.dna.features["chimera_ears"]) // otherwise use their preference if there is one
			ear_owner.dna.species.mutant_bodyparts["chimera_ears"] = ear_owner.dna.features["chimera_ears"]
		else // otherwise default to none
			ear_owner.dna.features["chimera_ears"] = ear_owner.dna.species.mutant_bodyparts["chimera_ears"] = "None"
		ear_owner.dna.update_uf_block(DNA_CHIMERA_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/chimera/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		ears_pref = ear_owner.dna.features["chimera_ears"]
		ear_owner.dna.species.mutant_bodyparts -= "chimera_ears"
		ear_owner.update_body()
