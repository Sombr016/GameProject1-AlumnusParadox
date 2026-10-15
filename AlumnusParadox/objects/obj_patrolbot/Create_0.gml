/*
Right now, only the patrol and chasing state are the ones employed.
*/
enum PatrolState {
	patrol,
	chasing,
	teleporting
}
//Reference to the wall tile map for collision.
walltilemap = layer_tilemap_get_id("RoomTiles");
//The current state that the robot is in.
state = PatrolState.patrol;

//A reference to the player target.
target = noone;
//The amount of line segments that the player currently occupies in the view triangle.
segments = 0;

//A cancel flag utilized in the block collision.
vCancel = 1;

//A reference to the last path position before entering the chasing state.
var lastpathposition;


path_start(path_ref,walk_speed,path_action_restart,true) 
