Rem -------------------------------  说  明   -------------------------------------- 
Rem --------------------------------------------------------------------------------
Rem --------------------------  EXP命令备份ORACLE  ---------------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------

%Global_Backup_Path%
md %GlobalToday%
cd %GlobalToday%

echo 更新到处日志 >%Global_Bat_HOME%\log\oracle.log

@ ECHO.										      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.				   说  明					      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.------------------------------------------------------------------------------->%Global_Bat_HOME%\log\oracle.log
@ ECHO.				  通用主程序    				      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.			Creat by Sunhm@GlobalToday				      >%Global_Bat_HOME%\log\oracle.log
@ ECHO.------------------------------------------------------------------------------->%Global_Bat_HOME%\log\oracle.log

exp %Global_Oracle_Username%/%Global_Oracle_Pwd%@orcl file=%Global_Backup_Path%%GlobalToday%\%GlobalToday%.dmp log=%Global_Backup_Path%%GlobalToday%\%GlobalToday%.log >%Global_Bat_HOME%\log\oracle.log
