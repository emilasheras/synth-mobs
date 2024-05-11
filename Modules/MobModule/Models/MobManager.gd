extends Node

var mobScenes = {
	"mob_po": preload("res://Modules/MobModule/Models/Po.tscn"),
	"mob_yo": preload("res://Modules/MobModule/Models/Yo.tscn"),
	"mob_gi": preload("res://Modules/MobModule/Models/Gi.tscn")
}
const SPAWN_RATE_SECONDS = 1.0

# Preload mob scenes
func _ready():
	pass

func getMobInstance(mobName: String) -> Node:
	if mobScenes.has(mobName):
		return mobScenes[mobName].instantiate()
	else:
		print("MobManager: No mob found with name ", mobName)
		return null

#func testCreature(mobModel):
	#print("Type of poMobModel:", typeof(poMobModel), poMobModel)
	#print("Testing get_state: ", poMobModel.get_state())
func getMobNameRandom():
	randomize()
	return mobScenes.keys().pick_random()

func spawnMobAt(mobName, scene: Node2D, coordinates):
	if(mobName == "any"):
		mobName = getMobNameRandom()
	print("mobName: {mobName}".format({"mobName": mobName}))
	var mobInstance = getMobInstance(mobName)
	mobInstance.position = Vector2(coordinates[0], coordinates[1])
	scene.add_child(mobInstance)

func spawnCreatures(amount: int, scene: Node2D, coordinatesMaximum, coordinatesMinimum = [0, 0]):
	# This function spawns `amount` creatures, with a 1-second gap between each
	print("max X: X({x}) and Y({y})".format({"x": coordinatesMaximum[0], "y": coordinatesMaximum[1]}))
	for i in range(amount):
		var posX = randf_range(coordinatesMinimum[0], coordinatesMaximum[0])
		var posY = randf_range(coordinatesMinimum[1], coordinatesMaximum[1])
		spawnMobAt("any", scene, [posX, posY])
		print("Spawned at: X({x}) and Y({y})".format({"x": posX, "y": posY}))
		
		# Wait for 1 second before continuing the loop
		await get_tree().create_timer(SPAWN_RATE_SECONDS).timeout
