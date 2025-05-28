Rem ----------------------------------   说  明   ---------------------------------- 
Rem --------------------------------------------------------------------------------
Rem ----------------- -------------  检查磁盘空间  ---------------------------------   
Rem -----------------------		Creat by Sunhm@20170621  ---------------------------
Rem ---------------------------------参数1:盘符 ------------------------------------
Rem -------------------例：call %~dp0\sub_check_disk_space D --------------
Rem --------------------------------------------------------------------------------

Rem --------------------------------  设置变量开始  --------------------------------

if "%Global_Checkdisk_DiskRange%"=="" (set Global_Checkdisk_DiskRange=C) else (echo 检查参数中配置%Global_Checkdisk_DiskRange% ) 
Rem 设置需要检查空间的盘符
Rem set Global_Checkdisk_DiskRange=C D E F G H I J K L M N O P Q R S T U V W X Y Z
if "%1"=="" (echo 检查 %Global_Checkdisk_DiskRange%盘空间) else (set Global_Checkdisk_DiskRange=%1%)

Rem --------------------------------  设置变量结束  --------------------------------

Rem 启用命令扩展
rem setlocal EnableDelayedExpansion

for %%i in (%Global_Checkdisk_DiskRange%) do (

if exist %%i: for /f "tokens=3" %%j in ('dir /-c %%i: ^|find "可用字节"') do (

set space=%%j

set space=!space:~0,-3!

set /a space=!space!/1024/1024

for /f "tokens=3*" %%v in ('vol %%i:') do set volume=%%w

echo %%i:!volume! 剩余 !space! GB可用 >>%Global_Bat_HOME%\log\sucess.log
echo %%i:!volume! 剩余 !space! GB可用 
)
set Global_Checkdisk_DiskSpace=%%i:!volume!剩余!space!GB可用
)

Rem 关闭命令扩展
rem setlocal disabledelayedexpansion

set Global_Checkdisk_DiskSpace=%space%
set Local_Checkdisk_DiskSpace=%space%
echo %Global_Checkdisk_DiskSpace%
