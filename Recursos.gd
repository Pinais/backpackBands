extends Control


@onready var money_label : Label = $money_label
@onready var level_label : Label = $level_label
@onready var level_prog_bar : ProgressBar = $level_prog_bar


var money : int = 0
var money_string : String = "$$ %s,00"
var experience : int = 0
var level : int = 0
var level_cap : int = 1000


func _ready():
	level_prog_bar.max_value = level_cap
	add_money(100)
	add_experience(100)


func _process(delta):
	if int(delta)%7 == 0:
		add_experience(1)
	if Input.is_action_just_pressed("mb1"):
		add_money(100)
	elif Input.is_action_just_pressed("mb2"): 
		add_money(-150)


func add_money(amount:int):
	var temp = money + amount
	if temp >= 0:
		money = temp
		var aux = money_string % str(money)
		money_label.text = aux
	else:
		print("Can't buy that")


func add_experience(amount:int):
	experience += amount
	if(experience>=level_cap):
		level_up()
	else:
		level_label.text = str(level)
		level_prog_bar.value = experience
	#play animation


func level_up():
	experience = experience - level_cap
	if level_cap < 0:
		level_cap = 0
	level += 1
	level_label.text = str(level)
