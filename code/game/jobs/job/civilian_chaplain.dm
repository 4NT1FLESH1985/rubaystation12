//Due to how large this one is it gets its own file
/datum/job/chaplain
	title = "Священник"
	department = "Civilian"
	department_flag = CIV

	total_positions = 1
	spawn_positions = 1
	supervisors = "Глава Персонала"
	access = list(access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/chaplain

	equip(var/mob/living/carbon/human/H, var/alt_title, var/ask_questions = TRUE)
		. = ..()
		if(!.)
			return
		if(!ask_questions)
			return

		var/obj/item/storage/bible/B = locate(/obj/item/storage/bible) in H
		if(!B)
			return

		spawn(0)
			var/religion_name = "Христианство"
			var/new_religion = sanitize(input(H, "Вы офицер экипажа. Хотели бы вы сменить свою религию? Стандартная - Христианство, в КОСМОСЕ.", "Name change", religion_name), MAX_NAME_LEN)

			if (!new_religion)
				new_religion = religion_name
			switch(lowertext(new_religion))
				if("christianity")
					B.SetName(pick("Святая Библия","Свертки мёртвого моря"))
				if("satanism")
					B.SetName("Не святая библия")
				if("cthulu")
					B.SetName("Некромикон")
				if("islam")
					B.SetName("Коран")
				if("scientology")
					B.SetName(pick("Биография Л.Рона Хабарда","Дианетика"))
				if("chaos")
					B.SetName("Книга Лоргара")
				if("imperium")
					B.SetName("Воодушевляющий Праймер")
				if("toolboxia")
					B.SetName("Манифест тулбокса")
				if("homosexuality")
					B.SetName("Ребята сошли с ума")
				if("science")
					B.SetName(pick("Директор Относительности", "Квантомная Энигма: Физика сталкивается с Сознательностью", "Программируем вселенную", "Квантомная Физика и Теология", "Теория нити для чайников", "Как: Построить свой Warp Drive", "Загадки блюспейса", "Играем в бога: Колекционная версия"))
				else
					B.SetName("Святая Книга [new_religion]")

		spawn(1)
			var/deity_name = "Космический Иисус"
			var/new_deity = sanitize(input(H, "Вы бы хотели изменить свое божество? Стандартный - Космический Иисус.", "Name change", deity_name), MAX_NAME_LEN)

			if ((length(new_deity) == 0) || (new_deity == "Space Jesus") )
				new_deity = deity_name
			B.deity_name = new_deity

			var/accepted = 0
			var/outoftime = 0
			spawn(200) // 20 seconds to choose
				outoftime = 1
			var/new_book_style = "Библия"

			while(!accepted)
				if(!B) break // prevents possible runtime errors
				new_book_style = input(H,"Какой стиль библии хотели бы вы взять?") in list("Bible", "Koran", "Scrapbook", "Creeper", "White Bible", "Holy Light", "Athiest", "Tome", "The King in Yellow", "Ithaqua", "Scientology", "the bible melts", "Necronomicon")
				switch(new_book_style)
					if("Koran")
						B.icon_state = "koran"
						B.item_state = "koran"
					if("Scrapbook")
						B.icon_state = "scrapbook"
						B.item_state = "scrapbook"
					if("Creeper")
						B.icon_state = "creeper"
						B.item_state = "syringe_kit"
					if("White Bible")
						B.icon_state = "white"
						B.item_state = "syringe_kit"
					if("Holy Light")
						B.icon_state = "holylight"
						B.item_state = "syringe_kit"
					if("Athiest")
						B.icon_state = "athiest"
						B.item_state = "syringe_kit"
					if("Tome")
						B.icon_state = "tome"
						B.item_state = "syringe_kit"
					if("The King in Yellow")
						B.icon_state = "kingyellow"
						B.item_state = "kingyellow"
					if("Ithaqua")
						B.icon_state = "ithaqua"
						B.item_state = "ithaqua"
					if("Scientology")
						B.icon_state = "scientology"
						B.item_state = "scientology"
					if("the bible melts")
						B.icon_state = "melted"
						B.item_state = "melted"
					if("Necronomicon")
						B.icon_state = "necronomicon"
						B.item_state = "necronomicon"
					else
						B.icon_state = "bible"
						B.item_state = "bible"

				H.update_inv_l_hand() // so that it updates the bible's item_state in his hand

				switch(input(H,"Посмотрите на вашу библию - это то чего вы хотите??") in list("Да","Нет"))
					if("Да")
						accepted = 1
					if("Нет")
						if(outoftime)
							to_chat(H, "У тебя вышло время, чувак. Ты застрял. В следующее время выбирай быстрее.")
							accepted = 1
		return 1
