extends CharacterBody2D

var direction = Vector2(0,1)
var prev_direction = Vector2(0,0)
var can_move = true; 
@export var speed = 32
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_pressed("left") and prev_direction != Vector2(1, 0):
		prev_direction = direction
		direction = Vector2(-1, 1)
	if Input.is_action_pressed("right") and prev_direction != Vector2(-1, 0):
		prev_direction = direction
		direction = Vector2(1, 1)
	if Input.is_action_pressed("down"):
		prev_direction = direction
		direction = Vector2(0, 1)
	
	if can_move: 
		position += direction * speed
		print(position)
		can_move = false
	move_and_slide()
	
	

func _on_timer_timeout():
	can_move = true
