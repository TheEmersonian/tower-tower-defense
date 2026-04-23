extends Node2D

const STARTING_HEALTH := 100
const STARTING_MONEY := 250.0

#ui
@export var PlayerHealth: float = 100:
	set(_newPlayerHealth):
		PlayerHealth = _newPlayerHealth
		health_value.text = str(_newPlayerHealth)
@onready var health_value: Label = $Existence/UI/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/HealthDisplayContainer/HealthValue
@export var PlayerMoney: float = 250:
	set(_newPlayerMoney):
		PlayerMoney = _newPlayerMoney
		money_value.text = "%0.2f" % PlayerMoney
@onready var money_value: Label = $Existence/UI/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/VBoxContainer/MoneyDisplayContainer/MoneyValue


#

@onready var enemy_path: Path2D = $Path2D

var enemy_scene := preload("res://scenes/enemies/basic_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerHealth = STARTING_HEALTH
	PlayerMoney = STARTING_MONEY

func _physics_process(_delta: float) -> void:
	if randf() < 0.01:
		add_enemy(create_enemy())


func create_enemy():
	var enemy := enemy_scene.instantiate()
	enemy.connect("death", enemy_death)
	return enemy

func add_enemy(enemy):
	var pathfollow := PathFollow2D.new()
	enemy.set_path_follow(pathfollow)
	pathfollow.add_child(enemy)
	enemy_path.add_child(pathfollow)

func enemy_death(net_worth):
	var mTween := get_tree().create_tween()
	mTween.tween_property(self, "PlayerMoney", PlayerMoney+net_worth, 15)
