extends ProgressBar

@onready var timer = $Timer	
@onready var damage_bar = $DamageBar
var health = 0 : set = _set_health 

func init_health(_health):
	health = _health 
	max_value = health 
	value = health
	damage_bar.max_value = health
	damage_bar.value = health
	#these set both to max health on startup
	
func _set_health(new_health): 
	var prev_health = health 
	health = min(max_value, new_health)
	value = health 
	
	if health <= 0: 
		queue_free()
		
		
	if health < prev_health: #checks if damage was taken
		timer.start()
	else : 
		damage_bar.value = health
		

func _on_timer_timeout():
	damage_bar.value = health
