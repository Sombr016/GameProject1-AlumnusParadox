/// @description - Temporary Alarm that will automatically restart the game when the player dies.

rift_completion = [false,false,false];
total_seconds = timeloopduration;
blackScreenOpacity = 0;
gameOverOpacity = 0;

global.riftGoal = totalRifts
global.riftsCompleted = 0

rift_completion = [false,false,false];

isPlayerDead = false;
//Setting up an alarm event
alarm[0] = game_get_speed(gamespeed_fps)
room_restart();