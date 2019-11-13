extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = ("Time passed - global.totalDeltaTitle - " + str(global.totalDeltaTitle) + "\nFloor divided - floor(global.totalDeltaTitle) - " + str(floor(global.totalDeltaTitle)) + "\nCharacters visible in title - visible_characters (title) - global.titleShown - " + str(global.titleShown) + "\nIs in game? - global.inGame - " + str(global.inGame) + "\nScore - global.score - " + str(global.score) + "\nPlayer postion - global.playerpos - position (player) - " + str(global.playerpos))