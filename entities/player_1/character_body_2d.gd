extends CharacterBody2D

@export var move_speed : float = 350
@export var Bullet : PackedScene
var new_bullets

func _ready() -> void:
	new_bullets = true

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if Input.is_action_pressed("shoot") and new_bullets == true:
		new_bullets = false
		shoot()
	velocity = input_direction * move_speed
	
	move_and_slide()

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $muzzle.global_transform


func _on_timer_timeout() -> void:
	new_bullets = true
