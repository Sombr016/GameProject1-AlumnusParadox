//CHASING -> SEARCH
//Currently goes from Chasing back to Patrol.
state = PatrolState.teleporting;
teleport_sound_ref = choose(snd_teleport1,snd_teleport2,snd_teleport3);
sound_instance = audio_play_sound_at(teleport_sound_ref, x, y, 0, vision_distance+50, 300, 1, false, 1,0.3,0,random_range(0.8,1));
vision_distance -= 50;
//Start the path, and set the path position to the last path position.
//path_start(path_ref,walk_speed,path_action_restart,true)
//path_position = lastpathposition;
