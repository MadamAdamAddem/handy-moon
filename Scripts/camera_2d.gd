extends Camera2D
@onready var player: CharacterBody2D = $"../Player"



func _ready() -> void:
	position.x = player.position.x
	


func _process(delta: float) -> void:
	position.x = player.position.x
	position.x += player.velocity.x /4

	
	if position.x - get_viewport_rect().size.x/(2 * zoom.x) <= 0:
		position.x = get_viewport_rect().size.x/(2 * zoom.x)
	elif position.x + get_viewport_rect().size.x/(2 * zoom.x) >= 780:
		position.x = 780 - get_viewport_rect().size.x/(2 * zoom.x)
