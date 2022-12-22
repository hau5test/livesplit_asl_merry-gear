/*********************************************************/
/* Merry Gear PC Autosplitter v1.0                       */
/*                                                       */
/*********************************************************/

state("stdrt") {
	// timers
	uint GameTime:	    0x4B424, 0x268, 0x138;
	uint Alerts:	    0x4B424, 0x268, 0x68;
	uint FilmUsed:	    0x4B424, 0x268, 0x28;
	uint ShotsFired:    0x4B424, 0x268, 0x18;
	uint Map:		    0x4B424, 0x268, 0x8;
    uint Finish:        0x4B424, 0x268, 0x290;
}


startup {
	// add splits based on checkpoints
	settings.Add("map_splits", true, "Map Based Splits");
	// add splits based on being checkpoints in the first building
	settings.Add("entry_split", true, "Entry", "map_splits");
	settings.Add("1st_floor_split", true, "1st Floor", "map_splits");
	settings.Add("2nd_floor_split", true, "2nd Floor", "map_splits");
	settings.Add("3rd_floor_split_east", true, "3rd Floor East Wing", "map_splits");
	settings.Add("3rd_floor_split_west", true, "3rd Floor West Wing", "map_splits");
	settings.Add("4th_floor_split", true, "4th Floor", "map_splits");
	settings.Add("5th_floor_split", true, "5th Floor", "map_splits");
	settings.Add("6th_floor_split", true, "6th Floor", "map_splits");
	settings.Add("7th_floor_split", true, "7th Floor", "map_splits");
	settings.Add("8th_floor_split", true, "8th Floor", "map_splits");
	settings.Add("9th_floor_split", true, "9th Floor", "map_splits");
	settings.Add("10th_floor_split", true, "10th Floor", "map_splits");

    vars.IGT = "";
}

gameTime {
    return TimeSpan.FromMilliseconds(current.GameTime);
}

start {
	// if currently the Boss Survival State is 0, listen to the main menu state for change
    if (current.GameTime > old.GameTime) return  true;
}

split {
    if (
        current.Map != old.Map &&
        settings["entry_split"] && current.Map == 1 && old.Map == 0 ||
        settings["1st_floor_split"] && current.Map == 2 && old.Map == 1 ||
        settings["2nd_floor_split"] && current.Map == 3 && old.Map == 2 ||
        settings["3rd_floor_split_east"] && current.Map == 4 && old.Map == 3 ||
        settings["3rd_floor_split_west"] && current.Map == 5 && old.Map == 4 ||
        settings["4th_floor_split"] && current.Map == 6 && old.Map == 5 ||
        settings["5th_floor_split"] && current.Map == 8 && old.Map == 6 ||
        settings["6th_floor_split"] && current.Map == 9 && old.Map == 8 ||
        settings["7th_floor_split"] && current.Map == 10 && old.Map == 9 ||
        settings["8th_floor_split"] && current.Map == 11 && old.Map == 10 ||
        settings["9th_floor_split"] && current.Map == 12 && old.Map == 11 ||
        settings["10th_floor_split"] && current.Map == 12 && current.Finish == 0 && old.Finish != current.Finish
    ) { return true;}
}


update {
    vars.IGT = "" + (current.GameTime / 1000) + "." + (current.GameTime % 1000 < 100?"0"+current.GameTime % 1000:current.GameTime % 1000);
    vars.IGT = vars.IGT.Substring(0, vars.IGT.Length - 1);
/*
// The following ranks are known to be possible
- Big Beard
- Big Boss
- Tortoise
- Elf
- Maverick
- Cowboy
- Paparazzi
- Photographer
- Elephant
- Mammoth
	if(current.GameTime>1079999) {
		vars.Rank = "Chicken";
	} else if ((current.GameTime>863999)&&(current.GameTime<1080000)) {
		vars.Rank = "Turtle";
	} else if ((current.GameTime>647999)&&(current.GameTime<864000)) {
		vars.Rank = "Hippopotamus";
	} else if ((current.GameTime>431999)&&(current.GameTime<648000)) {
		vars.Rank = "Elephant";
	} else if ((current.GameTime>215999)&&(current.GameTime<1080000)) {
		vars.Rank = "Deer";
	} else if (current.Kills > 3) {
		vars.Rank = "Deer";
	} else if (current.Kills < 4) {
		if ((current.GameTime>108000)&&(current.GameTime<432000)) {
			vars.Rank = "Zebra";
		} else if ((current.GameTime>81000)&&(current.GameTime<1080000)) {
			vars.Rank = "Jackal";
		} else if ((current.GameTime>45000)&&(current.GameTime<1080000)) {
			vars.Rank = "Panther";
		} else if ((current.Kills > 0) ||(current.Continues > 0) || (current.Alerts > (8 + current.MenuPointerPosition)) ||(current.Rations > 1)) {
			vars.Rank = "Eagle";
		} else {
			vars.Rank = current.MenuPointerPosition==0?"Big Boss":"Fox";
		}
*/
}