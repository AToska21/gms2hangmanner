///@description Sets all globals
gml_pragma("global","global_init()");

function global_init() {
	
	//game vars
	global.gamereswidth = 960;
	global.gameresheight = 540;
	
	//word pack vars
	global.wordpack_list = [];
	global.chosen_wordpack = "";
	global.wordpack_words = [];
	global.chosenword = "";

}