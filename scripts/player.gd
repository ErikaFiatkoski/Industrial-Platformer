extends CharacterBody2D


@export var speed = 6.5
@export_range(0, 1) var lerp_factor = 0.075
@onready var sprite = $Sprite


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	#target_velocity = a velocidade que nós QUEREMOS atingir
	var target_velocity = direction * speed * 100.0
	
	velocity = lerp(velocity,target_velocity, lerp_factor)
	move_and_slide()
	var target_rotation = direction.x * 45.0
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, target_rotation, lerp_factor)
