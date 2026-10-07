//First check to see if object near wall
//Pushes block to whichever way the player pushes the block
if (!place_meeting(other.x + xSpeed, other.y + ySpeed, obj_otherID)){
	if (xSpeed != 0 || ySpeed != 0) {
		other.x += xSpeed
		other.y += ySpeed
	}
}
else {
	x -= xSpeed
	y -= ySpeed
}