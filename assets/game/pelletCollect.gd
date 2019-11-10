extends Area2D

var justStarted = true

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if justStarted == true && global.inGame == true:
		justStarted = false
		show()

func _on_Pellet_area_entered(area):
	pass
	if area == $"/root/Player/Body":
		hide()
		global.score += 1