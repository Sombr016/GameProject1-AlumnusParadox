/// @description General setup
walltilemap = layer_tilemap_get_id("RoomTiles");


//Player States
enum States {
	regular, 
	pushing
}

//Axis that obj_movingBlocks is being grabbed
enum GrabAxis {
	none,
	horizontal,
	vertical
}


//Initial player state
state = States.regular;


// 'grabTarget' and 'grabDirection' are used for grabbing/pushing
grabTarget = noone
grabDirection = GrabAxis.none
// 'grabTarget' refers to what instance is being grabbed
// 'grabDirection' refers to what axis (x or y) you're moving on
