/datum/admin_secret_item/admin_secret/list_fingerprints
	name = "List Fingerprints"

/datum/admin_secret_item/admin_secret/list_fingerprints/execute(var/mob/user)
	. = ..()
	if(!.)
		return
	var/dat = "<B>Showing Fingerprints.</B><HR>"
	dat += "<meta charset='utf-8'><table cellspacing=5><tr><th>Name</th><th>Fingerprints</th></tr>"
	for(var/mob/living/carbon/human/H in SSmobs.mob_list)
		if(H.ckey)
			if(H.dna && H.dna.uni_identity)
				dat += "<meta charset='utf-8'><tr><td>[H]</td><td>[md5(H.dna.uni_identity)]</td></tr>"
			else if(H.dna && !H.dna.uni_identity)
				dat += "<meta charset='utf-8'><tr><td>[H]</td><td>H.dna.uni_identity = null</td></tr>"
			else if(!H.dna)
				dat += "<meta charset='utf-8'><tr><td>[H]</td><td>H.dna = null</td></tr>"
	dat += "<meta charset='utf-8'></table>"
	show_browser(user, dat, "window=fingerprints;size=440x410")
