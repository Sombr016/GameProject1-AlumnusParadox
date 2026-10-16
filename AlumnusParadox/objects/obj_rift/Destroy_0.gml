if(instance_exists(obj_timewatch)) {
	if(!obj_timewatch.rift_completion[rift_number]) {
		obj_timewatch.rift_completion[rift_number] = true;
		global.riftsCompleted++;
	}
}