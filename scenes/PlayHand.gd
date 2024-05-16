extends Node2D

signal on_shake_done
signal show_outcome

var queued_move = "rock"

@export var rock_sprite:Texture2D
@export var paper_sprite:Texture2D
@export var scissors_sprite:Texture2D

func start_shake(move:String):
	$PlaySprite.texture = rock_sprite;
	queued_move = move
	$ShakeAnimationPlayer.play("shake")

func set_sprite_to_queued_move():
	if queued_move == "rock":
		$PlaySprite.texture = rock_sprite;
	if queued_move == "paper":
		$PlaySprite.texture = paper_sprite;
	if queued_move == "scissors":
		$PlaySprite.texture = scissors_sprite;

func indicate_shake_done():
	on_shake_done.emit()

func send_show_outcome():
	show_outcome.emit()
