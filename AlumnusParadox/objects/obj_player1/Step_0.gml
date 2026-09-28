//Player movement with Tilemap Collision.

// Any tiles marked within the walltilemap variable will be marked for wall collision.
if (keyboard_check(vk_right) && !tilemap_get_at_pixel(walltilemap, x + 2, y)) x += 2;
if (keyboard_check(vk_left) && !tilemap_get_at_pixel(walltilemap, x - 2, y)) x -= 2;
if (keyboard_check(vk_down)  && !tilemap_get_at_pixel(walltilemap, x, y+2)) y += 2;
if (keyboard_check(vk_up)  && !tilemap_get_at_pixel(walltilemap, x, y-2)) y -= 2;

//Clamps movement to be bound within the playable area.
x = clamp(x,0,room_width);
y = clamp(y,0,room_height);  