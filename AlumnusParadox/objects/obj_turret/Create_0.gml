enum TurretStates {
	sentry,
	engaged,
	search,
	paused
}
direction = starting_direction;
disableReverse = false;
state = TurretStates.sentry;

activation_sound_ref = choose(snd_activate1,snd_activate2);

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
