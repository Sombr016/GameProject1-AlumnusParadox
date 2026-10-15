if(state != PatrolState.patrol) {
	if(!other.isInvulnerable) {	
		other.state = States.death;
		other.isDead = true;
	}
	lastpathposition = lastpathposition - 0.5
	state = PatrolState.teleporting;
}