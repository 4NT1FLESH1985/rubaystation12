/obj/item/instrument
	icon = 'icons/obj/items.dmi'
	throwforce = 0
	throw_speed = 3
	throw_range = 6
	force = 0

/obj/item/instrument/guitar
	name = "Гитара"
	desc = "Античный музыкальный инструмент сделаный из дерева, придуман на Земле. Имеет шесть металических струн. Когда двигаются, они вибрируют и создают волны , делая звук."
	icon = 'icons/obj/items.dmi'
	icon_state = "guitar"

/obj/item/instrument/guitar/attack_self(mob/user as mob)
	user.visible_message("<span class='notice'><b>\The [user]</b> strums [src]!</span>","<span class='notice'>You strum [src]!</span>")
