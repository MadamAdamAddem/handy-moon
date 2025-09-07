extends CharacterBody2D


@onready var health_component: HealthComponent = $HealthComponent
@onready var movement_component: MovementComponent = $MovementComponent
@onready var this_sprite: AnimatedSprite2D = $EnemySprite
@export var movement_disabled : bool = false

func _ready() -> void:
	movement_component.disabled = movement_disabled
	health_component.died.connect(onDeath)
	health_component.took_damage.connect(onDamage)
	
func _process(delta: float) -> void:
	movement_component.updateTarget(Globals.getPlayerPosition())
	this_sprite.scale.x = 1 if velocity.x > 0 else -1 if velocity.x < 0 else this_sprite.scale.x
	pass
	
	
func onDeath() -> void:
	#queue_free()
	pass
	
func onDamage() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(this_sprite, "modulate:v", 3.0, 0.1)
	tween.tween_property(this_sprite, "modulate:v", 1.0, 0.1)
