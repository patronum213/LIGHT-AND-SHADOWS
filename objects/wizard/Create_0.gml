/// @description Insert description here
// You can write your code in this editor

//dialogue is stored as an array of strings, one item per line
//actions are imbedded as a sub-array, with the first item being the text to display concurently 
//and the rest being the keyworks outputed to the do_dialogue_functions array for reference later in the code
dialogue = [
"Oh, you're new. I'm assuming you followed the fireflies here?",
"I hope you did, couldn't imagine making the journey here without their guiding lights.",
"You can head up to the top floor to recover in the light if you need",
"If you need any help or anything to stay safe, just ask. We can usually help you out. Usually."
]
do_dialogue_functions = [];
in_dialogue_with_player = false;
