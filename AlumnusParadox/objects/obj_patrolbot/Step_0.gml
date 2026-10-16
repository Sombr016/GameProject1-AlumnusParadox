/*
Patrolling State (Default) -> Bot will patrol around a set path. Said path is immutable and persistent,
meaning that the Bot will always have one path and that path will always exist. When the player
enters the bot’s viewing area, then it will enter a chasing state.


Chasing State -> Bot will begin chasing the player around the playable area. If the player moves too
far away from the Bot (or the Bot moves too far away from the patrolling area), then the Bot will
enter the Searching State. If the Bot comes into contact with the player, then it will kill the player.

This searching state
Teleporting State -> Teleports to the last known point on the path. Doesn't do anything.


Paused State -> If the game is paused, then the Bot will stay in place, remembering which state it was in before the game is paused. Once the pause ends, the Bot will return to its previous state.


*/
step = (vision_spread/triangle_segments)*2; //The step that is between each line in the triangle.
segments = 0; //The tracker of the amount of segments the player currently occupies.
for(var i = 0; i < triangle_segments; i++) {
	//show_debug_message(string(line_array[i]))
	//Creates a collision line on an angle within the view cone.
	collisionline = collision_line(x,y,x+lengthdir_x(vision_distance, direction+(-vision_spread+step*i)),y+lengthdir_y(vision_distance, direction+(-vision_spread+step*i)),obj_player1,false,false);
	//If the line collides with the player, then add to segments.
	if(collisionline != noone) {
		//show_debug_message(string(segments));
		segments++
	}
	//If the amount of segments that the player occupies exceeds the segments needed to target the player, then target. In this case, the Engaged State will begin.
	if(segments >= segments_needed_for_target) {
		//Checks if target is equal to noone. This prevents the case where the last line in the cone doesn't detect the player, therefore the player is never targeted.
		if(target == noone) {
			//show_debug_message("Target Found!");
			target = collisionline;
		}
	}
	//If the amount of segments does not exceed the segments needed to target the player, then set the target to noone.
	//When this happens, an alarm will trigger, eventually activating the Search State.
	else {
		target = noone;
	}
	
}
//image_angle = direction;


if(state == PatrolState.patrol) {
	//If the target is found and the alarm isn't already active, activate the bot.
	if(image_alpha <= 1) {
		image_alpha += 0.05
	}
	if(target != noone && alarm[0] < 0) {
		alarm[0] = activation_time;
	}
	var _x = x + lengthdir_x(walk_speed*sprite_width/4, direction);
	var _y = y + lengthdir_y(walk_speed*sprite_height/4, direction);
	//Checks if the moving box is in front of the patrol bot. If it is, then go the other way in the path.
	if (collision_line(x,y,_x, _y, obj_movingBlocks, false, true))
	{
		path_speed *= -1;
		path_position = path_position+(path_speed/100);
	}
	//else {path_speed = walk_speed;}
	//else if (path_index != path_flyer) {
		//path_start(path_flyer,hsp,path_action_restart,true)
	//}
}
if(state == PatrolState.chasing) {
	//If the target isn't found and the alarm isn't set, then start the patrol alarm.
	if(target == noone && alarm[1] < 0) {
		alarm[1] = 120;
	}
	//If the target is found, then the patrol alarm is set inactive.
	else if(target != noone){
		alarm[1] = -1;
	}
	if(instance_exists(obj_player1)){
		//Point towards the player.
		direction = point_direction(x,y,obj_player1.x,obj_player1.y);
		//If the patrol bot collides with a wall or a moving block, then stop moving.
		if(place_meeting((x + (walk_speed*sprite_width/2*cos(direction*(pi/180)))),(y + (walk_speed*sprite_height/2*sin(direction*(pi/180)))),[walltilemap,obj_movingBlocks])) {
			vCancel = 0;
		}
		else {
			vCancel = 1;
		}
		//Set the speed. Base Walk Speed * Chase Speed Multiplier * vCancel.
		speed = walk_speed*chase_speed_mult*vCancel;
	}
}
if(state == PatrolState.teleporting) {
	speed = 0;
	if(image_alpha <= 0) {
		state = PatrolState.patrol;
		path_start(path_ref,walk_speed,path_action_restart,true)
		path_position = lastpathposition;

	}
	else {
		image_alpha -= (1/fading_time);
	}
}
