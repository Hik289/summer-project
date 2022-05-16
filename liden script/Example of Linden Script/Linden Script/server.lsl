integer debugChannel = 1;
integer debug_listenHandle;
integer guideBoardInitChannel = 102;
integer guideBoardInit_listenHandle;
integer dialogChannel=-102;
integer dialog_listenHandle;

//string TEACHER_NAME = "Test User";
string TEACHER_NAME = "zunlin ke";
//list watchPointsNames=["P0","P1","P2","P3","P4","P5","P6","P7","P8"];
list watchPointsNames = ["入口","观察点1", "观察点2", "观察点3", "观察点4", "观察点5", "观察点6", "观察点7", "观察点8"];
// method 1 (use this)
string REGION_NAME="source"; // if use megaregion ,then any pos can be like huyu00(356,356), huyu00(1025,1025)
// method 2
list watchPointsRegions=["source","source","source","source","source","source","source","source","source","source"]; 
list watchPointsVectors = [<70,141,245>,<44,214,220>,<52,224,231>,<104,193,210>,<184,76,230>,<134,226,246>,<126,68,146>,<8,1,269>,<101,183,282>];
string seperator = "@";
string SERVER_NAME="Server";
list allAgentsNames=[];//names including all students and teacher

// user defined fun to get key by name
key Name2Key(string firstname,string lastname)
{ // "Test" "User"
	return osAvatarName2Key(firstname,lastname);
}

key Name2Key(string fullname)
{ // "Test User"
         list first_last=llParseString2List(fullname,[" "],[]);
	 string firstname=llList2String(first_last,0);
	 string lastname=llList2String(first_last,1);
	 return osAvatarName2Key(firstname,lastname);
}

list AssignPositions(vector pos,integer n)
{// Assign n position by given pos
        list pos_list=[];
	integer m1=llCeil(n);//Returns an integer that is the integer value of val rounded towards positive infinity (return >= val)
	integer m2=llFloor(m1/2);Returns an integer that is the integer value of val rounded towards negative infinity (return <= val)
	integer i;
	integer j;
	for(i=-m2;i<=m2;++i)
		for(j=-m2;j<=m2;++j)
			pos_list+=[<pos.x+i,pos.y+j,pos.z>];
	return pos_list;
}

default
{
    state_entry()
    {
        llSay(0, "Server script running...");
        batchTeleport_listenHandle = llListen(batchTeleportChannel, "", "", "");//为什么后面三个参数都为空？
        gps_listenHandle = llListen(gpsChannel, "", "", "");
        guideBoardInit_listenHandle = llListen(guideBoardInitChannel, "", "", "");
        dialog_listenHandle=llListen(dialogChannel,"","","");
        debug_listenHandle = llListen(debugChannel, "", "", "");
    }
    
    touch_start(integer num_detected)
    {
	//llSay(0,"Touch start...");
    }

    listen(integer channel, string name, key id, string message)
    {        
       
       if(channel == guideBoardInitChannel)
        {
            if( name != SERVER_NAME)
	    {
                 llSay(0,"Sending watch points names to client...");
                 llRegionSay(guideBoardInitChannel, llDumpList2String(watchPointsNames, seperator));
	    }
        }
        else if(channel==dialogChannel)
        {
            integer index=llListFindList(watchPointsNames,[message]); //message "观察点1"
             string Destination=llList2String(watchPointsRegions,index); // "huyu011"
			// string Destination=REGION_NAME; // same if megaregion
            vector LandingPoint=llList2Vector(watchPointsVectors,index);
            vector LookAt=<1,1,1>;
            llInstantMessage(id, "Teleporting you to: "+Destination+" "+(string)LandingPoint);
            osTeleportAgent(id,Destination,LandingPoint,LookAt);
        }
        else if(channel == debugChannel)
        {
             llSay(0, "Server " + (string)message);
        }
    }
}

