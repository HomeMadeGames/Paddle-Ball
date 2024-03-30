extends Sprite2D

var score := [0, 0]# 0:Player, 1: CPU
# Speed at which the paddles move.
const PADDLE_SPEED : int = 500

# goal sound
@onready var scorePlayerSound = $scorePlayer
@onready var scoreCpuSound = $scoreCPU


func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_score_left_body_entered(body):
	score [1] += 1
	$Hud/CPUScore.text = str(score[1])
	scoreCpuSound.play()
	$ballTimer.start()
	


func _on_score_right_body_entered(body):
	score [0] += 1
	$Hud/PlayerScore.text = str(score[0])
	$ballTimer.start()
	scorePlayerSound.play()
