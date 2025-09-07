class_name HealthComponent extends Area2D


@export var health : int = 2
@export var invincibility_time : float = 1

var is_dead : bool = false
var can_take_damage : bool = true

signal died
signal took_damage

	
func takeAttack(attack: int) -> void:
	if not can_take_damage:
		return
		
	health -= attack
	took_damage.emit()
	if(health <= 0):
		died.emit()
	else:
		can_take_damage = false
		var timer = Timer.new()
		timer.wait_time = invincibility_time
		timer.one_shot = true
		timer.timeout.connect(func():
			can_take_damage = true
			timer.queue_free()
			)
		add_child(timer)
		timer.start()
		
		
