class_name HitboxComponent extends Area2D

@export var damage : int = 0
@export var canAttack : bool = true


func _on_area_entered(area: Area2D) -> void:
	if area is not HealthComponent or not canAttack:
		return

	area.takeAttack(damage)
