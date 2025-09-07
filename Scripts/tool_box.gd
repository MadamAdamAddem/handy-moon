extends RigidBody2D


var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var collision: CollisionShape2D = $ToolBoxColl
@onready var tool_box_hitbox: HitboxComponent = $ToolBoxHitbox


var is_launched : bool = false

func launchToolBox() -> void:
	freeze = false
	apply_impulse(Vector2(0, 100))
	position = global_position
	top_level = true
	is_launched = true
	visible = true
	tool_box_hitbox.canAttack = true
	
func _process(delta: float) -> void:
	if linear_velocity.y == 0:
		tool_box_hitbox.canAttack = false

	
func pickUpToolBox() -> void:
	freeze = true
	position = Vector2(0, 18)
	top_level = false
	is_launched = false
	visible = false
	tool_box_hitbox.canAttack = false
	rotation = 0
	
	
	
