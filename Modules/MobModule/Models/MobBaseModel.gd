extends RigidBody2D

### MOVEMENT SCRIPT
const MIN_SPEED = 20
const MAX_SPEED = 40
var change_interval = 0.250  # Time in seconds between direction/speed changes
var timer = 0.0  # Timer to track time since last change
var centerBias = 0.1 # How strongly the mob is biased towards the center (0-1)

func _ready():
	randomize()  # Ensures that the random generator seed is unique
	apply_random_velocity()

func _physics_process(delta):
	timer += delta
	if timer >= change_interval:
		timer = 0  # Reset the timer
		apply_random_velocity()

func apply_random_velocity():
	# Recalculate center direction
	var directionToCenter = (get_viewport_rect().get_center() - global_position).normalized()
	
	var randomDirection = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	var randomSpeed = randf_range(MIN_SPEED, MAX_SPEED)
	
	var movementDirection = (directionToCenter * centerBias + randomDirection * (1 - centerBias)).normalized()
	
	linear_velocity = movementDirection * randomSpeed
