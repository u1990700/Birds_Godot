extends Node2D

var ocell_jug = preload("res://Scenes/ocell.tscn") #aerolit precarregat
var ocell_pc = preload("res://Scenes/ocell_pc.tscn") #aerolit precarregat

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("Coordenada X del borde derecho de la pantalla:", _position_screen())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var ocell_p = ocell_pc.instantiate()
	#add_child(ocell_jug)
	pass
	
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed: 
			var ocell_j = ocell_jug.instantiate()
			add_child(ocell_j)
			var y = get_global_mouse_position().y
			ocell_j.position = Vector2(0, y)

			#ocell_j.impulse
			#queue_free()
	pass # Replace with function body.


func _on_timer_timeout():
	pass # Replace with function body.


func _poistion_screen():
	var viewport_rect = get_viewport_rect()
	var screen_right = viewport_rect.position.x + viewport_rect.size.x
	
	return screen_right
