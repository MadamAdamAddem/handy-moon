extends Node2D

var is_attacking : bool = false
@onready var melee_hitbox: HitboxComponent = $MeleeHitbox
@onready var hitbox_collision: CollisionShape2D = $MeleeHitbox/HitboxCollision



func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("attack") and not is_attacking:
		is_attacking = true
		melee_hitbox.canAttack = true
		visible = true
		hitbox_collision.disabled = false
		
		var timer = Timer.new()
		timer.wait_time = 0.5
		timer.one_shot = true
		
		timer.timeout.connect(func(): 
			is_attacking = false
			melee_hitbox.canAttack = false
			visible = false
			hitbox_collision.disabled = true
			timer.queue_free()
		)
		add_child(timer)
		timer.start()
	
	
	pass
