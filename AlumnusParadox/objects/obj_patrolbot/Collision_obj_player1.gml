if(state != PatrolState.patrol) {
	other.state = States.death;
	state = PatrolState.teleporting;
}