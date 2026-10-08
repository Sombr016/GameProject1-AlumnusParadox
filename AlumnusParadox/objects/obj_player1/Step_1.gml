/// @description player control & target scanning

#region scanning

if state == States.regular {
	var bestDistance = maxGrabDistance
	grabTarget = noone;
	
	//This checks every instance of obj_movingBlocks, and choses the one closest to this instance
	//Note: since bestDistance is initialized to the value of 'maxGrabDistance', objects must be closer than 'maxGrabDistance' to be considered.
	with obj_movingBlocks{
		//This code is being executed within an instance of obj_movingBlocks (every instance, for that matter)
		//since bestDistance is declared as a local variable (it's yellow), we still have access to it in this code.
		var thisDistance = point_distance(x,y,other.x,other.y);
			
		if thisDistance < bestDistance {
			bestDistance = thisDistance
			//In this context, 'other' is obj_player
			other.grabTarget = id
		}
	}
}
		
#endregion

#region controls

//pressing 'E' stops or starts pushing a block
if keyboard_check_pressed(ord("E"))
{
	#region push stop/start
	
	//If we're already pushing, stop doing it.
	if state == States.pushing {
		
		state = States.regular
		
		//stop the block from moving
		with obj_movingBlocks{
			hspeed = 0
			vspeed = 0
		}
	}
	//If scanning (see above) found a grab target, start pushing it.
	else if instance_exists(grabTarget){
		
		state = States.pushing
		
		//Calculate grabDirection based on which axis you're closest to the grabTarget on
		if abs(x-grabTarget.x)<abs(y-grabTarget.y){
			grabDirection = GrabAxis.vertical	
		} else {
			grabDirection = GrabAxis.horizontal	
		}
	}
	#endregion
}

#region speed calculations

//Player direction and speed
var inputVect_x = (keyboard_check(vk_right)-keyboard_check(vk_left)),
	inputVect_y = (keyboard_check(vk_down)-keyboard_check(vk_up)),
	speedSpeed = walkSpeed,
	hCancel = 1, vCancel = 1;
	//hCanvel and vCancel control when we want the player to be able to move
	
//Change speed if player is pushing
if state == States.pushing {
	speedSpeed = pushSpeed;
	
	//grabDirection limits movement to one axis
	if grabDirection = GrabAxis.vertical then hCancel = 0
	if grabDirection = GrabAxis.horizontal then vCancel = 0
}

//Horizontal wall collision for player
if(!tilemap_get_at_pixel(walltilemap, x + (inputVect_x*sprite_width/2) + (inputVect_x * speedSpeed), y)){
 hCancel = 1
}
else{
hCancel = 0
}
//Vertical  wall collision for player
if(!tilemap_get_at_pixel(walltilemap, x, y + (inputVect_y*sprite_height/2)+(inputVect_y * speedSpeed))){
 vCancel = 1
}
else{
vCancel = 0
}

hspeed = inputVect_x * speedSpeed * hCancel
vspeed = inputVect_y * speedSpeed * vCancel

/*
To understand this hspeed & vspeed operation, break it down into parts:
	
	inputVect_x * speedSpeed * hCancel
	
	inputVect_x
		In GameMaker, true/false functions actually return 1 or 0 respectively, which means you can use them for arithmetic.
		Therefore, all the possible input combinations result in the following:
			just left: -1
			just right: 1
			both or neither: 0
	
	speedSpeed
		We multiply the input component by 'speedSpeed', 
		so if the input component is -1 and 'speedSpeed' = 4, we get -4.
		Note: there is an above if statement that checks if we're in the pushing state.
		Depending on that, 'speedSpeed' either holds the value of 'walkSpeed' or 'pushSpeed'.
	
	
	hCancel
		Based on the same if statement, 'hCancel' is either 0 or 1.
		Our existing value, the product of our input and speed, is then multiplied by 'hCancel'.
		if 'hCancel' is 1, nothing happens.
		if 'hCancel' is 0, the existing value we have becomes 0.
		therefore, we set hCancel to 0 when we don't want to move on the x-axis
	
	(This explains the statement setting hspeed, but the same applies for vspeed)
*/

#endregion

#region pushing
//If pushing, transfer the player's speed to the object they're pushing
if (state == States.pushing) with grabTarget {
	if !place_meeting(x + other.hspeed, y + other.hspeed, obj_movingBlocks){
		hspeed = other.hspeed
		vspeed = other.vspeed
	} else {
		hspeed = 0
		vspeed = 0
	}
	
	//Vertical wall collision for block
	if(tilemap_get_at_pixel(other.walltilemap, x, y + (inputVect_y*sprite_height/2)+vspeed)){
		vspeed = 0
	} 
	//Horizontl wall collision for block
	if(tilemap_get_at_pixel(other.walltilemap, x + hspeed +(inputVect_x*sprite_height/2), y )){
		hspeed = 0
	}
}
#endregion

#endregion