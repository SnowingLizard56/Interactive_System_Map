extends Camera2D
@export var speed: int
@export var zoom_speed: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Zoom
	var zoom_velocity = zoom_speed * delta
	var zoom_displacement = zoom.x

	# Zoom in - Scroll wheel only has a just released
	if Input.is_action_pressed("camera-zoom-in"):
		zoom_displacement += zoom_velocity * zoom_displacement
	if Input.is_action_just_released("camera-zoom-in"):
		zoom_displacement += zoom_velocity * zoom_displacement * 5

	# Zoom out - Scroll wheel only has a just released
	if Input.is_action_pressed("camera-zoom-out"):
		zoom_displacement -= zoom_velocity * zoom_displacement
	if Input.is_action_just_released("camera-zoom-out"):
		zoom_displacement -= zoom_velocity * zoom_displacement * 5

	zoom_displacement = clampf(zoom_displacement, 0.01, 5)
	zoom = Vector2(zoom_displacement, zoom_displacement)

	# Movement
	var velocity = speed * delta * 1 / (zoom.x + 0.2)
	if Input.is_action_pressed("camera-down"):
		position.y += velocity
	if Input.is_action_pressed("camera-up"):
		position.y -= velocity
	if Input.is_action_pressed("camera-left"):
		position.x -= velocity
	if Input.is_action_pressed("camera-right"):
		position.x += velocity
