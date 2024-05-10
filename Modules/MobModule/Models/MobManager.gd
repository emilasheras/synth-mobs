extends Node

var mobScenes = {
	"mob_po": preload("res://Modules/MobModule/Models/Po.tscn"),
	"mob_yo": preload("res://Modules/MobModule/Models/Yo.tscn")
}

# Preload mob scenes
func _ready():
	pass

func getMobInstance(mobName: String) -> Node:
	if mobScenes.has(mobName):
		print(mobScenes[mobName])
		return mobScenes[mobName].instantiate()
	else:
		print("MobManager: No mob found with name ", mobName)
		return null

#func testCreature(mobModel):
	#print("Type of poMobModel:", typeof(poMobModel), poMobModel)
	#print("Testing get_state: ", poMobModel.get_state())

func spawnMobAt(mobName, scene: Node2D, coordinates):
	var mobInstance = getMobInstance(mobName)
	scene.add_child(mobInstance) # todo: now how do i attach it?
	mobInstance.position = Vector2(coordinates[0], coordinates[1])

func spawnCreatures(amount: int, scene: Node2D, coordinatesMaximum):
	# This function spawns `amount` creatures, with a 1-second gap between each
	print("max X: X({x}) and Y({y})".format({"x": coordinatesMaximum[0], "y": coordinatesMaximum[1]}))
	for i in range(amount):
		var posX = randf_range(0, coordinatesMaximum[0])
		var posY = randf_range(0, coordinatesMaximum[1])
		spawnMobAt("mob_yo", scene, [posX, posY])
		print("Spawned at: X({x}) and Y({y})".format({"x": posX, "y": posY}))
		
		# Wait for 1 second before continuing the loop
		await get_tree().create_timer(1.0).timeout
