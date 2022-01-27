/datum/job/assistant
	title = "Ассистент"
	department = "Гражданский"
	department_flag = CIV

	total_positions = -1
	spawn_positions = -1
	supervisors = "Абсолютно все"
	economic_power = 1
	access = list()
	alt_titles = list("Технический ассистент","Медицинский интерн","Научный ассистент","Гость")
	outfit_type = /decl/hierarchy/outfit/job/assistant

/datum/job/assistant/get_access()
	return list()
