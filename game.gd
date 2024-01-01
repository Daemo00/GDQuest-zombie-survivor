extends Node2D

var mob_scene = preload("res://mob.tscn")

func spawn_mob():
	var mob = mob_scene.instantiate()
	var mob_position = %PathFollow2D
	mob_position.progress_ratio = randf()
	mob.global_position = mob_position.global_position
	add_child(mob)	

func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
