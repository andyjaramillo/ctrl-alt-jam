extends CharacterBody2D

@export var speed = 400  # speed in pixels/sec
@export var dash_speed = 2400

#@export var rotation_speed = 10.0
var isdashing = false

@onready var timer = $DashCoolDown
@onready var anim_sprite = $"940 Theta/AnimatedSprite2D"

#
#func _ready() -> void:
	#anim_sprite.rotation_degrees = 0


 
var is_crawling
@onready var idle_direction = Vector2(0,-400)
var direction
func _physics_process(delta):
	
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if velocity != Vector2.ZERO:
		idle_direction = direction
		
		
	if !isdashing:
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
			
			
			
		if Input.is_action_just_pressed("dash"):
			isdashing = true
			timer.start()
	if isdashing:
		if velocity == Vector2.ZERO:
			velocity = idle_direction * dash_speed
		else: 
			velocity = direction * dash_speed
		print(velocity)
	move_and_slide()
	
	print(anim_sprite.global_rotation_degrees)


func _on_dash_cool_down_timeout() -> void:
	isdashing = false
	
