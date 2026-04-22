class_name BasicTower
extends Tower

var basic_tower_base := preload("res://assets/images/Homing Blast.png")
var basic_tower_turret := preload("res://assets/images/gun.png")

func set_stats():
	base_sprite = basic_tower_base
	base_scale = Vector2(0.3,0.3)
	base_rotation_degrees = 0
	turret_sprite = basic_tower_turret
	turret_scale = Vector2(0.1,0.1)
	turret_rotation_degrees = -225
	attack_range = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stats()
	setup_tower()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if enemies.size() > 0:
		tower_turret.look_at(enemies[0].global_position)
		tower_turret.rotation_degrees += turret_rotation_degrees
