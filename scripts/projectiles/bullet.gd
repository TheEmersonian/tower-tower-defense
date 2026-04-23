class_name Projectile
extends Area2D

var damage: float
var pierce: int
var speed: float
var hit_enemies: Array[Enemy]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup(_damage: float, _pierce: int, _speed: float):
	damage = _damage
	pierce = _pierce
	speed = _speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.from_angle(rotation) * delta * speed
	


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		if hit_enemies.has(area): return
		area.take_damage(damage)
		hit_enemies.append(area)
		pierce -= 1
		if pierce < 0:
			queue_free()
