extends CharacterBody2D

@onready var tool_box: RigidBody2D = $ToolBox
@onready var this_sprite: AnimatedSprite2D = $PlayerSprite

const SPEED = 200.0
const JUMP_VELOCITY = -115.0

var double_jump_ready : bool = true

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var left : int = int(Input.is_action_pressed("left")) * -1
	var right : int = int(Input.is_action_pressed("right"))
		
	if(not is_on_floor()):
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif double_jump_ready:
			tool_box.launchToolBox()
			double_jump_ready = false
			velocity.y = JUMP_VELOCITY
		
	
	if (left + right):
		velocity.x = SPEED * (left + right)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	this_sprite.scale.x = -1 if velocity.x > 0 else 1 if velocity.x < 0 else this_sprite.scale.x
	move_and_slide()

func _process(delta: float) -> void:
	if global_position.distance_to(tool_box.global_position) < 12:
		tool_box.pickUpToolBox()
		double_jump_ready = true
		pass

func _ready() -> void:
	Globals.registerPlayer(self)
	#tool_box.add_collision_exception_with(self)
	pass
