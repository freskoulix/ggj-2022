extends RigidBody

onready var animation_tree = self.find_node('AnimationTree')
onready var playback = self.find_node('AnimationTree').get('parameters/playback')

# Called when the node enters the scene tree for the first time.
func _ready():
	playback.start('Floating')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_RigidBody_body_entered(body):
	get_tree().get_current_scene().end_game()
