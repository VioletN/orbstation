#define CHEESY_LOW 3
#define CHEESY_MID 5
#define CHEESY_HIGH 10

// Cheese reagent - exists to make the cheese rush ability of the ratfolk stomach organ work

/datum/reagent/consumable/cheese
	name = "Cheese Sauce"
	description = "Rats can't get enough of the stuff!"
	color = "#FFC814" // rgb: 225, 200, 20
	taste_description = "cheese"
	glass_icon_state = "glass_yellow"
	glass_name = "glass of cheese sauce"
	glass_desc = "Rats can't get enough of the stuff!"
	ph = 6.7 // the same as milk
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/obj/item/food/cheese
	///Amount of cheese reagent that will be added to a person after eating the food.
	var/cheesiness = CHEESY_LOW

/obj/item/food/cheese/MakeEdible()
	..()
	if(cheesiness)
		var/datum/component/edible/e = GetComponent(/datum/component/edible)
		if(e)
			if(!e.after_eat) // we want to allow this to be overridden if necessary
				e.after_eat = CALLBACK(src, .proc/add_cheese)

///Adds the cheese reagent to cheese based on its cheesiness value.
/obj/item/food/cheese/proc/add_cheese(mob/living/eater)
	if(ishuman(eater))
		var/mob/living/carbon/human/h = eater
		h.reagents.add_reagent(/datum/reagent/consumable/cheese, cheesiness)

/obj/item/food/cheese/wheel
	cheesiness = CHEESY_MID

/obj/item/food/cheese/royal
	cheesiness = CHEESY_HIGH

#undef CHEESY_LOW
#undef CHEESY_MID
#undef CHEESY_HIGH
