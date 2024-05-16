extends Node2D

signal play_move(move_string)

var queued_move:String;

func select_move(move_string):
	queued_move = move_string
	$InOut.play("out")
	$ScissorButton.disabled = true
	$RockButton.disabled = true
	$PaperButton.disabled = true

func fade_in():
	$InOut.play("in")
	$ScissorButton.disabled = false
	$RockButton.disabled = false
	$PaperButton.disabled = false

func fade_out():
	$InOut.play("out")
	$ScissorButton.disabled = true
	$RockButton.disabled = true
	$PaperButton.disabled = true

func stop_animation():
	$InOut.stop()

func on_fade_out_done():
	play_move.emit(queued_move)

func _on_rock_button_pressed():
	select_move("rock")

func _on_paper_button_pressed():
	select_move("paper")

func _on_scissor_button_pressed():
	select_move("scissors")
