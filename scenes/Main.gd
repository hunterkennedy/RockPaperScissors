extends Node

var enemy_moves = ["rock", "paper", "scissors"]
var win_conditions = {"rock": "scissors", "paper": "rock", "scissors": "paper"}
var will_take_damage = false
var will_deal_damage = false

func game_over():
	$HUD.show_game_over()
	
func new_game():
	$HUD.show_message("Good Luck!")
	$Music.play()
	$StartTimer.start()
	$HealthHand.show()
	$EnemyHealthHand.show()
	$MoveSelector.show()
	$MoveSelector.stop_animation()
	$HealthHand.reset_health()
	$EnemyHealthHand.reset_health()

func _on_start_timer_timeout():
	$HealthHand.fade_in()
	$EnemyHealthHand.fade_in()
	start_turn()

func _on_hud_start_game():
	new_game()

func _on_move_selector_play_move(move_string:Variant):
	var chosen_enemy_move:String = enemy_moves[randf_range(0, 2)]
	# determine outcome
	will_take_damage = (win_conditions[chosen_enemy_move] == move_string)
	will_deal_damage = (win_conditions[move_string] == chosen_enemy_move)
	# $HealthHand.take_damage()
	$PlayHand.start_shake(move_string)
	$EnemyHand.start_shake(chosen_enemy_move)

func _on_play_hand_on_shake_done():
	start_turn()

func start_turn():
	$MoveSelector.fade_in()

func _on_play_hand_show_outcome():
	if will_take_damage:
		$HealthHand.take_damage()
	if will_deal_damage:
		$EnemyHealthHand.take_damage()

func _on_enemy_health_hand_game_over():
	$WinSound.play()
	end_game()
	$HUD.show_game_over(true)

func _on_health_hand_game_over():
	$LoseSound.play()
	end_game()
	$HUD.show_game_over(false)

func end_game():
	$Music.stop()
	$HealthHand.hide()
	$HealthHand.fade_out()

	$EnemyHealthHand.fade_out()
	$EnemyHealthHand.hide()

	$MoveSelector.stop_animation()
	$MoveSelector.hide()
