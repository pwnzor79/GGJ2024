extends AudioStreamPlayer2D

@export var playerText: RichTextLabel
@export var bobbyText: RichTextLabel
@export var dictionary: String

#https://forum.godotengine.org/t/how-to-import-and-read-text/21936
@onready var bobbyDictionary = "res://BobbyAssets/words.txt"

var file = FileAccess.open("res://BobbyAssets/words.txt", FileAccess.READ)

#var questionPick int: = 0
var answerText: String = ""
var timeTrim: float = 0.3
var isTalking: bool = false
var dictionaryArray = [" "]
var csvFile: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	_loadFile()
	#_askQuestion()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#_askQuestion()
	pass

func _loadFile() -> void: #it is redundant to call this file if 
#https://forum.godotengine.org/t/load-variable-from-file/321/2
	if file == null:
		printerr("Could not load example.csv: %s" % error_string(FileAccess.get_open_error()))
		return
	print("begin processing csv data")

	# get header line - remove/comment next line if no header in csv file
	var _discarded_header_line = file.get_line()
	
	while !file.eof_reached():
		var csv_data := file.get_csv_line()
		# process csv data - for example just print it
		#print("CSV data is %s" % ", ".join(csv_data))
		#add csv data to our array
		#csv_data.erase(0, 2)
		dictionaryArray.resize(dictionaryArray.size() + 1)
		dictionaryArray[dictionaryArray.size()-1] = csv_data[0]
		#dictionaryArray[dictionaryArray.size()-1].erase(0,2)
		#print(dictionaryArray[dictionaryArray.size()-1])

	
	print("done processing csv data")
	print(dictionaryArray)


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
				if isTalking:
					print("don't interrupt me")
				else:
					_sayText(answerText)
			"Backspace":
				answerText[answerText.length()-1] = ""
			"Space":
				answerText += " "
		print(answerText)
		playerText.text = answerText

func _askQuestion():
	var questionPick := randi_range(0, 5)
	print(questionPick)
	if(questionPick == 0):
		bobbyText.text = ("what is your name? ")
		_sayText(bobbyText.text)
	elif(questionPick == 1):
		bobbyText.text = "what is your quest?"
		_sayText(bobbyText.text)
	elif(questionPick == 2):
		bobbyText.text = ("sd ")
	elif(questionPick == 3):
		bobbyText.text = ("doing question 3 ")
		_sayText(bobbyText.text)
	elif(questionPick == 4):
		bobbyText.text = ("aaaaadaaaaaaaaaaaaaaaaaaaaaaaaaaa ")
		_sayText(bobbyText.text)
	elif(questionPick == 5):
		bobbyText.text = ("doing question 5 ")
		_sayText(bobbyText.text)

#https://godotforums.org/d/24845-how-to-change-the-stream-of-an-audiostreamplayer-via-gdscript
#this shows how to change the sound this plays

#https://forum.godotengine.org/t/get-first-n-characters-from-string/27447
# this shows how to parse the text
func _sayText(question: String):
	isTalking = true
	
	if(dictionaryArray.has(question)):
		print("that is in the dictionary")
	else:
		print("that is not in the dictionary")
	
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
		
	isTalking = false
	
	
	
