
Rem -------------------------------  说  明   -------------------------------------- 
Rem --------------------------------------------------------------------------------
Rem ---------------------------  删除SAP备份文件  ----------------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem --------------------------------------------------------------------------------
Rem --------------------------------------------------------------------------------


Rem @@@forfiles用法
Rem @  /p 指定的路径
Rem @  /s 包括子目录
Rem @  /m 查找的文件名掩码
Rem @  /d 指定日期,有绝对日期和相对日期, 此处-7指当前日期 的7天前   


Rem @对目录 %SrcDir% 指定日期以前的目录和文件进行cmd /c del /f /q /a @path && rd /s /q @path操作

Rem @del /f /q /a 强制删除只读文件

Rem forfiles /p %SrcDir% /s /m *.* /d -%DaysAgo% /c "cmd /c del /f /q /a @path"

Rem forfiles /p %SrcDir% /s /m *.* /d -%DaysAgo% /c "cmd /c echo 正在删除：@path"

forfiles /p "%Global_Del_Sapdatebackup_SrcDir%" /s /d -%Global_Del_Sapdatebackup_DaysAgo% /c "cmd /c echo 正在删除：[@file]　该文件上次修改时间：[@fdate @ftime] && del /f /q /a @file && rd /s /q @path && echo 日志备份 @path 已经删除,删除日期: %GlobalToday%>>%~dp0\log\delete_data.log" 


rem if %ERRORLEVEL% EQU 0 (echo 删除日志成功,删除日期: %Global_Today%>>%~dp0\log\sucess.log) else (echo 删除日志失败,删除日期: %Global_Today%>>%~dp0\log\erro.log)