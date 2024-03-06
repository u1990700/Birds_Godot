extends Node2D

@onready var _animated_sprite = $RigidBody2D/AnimatedSprite2D

var velocity = Vector2(0, 0) # Velocidad inicial del objeto
var gravity = 10 # Gravedad, puedes ajustar este valor según tus necesidades
var angle_degrees = 45 # Ángulo de lanzamiento en grados, puedes ajustar este valor

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("volar")
	var radians = deg_to_rad(angle_degrees) # Convertir el ángulo de grados a radianes
	velocity.x = cos(radians) * 300 # Velocidad inicial en dirección X
	velocity.y = -sin(radians) * 1000 # Velocidad inicial en dirección Y
	$RigidBody2D.apply_impulse(velocity.rotated(rotation))
	pass # Replace with function body.

func _process(delta):
	
	velocity.y += gravity * delta
	position += velocity * delta
	
	pass
