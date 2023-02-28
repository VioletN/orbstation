#define SCANGATE_NONE "Off"
#define SCANGATE_MINDSHIELD "Mindshield"
#define SCANGATE_DISEASE "Disease"
#define SCANGATE_GUNS "Guns"
#define SCANGATE_WANTED "Wanted"
#define SCANGATE_ZOMBIE "Zombie"


/obj/machinery/scanner_gate
	name = "scanner gate"
	desc = "A gate able to perform mid-depth scans on any organisms who pass under it."
	icon = 'icons/obj/machines/scangate.dmi'
	icon_state = "scangate"
	circuit = /obj/item/circuitboard/machine/scanner_gate

	var/scanline_timer
	///Internal timer to prevent audio spam.
	var/next_beep = 0
	///Bool to check if the scanner's controls are locked by an ID.
	var/locked = FALSE
	///Which setting is the scanner checking for? See defines in scan_gate.dm for the list.
	var/scangate_mode = SCANGATE_NONE
	///Is searching for a disease, what severity is enough to trigger the gate?
	var/disease_threshold = DISEASE_SEVERITY_MINOR
	///Flips all scan results for inverse scanning. Signals if scan returns false.
	var/reverse = FALSE
	///Will the assembly on the pass wire activate if the scanner resolves green (Pass) on crossing?
	var/light_pass = FALSE
	///Will the assembly on the pass wire activate if the scanner resolves red (fail) on crossing?
	var/light_fail = FALSE
	///Does the scanner ignore light_pass and light_fail for sending signals?
	var/ignore_signals = FALSE


/obj/machinery/scanner_gate/Initialize(mapload)
	. = ..()
	wires = new /datum/wires/scanner_gate(src)
	set_scanline("passive")
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)

/obj/machinery/scanner_gate/Destroy()
	qdel(wires)
	wires = null
	. = ..()

/obj/machinery/scanner_gate/examine(mob/user)
	. = ..()
	if(locked)
		. += span_notice("The control panel is ID-locked. Swipe a valid ID to unlock it.")
	else
		. += span_notice("The control panel is unlocked. Swipe an ID to lock it.")

/obj/machinery/scanner_gate/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, PROC_REF(auto_scan), AM)

/obj/machinery/scanner_gate/proc/auto_scan(atom/movable/AM)
	if(!(machine_stat & (BROKEN|NOPOWER)) && isliving(AM) & (!panel_open))
		perform_scan(AM)

/obj/machinery/scanner_gate/proc/set_scanline(type, duration)
	cut_overlays()
	deltimer(scanline_timer)
	add_overlay(type)
	if(duration)
		scanline_timer = addtimer(CALLBACK(src, PROC_REF(set_scanline), "passive"), duration, TIMER_STOPPABLE)

/obj/machinery/scanner_gate/attackby(obj/item/W, mob/user, params)
	var/obj/item/card/id/card = W.GetID()
	if(card)
		if(locked)
			if(allowed(user))
				locked = FALSE
				req_access = list()
				to_chat(user, span_notice("You unlock [src]."))
		else if(!(obj_flags & EMAGGED))
			to_chat(user, span_notice("You lock [src] with [W]."))
			var/list/access = W.GetAccess()
			req_access = access
			locked = TRUE
		else
			to_chat(user, span_warning("You try to lock [src] with [W], but nothing happens."))
	else
		if(!locked && default_deconstruction_screwdriver(user, "[initial(icon_state)]_open", initial(icon_state), W))
			return
		if(panel_open && is_wire_tool(W))
			wires.interact(user)
	return ..()

/obj/machinery/scanner_gate/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	locked = FALSE
	req_access = list()
	obj_flags |= EMAGGED
	to_chat(user, span_notice("You fry the ID checking system."))

/obj/machinery/scanner_gate/proc/perform_scan(mob/living/M)
	var/beep = FALSE
	var/color = null
	switch(scangate_mode)
		if(SCANGATE_NONE)
			return
		if(SCANGATE_WANTED)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				var/perpname = H.get_face_name(H.get_id_name())
				var/datum/record/crew/target = find_record(perpname)
				if(!target || (target.wanted_status == WANTED_ARREST))
					beep = TRUE
		if(SCANGATE_MINDSHIELD)
			if(HAS_TRAIT(M, TRAIT_MINDSHIELD))
				beep = TRUE
		if(SCANGATE_DISEASE)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(get_disease_severity_value(C.check_virus()) >= get_disease_severity_value(disease_threshold))
					beep = TRUE
		if(SCANGATE_ZOMBIE)
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				if(is_species(H, /datum/species/zombie) || H.getorganslot(ORGAN_SLOT_ZOMBIE)) //Can detect dormant zombies
					beep = TRUE
		if(SCANGATE_GUNS)
			for(var/I in M.get_contents())
				if(isgun(I))
					beep = TRUE
					break

	if(reverse)
		beep = !beep
	if(beep)
		alarm_beep()
		SEND_SIGNAL(src, COMSIG_SCANGATE_PASS_TRIGGER, M)
		if(!ignore_signals)
			color = wires.get_color_of_wire(WIRE_ACCEPT)
			var/obj/item/assembly/assembly = wires.get_attached(color)
			assembly?.activate()
	else
		SEND_SIGNAL(src, COMSIG_SCANGATE_PASS_NO_TRIGGER, M)
		if(!ignore_signals)
			color = wires.get_color_of_wire(WIRE_DENY)
			var/obj/item/assembly/assembly = wires.get_attached(color)
			assembly?.activate()
		set_scanline("scanning", 10)

	use_power(active_power_usage)

/obj/machinery/scanner_gate/proc/alarm_beep()
	if(next_beep <= world.time)
		next_beep = world.time + (2 SECONDS)
		playsound(src, 'sound/machines/scanbuzz.ogg', 100, FALSE)
	var/image/alarm_image = image(icon, src, "alarm_light", layer+1)
	flick_overlay_view(alarm_image, 2 SECONDS)
	set_scanline("alarm", 2 SECONDS)

/obj/machinery/scanner_gate/can_interact(mob/user)
	if(locked)
		return FALSE
	return ..()

/obj/machinery/scanner_gate/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ScannerGate", name)
		ui.open()

/obj/machinery/scanner_gate/ui_data()
	var/list/data = list()
	data["locked"] = locked
	data["scan_mode"] = scangate_mode
	data["reverse"] = reverse
	data["disease_threshold"] = disease_threshold
	return data

/obj/machinery/scanner_gate/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("set_mode")
			var/new_mode = params["new_mode"]
			scangate_mode = new_mode
			. = TRUE
		if("toggle_reverse")
			reverse = !reverse
			. = TRUE
		if("toggle_lock")
			if(allowed(usr))
				locked = !locked
			. = TRUE
		if("set_disease_threshold")
			var/new_threshold = params["new_threshold"]
			disease_threshold = new_threshold
			. = TRUE

#undef SCANGATE_NONE
#undef SCANGATE_MINDSHIELD
#undef SCANGATE_DISEASE
#undef SCANGATE_GUNS
#undef SCANGATE_WANTED
#undef SCANGATE_ZOMBIE
