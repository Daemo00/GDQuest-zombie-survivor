extends CharacterBody2D

const DAMAGE_RATE = 100  # per mob, per second
const MAX_HEALTH = 500
var health = MAX_HEALTH
signal health_depleted

func _physics_process(delta):
	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down",
	)
	velocity = direction * 600
	move_and_slide()
	
	var boo = %HappyBoo
	if velocity.length() > 0:
		boo.play_walk_animation()
	else:
		boo.play_idle_animation()

	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	health -= overlapping_mobs.size() * DAMAGE_RATE * delta
	%ProgressBar.value = health * 100/MAX_HEALTH
	if health <= 0:
		health_depleted.emit()
