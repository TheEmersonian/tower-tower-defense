@abstract
class_name Enemy
extends Area2D

var max_health: float
var health: float
var speed: float

var pathfollow: PathFollow2D

@abstract
func set_stats()

@abstract
func reach_end_of_track()

func _process(delta: float) -> void:
	if is_instance_valid(pathfollow):
		pathfollow.progress += speed * delta
		if pathfollow.progress_ratio >= 0.999:
			reach_end_of_track()

func set_path_follow(new_path_follow: PathFollow2D):
	pathfollow = new_path_follow

func take_damage(damage: float):
	var health_before := health
	health -= damage
	print("Enemy HP: ", health_before, "/", max_health, "->",health,"/",max_health)
	if health <= 0:
		queue_free()
