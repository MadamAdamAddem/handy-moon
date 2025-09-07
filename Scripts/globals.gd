extends Node

var player : CharacterBody2D = null



func registerPlayer(new_player: CharacterBody2D) -> void:
	player = new_player
	pass
	
func removePlayer() -> void:
	player = null
	pass
	
func getPlayerPosition() -> Vector2:
	if player:
		return player.position
	
	return Vector2(0,0)
