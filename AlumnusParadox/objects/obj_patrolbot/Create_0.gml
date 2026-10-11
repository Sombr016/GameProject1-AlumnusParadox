enum PatrolState {
	patrol,
	chasing,
	searching
}
walltilemap = layer_tilemap_get_id("RoomTiles");
state = PatrolState.patrol;


target = noone;
segments = 0;


vCancel = 1;


var lastpathposition;


path_start(path_ref,walk_speed,path_action_restart,true) 
