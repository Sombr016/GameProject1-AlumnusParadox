//Player movement with Tilemap Collision.

// Any tiles marked within the walltilemap variable will be marked for wall collision.
if (keyboard_check(vk_right) && !tilemap_get_at_pixel(walltilemap, x + 2, y)){
	x += 2;
	sprite_index = spr_player_run_right;
}

if (keyboard_check(vk_left) && !tilemap_get_at_pixel(walltilemap, x - 2, y)){
	x -= 2;
	sprite_index = spr_player_run_left;
}

if (keyboard_check(vk_down)  && !tilemap_get_at_pixel(walltilemap, x, y+2)){
	y += 2;
	sprite_index = spr_player_run_down;
}

if (keyboard_check(vk_up)  && !tilemap_get_at_pixel(walltilemap, x, y-2)){
	y -= 2;
	sprite_index = spr_player_run_up;
}

if (!(keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_left) || keyboard_check(vk_right))){
	sprite_index = spr_player_idle;
}


//Clamps movement to be bound within the playable area.
x = clamp(x,0,room_width);
y = clamp(y,0,room_height);  


//Player movement
moveRight = keyboard_check(vk_right) //Moves playr to the right
moveLeft = keyboard_check(vk_left)  //Moves player to the left
moveDown = keyboard_check(vk_down)  //Moves player down
moveUp = keyboard_check(vk_up) //Moves player up

xSpeed =( moveRight - moveLeft) * moveSpeed //The rate of speed the player is moving left or right
ySpeed = (moveDown - moveUp) * moveSpeed //The rate of speed the player is moving up or down

x += xSpeed //The x-coordinate position changes as the player moves
y += ySpeed //The y-coordinate changes as the [layer moves
