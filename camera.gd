extends Camera2D
@export var speed: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Zoom


	# Movement
	var velocity = speed * delta
	if Input.is_action_pressed("camera-down"):
		position.y += velocity
	if Input.is_action_pressed("camera-up"):
		position.y -= velocity
	if Input.is_action_pressed("camera-left"):
		position.x -= velocity
	if Input.is_action_pressed("camera-right"):
		position.x += velocity
