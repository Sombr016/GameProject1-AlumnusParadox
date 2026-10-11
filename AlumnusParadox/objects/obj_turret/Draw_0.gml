draw_self();
<<<<<<< Updated upstream
draw_line_color(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),c_green,c_red)
=======
draw_set_alpha(line_alpha);
draw_line_color(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),c_green,c_red)
draw_set_alpha(1);
if(debug) {
	draw_set_color(c_white);
	draw_set_alpha(1);
	//draw_text(_x, _y, string(targetbeam));
	//draw_text(_x,_y+20, string(direction));
	//draw_text(_x,_y+40, string(alarm[0]));
	//draw_text(_x,_y+60, string(alarm[1]));
	//draw_text(_x,_y+80, string(alarm[2]));
	//draw_text(_x,_y+100, string(min_rotation));
	//draw_text(_x,_y+120, string(max_rotation));
	//Text of the target.
	draw_text_ext_transformed(x,y-60,("Target: "+string(target)),-1,-1,0.25,0.5,0);
	draw_text_ext_transformed(x,y-50,("Fire Timer: "+string(alarm[3])+". "+"Engage Timer: "+string(alarm[1])+". "+"Search Timer: "+string(alarm[2])+". "),-1,-1,0.25,0.5,0);
	draw_text_ext_transformed(x,y-40,("Beam Length: "+string(beam_length)+"."+" Beam Alpha: "+string(line_alpha)),-1,-1,0.25,0.5,0);
	//Text for each requirement in order to target.
	draw_text_ext_transformed(x,y-30,("View Cone: "+string(min_rotation)+"->"+string(max_rotation)+". Total Rotation: "+string(total_rotation)),-1,-1,0.25,0.5,0);
}
else {
	draw_set_color(c_white);
	draw_set_alpha(1);
}
>>>>>>> Stashed changes
