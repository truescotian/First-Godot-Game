extends CharacterBody2D

@export var speed = 400
@export var dash_speed = 3200

var upDashing = false
var upDashCount = 0
var downDashing = false
var downDashCount = 0
var leftDashing = false
var leftDashCount = 0
var rightDashing = false
var rightDashCount = 0
var canDash = true
	
func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_just_pressed("up") and not upDashing and upDashCount == 1 and canDash:
		dash()
		reset_dash_counts()
	elif Input.is_action_just_pressed("up") and not upDashing:
		upDashCount += 1
		$UpDashTimer.start()
	elif Input.is_action_just_pressed("down") and not downDashing and downDashCount == 1 and canDash:
		dash()
		reset_dash_counts()
	elif Input.is_action_just_pressed("down") and not downDashing:
		downDashCount += 1
		$DownDashTimer.start()
	elif Input.is_action_just_pressed("left") and not leftDashing and leftDashCount == 1 and canDash:
		dash()
		reset_dash_counts()
	elif Input.is_action_just_pressed("left") and not leftDashing:
		leftDashCount += 1
		$LeftDashTimer.start()
	elif Input.is_action_just_pressed("right") and not rightDashing and rightDashCount == 1 and canDash:
		dash()
		reset_dash_counts()
	elif Input.is_action_just_pressed("right") and not rightDashing:
		rightDashCount += 1
		$RightDashTimer.start()
	move_and_slide()

func dash():
	$DashCooldown.start()
	canDash = false
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * dash_speed

func reset_dash_counts():
	upDashCount = 0
	leftDashCount = 0
	downDashCount = 0
	rightDashCount = 0

func _on_up_dash_timer_timeout():
	upDashCount = 0
	upDashing = 0

func _on_down_dash_timer_timeout():
	downDashCount = 0
	downDashing = 0

func _on_right_dash_timer_timeout():
	rightDashCount = 0
	rightDashing = 0

func _on_left_dash_timer_timeout():
	leftDashCount = 0
	leftDashing = 0

func _on_dash_cooldown_timeout():
	canDash = true
