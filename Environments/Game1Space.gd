extends Node2D

func _ready():
	#testCreature(poMobModel)
	var viewport = get_viewport_rect()
	#print(viewport.get_center())
	MobManager.spawnCreatures(15, self, [viewport.size.x, viewport.size.y])
