extends Node2D

var playback # Will hold the AudioStreamGeneratorPlayback.

func _ready():
	### CREATURE SPAWNING
	var viewport = get_viewport_rect()
	MobManager.spawnCreatures(2, self, [viewport.size.x, viewport.size.y])
