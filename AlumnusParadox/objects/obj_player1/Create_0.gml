/// @description General setup
walltilemap = layer_tilemap_get_id("RoomTiles");
isInvulnerable = false;
invulnerabilityTime = 0;



//Player States
enum States {
	regular, 
	pushing,
	death
}

//Axis that obj_movingBlocks is being grabbed
enum GrabAxis {
	none,
	horizontal,
	vertical
}


//Initial player state
state = States.regular;

isDead = 0;

// 'grabTarget' and 'grabDirection' are used for grabbing/pushing
grabTarget = noone
grabDirection = GrabAxis.none
// 'grabTarget' refers to what instance is being grabbed
// 'grabDirection' refers to what axis (x or y) you're moving on


_uniColor = shader_get_uniform(player_rift_pull, "u_colour");
_color    = [1.0, 1.0, 0.0, 0.5];
_uniMix = shader_get_uniform(player_rift_pull, "u_mix");


_shaderOpacity = 0.4;

_teleportOpacity = 0;
// X (RED) Y (GREEN) Z (BLUE) W (OPACITY)

//Increases the player movespeed.
code1 = [vk_up, vk_right,vk_down,vk_down,vk_down];
code1_pos = 0;

//[TITLE CARD]
code2 = [vk_up,vk_up,vk_up,vk_down,vk_down,vk_down];
code2_pos = 0;

code3 = [vk_up,vk_up,vk_down,vk_down,vk_left,vk_right,vk_left,vk_right,ord("B"),ord("A")];
code3_pos = 0;