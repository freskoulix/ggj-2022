extends Node

onready var menu = preload('res://scenes/Menu.tscn').instance()
onready var intro = preload('res://scenes/Intro.tscn').instance()
onready var game = preload('res://scenes/Game.tscn').instance()
onready var end = preload('res://scenes/End.tscn').instance()
onready var credits = preload('res://scenes/Credits.tscn').instance()
onready var main_scene = get_tree().get_current_scene()

var state = 'menu'

# Called when the node enters the scene tree for the first time.
func _ready():
	main_init()

func _input(event):
	if event.is_action_pressed('toggle_fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen

func main_init():
	main_scene.add_child(menu)

func start_game():
	state = 'intro'
	main_scene.remove_child(menu)
	main_scene.add_child(intro)

func run_game():
	state = 'game'
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	main_scene.remove_child(intro)
	main_scene.add_child(game)

func end_game():
	state = 'end_game'
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	main_scene.remove_child(game)
	main_scene.add_child(end)

func show_credits():
	state = 'credits'
	main_scene.remove_child(end)
	main_scene.add_child(credits)
