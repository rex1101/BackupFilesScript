Rem ----------------------------------   ˵  ��   ---------------------------------- 
Rem --------------------------------------------------------------------------------
Rem -----------------------  �����̲��㣬��ɾ��һ������  -------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem ---------------------------------����1:�̷� ------------------------------------
Rem -------------------����call %~dp0\sub_check_disk_space D -----------------------
Rem --------------------------------------------------------------------------------

call %Global_Bat_HOME%\sub_comm\sub_check_disk_space.bat

set /a Local_Del_Sapdatebackup_DaysAgo=%Global_Del_Sapdatebackup_DaysAgo%
if "%Global_Checkdisk_DiskSpace%" LEQ %Global_Checkdisk_Safe% (echo ɾ����־�ɹ�,ɾ������: %GlobalToday% >>%Global_Bat_HOME%\log\sucess.log ) else (set /a Local_Del_Sapdatebackup_DaysAgo=%Global_Del_Sapdatebackup_DaysAgo%-1 && echo ���̿ռ�С�� %Global_Checkdisk_Safe%G�������һ������)

if %Local_Del_Sapdatebackup_DaysAgo% NEQ %Global_Del_Sapdatebackup_DaysAgo% (echo call %Global_Bat_HOME%\sub_clear\%1%) else (echo ���ϵͳ�ռ仹��%Global_Checkdisk_DiskSpace%G %GlobalToday%>>%Global_Bat_HOME%\log\sucess.log)

if exist  %Global_Bat_HOME%\log\erro.log (blat %Global_Bat_HOME%\log\erro.log -to %Global_Mail_Remail% -charset %Global_Mail_Unicode% -subject %Global_Mail_Title% -server %Global_Mail_Smtp% -f %Global_Mail_User% -u %Global_Mail_User% -pw %Global_Mail_Pwd% && del %Global_Bat_HOME%\log\erro.log && echo ������־���ͳɹ�) else (echo �����ҵ����)