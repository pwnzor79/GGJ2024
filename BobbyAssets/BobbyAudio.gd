extends AudioStreamPlayer2D

#var questionPick int: = 0
var questionText: String = "test string"
var answerText: String = ""
var timeTrim: float = 0.3

# Called when the node enters the scene tree for the first time.
func _ready():
	#_askQuestion()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#_askQuestion()
	pass

func _input(event):


	#print(event.as_text())
	if Input.is_anything_pressed():
		match event.as_text():
			"a", "A":
				answerText += "a"
			"b", "B":
				answerText += "b"
			"c", "C":
				answerText += "c"
			"d", "D":
				answerText += "d"
			"e", "E":
				answerText += "e"
			"f", "F":
				answerText += "f"
			"g", "G":
				answerText += "g"
			"h", "H":
				answerText += "h"
			"i", "I":
				answerText += "i"
			"j", "J":
				answerText += "j"
			"k", "K":
				answerText += "k"
			"l", "L":
				answerText += "l"
			"m", "M":
				answerText += "m"
			"n", "N":
				answerText += "n"
			"o", "O":
				answerText += "o"
			"p", "P":
				answerText += "p"
			"q", "Q":
				answerText += "q"
			"r", "R":
				answerText += "r"
			"s", "S":
				answerText += "s"
			"t", "T":
				answerText += "t"
			"u", "U":
				answerText += "u"
			"v", "V":
				answerText += "v"
			"w", "W":
				answerText += "w"
			"x", "X":
				answerText += "x"
			"y", "Y":
				answerText += "y"
			"z", "Z":
				answerText += "z"
			"Enter":
				_sayText(answerText)
			"Backspace":
				answerText[answerText.length()-1] = ""
			"Space":
				answerText += " "
		print(answerText)

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
		self.questionText = ("aaaaadaaaaaaaaaaaaaaaaaaaaaaaaaaa ")
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
		
		#print(question[n])
		
		#play the sound
		#https://www.reddit.com/r/godot/comments/12zia1x/how_to_add_small_delay_to_a_one_off_sound_play/
		#this shows how to hold this process until the sound finishes.
		
		
		match question[n]:
			"a", "A":
				self.stream = load("res://BobbyAssets/Audio/A.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		
			"b", "B":
				self.stream = load("res://BobbyAssets/Audio/B.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"c", "C":
				self.stream = load("res://BobbyAssets/Audio/C.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"d", "D":
				self.stream = load("res://BobbyAssets/Audio/D.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"e", "E":
				self.stream = load("res://BobbyAssets/Audio/E.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"f", "F":
				self.stream = load("res://BobbyAssets/Audio/F.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		
			"g", "G":
				self.stream = load("res://BobbyAssets/Audio/G.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"h", "H":
				self.stream = load("res://BobbyAssets/Audio/H.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"i", "I":
				self.stream = load("res://BobbyAssets/Audio/I.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"j", "J":
				self.stream = load("res://BobbyAssets/Audio/J.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"k", "K":
				self.stream = load("res://BobbyAssets/Audio/K.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		
			"l", "L":
				self.stream = load("res://BobbyAssets/Audio/L.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"m", "M":
				self.stream = load("res://BobbyAssets/Audio/M.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"n", "N":
				self.stream = load("res://BobbyAssets/Audio/N.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"o", "O":
				self.stream = load("res://BobbyAssets/Audio/O.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"p", "P":
				self.stream = load("res://BobbyAssets/Audio/P.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		
			"q", "Q":
				self.stream = load("res://BobbyAssets/Audio/Q.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"r", "R":
				self.stream = load("res://BobbyAssets/Audio/R.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"s", "S":
				self.stream = load("res://BobbyAssets/Audio/S.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"t", "T":
				self.stream = load("res://BobbyAssets/Audio/T.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"u", "U":
				self.stream = load("res://BobbyAssets/Audio/U.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		
			"v", "V":
				self.stream = load("res://BobbyAssets/Audio/V.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"w", "W":
				self.stream = load("res://BobbyAssets/Audio/W.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"x", "X":
				self.stream = load("res://BobbyAssets/Audio/X.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"y", "Y":
				self.stream = load("res://BobbyAssets/Audio/Y.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
				
			"z", "Z":
				self.stream = load("res://BobbyAssets/Audio/Z.wav")
				self.playing = true
				await get_tree().create_timer(self.stream.get_length() - timeTrim).timeout
		#hold until the sound is done
	
	
	
	
