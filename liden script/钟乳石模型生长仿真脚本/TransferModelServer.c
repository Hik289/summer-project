integer noticeChannel = 105; //给模型客户端发送消息的通道
integer counter;             //需要展示的钟乳石模型序号
integer totalNum = 5;        //钟乳石模型总数
float   gap = 0.0002;        //计时器间隔
 
default
{
	//重置脚本，通常需不要此步
	//on_rez(integer start_param)
	//{
	//	llResetScript();
	//}

    state_entry()
   {
	    //计时停止
	    llSetTimerEvent(0.0);
    }
 
    touch_start(integer total_number)
    {
	    //计时开始
	    llSetTimerEvent(gap);

	    //最初不展示任何钟乳石模型        
	    counter = 0;

	    //通知所有钟乳石隐藏起来，准备开始钟乳石生长的动画演示
        llSay(noticeChannel,"reset all stalagmites."); 
    }
 
    timer()
    {
        ++counter; 

	    //通知对应序号的钟乳石模型显现
	    llSay(noticeChannel,(string)counter);
	
	    //每个阶段的钟乳石模型在界面上停留2秒
        llSleep(2.0);
    }
}