extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("RESET")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_pause()

func _resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwords("blur")
	
func _paused():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func _pause():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		_pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		_resume()

func _on_resume_pressed():
	_resume()

func _on_restart_pressed():
	_resume()
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit
