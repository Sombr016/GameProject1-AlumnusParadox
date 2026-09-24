minutes_left = floor(total_seconds / 60)
seconds_left = floor(total_seconds % 60)

seconds_text = string(seconds_left)
if (seconds_left < 10) {
	seconds_text = "0" + string(seconds_left)
}

display_clock = string(minutes_left) + ":" + seconds_text

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(display_get_gui_width()/2, 50, "Time Remaining: " + display_clock)