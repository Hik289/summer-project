integer num = 1;             //��ǰģ����ţ��ɸ�����Ҫ����
integer noticeChannel = 105; //���ܷ�������Ϣ��ͨ��      
float alpha = 0.0;           //��ʼ�ɼ���Ϊ0
float gap = 0.0001;          //��ʱ�����


default
{
    state_entry()
    {
	    llSay(0, "Waiting for the message from server...");
	
	    //������������������Ϣ
	    llListen(noticeChannel,"","","");

	    //���õ�ǰģ�͵ĳ�ʼ״̬�����ɼ���
	    llSetAlpha(alpha, ALL_SIDES);

	    //��ʱֹͣ
	    llSetTimerEvent(0.0);
    }

    listen(integer channel, string name, key id, string message)
    {
	    //�����ﵱǰģ�ͳ��ֵĽ׶Σ���ģ������ļ�ʱ��ʼ��ģ�����֣���timer�����ã�
        if(message == (string)num)
	    {
           llSetTimerEvent(gap);
        }

	    //���յ�������Ϣ�������ص�ǰģ��
        if(message == "reset all stalagmites.")
        {
             alpha = 0.0;
             llSetAlpha(alpha, ALL_SIDES);
             llSetTimerEvent(0.0);
        }
    }
    
    timer()
    {
	   //���õ�ǰģ����ÿ��ʱ�����пɼ��ȵı仯
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
       