class_name MovementComponent extends Node

@onready var parent : CharacterBody2D = get_parent()
@export var SPEED : int = 200

var disabled : bool = false

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var targetPosition : Vector2 = Vector2(0,0)

func updateTarget(position: Vector2) -> void:
	targetPosition = position;
	
func _physics_process(delta: float) -> void:

	
	if(not parent.is_on_floor()):
		parent.velocity.y += gravity * delta
	
	if(targetPosition == Vector2(0,0) or disabled):
		parent.move_and_slide()
		return
		


	
	var diff : Vector2 = targetPosition - parent.position
	
	if(abs(diff.x) < 25 and abs(diff.y) < 20):
		parent.velocity.x = move_toward(parent.velocity.x, 0, 10)
	else:
		parent.velocity.x = move_toward(parent.velocity.x, diff.x, SPEED)
		
	parent.move_and_slide()
