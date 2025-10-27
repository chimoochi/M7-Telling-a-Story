extends Control
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var next_button: Button = %NextButton
var dialogue_items : Array[String] = [
	"starting text",
	"middle text",
	"end text"
]
var character_name = "Sophia"
var currentindex = 0

func show_text():
	var current_item = dialogue_items[currentindex]
	rich_text_label.text = current_item
	pass
func advance():
	currentindex += 1
	show_text()
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_button.pressed.connect(advance)
	show_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
