extends CharacterBody2D

@export var speed = 1000  # speed in pixels/sec
@export var dash_speed = 3000

#@export var rotation_speed = 10.0
var isdashing = false

@onready var timer = $DashDuration
@onready var dash_cooldown_timer = $DashCoolDown


@onready var anim_sprite = $"940 Theta/AnimatedSprite2D"
@onready var audio = $AudioStreamPlayer
@onready var dash_audio = $AudioStreamPlayer2
@onready var infest_audio = $AudioStreamPlayer3
#
#func _ready() -> void:
	#anim_sprite.rotation_degrees = 0


var can_dash = true
var is_crawling
@onready var idle_direction = Vector2(0,-400)
var direction
func _ready() -> void:
	anim_sprite.rotation_degrees = 180



func _physics_process(delta):
	
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if velocity != Vector2.ZERO:
		idle_direction = direction
		
		
	if !isdashing:
		if can_dash == false:
			anim_sprite.self_modulate = Color(0.534, 0.85, 0.991, 1.0)
			speed = 500
		else:
			anim_sprite.self_modulate = Color(1,1,1)
			speed = 1000
		dash_audio.stop()
		if Input.is_action_pressed("up"):
			is_crawling = true
			anim_sprite.rotation_degrees = 0 
			if Input.is_action_pressed("left"):
				anim_sprite.rotation_degrees = -45
			elif Input.is_action_pressed("right"):
				anim_sprite.rotation_degrees = 45
			anim_sprite.play("Crawl")
			
		elif Input.is_action_pressed("down"): 
			is_crawling = true
			anim_sprite.rotation_degrees = 180
			if Input.is_action_pressed("left"):
				anim_sprite.rotation_degrees = 225
			elif Input.is_action_pressed("right"):
				anim_sprite.rotation_degrees = 135
	  
			anim_sprite.play("Crawl")
			
		elif Input.is_action_pressed("left"): 
			is_crawling = true
			anim_sprite.rotation_degrees = -90
			if Input.is_action_pressed("up"):
				#print("leftupa")
				anim_sprite.rotation_degrees = -45
			elif Input.is_action_pressed("down"):
				anim_sprite.rotation_degrees = -135

			anim_sprite.play("Crawl")
			
		elif Input.is_action_pressed("right"):  
			is_crawling = true
			anim_sprite.rotation_degrees = 90
			if Input.is_action_pressed("up"):
				anim_sprite.rotation_degrees = 45
			elif Input.is_action_pressed("down"):
				anim_sprite.rotation_degrees =135	
			anim_sprite.play("Crawl")
			
		else:
			anim_sprite.play("Idle")
			is_crawling = false
			
		
		if Input.is_action_just_pressed("dash") && can_dash:
			can_dash = false
			isdashing = true
			timer.start()
			dash_cooldown_timer.start()
	
			
	if isdashing:
		is_crawling = false
		if velocity == Vector2.ZERO:
			velocity = idle_direction * dash_speed
		else: 
			velocity = direction * dash_speed
		print(velocity)
		if dash_audio.get_playback_position() == 0:
			dash_audio.play()
	
	if is_crawling:
		audio.play(audio.stream.get_length() * randf())
	else:
		audio.stop()
		
	move_and_slide()
	



func _on_dash_duration_timeout() -> void:
	isdashing = false
	
	


func _on_dash_cool_down_timeout() -> void:
	can_dash = true
	


func _on_timer_timeout() -> void:
	pass # Replace with function body.
