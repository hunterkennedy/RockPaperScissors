extends Node2D

signal next_turn
signal game_over
var health = 5

# Used to trigger the cleaver animation
func take_damage():
	$CleaverAnimationPlayer.stop()
	$CleaverAnimationPlayer.play("cleave")

# This is used in the cleaver animation
func remove_finger():
	# update health
	health = health - 1
	# select which finger to remove
	if health == 4:
		# remove pinky
		$Pinky.hide()
		$BloodstainAnimationPlayer.play("bleed")
	if health == 3:
		$Ring.hide()
	if health == 2:
		$Thumb.hide()
	if health == 1:
		$Index.hide()
	if health == 0:
		$Middle.hide()
		game_over.emit()

func fade_in():
	$InOut.play("in")

func fade_out():
	$InOut.play("out")

func set_health(new_health:int):
	health = new_health

func send_next_turn():
	next_turn.emit()

func reset_health():
	$BloodstainAnimationPlayer.stop()
	$Pinky.show()
	$Ring.show()
	$Thumb.show()
	$Index.show()
	$Middle.show()
	health = 5
