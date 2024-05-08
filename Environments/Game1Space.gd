extends Node2D

var poMobModel = preload("res://Modules/MobModule/Models/Po.tscn")
var YoMobModel = preload("res://Modules/MobModule/Models/Yo.tscn")

func _ready():
	print("Type of poMobModel:", typeof(poMobModel), poMobModel)
	print("Testing get_state: ", poMobModel.get_state())
	var mobInstance = poMobModel.instantiate()
	add_child(mobInstance)
	mobInstance.position = Vector2(randf_range(0,100), randf_range(0,100))

