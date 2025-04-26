extends Area2D

var speed = 1700

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	body.queue_free()
	queue_free()
