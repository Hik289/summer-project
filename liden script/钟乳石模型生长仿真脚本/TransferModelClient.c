integer num = 1;             //当前模型序号，可根据需要递增
integer noticeChannel = 105; //接受服务器消息的通道      
float alpha = 0.0;           //初始可见度为0
float gap = 0.0001;          //计时器间隔


default
{
    state_entry()
    {
	    llSay(0, "Waiting for the message from server...");
	
	    //监听服务器发来的消息
	    llListen(noticeChannel,"","","");

	    //设置当前模型的初始状态（不可见）
	    llSetAlpha(alpha, ALL_SIDES);

	    //计时停止
	    llSetTimerEvent(0.0);
    }

    listen(integer channel, string name, key id, string message)
    {
	    //当到达当前模型出现的阶段，该模型自身的计时开始，模型显现（在timer中设置）
        if(message == (string)num)
	    {
           llSetTimerEvent(gap);
        }

	    //若收到重置消息，则隐藏当前模型
        if(message == "reset all stalagmites.")
        {
             alpha = 0.0;
             llSetAlpha(alpha, ALL_SIDES);
             llSetTimerEvent(0.0);
        }
    }
    
    timer()
    {
	   //设置当前模型在每个时间间隔中可见度的变化
       if(alpha < 1.0 )
       {
         if(alpha < 0.8)
         {
              alpha = alpha + 0.4;
         }
        else
         {
             alpha = alpha + 0.2;
         }
        llSetAlpha(alpha, ALL_SIDES);
        }
    }
}
       