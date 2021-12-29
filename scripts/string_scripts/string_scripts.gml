/// @description add description of function
/// @function string_replace_pos(substr,str,index){
/// @param substr	string to be replacement
/// @param str		string to change
/// @param index	index to place substring

function string_replace_pos(substr,str,index){
	
	str = string_delete(str,index,1);
	str = string_insert(substr,str,index);
	
	return str;

}