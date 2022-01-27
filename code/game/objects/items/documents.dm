/obj/item/documents
	name = "Секретные документы"
	desc = "Совершенно секретные документы."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "docs_generic"
	item_state = "paper"
	throwforce = 0
	w_class = ITEM_SIZE_TINY
	throw_range = 1
	var/description_antag

/obj/item/documents/examine(mob/user)
	. = ..()
	if(description_antag)
		to_chat(user, description_antag)

/obj/item/documents/nanotrasen
	name = "Секретные корпоративные документы"
	desc = "Совершенно секретные корпоративные документы, заполненные с комплексными диаграммами, исследовательскими процедурами, и деталями клонирования или разведения  неразумных рас . Похоже что они выставят их на аукцион к высшим приватным аукционерам."
	description_antag = "Конгломерат сильных корпораций похоже хочет создать веапонизированную ксенобиологическую расу. Возможно как форма ВМД."
	icon_state = "docs_verified"

/obj/item/documents/scg/verified
	name = "Секретные правительственные документы"
	desc = "Совершенно секретные документы раскрывающие СГ ИГГ, давая доступ в запрещенные сектора. Ихняя важность - координаты, коды для союзных кораблей, и списки допусков."
	description_antag = "Эти коды очень странные для исследовательских суден: много из них в списке СГ, спрятанные. Вы никогда не слышали этого."
	icon_state = "docs_verified"

/obj/item/documents/scg/brains
	name = "secret medical documents"
	desc = "Heavily classified medical documentation of brain scans and exploratory surgery conducted across the entire length of the Torch project. It seems like they have been documenting how deep-space living has altered the structure of the brain."
	description_antag = "These studies were conducted, without consent, while the patients were under anaesthesia for some other routine medical concern. They detail some very unusual deformities within the deepest parts of the brain, correlating them with the people and places visited by the Torch 'for later assessment'. The findings, and any 'viable specimens', are to be delivered to a black site on S/2004 N 1."
	icon_state = "docs_verified"

/obj/item/documents/scg/red
	name = "red secret documents"
	desc = "\"Top Secret\" protocols on what to do if the ship passes into TCC sectors. The writing mostly goes over the diplomatic process, while constantly shaming the Terrans for their idiocy and needless aggression."
	description_antag = "You notice that these protocols contain small, almost intentional snubbing efforts. Whoever wrote these may have been rooting for a war to start..."
	icon_state = "docs_red"

/obj/item/documents/scg/blue
	name = "Синие секретные документы"
	desc = "Совершенно секретные документы описующие компанию скрелов Krri'gli, и ихние настойчивые запросы про исследовательско важные сектора для Torch для расследования."
	description_antag = "Krri'gli seem to be guiding the Torch, subtly, to a specific unmapped sector of the galaxy. It's almost like they're too afraid to investigate it personally."
	icon_state = "docs_blue"

/obj/item/documents/scgr
	name = "Приватные записки и факсы"
	desc = "Совершенно секретные записки и факсы Между SCGR и других официальных персон СГ."
	description_antag = "Переписки SCGR хранящие массивное количество грязи на политиков: Наркотики, секс, деньги..."
