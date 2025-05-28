Rem ----------------------------------   说  明   ---------------------------------- 
Rem --------------------------------------------------------------------------------
Rem -----------------------  检查磁盘不足，多删除一天数据  -------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem ---------------------------------参数1:盘符 ------------------------------------
Rem -------------------例：call %~dp0\sub_check_disk_space D -----------------------
Rem --------------------------------------------------------------------------------

call %Global_Bat_HOME%\sub_comm\sub_check_disk_space.bat

set /a Local_Del_Sapdatebackup_DaysAgo=%Global_Del_Sapdatebackup_DaysAgo%
if "%Global_Checkdisk_DiskSpace%" LEQ %Global_Checkdisk_Safe% (echo 删除日志成功,删除日期: %GlobalToday% >>%Global_Bat_HOME%\log\sucess.log ) else (set /a Local_Del_Sapdatebackup_DaysAgo=%Global_Del_Sapdatebackup_DaysAgo%-1 && echo 磁盘空间小于 %Global_Checkdisk_Safe%G，多清除一天数据)

if %Local_Del_Sapdatebackup_DaysAgo% NEQ %Global_Del_Sapdatebackup_DaysAgo% (echo call %Global_Bat_HOME%\sub_clear\%1%) else (echo 检查系统空间还有%Global_Checkdisk_DiskSpace%G %GlobalToday%>>%Global_Bat_HOME%\log\sucess.log)

if exist  %Global_Bat_HOME%\log\erro.log (blat %Global_Bat_HOME%\log\erro.log -to %Global_Mail_Remail% -charset %Global_Mail_Unicode% -subject %Global_Mail_Title% -server %Global_Mail_Smtp% -f %Global_Mail_User% -u %Global_Mail_User% -pw %Global_Mail_Pwd% && del %Global_Bat_HOME%\log\erro.log && echo 错误日志发送成功) else (echo 完成作业！！)