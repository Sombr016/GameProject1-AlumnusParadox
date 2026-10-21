// PATROL -> CHASING
state = PatrolState.chasing;
//sound_instance = audio_play_sound_at(act_sound_ref, x, y, 0, vision_distance+50, 300, 1, false, 1,1,0,random_range(0.6,0.9));
sound_instance = audio_play_sound_on(emitter, act_sound_ref, false, 10,1,0,random_range(0.6,0.9));
//Saves the last path position as a standardized value between 0 and 1.
lastpathposition = path_position;
vision_distance += 50;
path_end();
