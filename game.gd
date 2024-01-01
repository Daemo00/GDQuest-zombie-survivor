extends Node2D

var mob_scene = preload("res://mob.tscn")
var tree_scene = preload("res://tree.tscn")

func spawn_mob():
	var mob = mob_scene.instantiate()
	var mob_position = %PathFollow2D
	mob_position.progress_ratio = randf()
	mob.global_position = mob_position.global_position
	add_child(mob)	

func spawn_tree():
	var tree = tree_scene.instantiate()
	var tree_position = %PathFollow2D
	tree_position.progress_ratio = randf()
	tree.global_position = tree_position.global_position
	add_child(tree)	

func _on_timer_timeout():
	spawn_mob()
	spawn_tree()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
