//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
/*	{"",		 "sb-cpu-perc.sh",		2,			0},*/
/*	{"",		 "sb-mem-used.sh",		5,			0},*/
	{"",		 "sb-home-left.sh",		120,			0},
	{"",		 "sb-vol-pulse.sh",		0,			10},
	{"",		 "sb-date.sh",			30,			0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "";
static unsigned int delimLen = 5;
//from github.com/LukeSmithxyz/dwmblocks:
//Most statusbars constantly rerun every script every several seconds to 
//update. This is an option here, but a superior choice is giving your 
//module a signal that you can signal to it to update on a relevant 
//event, rather than having it rerun idly.
//
//For example, the audio module has the update signal 10 by default. 
//Thus, running pkill -RTMIN+10 dwmblocks will update it.
//
//You can also run kill -44 $(pidof dwmblocks) which will have the same 
//effect, but is faster. Just add 34 to your typical signal number.
//
//My volume module never updates on its own, instead I have this command 
//run along side my volume shortcuts in dwm to only update it when relevant.
//
//Note that all modules must have different signal numbers.
