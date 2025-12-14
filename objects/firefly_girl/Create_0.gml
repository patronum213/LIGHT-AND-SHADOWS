/// @description Insert description here
// You can write your code in this editor

//dialogue is stored as an array of strings, one item per line
//actions are imbedded as a sub-array, with the first item being the text to display concurently 
//and the rest being the keyworks outputed to the do_dialogue_functions array for reference later in the code
dialogue = [
"oh hi. Are you?? Alright?",
"Actually that's kind of stupid to ask since you got sent to the literal SHADOW REALM…",
"sorry that happened to you by the way.",
"If it makes you feel any better there's been a few people around this place, so we've got somewhere safe to rest for you.",
"Just take. a... uhm. A right? I don't know, just head right. There should be some of my fireflies marking the place."
]
do_dialogue_functions = [];
in_dialogue_with_player = false;
