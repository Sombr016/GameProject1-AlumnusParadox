draw_self();
if(show_line){
	draw_line_color(x,y,x+(beam_length*cos(-direction*(pi/180))),y+(beam_length*sin(-direction*(pi/180))),c_green,c_red)
}