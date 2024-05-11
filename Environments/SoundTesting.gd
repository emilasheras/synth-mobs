extends Node2D

# Sequence of frequencies to play
var sequence = [440, 494, 523, 440, 392, 440, 494, 440]
var note_duration = 0.2  # Duration of each note in seconds
var mix_rate  # Audio sample rate. 
# For GDScript (or not compiled langs) consider using a lower mix_rate such as 11,025 Hz or 22,050 Hz.

# Internal variables
var current_note_index = 0
var time_since_last_note = 0.0
var playback
var player

func _ready():
	player = $TestAudioPlayer
	player.play()
	mix_rate = $TestAudioPlayer.stream.mix_rate
	playback = player.get_stream_playback()

	play_tone(sequence[current_note_index], note_duration)

func _process(delta):
	# Make sure the last note played ended its frames before playing the next one
	time_since_last_note += delta
	if time_since_last_note >= note_duration:
		current_note_index = (current_note_index + 1) % sequence.size()
		play_tone(sequence[current_note_index], note_duration)
		time_since_last_note = 0.0

func play_tone(frequency, duration):
	if playback == null:
		print("Playback is not ready at play_tone.")
		return
	
	var frames_to_fill = int(mix_rate * duration)
	print("frames_to_fill: ",frames_to_fill)
	print("playback.get_frames_available(): ",playback.get_frames_available())
	var phase = 0.0
	var increment = frequency / mix_rate
	
	var samples = []
	for i in range(frames_to_fill):
		var value = sin(phase * TAU)
		samples.append(Vector2(value, value))
		phase = fmod(phase + increment, 1.0)
	
	# Push all frames at once if possible
	playback.push_buffer(PackedVector2Array(samples))
	print("Pushed ", frames_to_fill, " frames for ", frequency, " Hz")

	# Additional debug
	print("Volume: ", player.volume_db, " Autoplay: ", player.autoplay)
