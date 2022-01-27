/datum/job/chef
	title = "Повар"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 2
	supervisors = "Глава Персонала"
	access = list(access_hydroponics, access_kitchen)
	alt_titles = list("Cook")
	outfit_type = /decl/hierarchy/outfit/job/service/chef

/datum/job/hydro
	title = "Гидропонист"
	department = "Service"
	department_flag = SRV
	total_positions = 2
	spawn_positions = 1
	supervisors = "Глава Персонала"
	access = list(access_hydroponics, access_kitchen)
	alt_titles = list("Hydroponicist")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener

//Cargo
/datum/job/qm
	title = "Завхоз"
	department = "Supply"
	department_flag = SUP
	total_positions = 1
	spawn_positions = 1
	supervisors = "Глава Персонала"
	economic_power = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/qm

/datum/job/cargo_tech
	title = "Грузчик"
	department = "Supply"
	department_flag = SUP
	total_positions = 2
	spawn_positions = 2
	supervisors = "Завхоз и Глава Персонала"
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

/datum/job/mining
	title = "Шахтёр"
	department = "Supply"
	department_flag = SUP
	total_positions = 3
	spawn_positions = 3
	supervisors = "Завхоз и Глава Персонала"
	economic_power = 5
	access = list(access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_qm, access_mining, access_mining_station)
	alt_titles = list("Drill Technician","Prospector")
	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

/datum/job/janitor
	title = "Уборщик"
	department = "Service"
	department_flag = SRV
	total_positions = 1
	spawn_positions = 1
	supervisors = "Глава Персонала"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_sec_doors, access_medical)
	alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

//More or less assistants
/datum/job/librarian
	title = "Библиотекарь"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "Глава Персонала"
	access = list(access_library, access_maint_tunnels)
	alt_titles = list("Journalist")
	outfit_type = /decl/hierarchy/outfit/job/librarian

/datum/job/lawyer
	title = "Агент Внутренних Дел"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "Должностные лица SCG Corporate Regulations"
	economic_power = 7
	access = list(access_lawyer, access_sec_doors, access_maint_tunnels, access_bridge)
	minimal_player_age = 10
	outfit_type = /decl/hierarchy/outfit/job/internal_affairs_agent

/datum/job/lawyer/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(H)
