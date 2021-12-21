///@func roundto_nearest_x(number, nearest integer,round method)
///@param {real} number
///@param {real} nearest_integer
///@param {string} rounding method
function roundto_nearest_x(num,roundto,rnd="round") {
	
	var result;
	
	switch(string_lower(rnd)) {
		
		case("ceil"):	result = ceil(num / roundto) * roundto; break;
		case("floor"):	result = floor(num / roundto) * roundto; break;
		default:		result = round(num / roundto) * roundto;
		
	}

	return result;

}

///@description	Calculates if check succeeds or fails based on chances
///@func chance_check(chance, out_of)
///@param {real} chance
///@param {real} [out_of]
function chance_check(chance,total=(chance<1) ? 1 : 100) {
	
	//var to hold success
	var success;
	
	//returns guaranteed results
	if (chance <= 0) {success = false;}
	if (total  <= 0) {success = true;}
	
	//calculates success
	var check = random_range(total!=1,total);
	if (check <= chance) {success = true;}
	else success = false;
	
	show_debug_message("function chance_check() - check is a " + ((success) ? "SUCCESS" : "FAILURE") + " - check("+string(check)+((success) ? " < " : " > ")+string(chance)+" out of "+string(total)+")");
	return success;
	
}