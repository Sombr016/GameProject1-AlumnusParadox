//STATE ENGAGED -> SEARCH
state = States.search;
//Set the min and max rotation to correspond to the angle of the Search Cone.
min_rotation = round(direction-(search_cone/2));
max_rotation = round(direction+(search_cone/2));
//Increase the beam length.
beam_length += 50;