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

@onready var row_bodies: HBoxContainer =  $VBoxContainer/RowBodies
@onready var row_expressions: HBoxContainer = $VBoxContainer/RowExpressions

@onready var body: TextureRect = %Body
@onready var expression: TextureRect = %Expression


	
func create_buttons() -> void:
	for current_body: String in bodies:
		var button := Button.new()
		row_bodies.add_child(button)
		button.text = current_body.capitalize()
		button.pressed.connect(func() -> void:
			body.texture = bodies[current_body]
		)
	for current_expression: String in expressions:
		var button := Button.new()
		row_expressions.add_child(button)
		button.text = current_expression.capitalize()
		button.pressed.connect(func() -> void:
			expression.texture = expressions[current_expression]
		)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_buttons()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
