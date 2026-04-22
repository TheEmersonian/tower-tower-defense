class_name BasicEnemy
extends Enemy

func set_stats():
	max_health = 100.0
	health = max_health
	speed = 100.0

func reach_end_of_track():
	pathfollow.queue_free()
	print("we got to the end yay or something idk")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stats()
