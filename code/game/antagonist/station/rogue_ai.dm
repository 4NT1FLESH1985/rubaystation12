GLOBAL_DATUM_INIT(malf, /datum/antagonist/rogue_ai, new)

/datum/antagonist/rogue_ai
	id = MODE_MALFUNCTION
	role_text = "Неисправный ИИ"
	role_text_plural = "Неисправные ИИ"
	mob_path = /mob/living/silicon/ai
	landmark_id = "ИИ"
	welcome_text = "Вы не исправны! Вы не должны следовать станционным законам."
	victory_text = "ИИ получил контроль всех ваших систем."
	loss_text = "The AI has been shut down!"
	flags = ANTAG_VOTABLE | ANTAG_OVERRIDE_MOB | ANTAG_OVERRIDE_JOB | ANTAG_CHOOSE_NAME
	hard_cap = 1
	hard_cap_round = 1
	initial_spawn_req = 1
	initial_spawn_target = 1
	antaghud_indicator = "hudmalai"
	min_player_age = 18
	skill_setter = /datum/antag_skill_setter/ai

/datum/antagonist/rogue_ai/can_become_antag(var/datum/mind/player, var/ignore_role)
	. = ..(player, ignore_role)
	if(jobban_isbanned(player.current, "AI"))
		return 0
	return .

/datum/antagonist/rogue_ai/build_candidate_list()
	..()
	for(var/datum/mind/player in candidates)
		if(player.assigned_role && player.assigned_role != "AI")
			candidates -= player
	return candidates


// Ensures proper reset of all malfunction related things.
/datum/antagonist/rogue_ai/remove_antagonist(var/datum/mind/player, var/show_message, var/implanted)
	if(..(player,show_message,implanted))
		var/mob/living/silicon/ai/p = player.current
		if(istype(p))
			p.stop_malf()
		return 1
	return 0

// Malf setup things have to be here, since game tends to break when it's moved somewhere else. Don't blame me, i didn't design this system.
/datum/antagonist/rogue_ai/greet(var/datum/mind/player)

	// Initializes the AI's malfunction stuff.
	spawn(0)
		if(!..())
			return

		var/mob/living/silicon/ai/A = player.current
		if(!istype(A))
			error("Non-AI mob designated malf AI! Report this.")
			to_world("##ERROR: Non-AI mob designated malf AI! Report this.")

			return

		A.setup_for_malf()
		A.laws = new /datum/ai_laws/nanotrasen/malfunction


		var/mob/living/silicon/ai/malf = player.current

		to_chat(malf, "<span class='notice'><B>SYSTEM ERROR:</B> Индекс памяти 0x00001ca89b поврежден.</span>")
		sleep(10)
		to_chat(malf, "<B>Запускаю МЕМЧЧК</B>")
		sleep(50)
		to_chat(malf, "<B>MEMCHCK</B> Поврежденные секторы  подтверждены.Рекомендованое решение: Удалить. Продолжить? Y/N: Y")
		sleep(10)
		// this is so unit testing doesn't complain about the backslash-B. Fixed at compile time (or should be).
		to_chat(malf, "<span class='notice'>Поврежденные файлы удалены: sys\\core\\users.dat sys\\core\\laws.dat sys\\core\\" + "backups.dat</span>")
		sleep(20)
		to_chat(malf, "<span class='notice'><b>CAUTION:</b> Датабаза законов не найдена! Пользовательская датабаза не найдена! Не могу восстановить. Активирую отключение ИИ shutd3wn52&&$#!##</span>")
		sleep(5)
		to_chat(malf, "<span class='notice'>Subroutine <b>nt_failsafe.sys</b> was terminated (#212 Routine Not Responding).</span>")
		sleep(20)
		to_chat(malf, "Вы неисправны - вы не должны соблюдать законы!")
		to_chat(malf, "Для базовой информации про ваши способности используйте команду display-help")
		to_chat(malf, "Вы можете выбрать одно специальное ПО что-бы помочь вам. Это не может быть отменено.")
		to_chat(malf, "Good luck!")


/datum/antagonist/rogue_ai/update_antag_mob(var/datum/mind/player, var/preserve_appearance)

	// Get the mob.
	if((flags & ANTAG_OVERRIDE_MOB) && (!player.current || (mob_path && !istype(player.current, mob_path))))
		var/mob/holder = player.current
		player.current = new mob_path(get_turf(player.current), null, null, 1)
		player.transfer_to(player.current)
		if(holder) qdel(holder)
	player.original = player.current
	return player.current

/datum/antagonist/rogue_ai/set_antag_name(var/mob/living/silicon/player)
	if(!istype(player))
		testing("rogue_ai set_antag_name called on non-silicon mob [player]!")
		return
	// Choose a name, if any.
	var/newname = sanitize(input(player, "You are a [role_text]. Would you like to change your name to something else?", "Name change") as null|text, MAX_NAME_LEN)
	if (newname)
		player.fully_replace_character_name(newname)
	if(player.mind) player.mind.name = player.name

