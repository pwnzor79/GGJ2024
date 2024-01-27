extends AudioStreamPlayer2D

#var questionPick int: = 0
var questionText: String = "test string"

# Called when the node enters the scene tree for the first time.
func _ready():
	_askQuestion()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#_askQuestion()
	pass


func _askQuestion():
	var questionPick := randi_range(0, 5)
	print(questionPick)
	if(questionPick == 0):
		self.questionText = ("what is your name? ")
		_sayText(self.questionText)
	elif(questionPick == 1):
		self.questionText = ("what is your quest? ")
		_sayText(self.questionText)
	elif(questionPick == 2):
		self.questionText = ("sd ")
	elif(questionPick == 3):
		self.questionText = ("doing question 3 ")
		_sayText(self.questionText)
	elif(questionPick == 4):
		self.questionText = ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ")
		_sayText(self.questionText)
	elif(questionPick == 5):
		self.questionText = ("doing question 5 ")
		_sayText(self.questionText)

#https://godotforums.org/d/24845-how-to-change-the-stream-of-an-audiostreamplayer-via-gdscript
#this shows how to change the sound this plays

#https://forum.godotengine.org/t/get-first-n-characters-from-string/27447
# this shows how to parse the text
func _sayText(question: String):
	for n in question.length()-1:
		
		print(question[n])
		
		#play the sound
		#https://www.reddit.com/r/godot/comments/12zia1x/how_to_add_small_delay_to_a_one_off_sound_play/
		#this shows how to hold this process until the sound finishes.
		
		if(question[n] != "a"):
			self.stream = load("res://BobbyAssets/Audio/ramSample1.wav")
			self.playing = true
			await get_tree().create_timer(self.stream.get_length()).timeout
		else:
			self.playing = false
		
		#hold until the sound is done
	
	
	
	
