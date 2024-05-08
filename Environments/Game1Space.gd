extends Node2D

var poMobModel = preload("res://Modules/MobModule/Models/Po.tscn")
var yoMobModel = preload("res://Modules/MobModule/Models/Yo.tscn")

func _ready():
	#testCreature(poMobModel)
	spawn_creatures(5)

#func testCreature(mobModel):
	#print("Type of poMobModel:", typeof(poMobModel), poMobModel)
	#print("Testing get_state: ", poMobModel.get_state())

func spawnMobAt(mobModel, coordinates):
	var mobInstance = mobModel.instantiate()
	add_child(mobInstance)
	mobInstance.position = Vector2(coordinates[0], coordinates[1])

func spawn_creatures(amount: int):
	# This function spawns `amount` creatures, with a 1-second gap between each
	var viewport = get_viewport_rect()
	print("max X: X({x}) and Y({y})".format({"x":viewport.size.x,"y":viewport.size.y}))
	for i in range(amount):
		var posX = randf_range(0, viewport.size.x)
		var posY = randf_range(0, viewport.size.y)
		print("Spawned at: X({x}) and Y({y})".format({"x":posX,"y":posY}))
		spawnMobAt(poMobModel, [posX, posY])
		
		# Wait for 1 second before continuing the loop
		await get_tree().create_timer(1.0).timeout
