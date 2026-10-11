draw_self();
//Visual representation of the viewing triangle.
draw_set_color(c_yellow);
draw_set_alpha(0.2);
draw_triangle(x, y,
x + lengthdir_x(vision_distance, direction+vision_spread),
y + lengthdir_y(vision_distance, direction+vision_spread),
x + lengthdir_x(vision_distance, direction-vision_spread),
y + lengthdir_y(vision_distance, direction-vision_spread),
false);
var _x = x + lengthdir_x(walk_speed*sprite_width/4, direction);
var _y = y + lengthdir_y(walk_speed*sprite_height/4, direction);
//DRAWING THE COLLISION LINES FOR THE TRIANGLE.
//Since there isn't actually any native cone collision in gamemaker, I elected to just create a bunch of lines that are encapsulated within the triangle.
//This is the visual representation of the collision lines.
if(debug) {
	step = (vision_spread/triangle_segments)*2;
	startline = -vision_spread
	for(var i = 0; i < triangle_segments+1; i++) {
		draw_line(x,y,x+lengthdir_x(vision_distance, direction+(startline+step*i)),y+lengthdir_y(vision_distance, direction+(startline+step*i)));
	}
	draw_set_color(c_white);
	draw_set_alpha(1);


	//Text of the target.
	var xdrawscale = 0.75;
	var ydrawscale = 0.75;
	draw_text_ext_transformed(x,y-60,("Colliding with wall? "+string(place_meeting((x + (walk_speed*sprite_width/2*cos(direction*(pi/180)))),(y + (walk_speed*sprite_width/2*sin(direction*(pi/180)))),walltilemap))
	+". Colliding with block? "+string(collision_line(x,y,_x, _y,obj_movingBlocks, false, true))),-1,-1,xdrawscale,ydrawscale,0);
	draw_text_ext_transformed(x,y-50,("Alarm 0: "+string(alarm[0])+" Alarm 1: "+string(alarm[1])),-1,-1,xdrawscale,ydrawscale,0);
	draw_text_ext_transformed(x,y-40,("Target: "+string(target)),-1,-1,xdrawscale,ydrawscale,0);
	//Text for each requirement in order to target.
	draw_text_ext_transformed(x,y-30,("Lines needed for target: "+string(segments_needed_for_target)+". Current segments: "+string(segments)),-1,-1,xdrawscale,ydrawscale,0);
}
else {
	draw_set_color(c_white);
	draw_set_alpha(1);
}
//draw_text(x,y-20,string(line_array));
