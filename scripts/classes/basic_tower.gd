class_name BasicTower
extends Tower

var basic_tower_base := preload("res://assets/images/towers/base/Base-Pierce1.png")
var basic_tower_turret := preload("res://assets/images/Summoner item 5.png")

var bullet_scene := preload("res://scenes/projectiles/bullet.tscn")
var projectiles_container: Node2D

var DAMAGE := 25.0

func set_stats():
	base_sprite = basic_tower_base
	base_scale = Vector2(0.05,0.05)
	base_rotation_degrees = 0
	turret_sprite = basic_tower_turret
	turret_scale = Vector2(1,1)
	turret_rotation_degrees = 45
	attack_range = 100.0
	projectile_speed = 175.0
	var attack_cooldown := TowerCooldown.new("attack_cooldown", 0.25, TowerCooldown.CooldownType.Attack, attack)
	tower_cooldowns.append(attack_cooldown)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_stats()
	setup_tower()
	projectiles_container = get_node("../../projectiles")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if enemies.size() > 0:
		tower_turret.look_at(enemies[0].global_position)
		tower_turret.rotation_degrees += turret_rotation_degrees

func attack():
	var bullet: Projectile = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.rotation_degrees = tower_turret.rotation_degrees - turret_rotation_degrees
	bullet.setup(DAMAGE, 1, projectile_speed)
	projectiles_container.add_child(bullet)







#end
