extends Polygon2D

func _ready():
	defineShape()
	
func defineShape():
	var points = []
	var radius = 20 
	var sides = 8  # More sides = smoother circle

	for i in range(sides):
		var angle = i * 2 * PI / sides
		points.append(Vector2(cos(angle), sin(angle)) * radius)
	
	self.polygon = points
	self.color = Color(0, 1, 0) 
