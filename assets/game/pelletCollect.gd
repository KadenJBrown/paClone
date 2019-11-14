extends Area2D

var justStarted = true
onready var player = $"/root/Game/Map/Player"
onready var sfx = $"/root/Game/SFX"
var disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if justStarted == true && global.inGame == true:
		justStarted = false
		disabled = false
		show()
		global.score += 1
	if global.inGame == false:
		show()

func _on_Pellet_body_entered(body):
	if body == player && !disabled:
		hide()
		sfx.stream = load("res://assets/sound/click.wav")
		sfx.stop()
		sfx.play()
		disabled = true
		global.score -= 1