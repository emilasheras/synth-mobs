extends Node2D

func _ready():
	var gradient = Gradient.new()
	gradient.set_colors([Color(0, 0, 1), Color(0, 0, 0)])  # Colors: Blue to Black
	gradient.set_offsets([0.0, 1.0])  # Start and end points of the gradient

	var gradient_texture = GradientTexture2D.new()
	gradient_texture.gradient = gradient
	gradient_texture.width = 1  # Width is 1 because it's a vertical gradient

	var sprite = Sprite2D.new()
	sprite.texture = gradient_texture
	sprite.scale = Vector2(800, 600)  # Scale the 1-pixel wide texture to fill the screen
	add_child(sprite)
