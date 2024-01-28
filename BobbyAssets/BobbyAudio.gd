extends AudioStreamPlayer2D

@export var playerText: RichTextLabel
@export var bobbyText: RichTextLabel
@export var timerText: RichTextLabel
@export var dictionary: String
@export var timer: Timer

#https://forum.godotengine.org/t/how-to-import-and-read-text/21936
#https://github.com/dwyl/english-words/blob/master/words.txt
@onready var bobbyDictionary = "res://BobbyAssets/words.txt"

var file = FileAccess.open("res://BobbyAssets/words.txt", FileAccess.READ)

#var questionPick int: = 0
var answerText: String = ""
var responseTextRight: String = ""
var responseTextWrong: String = ""
var responseTextMiscellaneous: String = ""
var timeTrim: float = 0.3
var isTalking: bool = false
var inDictionary: bool = true
var benefitOfTheDoubt: bool = true #determining factor when the answer is not predetermined
var grammarSlam: bool = true #means you must get benefit of the doubt and be in the dictionary
var askAfterTalking: bool = false #determines if "say text" goes to "process question"
var dictionaryArray = [" "]
var answerArray = [" "]
var wrongAnswerArray = [" "]
var correctAnswerArray = [" "]
var csvFile: String = ""
var anger: int = 0
var happiness: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_loadFile()
	_processQuestion()
	#timerText.clear()
	#timerText.add_text(str(snapped(timer.time_left, 0.1)))
	#timerText.text = timer.time_left
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#https://forum.godotengine.org/t/how-to-assign-a-label-text-property-to-a-timers-time-left-function/21794/2
	timerText.text = str($Timer.time_left - 1)
	if(timer.time_left < 1):
		timer.paused = true
		timerText.text = ("0")
		#print("game over")
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
		dictionaryArray.resize(dictionaryArray.size() + 1)
		dictionaryArray[dictionaryArray.size()-1] = csv_data[0]
	
	print("done processing csv data")
	#print(dictionaryArray)

func _processQuestion():
	print("question process")
	askAfterTalking = false
	
	#check if angriness is enough to lose
	if(anger >= 5):
		print("you lose!")
		
	#check if happiness is enough to win
	elif(happiness >= 5):
		print("you win!")
	
	#ask question
	_askQuestion()

func _processAnswer(answer):
	
	#check spelling
	inDictionary = true
	askAfterTalking = true
	
	answerArray = answer.split(" ")
	for word in answerArray:
		if(!dictionaryArray.has(word)):
			inDictionary = false
		
	print("process answer " + answerText)
	if(wrongAnswerArray.has(answerText)):
		print("wrong answer")
		anger += 1
		bobbyText.text = responseTextWrong
		_sayText(responseTextWrong)
	elif(correctAnswerArray.has(answerText)):
		print("correct answer")
		happiness += 1
		bobbyText.text = responseTextRight
		_sayText(responseTextRight)
	else:
		print("neither")
		bobbyText.text = responseTextMiscellaneous
		_sayText(responseTextMiscellaneous)
		if(grammarSlam):
			print("we are checking grammar")
			if(inDictionary):
				print("the word is in the dictionary")
				if(benefitOfTheDoubt):
					print("you get benefit of the doubt")
					happiness += 1
				else:
					print("you do not get benefit of the doubt")
					anger += 1
			else:
				print("that was not in the dictionary")
				anger += 1
		else:
			print("we are not checking grammar")
			if(benefitOfTheDoubt):
				print("you get benefit of the doubt")
				happiness += 1
			else:
				print("you do not get benefit of the doubt")
				anger += 1
	
	#_processQuestion()

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
					_processAnswer(answerText)
					#_sayText(answerText)
			"Backspace":
				if(answerText.length() > 0):
					answerText[answerText.length()-1] = ""
			"Space":
				answerText += " "
		print(answerText)
		playerText.text = answerText

func _askQuestion():
	
	var questionPick := randi_range(0, 0) #this is inclusive on both sides
	print(questionPick)
	if(questionPick == 0):
		bobbyText.text = ("s ")
		wrongAnswerArray = ["tim", "steve"]
		correctAnswerArray = ["bobby", "gargathor"]
		responseTextRight = ("that is a great name")
		responseTextWrong = ("TIM!!")
		responseTextMiscellaneous = (answerText + " is a cool name!")#this is set when askQuestion is called
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
		
		
	elif(questionPick == 1):
		bobbyText.text = "what is your quest?"
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 2):
		bobbyText.text = ("what is your favorite color?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 3):
		bobbyText.text = ("how was your day?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 4):
		bobbyText.text = ("what is your social security number?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 5):
		bobbyText.text = ("what is your favorite food?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 6):
		bobbyText.text = "what is Ian's middle name?"
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 7):
		bobbyText.text = ("what color are the curtains behind me?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 8):
		bobbyText.text = ("what is the square root of pi")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 9):
		bobbyText.text = ("are you funny?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 10):
		bobbyText.text = ("tell me a story")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 11):
		bobbyText.text = "knock knock" #the player should say 'who is there', 'whos' makes me angry
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 12):
		bobbyText.text = ("Rene Descarte famously stated 'I think therefore I am' in order to assert cognizance 
		is the ultimate proof of existence, however this idea is challenged by gnostic beliefs which assert that 
		there is no certainty behind the assertion that the reality we observe is real at all. What are your
		thoughts on this issue? Also what is 4/7?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 13):
		bobbyText.text = ("sdrawkcab 'reflection' tou epyt")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 14):
		bobbyText.text = ("what is the name of prometheus' brother?") #epimetheus or brometheus
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
	elif(questionPick == 15):
		bobbyText.text = ("what is your favorite food?")
		wrongAnswerArray = []
		correctAnswerArray = []
		responseTextRight = ("")
		responseTextWrong = ("")
		responseTextMiscellaneous = ("")
		grammarSlam = false
		benefitOfTheDoubt = true
		_sayText(bobbyText.text)
		
	#_questionProcess()

#https://godotforums.org/d/24845-how-to-change-the-stream-of-an-audiostreamplayer-via-gdscript
#this shows how to change the sound this plays

#https://forum.godotengine.org/t/get-first-n-characters-from-string/27447
# this shows how to parse the text
func _sayText(question: String):
	isTalking = true
	timer.paused = true
	
	print("saying " + question)
	
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
	timer.paused = false
	if(askAfterTalking):
		_processQuestion()
	
	
