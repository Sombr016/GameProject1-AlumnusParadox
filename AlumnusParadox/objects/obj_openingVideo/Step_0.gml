
if(keyboard_check_pressed(vk_anykey)){
	video_close()
}

if(video_get_status() == video_status_closed and !audio_is_playing(snd_menuMusic)){
	audio_play_sound(snd_menuMusic,0,true)
}