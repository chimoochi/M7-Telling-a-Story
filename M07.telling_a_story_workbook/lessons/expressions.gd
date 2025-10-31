extends Control

var bodies := {
	"sophia": preload("res://assets/sophia.png"),
	"pink": preload("res://assets/pink.png")
}
var expressions := {
	"happy": preload("res://assets/emotion_happy.png"),
	"regular": preload("res://assets/emotion_regular.png"),
	"sad": preload("res://assets/emotion_sad.png"),
}
@onready var body: TextureRect = %Body
@onready var expression: TextureRect = %Expression
@onready var button_sophia: Button = %ButtonSophia
@onready var button_pink: Button = %ButtonPink
@onready var button_regular: Button = %ButtonRegular
@onready var button_sad: Button = %ButtonSad
@onready var button_happy: Button = %ButtonHappy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body.texture = bodies['pink']
	expression.texture = expressions['happy']
	button_sophia.pressed.connect(func(): body.texture = bodies["sophia"])
	button_pink.pressed.connect(func(): body.texture = bodies["pink"])
	button_regular.pressed.connect(func(): expression.texture = expressions["regular"])
	button_sad.pressed.connect(func(): expression.texture = expressions["sad"])
	button_happy.pressed.connect(func(): expression.texture = expressions["happy"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
