extends RigidBody2D

var min_speed = 50  # Minimum speed of the creature
var max_speed = 150  # Maximum speed of the creature
var change_interval = 1.0  # Time in seconds between direction/speed changes

var timer = 0.0  # Timer to track time since last change

func _ready():
	randomize()  # Ensures that the random generator seed is unique
	apply_random_velocity()

func _physics_process(delta):
	timer += delta
	if timer >= change_interval:
		timer = 0  # Reset the timer
		apply_random_velocity()

func apply_random_velocity():
	var random_direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	var random_speed = randf_range(min_speed, max_speed)
	linear_velocity = random_direction * random_speed
