extends KinematicBody

onready var character = self.find_node('ConsCollisionShape')
onready var playback = self.find_node('AnimationTree').get('parameters/playback')
var velocity = 1
var jump = 2
var gravity = 1
var looking = 'left'
var character_state = 'idle'
var is_walking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	var previous_character_state = character_state
	var is_walking = false
	var current_looking = looking
	if (Input.is_action_pressed('move_front')):
		current_looking = 'front'
		move_and_slide(Vector3(0, 0, velocity))
		is_walking = true
	if (Input.is_action_pressed('move_back')):
		current_looking = 'back'
		move_and_slide(Vector3(0, 0, -velocity))
		is_walking = true
	if (Input.is_action_pressed('move_right')):
		current_looking = 'right'
		move_and_slide(Vector3(-velocity, 0, 0))
		is_walking = true
	if (Input.is_action_pressed('move_left')):
		current_looking = 'left'
		move_and_slide(Vector3(velocity, 0, 0))
		is_walking = true
	if (Input.is_action_pressed('jump')):
		character_state = 'jump'
		move_and_slide(Vector3(0, jump, 0))
		is_walking = true

	if is_walking and previous_character_state == 'idle':
		character_state = 'walk'
	elif not is_walking:
		character_state = 'idle'

	if previous_character_state == 'idle' and character_state == 'walk':
		walk()
	elif previous_character_state == 'walk' and character_state == 'idle':
		idle()

	move_and_slide(Vector3(0, -gravity, 0))

func walk():
	if not is_walking:
		playback.start('Walk')
		is_walking = true

func idle():
	playback.stop()
	is_walking = false
