@abstract
class_name Tower
extends Node2D

@export_category("Visual")
@export var base_sprite: Texture2D
@export var base_rotation_degrees: float
@export var base_scale: Vector2
@export var turret_sprite: Texture2D
@export var turret_rotation_degrees: float
@export var turret_scale: Vector2
@export_category("Stats")
@export var attack_range : float

var enemies: Array

var tower_base: Sprite2D
var tower_turret: Sprite2D
var tower_range: Area2D

@abstract
func set_stats()

func setup_tower():
	tower_base = Sprite2D.new() # instance the sprite2d for the base
	tower_base.texture = base_sprite # apply the texture
	tower_base.rotation_degrees = base_rotation_degrees # apply the rotation
	tower_base.scale = base_scale # apply the scale
	add_child(tower_base) # add as child
	
	tower_turret = Sprite2D.new() # instance the sprite2d for the turret
	tower_turret.texture = turret_sprite # apply the texture
	tower_turret.rotation_degrees = turret_rotation_degrees # apply the rotation
	tower_turret.scale = turret_scale # apply the scale
	add_child(tower_turret) # add as a child
	
	tower_range = Area2D.new() # instance the area2d for enemy detection
	var r_a_shape := CollisionShape2D.new() # instance the collision shaoe
	var actual_fucking_shape := CircleShape2D.new() # finally instance the actual shape we need to modify
	actual_fucking_shape.radius = attack_range # apply attack range
	# put all those together as needed 
	r_a_shape.shape = actual_fucking_shape
	tower_range.add_child(r_a_shape)
	# connect the relevant signals
	tower_range.connect("area_entered", enemy_entered_range)
	tower_range.connect("area_exited", enemy_left_range)
	add_child(tower_range) # add as child
	

func enemy_entered_range(enemy):
	if enemy not in enemies:
		enemies.append(enemy)

func enemy_left_range(enemy):
	if enemy in enemies:
		enemies.erase(enemy)













#end
