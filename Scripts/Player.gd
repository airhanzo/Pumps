extends KinematicBody2D

const SPEED = 250
const GRAVITY = 10
const JUMP_HEIGHT = -300
const NORMAL = Vector2(0, -1)

var motion = Vector2()

func _physics_process(delta):
	_move(delta)
	

func _move(delta):
	
	motion.y += GRAVITY

	if Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		motion.x = SPEED
	else:
		motion.x = 0
		
	if motion.x != 0 and is_on_floor():
		$AnimatedSprite.play("Walk")
	elif !is_on_floor():
		$AnimatedSprite.play("Jump")
	else:
		$AnimatedSprite.play("Idle")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y = JUMP_HEIGHT
		
	
	motion = move_and_slide(motion, NORMAL)
