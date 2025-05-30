extends Node3D

var pa_turn_finished = 0
var pb_turn_finished = 0
var ma_turn_finished = 0
var mb_turn_finished = 0

var turn_order =["pa","pb","ma","mb"]
var turn_pointer =0
var mode=1 #0,1,2 for start, combat, end...evtl exploration

func _ready():
	var data = preload("res://data/fight_list.csv")
	var turn_order =[data.records[0][0],data.records[0][1],data.records[0][4],data.records[0][5]]
	print(data.records)  # array of data
	
	# array of data

	
	#{ "id": 1, "name": "Shooter", "speed": 100, "max_speed": 150, " damage": 1

func _process(delta: float) -> void:
	
	match mode:
		0:
			pass
		1:
			turn_based_combat()
		2:
			pass
			

func turn_based_combat():
	var turn = turn_order [turn_pointer]
	match turn:
		"pa":
			print ("Player 1 turn, turn is: ", str(turn_pointer))
			if pa_turn_finished==1:
				turn_pointer =1
				pa_turn_finished =0
			if turn_pointer >turn_order.size(): turn_pointer =0
		"pb":
			print ("Player 2 turn, turn is: ", str(turn_pointer))
			if pb_turn_finished==1:
				turn_pointer =2
				pb_turn_finished =0
			if turn_pointer >turn_order.size(): turn_pointer =0
		"ma":
			print ("Monster 1 turn, turn is: ", str(turn_pointer))
			await get_tree().create_timer(2.0).timeout
			turn_pointer =3
			if turn_pointer >turn_order.size(): turn_pointer =0 
		"mb":
			print ("Monster 2 turn, turn is: ", str(turn_pointer))
			await get_tree().create_timer(2.0).timeout
			turn_pointer =0
			if turn_pointer >turn_order.size(): turn_pointer =0

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print ("Ja")
		


func _on_button_player_1_pressed() -> void:
	pa_turn_finished =1 # Replace with function body.


func _on_button_player_2_pressed() -> void:
	pb_turn_finished =1 # Replace with function body.
