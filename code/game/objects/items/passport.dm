/obj/item/passport
	name = "Паспорт"
	icon = 'icons/obj/passport.dmi'
	icon_state = "passport"
	force = 0.5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "Паспорт. Его источники неизвестны."
	var/info
	var/fingerprint

/obj/item/passport/proc/set_info(mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/decl/cultural_info/culture = H.get_cultural_value(TAG_HOMEWORLD)
	var/pob = culture ? culture.name : "Unset"
	if(H.dna)
		fingerprint = md5(H.dna.uni_identity)
	else
		fingerprint = "N/A"
	info = "\icon[src] [src]:\nName: [H.real_name]\nSpecies: [H.get_species()]\nGender: [gender2text(H.gender)]\nAge: [H.age]\nPlace of Birth: [pob]\nFingerprint: [fingerprint]"

/obj/item/passport/attack_self(mob/user as mob)
	user.visible_message(
		SPAN_ITALIC("[user] opens and checks [src]."),
		SPAN_ITALIC("You open [src] and check for some main information."),
		SPAN_ITALIC("You hear the faint rustle of pages."),
		5
	)
	to_chat(user, info || SPAN_WARNING("[src] is completely blank!"))

/obj/item/passport/scg
	name = "\improper SCG passport"
	icon_state = "passport_scg"
	desc = "Паспорт из Правительства Солнечной Системы."

/obj/item/passport/earth
	name = "\improper Earth passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Земли, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/venus
	name = "\improper Venusian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Венеры, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/luna
	name = "\improper Luna passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Луны, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/mars
	name = "\improper Martian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Марса, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/phobos
	name = "\improper Phobos passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Фобоса, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/ceres
	name = "\improper Ceres passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Цереры, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/pluto
	name = "\improper Plutonian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Плутона, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/tiamat
	name = "\improper Tiamat passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из ?Тиамата?, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/eos
	name = "\improper Eos passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Эоса, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/ceti_epsilon
	name = "\improper Cetite passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Киты Эпсилон, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/lordania
	name = "\improper Lordanian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Лордании, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/kingston
	name = "\improper Kingstonian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Kingston, within Sol Central Government space."

/obj/item/passport/cinu
	name = "\improper Cinusian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из ?Цину?, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/yuklid
	name = "\improper Yuklid V passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Юклид В, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/lorriman
	name = "\improper Lorriman passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из ?Лорриман?, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/tersten
	name = "\improper Tersten passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из Терстена, в пределах территории Правительства Солнечной Системы."

/obj/item/passport/south_gaia
	name = "\improper Southern Gaian passport"
	icon_state = "passport_scg2"
	desc = "Паспорт из южной части Гайи, под контролем Правительства Солнечной Системы."

/obj/item/passport/iccg
	name = "\improper ICCG passport"
	icon_state = "passport_iccg"
	desc = "Паспорт из Независимой Колониальной Конфедерации Гильгамеша."

/obj/item/passport/north_gaia
	name = "\improper Northern Gaian passport"
	icon_state = "passport_iccg2"
	desc = "Паспорт с северной части Гайи, под контролем Независимой Колониальной Конфедерации Гильгамеша."

/obj/item/passport/terra
	name = "\improper Terran passport"
	icon_state = "passport_iccg2"
	desc = "Паспорт из Терры, в пределах территории НККГ."

/obj/item/passport/novayazemlya
	name = "\improper Novaya Zemlya passport"
	icon_state = "passport_iccg2"
	desc = "Паспорт из Новой Земли, в пределах территории НККГ."

/obj/item/passport/saveel
	name = "\improper Saveel passport"
	icon_state = "passport"
	desc = "Паспорт из Савил, изолированной колонии."

/obj/item/passport/magnitka
	name = "\improper Magnitkan passport"
	icon_state = "passport"
	desc = "Паспорт из Магнитки, независимой колонии."

/obj/item/passport/empiremohranda
	name = "\improper Mohrandade passport"
	icon_state = "passport"
	desc = "Паспорт из Империи Мохранда, граница империи установлена на Лорене и Мохранде, в системе Люггуст."
