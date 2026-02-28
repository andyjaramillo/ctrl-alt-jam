extends CharacterBody2D

@export var speed = 400  # speed in pixels/sec
#@export var rotation_speed = 10.0

@onready var anim_sprite = $"../AnimatedSprite2D"

func _ready() -> void:
	anim_sprite.rotation = 0

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	
	if Input.is_action_pressed("up"):
		anim_sprite.rotation = 0 
		#if Input.is_action_pressed("left"):
			#anim_sprite.rotation = -45
		#elif Input.is_action_pressed("right"):
			#anim_sprite.rotation = 45
		anim_sprite.play("Crawl")
		
	elif Input.is_action_pressed("down"): 
		anim_sprite.rotation = 180
		#if Input.is_action_pressed("left"):
			#anim_sprite.rotation = 225
		#elif Input.is_action_pressed("right"):
			#anim_sprite.rotation = 135
  
		anim_sprite.play("Crawl")
		
	elif Input.is_action_pressed("left"): 
		anim_sprite.rotation = -90
		#if Input.is_action_pressed("up"):
			##print("leftupa")
			#anim_sprite.rotation = -45
		#elif Input.is_action_pressed("down"):
			#anim_sprite.rotation = -135

		anim_sprite.play("Crawl")
		
	elif Input.is_action_pressed("right"):  
		anim_sprite.rotation= 90
		#if Input.is_action_pressed("up"):
			#anim_sprite.rotation = 45
		#elif Input.is_action_pressed("down"):
			#anim_sprite.rotation =135	
		anim_sprite.play("Crawl")
		
	else:
		anim_sprite.play("Idle")
	print(anim_sprite.rotation)
	move_and_slide()
	
