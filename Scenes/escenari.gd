class_name Escenari extends Node2D

var ocell_jug = preload("res://Scenes/ocell.tscn") #aerolit precarregat
var ocell_pc = preload("res://Scenes/ocell_pc.tscn") #aerolit precarregat

var temp = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("Coordenada X del borde derecho de la pantalla:", _poistion_screen_coord())
	print($Control/Timer.get_time_left())
	pass # Replace with function body.

func _process(delta):
	
	if($Control/Timer.get_time_left() <= temp):
		temp -= 5
		print(temp)
		#Afegir un ocell cada 5 segons fer una funció aquí
		var ocell_p = ocell_pc.instantiate()
		add_child(ocell_p)
		var x = _poistion_screen_coord()
		var y = randf_range(200, 400)
		print(y)
		ocell_p.position = Vector2(x,y)#la y es per indicar d'on parteix el ocell
		#if(ocell_p.body_entered()):
			#print("choca")
	# OcellJugador._on_body_entered(ocell_p)
	pass
func _input(event):
	if event is InputEventMouseButton:
		#Al fer clic apareixera un ocell al bando esquerra
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed: 
			var ocell_j = ocell_jug.instantiate()
			add_child(ocell_j)
			var y = get_global_mouse_position().y
			ocell_j.position = Vector2(0, y)
			#queue_free()
	pass # Replace with function body.

func _on_timer_timeout():
	pass # Replace with function body.

func _poistion_screen_coord():
	var viewport_rect = get_viewport_rect()
	var screen_right = viewport_rect.position.x + viewport_rect.size.x
	
	return screen_right
