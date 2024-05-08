extends Sprite2D

# Function to scale the sprite to cover the given resolution
func scaleToCover(screenWidth: float, screenHeight: float):
	if not texture:
		print("BackgroundSprite: No texture is set on this sprite.")
		return

	var textureWidth = texture.get_width()
	var textureHeight = texture.get_height()

	var scaleX = screenWidth / textureWidth
	var scaleY = screenHeight / textureHeight

	var scaleFactor = max(scaleX, scaleY)

	# Apply the uniform scale factor to maintain the aspect ratio
	self.scale = Vector2(scaleFactor, scaleFactor)
	
	# Move to the center of the camera vey todo: add a singleton static access for this values
	self.position = Vector2(960, 540)
