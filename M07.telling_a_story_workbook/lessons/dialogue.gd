extends Control
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var next_button: Button = %NextButton
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var body: TextureRect = %Body
@onready var expression: TextureRect = %Expression

var expressions := {
	"happy": preload("res://assets/emotion_happy.png"),
	"regular": preload("res://assets/emotion_regular.png"),
	"sad": preload("res://assets/emotion_sad.png"),
}

var dialogue_items : Array[Dictionary] = [
	{
		"expression": expressions["regular"],
		"text": "the starting text",
	},
	{
		"expression": expressions["sad"],
		"text": "other text abotu something",
	},
	{
		"expression": expressions["happy"],
		"text": "a piece of data in a dictionary",
	},
	{
		"expression": expressions["regular"],
		"text": "almost the end",
	},
	{
		"expression": expressions["happy"],
		"text": "the end",
	}
]

var character_name = "Sophia"
var currentindex = 0

func slide_in() -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)
	body.position.x = 200
	tween.tween_property(body, "position:x", 0, .3)
	body.modulate.a = 0
	tween.parallel().tween_property(body,"modulate:a",1,.2)

func show_text():
	slide_in()
	var current_item := dialogue_items[currentindex]
	
	rich_text_label.text = current_item["text"]
	expression.texture = current_item["expression"]
	rich_text_label.visible_ratio = 0.0
	
	var tween := create_tween()
	var text_appearing_duration := 1.2
	tween.tween_property(rich_text_label, "visible_ratio", 1.0, text_appearing_duration)
	
	var sound_max_offset := audio_stream_player.stream.get_length() - text_appearing_duration
	var sound_start_position := randf() * sound_max_offset
	audio_stream_player.play(sound_start_position)
	tween.finished.connect(audio_stream_player.stop)
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
