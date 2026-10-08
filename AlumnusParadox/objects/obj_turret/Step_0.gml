/* SENTRY STATE

In the sentry state, the turret will rotate around and look for a target. When a target is found, the
sentry sets a target and enters the Engaged State.

 - Rotate around the playable area.
 - Check for the targeting beam collision.
 - If the targeting beam collides with the player, then enter the engaged state.
END STATE */
if (state == TurretStates.sentry) {
	// If the player exists, then start collision.
	if(object_exists(obj_player1)){
		targetbeam = collision_line(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),obj_player1,false,false)
		if(targetbeam != noone && alarm[0] < 0) {
			state = TurretStates.engaged;
			canFire = false;
			alarm[3] = activation_speed;
			target = targetbeam;
		}
	}
	direction += rotation_speed*reverse;
	image_angle = direction;
	if(total_rotation < 360 && (round(direction) == (max_rotation) || round(direction) == (min_rotation))) {
		//show_debug_message("Attempting Reverse (Sentry)");
		//A flag that disables reverse if the turret is outside of the initial view cone.
		if(disableReverse) {
			//show_debug_message("Enabled Reverse");
			disableReverse = false;
			direction += reverse;
		}
		else { 
			reverse = reverse * -1;
		}
	}
	sprite_index = spr_turret_passive;
}
/* ENGAGED STATE
While in the engaged state, the turret will lock on to the player and start firing bullets.
If the targetting beam is not detecting the player, start the Search state countdown.
END STATE */
if (state == TurretStates.engaged) {
	if(object_exists(obj_player1)){
		targetbeam = collision_line(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),obj_player1,false,false)
		direction = point_direction(x, y, target.x, target.y);
		image_angle = direction;
		if(canFire == true) {
			//The simple solution? Use a gun. If that gun don't help? Use more gun.
			//If the turret can fire, then indicate that it can't for the duration signaled in fire_rate.
			//Then, create a bullet instance and copy the turret's direction for the bullet.
			canFire = false;
			alarm[3] = fire_rate;
			bullet = instance_create_layer(x+(14*cos(-direction*(pi/180))),y+(14*sin(-direction*(pi/180))),"Instances",obj_turretbullet);
			bullet.direction = direction;
			bullet.image_angle = direction;
		}
		if(targetbeam == noone && alarm[1] < 0) {
			alarm[1] = 30;
		}
		//Looks confusing, but its simple. As long as the targetbeam targets the player,
		//then it will pause the Search state alarm.
		else if(targetbeam != noone) {
			alarm[1] = 30;
		}
		//Sets the sprite index to the active state.
		sprite_index = spr_turret_active;
	}
}
/* SEARCH STATE
In this state, the turret bot will stop firing and continue to look at the player’s last known location 
for a short time. After this short period of time passes, the turret bot will return to the Sentry State.


END STATE */
if (state == TurretStates.search) {
	if(object_exists(obj_player1)) {
		targetbeam = collision_line(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),obj_player1,false,false)
		if(targetbeam == noone && alarm[2] < 0) {
			//Start the sentry countdown.
			//show_debug_message("Turret entering sentry mode!")
			alarm[2] = 360;
		}
		if(targetbeam != noone) {
			//Turret found a target. Reentering engaged mode.
			//show_debug_message("Turret entering engaged mode!")
			alarm[2] = -1;
			alarm[3] = activation_speed;
			state = TurretStates.engaged;
			target = targetbeam;
			beam_length -=50;
		}
	}
	direction += rotation_speed*reverse;
	image_angle = direction;
	if(round(direction) == max_rotation || round(direction) == min_rotation) {
		//show_debug_message("Attempting Reverse (Search)");
		reverse = reverse * -1;
	}
}
