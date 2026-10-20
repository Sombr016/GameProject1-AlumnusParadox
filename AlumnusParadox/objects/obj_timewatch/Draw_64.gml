minutes_left = floor(total_seconds / 60)
seconds_left = floor(total_seconds % 60)

seconds_text = string(seconds_left)
if (seconds_left < 10) {
	seconds_text = "0" + string(seconds_left)
}

display_clock = string(minutes_left) + ":" + seconds_text

//Variables for drawing the watch
prg = total_seconds/timeloopduration
segments = 45
radius = 77
watchX = 145
watchY = 190

//Draw watch frame
draw_set_alpha(1*(1-blackScreenOpacity))
draw_sprite(spr_watch,image_index,150,200)
draw_set_alpha(1);

//Drawing the circle over the watch frame (curtosy of google gemini)
if (total_seconds > 0) {
    // Set color and transparency
    draw_set_color(c_blue);
    draw_set_alpha(0.6*(1-blackScreenOpacity));
    
    // Start drawing a triangle fan primitive
    draw_primitive_begin(pr_trianglefan);
    
    // The first vertex is the center of the circle
    draw_vertex(watchX, watchY);
    
    // Calculate how many degrees of the circle to draw based on remaining time
    var total_angle = 360 * prg;
    
    // Generate outer vertices along the arc
    for (var i = 0; i <= segments; i++) {
        // Linear interpolation of the angle
        var current_angle = (i / segments) * total_angle;
        
        // Convert to GameMaker coordinate system 
        // Subtracting from 90 ensures the countdown starts at the top (12 o'clock)
        var rad = degtorad(90 + current_angle); 
        
        // Calculate point position
        var vx = watchX + cos(rad) * radius;
        var vy = watchY - sin(rad) * radius;
        draw_vertex(vx, vy);
    }
    
    draw_primitive_end();
    
    // Reset alpha and color to prevent bleeding into other draw events
    draw_set_alpha(1*(1-blackScreenOpacity));
    draw_set_color(c_white);
}
//End of google gemini code

//Draw timer text
draw_set_alpha(1*(1-blackScreenOpacity));
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(watchX, watchY, display_clock)

//Draw rift goal text
riftsGoal = string(global.riftsCompleted) + " / "+ string(global.riftGoal) +" Rifts Closed"
draw_text(400,150, riftsGoal)

draw_set_alpha(1);
if(blackScreenOpacity >= 1) {
	if(gameOverOpacity < 1) {gameOverOpacity += 0.02;}
	draw_sprite_ext(spr_GameOver_text,0,100,display_get_gui_height()/1.2, 0.5, 0.5, 0, c_red, gameOverOpacity);
}
//Player death screen
//Temporary Text, replace this code with the loss screen sprites.
/*
if(isPlayerDead) {
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2, "You Died!");
}
*/