extends KinematicBody2D

export(bool) var randomtype = true
var current = Vector2(-1,0)
var next = null

func _ready():
	pass

#func _process(delta):
#	if next != null:
#		if !move_and_collide(next*10,true,true,true):
#			