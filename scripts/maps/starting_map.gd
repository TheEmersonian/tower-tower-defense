extends Node2D

@onready var enemy_path: Path2D = $Path2D

var enemy_scene := preload("res://scenes/enemies/basic_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_enemy(create_enemy())
	pass # Replace with function body.



func create_enemy():
	var enemy := enemy_scene.instantiate()
	return enemy

func add_enemy(enemy):
	var pathfollow := PathFollow2D.new()
	enemy.set_path_follow(pathfollow)
	pathfollow.add_child(enemy)
	enemy_path.add_child(pathfollow)
	
