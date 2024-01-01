extends CharacterBody2D

var health = 10
@onready var player = get_node("/root/Game/Player")
@onready var slime = %Slime
const smoke_scene = preload("res://smoke_explosion/smoke_explosion.tscn")


func _ready():
	# Not in physics process because otherwise it does not allow to play hurt when damaged
	slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()

func take_damage():
	slime.play_hurt()
	health -= 3
	if health <= 0:
		queue_free()
		var smoke = smoke_scene.instantiate()
		# Cannot add to self because it is going to be deleted
		get_parent().add_child(smoke)
		smoke.global_position = global_position
