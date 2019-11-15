extends KinematicBody2D

export(bool) var randomtype = true
var current = Vector2(-1,0)
var next = null
var speed = 200
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	pass

func _process(delta):
	# Find available directions
	var available = []
	for x in range(-1,2,2):
		for y in range(-1,2,2):
			if Vector2(x,y) * -1 != current && Vector2(x,y) != current && !move_and_collide(Vector2(x,y)*8,true,true,true):
				available.append(Vector2(x,y))
	if next == null && available != []:
		# Randomize direction
		next = available[rng.randi_range(0,len(available)-1)]
	# Check if on next direction and move
	if next != null:
		if !move_and_collide(next*8,true,true,true):
			current = next
			next = null
	move_and_collide(current*delta*speed)
	position += current * -1