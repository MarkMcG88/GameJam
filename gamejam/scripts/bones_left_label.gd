extends Label

func update_bones_list(bones: Array):
	var bones_left = 5 - bones.size()
	if bones_left > 0:
		text = "Bones Left: %d" % bones_left
	else:
		text = ""
	
