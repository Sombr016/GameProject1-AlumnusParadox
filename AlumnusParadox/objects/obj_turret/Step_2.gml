if(state == TurretStates.sentry) {
	sprite_index = spr_rturret_inactive;
}
else if(state != TurretStates.sentry) {
	sprite_index = spr_rturret_act;
}