Rem -------------------------------  ˵  ��   -------------------------------------- 
Rem --------------------------------------------------------------------------------
Rem --------------------------  EXP�����ORACLE  ---------------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------

%Global_Backup_Path%
md %GlobalToday%
cd %GlobalToday%

echo ���µ�����־ >%Global_Bat_HOME%\log\oracle.log

@ ECHO.										      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.				   ˵  ��					      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.------------------------------------------------------------------------------->%Global_Bat_HOME%\log\oracle.log
@ ECHO.				  ͨ��������    				      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.			Creat by Sunhm@GlobalToday				      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.------------------------------------------------------------------------------->%Global_Bat_HOME%\log\oracle.log

exp %Global_Oracle_Username%/%Global_Oracle_Pwd%@orcl file=%Global_Backup_Path%%GlobalToday%\%GlobalToday%.dmp log=%Global_Backup_Path%%GlobalToday%\%GlobalToday%.log >%Global_Bat_HOME%\log\oracle.log
