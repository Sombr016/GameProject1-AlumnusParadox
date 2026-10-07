enum States {
	sentry,
	engaged,
	search,
	paused
}
direction = starting_direction;
disableReverse = false;
state = States.sentry;


target = noone;

targetbeam = noone;
canFire = true;

min_rotation = starting_direction - (total_rotation/2);
max_rotation = starting_direction + (total_rotation/2);

if(min_rotation < 0) {
	min_rotation = 360+min_rotation
}
if(max_rotation >= 360) {
	max_rotation = (max_rotation-360)
}

reverse = 1;