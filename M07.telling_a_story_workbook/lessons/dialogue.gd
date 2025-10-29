extends Control
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var next_button: Button = %NextButton
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

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
