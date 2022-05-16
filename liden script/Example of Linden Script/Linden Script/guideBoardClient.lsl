integer guideBoardInitChannel = 102;
integer guideBoardInit_listenHandle;
integer dialogChannel=-102;
integer dialog_listenHandle;

list watchPointsNames=[]; // fetch from server
string seperator="@";
string initMsg="FetchWatchPoints";
string dialog_msg="Please choose a watch point.";
string SERVER_NAME="Server";

default
{
    state_entry()
    {        
	llSay(0,"Guide board client script running...");
        guideBoardInit_listenHandle = llListen(guideBoardInitChannel, SERVER_NAME, "", "");
	llSay(0,"Sending request to server for fetching watch points...");
        llRegionSay(guideBoardInitChannel, initMsg);
    }
    
    touch_start(integer total_num)
    {
	llSay(0,"Touch start...");
        if(llGetListLength(watchPointsNames) == 0)
        {
            llSay(0, "Server didn't give me watch points. Check server's script. If it's right, reset this guideBord script to fetch watch points.");
            return;
        }
        integer i = 0;
        for(; i < total_num; ++i)
        {
            llDialog(llDetectedKey(i),dialog_msg, watchPointsNames, dialogChannel);
        }        
    }
    
    listen(integer channel, string name, key id, string message)
    {
         if(channel==guideBoardInitChannel)
	 {
              llSay(0,"Successfully fetching watch points names from server.");
	      llSay(0,message);
	      watchPointsNames=llParseString2List(message,[seperator],[]);
	      llSay(0,(string)watchPointsNames);
	 }
    } 
}

