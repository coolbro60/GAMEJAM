extends CharacterBody2D

var direction = Vector2(0,1)
var prev_direction = Vector2(0,0)
var can_move = true; 
@export var speed = 3000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up") and prev_direction != Vector2(0, 1):
		prev_direction = direction
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down") and prev_direction != Vector2(0, -1):
		prev_direction = direction
		direction = Vector2(0, 1)
	if Input.is_action_pressed("left") and prev_direction != Vector2(1, 0):
		prev_direction = direction
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("right") and prev_direction != Vector2(-1, 0):
		prev_direction = direction
		direction = Vector2(1, 0)
	
	if can_move: 
		position += direction * speed * delta
		can_move = false
	move_and_slide()
		

func _on_timer_timeout():
	can_move = true
