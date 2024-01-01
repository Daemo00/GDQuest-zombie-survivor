extends Area2D

func _physics_process(delta):
	var in_range_enemies = get_overlapping_bodies()
	if in_range_enemies.size() > 0:
		var target_enemy = in_range_enemies.front()
		look_at(target_enemy.global_position)

const BULLET = preload("res://bullet.tscn")
func shoot():
	var bullet = BULLET.instantiate()
	%ShootingPoint.add_child(bullet)


func _on_timer_timeout():
	shoot()
