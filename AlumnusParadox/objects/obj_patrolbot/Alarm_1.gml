//CHASING -> SEARCH
//Currently goes from Chasing back to Patrol.
state = PatrolState.patrol;

//Start the path, and set the path position to the last path position.
path_start(path_ref,walk_speed,path_action_restart,true)
path_position = lastpathposition;
